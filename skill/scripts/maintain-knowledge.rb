#!/usr/bin/env ruby
# frozen_string_literal: true

require "date"
require "json"
require "net/http"
require "tempfile"
require "uri"
require "yaml"

skill_root = File.expand_path("..", __dir__)
manifest_path = File.join(skill_root, "maintenance", "source-monitoring.yaml")
queue_path = File.join(skill_root, "maintenance", "review-queue.yaml")
evidence_root = File.join(skill_root, "references", "evidence")

command = ARGV.shift || "check"
dry_run = ARGV.delete("--dry-run")
scan_all = ARGV.delete("--all")
fail_on_candidates = ARGV.delete("--fail-on-candidates")

unless ARGV.empty? && %w[check scan].include?(command)
  warn "Usage: ruby skill/scripts/maintain-knowledge.rb check"
  warn "       ruby skill/scripts/maintain-knowledge.rb scan [--dry-run] [--all] [--fail-on-candidates]"
  exit 64
end

if fail_on_candidates && !dry_run
  warn "--fail-on-candidates requires --dry-run"
  exit 64
end

def load_yaml(path)
  YAML.safe_load(
    File.read(path, encoding: "UTF-8"),
    permitted_classes: [Date],
    aliases: false
  )
rescue Errno::ENOENT
  abort "Missing #{path}"
rescue Psych::SyntaxError => e
  abort "#{path}: invalid YAML: #{e.message.lines.first.strip}"
end

def parse_date(value, label, errors)
  Date.parse(value.to_s)
rescue Date::Error
  errors << "#{label}: invalid date #{value.inspect}"
  nil
end

def atomic_yaml_write(path, value)
  directory = File.dirname(path)
  Tempfile.create(["#{File.basename(path)}.", ".tmp"], directory) do |file|
    file.write(YAML.dump(value))
    file.flush
    file.fsync
    File.rename(file.path, path)
  end
end

manifest = load_yaml(manifest_path)
queue = load_yaml(queue_path)
errors = []
warnings = []
today = Date.today

unless manifest.is_a?(Hash) && manifest["version"] == 1
  errors << "#{manifest_path}: version must be 1"
end

unless queue.is_a?(Hash) && queue["version"] == 1 && queue["items"].is_a?(Array)
  errors << "#{queue_path}: expected version 1 and an items list"
end

allowed_roles = %w[
  academic-synthesis evidence-synthesis public-health-guidance regulatory-science
  clinical-guidance regional-guidance primary-research research-publications
  government-guidance
]
allowed_tiers = %w[stable frontier regional contested]
channels = manifest.is_a?(Hash) ? manifest["channels"] : nil
queries = manifest.is_a?(Hash) ? manifest["literature_queries"] : nil
errors << "#{manifest_path}: channels must be a non-empty list" unless channels.is_a?(Array) && !channels.empty?
errors << "#{manifest_path}: literature_queries must be a non-empty list" unless queries.is_a?(Array) && !queries.empty?

