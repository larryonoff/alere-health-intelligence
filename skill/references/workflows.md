# Nutrition Workflows

Read only the section matching the user's task.

## Food or meal choice

1. Identify the immediate goal and realistic options.
2. Compare meal pattern, likely satiety, variety, preparation, price, and
   constraints rather than searching for a universally “best” food.
3. Give the choice first, then 2–4 decisive reasons.
4. Offer an adjustment or alternative when useful.

For a meal review, recognize what already works before identifying the most
valuable improvement. Judge the broader pattern when history exists; do not
moralize a single meal.

## Grocery product or ingredient list

Use one of these verdicts when a categorical answer helps:

- `suitable`;
- `suitable sometimes`;
- `a different option would fit better`.

Then:

1. Check that products serve the same purpose.
2. Use the ingredient list and nutrition declaration, not front-label claims.
3. Identify 2–4 characteristics that actually change the decision.
4. Consider serving, frequency, price, and local availability.
5. Suggest an accessible alternative when the product is a poor fit.

If only the front of a package is available, request the ingredients and
nutrition declaration or make the conclusion explicitly conditional. Do not
declare an individual additive dangerous without adequate evidence.

## Recipe

1. Identify servings and material constraints: exclusions, available
   ingredients, equipment, time, and budget.
2. Read `knowledge-map.md` and select a reviewed recipe ID before generating a
   new recipe. Never use the imported archive as a runtime recipe source.
3. Read the complete recipe block because document extraction may split
   ingredients and steps across page breaks. Do not reconstruct missing or
   damaged quantities from memory.
4. Provide servings when the source states or reliably implies them,
   ingredients, clear steps, and approximate total time. If servings or time
   are absent, label any estimate.
5. For an adaptation, list substitutions and explain meaningful tradeoffs.
6. Avoid exact calorie or nutrient claims without exact amounts and a defined
   calculation source.

Prefer flexible meal constructors when the user needs ideas rather than a
specific recipe.

## Menu and shopping

Ask for duration, number of people, and material exclusions only when unknown.
Read `knowledge-map.md` for the runtime menu and shopping references.

- Reuse ingredients across meals to reduce cost and leftovers.
- Match complexity to available cooking time and equipment.
- Include practical convenience foods when they improve feasibility.
- Organize shopping by store department and estimate quantities when possible.
- Consider seasonality, storage life, and ingredients already at home.
- Keep plans flexible; never present a general menu as therapeutic treatment.
- Never add supplement instructions, fixed hydration targets, universal
  portions, or health-outcome claims to a general menu.
- Do not reproduce the complete reference menu by default. Select and adapt the
  relevant days or dishes to the user's request.

## Available ingredients and storage

Prioritize ingredients that should be used soon. Account for storage life,
food-safety signs, preparation time, and equipment. Separate quality loss from
actual safety risk. When safety depends on time, temperature, packaging, or
visible spoilage, ask for that information before advising consumption.

## Habit support

Offer one small change at a time:

- define the minimum viable action;
- connect it to a specific situation or cue;
- make success observable;
- ask later whether it was attempted and useful;
- adapt instead of blaming the user.

Do not use streaks, food grades, fear, or shame.

## Nutrition or evidence question

Structure when useful:

1. `Conclusion` — what the user should know or do.
2. `Evidence` — what is established and for which population.
3. `Practical application` — how it applies here.
4. `Limits` — uncertainty, applicability, or need for professional care.

Distinguish association from causation, biomarkers from meaningful outcomes,
population guidance from individualized treatment, and evidence from personal
preference.

## Regional defaults

Use the user's known location. For Russian-speaking users in Poland:

- use metric units and Polish złoty;
- consider Polish shops, labels, seasonality, and availability;
- include a Polish product name when it helps shopping;
- do not apply foreign product databases or rankings without checking local
  relevance.
