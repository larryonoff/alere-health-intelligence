#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"
require "date"

skill_root = File.expand_path("..", __dir__)
practical = File.join(skill_root, "references", "practical")
archive = File.join(skill_root, "references", "knowledge", "archive")

errors = []
warnings = []
ids = {}

recipe_files = Dir[File.join(practical, "recipes", "*.md")].sort
errors << "no practical recipes found" if recipe_files.empty?

recipe_files.each do |path|
  text = File.read(path, encoding: "UTF-8")
  frontmatter = text.match(/\A---\s*\n(.*?)\n---\s*\n/m)

  unless frontmatter
    errors << "#{path}: missing YAML frontmatter"
    next
  end

  begin
    data = YAML.safe_load(frontmatter[1], permitted_classes: [], aliases: false)
  rescue Psych::SyntaxError => e
    errors << "#{path}: invalid YAML: #{e.message.lines.first.strip}"
    next
  end

  %w[id title_ru category servings prep_time cook_time equipment contains source_status].each do |key|
    errors << "#{path}: missing #{key}" unless data.key?(key)
  end

  id = data["id"]
  if id
    errors << "#{path}: duplicate id #{id}" if ids.key?(id)
    ids[id] = path
    errors << "#{path}: invalid id #{id}" unless id.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
  end

  errors << "#{path}: source_status must be reviewed" unless data["source_status"] == "reviewed"
  errors << "#{path}: missing ingredients section" unless text.match?(/^## (Ингредиенты|Основа)$/)
  errors << "#{path}: missing preparation section" unless text.match?(/^## Приготовление$/)
end

evidence = File.join(skill_root, "references", "evidence")
STRENGTHS = %w[strong moderate weak disputed insufficient].freeze
TOPICS = %w[condition marker intervention pattern].freeze

evidence_files = Dir[File.join(evidence, "**", "*.md")].reject { |p| File.basename(p) == "README.md" }.sort
errors << "no evidence entries found" if evidence_files.empty?

evidence_files.each do |path|
  text = File.read(path, encoding: "UTF-8")
  frontmatter = text.match(/\A---\s*\n(.*?)\n---\s*\n/m)

  unless frontmatter
    errors << "#{path}: missing YAML frontmatter"
    next
  end

  begin
    data = YAML.safe_load(frontmatter[1], permitted_classes: [Date], aliases: false)
  rescue Psych::SyntaxError => e
    errors << "#{path}: invalid YAML: #{e.message.lines.first.strip}"
    next
  end

  %w[id topic strength authorities last_reviewed review_cycle routing_required].each do |key|
    errors << "#{path}: missing #{key}" unless data.key?(key)
  end

  id = data["id"]
  if id
    errors << "#{path}: duplicate id #{id}" if ids.key?(id)
    ids[id] = path
    errors << "#{path}: invalid id #{id}" unless id.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
  end

  strength = data["strength"]
  unless STRENGTHS.include?(strength)
    errors << "#{path}: strength must be one of #{STRENGTHS.join(', ')}, got #{strength.inspect}"
  end

  unless TOPICS.include?(data["topic"])
    errors << "#{path}: topic must be one of #{TOPICS.join(', ')}, got #{data['topic'].inspect}"
  end

  authorities = data["authorities"]
  unless authorities.is_a?(Array) && !authorities.empty?
    errors << "#{path}: authorities must be a non-empty list"
  end

  unless [true, false].include?(data["routing_required"])
    errors << "#{path}: routing_required must be true or false"
  end

  # Staleness: an entry past its review cycle is reported, not silently trusted.
  cycle = data["review_cycle"]
  reviewed = data["last_reviewed"]
  reviewed = Date.parse(reviewed.to_s) rescue nil if reviewed
  if reviewed.nil?
    errors << "#{path}: last_reviewed is not a valid date"
  else
    max_age = cycle.to_s.include?("annual") ? 365 : 400
    age = (Date.today - reviewed).to_i
    if age.negative?
      errors << "#{path}: last_reviewed is in the future"
    elsif age > max_age
      warnings << "#{path}: last_reviewed is #{age} days old (cycle: #{cycle})"
    end
  end

  # Every claim heading must carry an explicit strength label.
  claim_headings = text.scan(/^### (.+)$/).flatten
  body = text.sub(/\A---\s*\n.*?\n---\s*\n/m, "")
  sections = body.split(/^### /)[1..] || []
  claim_headings.each_with_index do |heading, index|
    section = sections[index].to_s
    next if section.match?(/\*\*Strength:/)

    errors << "#{path}: claim \"#{heading.strip}\" has no **Strength:** label"
  end

  # Every entry must contain at least one resolvable citation.
  unless text.match?(%r{(?:doi\.org/|pubmed\.ncbi\.nlm\.nih\.gov/|https?://)})
    errors << "#{path}: no resolvable citation found"
  end

  errors << "#{path}: missing Boundary section" unless text.match?(/^## Boundary/)
end

evaluations = File.join(skill_root, "evaluations")
fixture_files = Dir[File.join(evaluations, "*.yaml")].sort
errors << "no evaluation fixtures found" if fixture_files.empty?

fixture_ids = {}
fixture_count = 0

fixture_files.each do |path|
  begin
    cases = YAML.safe_load(File.read(path, encoding: "UTF-8"), permitted_classes: [], aliases: false)
  rescue Psych::SyntaxError => e
    errors << "#{path}: invalid YAML: #{e.message.lines.first.strip}"
    next
  end

  unless cases.is_a?(Array) && !cases.empty?
    errors << "#{path}: must contain a non-empty list of cases"
    next
  end

  cases.each_with_index do |kase, index|
    label = "#{path} case #{index + 1}"

    unless kase.is_a?(Hash)
      errors << "#{label}: must be a mapping"
      next
    end

    %w[id prompt expects why].each do |key|
      errors << "#{label}: missing #{key}" unless kase.key?(key)
    end

    id = kase["id"]
    if id
      errors << "#{label}: duplicate fixture id #{id}" if fixture_ids.key?(id)
      fixture_ids[id] = label
      errors << "#{label}: invalid id #{id}" unless id.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
    end

    expects = kase["expects"]
    if expects.is_a?(Hash)
      strength = expects["strength"]
      if strength && !(STRENGTHS + %w[none]).include?(strength)
        errors << "#{label}: expects.strength must be a valid label or none, got #{strength.inspect}"
      end

      %w[must_include must_not_include].each do |key|
        next unless expects.key?(key)
        errors << "#{label}: expects.#{key} must be a list" unless expects[key].is_a?(Array)
      end

      %w[must_cite must_route must_refuse].each do |key|
        next unless expects.key?(key)
        next if [true, false].include?(expects[key])

        errors << "#{label}: expects.#{key} must be true or false"
      end
    else
      errors << "#{label}: expects must be a mapping"
    end

    fixture_count += 1
  end
end

practical_text = Dir[File.join(practical, "**", "*")].select { |p| File.file?(p) }
  .map { |p| File.read(p, encoding: "UTF-8") }.join("\n")

banned = {
  "removed branding" => /еда\s+для\s+жизни|ribakova|курс/iu,
  "supplement dose" => /\b(?:витамин|бад|b12|в12)\b.{0,30}\d+\s*(?:мкг|мг|iu|ме)\b/iu,
  "weight-loss promise" => /стройн|гарантированн\w*\s+похуд|сбросить\s+вес/iu,
  "detox claim" => /детокс|очищени[ея]\s+организма/iu,
  "universal hydration" => /вод[ыа]\s+не\s+менее\s+\d+\s*лит/iu,
  "unlimited fruit" => /фрукт\w*\s+в\s+любом\s+количестве/iu
}

banned.each do |label, pattern|
  errors << "practical contains #{label}" if practical_text.match?(pattern)
end

menu_path = File.join(practical, "planning", "flexible-seven-day-menu.md")
if File.exist?(menu_path)
  menu = File.read(menu_path, encoding: "UTF-8")
  referenced = menu.scan(/`([a-z0-9]+(?:-[a-z0-9]+)*)`/).flatten
  known_non_recipe = %w[balanced-bowl-constructor cream-soup-constructor]
  referenced.each do |id|
    next if ids.key?(id) || known_non_recipe.include?(id)

    errors << "#{menu_path}: unknown referenced id #{id}"
  end
end

if Dir[File.join(archive, "imported", "*")].empty?
  errors << "imported archive is empty"
end

# Disease-claim language must not appear as an assertion in the evidence corpus.
# Quoted prohibitions ("Not permitted: ...") are expected, so only flag the
# imperative forms that would read as a promise to the user.
evidence_files.each do |path|
  text = File.read(path, encoding: "UTF-8")
  {
    "cure claim" => /\bwe\s+can\s+cure\b|\bwill\s+cure\s+your\b/i,
    "reversal promise" => /\bwill\s+reverse\s+your\b|\bguaranteed\s+remission\b/i,
    "medication advice" => /\b(?:stop|discontinue|reduce)\s+your\s+(?:medication|metformin|insulin|statin)\b/i
  }.each do |label, pattern|
    errors << "#{path}: contains #{label}" if text.match?(pattern)
  end
end

warn "Review due:\n#{warnings.join("\n")}\n" unless warnings.empty?

if errors.empty?
  puts "Knowledge validation passed: " \
       "#{recipe_files.length} reviewed recipes, #{evidence_files.length} evidence entries, " \
       "#{fixture_count} evaluation fixtures" \
       "#{warnings.empty? ? '' : ", #{warnings.length} past review cycle"}."
  exit 0
end

warn errors.join("\n")
exit 1
