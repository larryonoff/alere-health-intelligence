#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"

skill_root = File.expand_path("..", __dir__)
runtime = File.join(skill_root, "references", "knowledge", "runtime")
archive = File.join(skill_root, "references", "knowledge", "archive")

errors = []
ids = {}

recipe_files = Dir[File.join(runtime, "recipes", "*.md")].sort
errors << "no runtime recipes found" if recipe_files.empty?

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

runtime_text = Dir[File.join(runtime, "**", "*")].select { |p| File.file?(p) }
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
  errors << "runtime contains #{label}" if runtime_text.match?(pattern)
end

menu_path = File.join(runtime, "planning", "flexible-seven-day-menu.md")
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

if errors.empty?
  puts "Knowledge validation passed: #{recipe_files.length} reviewed recipes."
  exit 0
end

warn errors.join("\n")
exit 1
