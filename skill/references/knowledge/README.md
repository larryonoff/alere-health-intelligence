# Imported Knowledge Archive

Reviewed material now lives in `../practical/`. Nothing under this directory is
approved for normal assistant use.

`archive/imported/` preserves the cleaned text extraction for manual
verification. It is not practical knowledge and must not be opened unless a
reviewer is checking a missing or damaged recipe.

This file is the only place promotion is defined. `archive/` carries no README
of its own, because two copies drifted into disagreeing about paths.

## Promoting an extraction to a reviewed recipe

1. Identify the complete recipe block in `archive/imported/`.
2. Separate ingredients from preparation.
3. Preserve explicit quantities; mark missing servings or times as `unknown`.
4. Remove promotional and health-outcome language.
5. Check the result against the safety rules below.
6. Write a structured Markdown file under `../practical/recipes/`, with the
   frontmatter the validator requires: `id`, `title_ru`, `category`, `servings`,
   `prep_time`, `cook_time`, `equipment`, `contains`, `source_status`.
7. Add its ID to `../practical/recipe-index.md`.
8. Run `ruby skill/scripts/validate-knowledge.rb`.

## Promotion rules

- Open `../practical/index.md`, then load only the relevant practical files.
- Preserve reviewed quantities and preparation steps.
- `unknown` means unknown: do not infer servings, time, or quantities.
- Adapt recipes to allergies, exclusions, equipment, time, budget, and local
  availability. State material substitutions.
- The `contains` field lists ingredients that require attention; it is not a
  guarantee that unlisted allergens are absent.
- Menus are flexible examples, not therapeutic plans.
- Health, storage-safety, supplement, and numerical claims require the evidence
  and safety workflow.

## Review states

- `reviewed` — ingredients and steps were separated and checked against the
  imported extraction.
- `needs-source-check` — extraction is incomplete or ambiguous; do not use as an
  exact recipe.
- `archived` — retained only for future review.