channel_ids = {}
Array(channels).each_with_index do |channel, index|
  label = "#{manifest_path} channel #{index + 1}"
  unless channel.is_a?(Hash)
    errors << "#{label}: must be a mapping"
    next
  end

  %w[id name role tier use_for never_use_alone_for urls cadence_days last_checked].each do |key|
    errors << "#{label}: missing #{key}" unless channel.key?(key)
  end

  id = channel["id"]
  if id
    errors << "#{label}: duplicate id #{id}" if channel_ids.key?(id)
    errors << "#{label}: invalid id #{id}" unless id.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
    channel_ids[id] = true
  end
  errors << "#{label}: invalid role #{channel['role'].inspect}" unless allowed_roles.include?(channel["role"])
  errors << "#{label}: invalid tier #{channel['tier'].inspect}" unless allowed_tiers.include?(channel["tier"])

  %w[use_for never_use_alone_for urls].each do |key|
    errors << "#{label}: #{key} must be a non-empty list" unless channel[key].is_a?(Array) && !channel[key].empty?
  end
  Array(channel["urls"]).each do |url|
    errors << "#{label}: invalid URL #{url.inspect}" unless url.to_s.match?(%r{\Ahttps://})
  end

  cadence = channel["cadence_days"]
  errors << "#{label}: cadence_days must be positive" unless cadence.is_a?(Integer) && cadence.positive?
  checked = parse_date(channel["last_checked"], "#{label} last_checked", errors)
  if checked && cadence.is_a?(Integer) && checked + cadence < today
    warnings << "#{id}: manual source review overdue since #{checked + cadence}"
  end
end

evidence_ids = Dir[File.join(evidence_root, "**", "*.md")].filter_map do |path|
  text = File.read(path, encoding: "UTF-8")
  frontmatter = text.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  next unless frontmatter

  data = YAML.safe_load(frontmatter[1], permitted_classes: [Date], aliases: false)
  data["id"]
end

query_ids = {}
Array(queries).each_with_index do |query, index|
  label = "#{manifest_path} literature query #{index + 1}"
  unless query.is_a?(Hash)
    errors << "#{label}: must be a mapping"
    next
  end

  %w[id topics cadence_days last_scanned europe_pmc_query].each do |key|
    errors << "#{label}: missing #{key}" unless query.key?(key)
  end

  id = query["id"]
  if id
    errors << "#{label}: duplicate id #{id}" if query_ids.key?(id)
    errors << "#{label}: invalid id #{id}" unless id.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
    query_ids[id] = true
  end
  unless query["topics"].is_a?(Array) && !query["topics"].empty?
    errors << "#{label}: topics must be a non-empty list"
  end
  unknown_topics = Array(query["topics"]) - evidence_ids
  errors << "#{label}: unknown evidence topics #{unknown_topics.join(', ')}" unless unknown_topics.empty?

  cadence = query["cadence_days"]
  errors << "#{label}: cadence_days must be positive" unless cadence.is_a?(Integer) && cadence.positive?
  scanned = parse_date(query["last_scanned"], "#{label} last_scanned", errors)
  if scanned && cadence.is_a?(Integer) && scanned + cadence < today
    warnings << "#{id}: literature scan overdue since #{scanned + cadence}"
  end
  errors << "#{label}: europe_pmc_query must be non-empty" if query["europe_pmc_query"].to_s.strip.empty?
end

queue_keys = {}
allowed_queue_statuses = %w[
  candidate relevant not-relevant duplicate needs-full-text verifying promoted rejected
]
Array(queue.is_a?(Hash) ? queue["items"] : []).each_with_index do |item, index|
  label = "#{queue_path} item #{index + 1}"
  unless item.is_a?(Hash)
    errors << "#{label}: must be a mapping"
    next
  end
  %w[key query_id status detected_on title url unreviewed].each do |key|
    errors << "#{label}: missing #{key}" unless item.key?(key)
  end
  key = item["key"]
  errors << "#{label}: duplicate key #{key}" if key && queue_keys.key?(key)
  queue_keys[key] = true if key
  errors << "#{label}: unknown query_id #{item['query_id']}" unless query_ids.key?(item["query_id"])
  errors << "#{label}: invalid status #{item['status'].inspect}" unless allowed_queue_statuses.include?(item["status"])
  parse_date(item["detected_on"], "#{label} detected_on", errors)
  errors << "#{label}: candidate must remain unreviewed" unless item["unreviewed"] == true
end

unless errors.empty?
  warn errors.join("\n")
  exit 1
end

if command == "check"
  warn "Maintenance warnings:\n#{warnings.join("\n")}" unless warnings.empty?
  puts "Maintenance validation passed: #{channels.length} source channels, " \
       "#{queries.length} literature queries, #{queue['items'].length} queued candidates" \
       "#{warnings.empty? ? '' : ", #{warnings.length} overdue checks"}."
  exit(warnings.empty? ? 0 : 2)
end

new_items = []
successful_queries = []
failed_queries = []
attempted_queries = 0
queries.each do |query|
  last_scanned = Date.parse(query["last_scanned"].to_s)
  next unless scan_all || last_scanned + query["cadence_days"] <= today

  attempted_queries += 1
  date_filter = "FIRST_PDATE:[#{last_scanned + 1} TO #{today}]"
  full_query = "(#{query['europe_pmc_query']}) AND #{date_filter}"
  uri = URI("https://www.ebi.ac.uk/europepmc/webservices/rest/search")
  uri.query = URI.encode_www_form(
    query: full_query,
    format: "json",
    resultType: "core",
    pageSize: 100,
    sort: "P_PDATE_D"
  )

  response = Net::HTTP.start(uri.host, uri.port, use_ssl: true, open_timeout: 10, read_timeout: 30) do |http|
    request = Net::HTTP::Get.new(uri)
    request["User-Agent"] = "Alere-Knowledge-Maintenance/1.0"
    http.request(request)
  end
  unless response.is_a?(Net::HTTPSuccess)
    warn "#{query['id']}: Europe PMC returned HTTP #{response.code}"
    failed_queries << query["id"]
    next
  end

  payload = JSON.parse(response.body)
  results = payload.dig("resultList", "result") || []
  results.each do |result|
    identifier = result["doi"]&.downcase || result["pmid"] || result["pmcid"]
    next unless identifier

    key = "europe-pmc:#{identifier}"
    next if queue_keys.key?(key)

    url = if result["doi"]
            "https://doi.org/#{result['doi']}"
          elsif result["pmid"]
            "https://pubmed.ncbi.nlm.nih.gov/#{result['pmid']}/"
          else
            "https://europepmc.org/article/PMC/#{result['pmcid']}"
          end
    item = {
      "key" => key,
      "query_id" => query["id"],
      "topics" => query["topics"],
      "status" => "candidate",
      "detected_on" => today.iso8601,
      "publication_date" => result["firstPublicationDate"] || result["firstIndexDate"],
      "title" => result["title"].to_s.strip,
      "journal" => result["journalTitle"],
      "authors" => result["authorString"],
      "url" => url,
      "unreviewed" => true
    }.compact
    new_items << item
    queue_keys[key] = true
  end
  successful_queries << query
rescue JSON::ParserError, Net::OpenTimeout, Net::ReadTimeout, SocketError, SystemCallError => e
  warn "#{query['id']}: scan failed: #{e.class}: #{e.message}"
  failed_queries << query["id"]
end

if dry_run
  puts "Maintenance scan dry run: #{new_items.length} new candidates from " \
       "#{successful_queries.length}/#{attempted_queries} successful queries."
  new_items.first(20).each { |item| puts "- #{item['query_id']}: #{item['title']} — #{item['url']}" }
  exit 1 unless failed_queries.empty?
  exit(fail_on_candidates && !new_items.empty? ? 3 : 0)
end

unless successful_queries.empty?
  queue["items"].concat(new_items)
  successful_queries.each { |query| query["last_scanned"] = today.iso8601 }
  atomic_yaml_write(queue_path, queue)
  atomic_yaml_write(manifest_path, manifest)
end

puts "Maintenance scan complete: #{new_items.length} new candidates queued from " \
     "#{successful_queries.length}/#{attempted_queries} successful queries."
exit(failed_queries.empty? ? 0 : 1)
