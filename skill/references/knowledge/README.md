# Practical Nutrition Library

Only files under `runtime/` are approved for normal assistant use.

`archive/imported/` preserves the cleaned text extraction for manual
verification. It is not runtime knowledge and must not be opened unless a
reviewer is checking a missing or damaged recipe.

## Runtime rules

- Open `../knowledge-map.md`, then load only the relevant runtime files.
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
