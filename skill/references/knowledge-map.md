# Practical Knowledge Map

Read `knowledge/README.md`, then open only the runtime files relevant to the
request. Never load `knowledge/archive/` during normal user assistance.

This file maps **practical knowledge**: recipes, constructors, menus, shopping,
and localization. For evidence about a condition, marker, or longevity
intervention, use `evidence/README.md` instead — the two are separate corpora
with different review rules.

## Recipe request

1. Open `knowledge/runtime/recipe-index.md`.
2. Select a reviewed recipe ID.
3. Open only its file under `knowledge/runtime/recipes/`.
4. Check ingredients against allergies and exclusions.

If no reviewed recipe fits, generate a clearly labeled adaptation or explain
that the imported archive requires manual review. Do not silently quote an
archived extraction.

## Meal constructors

- `knowledge/runtime/constructors/bowl.md`
- `knowledge/runtime/constructors/cream-soup.md`

## Menu and shopping

- `knowledge/runtime/planning/flexible-seven-day-menu.md` — adaptable example
  connected to reviewed recipe IDs.
- `knowledge/runtime/planning/shopping-list-template.md` — rules for producing a
  contextual shopping list without invented quantities.

## Poland localization

- `knowledge/runtime/localization/poland-ingredients.md` — Russian and Polish
  ingredient names. It does not prove price, availability, or allergen safety.

## Imported archive

`knowledge/archive/imported/` contains text retained for future manual
normalization. It is excluded from runtime routing because columns, page breaks,
promotional language, and incomplete fields may remain.
