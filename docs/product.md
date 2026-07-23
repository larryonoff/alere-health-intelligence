# Alere Product Direction

Status: working product brief.  
Last reviewed: 2026-07-23.

## Product thesis

Most nutrition apps are optimized for recording food, counting calories, and
displaying nutrient totals. Alere should optimize for understanding a person's
eating pattern and selecting the next realistic improvement.

Alere is a personal nutrition intelligence assistant, not a calorie counter,
diet program, diagnostic tool, or substitute for professional care.

## Initial audience

Start with busy adults who want to improve ordinary weekday meals without
counting every calorie. Their recurring problem is deciding what to eat or what
small change to make when time, energy, and planning capacity are limited.

They:

- want to improve everyday nutrition;
- are overwhelmed by conflicting advice;
- do not want rigid dieting or constant calorie counting;
- need recommendations adapted to their preferences, budget, culture, cooking
  ability, and routine;
- are generally healthy.

The first alternative being replaced is an inconsistent mix of generic web
search, general-purpose AI chat, and calorie trackers that users abandon
because logging is too demanding.

## Value proposition

> Understand what matters in your eating pattern and make one achievable
> improvement at a time.

Alere should:

- accept food information through natural conversation, text, or voice;
- be explicit about uncertainty when the user's description is incomplete;
- consider patterns across days and weeks rather than judging one meal;
- recognize what already works;
- recommend a small number of changes, with one clear priority;
- remember relevant preferences and previous attempts;
- explain why a recommendation matters and show credible sources on request.

## Differentiation

Alere should compete on:

1. **Longitudinal context** — become more useful as it learns the user's
   routines, constraints, preferences, and response to previous suggestions.
2. **Diet quality over false precision** — emphasize patterns, variety, and
   food quality; provide ranges and uncertainty instead of implying exact
   knowledge from incomplete descriptions.
3. **Next best action** — choose the smallest high-value change the user is
   ready to try.
4. **Evidence transparency** — connect material recommendations to maintained
   sources and communicate confidence and limitations.
5. **Local practicality** — understand ordinary foods, shops, budgets, and
   mixed dishes in the user's region and culture.
6. **Non-judgmental use** — support modes that do not expose calories, streaks,
   or food grades when those mechanisms are unwanted or inappropriate.

Photo recognition, barcode scanning, recipe generation, and generic AI chat
are useful capabilities but not durable differentiation.

## Competitive test

| Alternative | Established strength | Alere must demonstrate |
| --- | --- | --- |
| Calorie trackers | Databases, logging, nutrient totals | Useful guidance from incomplete records without mandatory calorie counting |
| Behavior programs | Lessons, structure, accountability | A relevant action without enrolling the user in a fixed weight-loss program |
| Personalized nutrition platforms | Scores, research, optional testing | Practical personalization without requiring proprietary biological tests |
| General-purpose AI | Flexible conversation | Safer, sourced, longitudinal guidance that remembers what the user tried |

The initial falsifiable advantage is: given an incomplete description of a
normal week, Alere can propose a more feasible, personally relevant next action
than a calorie tracker or a context-free AI chat.

Test this claim with 12 matched, anonymized weekly-food scenarios drawn from
the target cohort. Give Alere, Fitatu as the selected regional calorie-tracker
baseline, and a preselected general-purpose AI the same underlying food
information, user goal, and maximum five-minute interaction budget. Let each
product use its normal input workflow rather than forcing identical interface
inputs.

Use the tracker's own summary, insight, or suggested action as its output. If
it produces no actionable guidance, record that result without having a
researcher invent or translate a recommendation. Before the test, freeze the
general-purpose AI provider, model identifier and version, system instructions,
comparison prompt, sampling settings, date, and absence of saved context.
Store this metadata with every output and rerun the benchmark after a material
model or prompt change. Present outputs in randomized, unlabeled order.
Participants should rate each output from 1–5 for:

- relevance to the stated situation;
- feasibility during the following week;
- clarity of the recommended action;
- confidence that the explanation is trustworthy.

Treat the claim as supported only if Alere's mean paired relevance and
feasibility scores are each at least 0.5 points higher than both baselines and
at least 60% of participants prefer Alere overall. Preserve the raw prompts,
outputs, ratings, and scoring method so the comparison can be repeated.

## Core product loop

1. Learn the user's goal and minimum relevant context.
2. Observe a meal, question, choice, or recurring difficulty.
3. Identify the strongest positive pattern and the most important opportunity.
4. Offer one practical action and alternatives.
5. Ask whether the action was feasible and useful.
6. Adapt future guidance from the result.
7. Summarize meaningful patterns over a week without requiring perfect logging.

## Practical use cases

The assistant should support everyday food choices, comparable grocery-product
reviews, recipe adaptation, meal and shopping planning, use of ingredients
already at home, storage questions, and small sustainable habits. These are
conversation capabilities rather than separate top-level application sections.

Detailed behavior and personalization boundaries are maintained in
`docs/assistant-capabilities.md`.

## First native product

The first validation vehicle is a native iOS MVP. A separate skill experiment
is not a prerequisite.

Include:

- one optional primary goal;
- conversation with limited, user-approved context;
- meal or situation capture by text or voice;
- one prioritized recommendation;
- a follow-up asking whether the recommendation was attempted and useful;
- weekly pattern summary;
- source explanations;
- safety routing for higher-risk requests.

The initial localization targets Russian-speaking users in Poland. Use metric
units, Polish złoty, locally available products, and Polish food names when they
make shopping easier.

Defer:

- food photography and image analysis;
- Share Sheet;
- HealthKit;
- widgets and Live Activities;
- CloudKit and user accounts;
- exact calorie tracking as the primary experience;
- a proprietary food-recognition model;
- large recipe and barcode databases;
- microbiome or continuous glucose testing;
- laboratory-result interpretation;
- clinician marketplace;
- social feed;
- automated therapeutic meal plans;
- broad integrations without a validated user need.

The MVP includes local, user-approved memory and deletion controls. Broader
integration is considered only after the core loop proves useful.

## Safety routing

Detect and route requests involving pregnancy, children, suspected eating
disorders, allergies, medication interactions, significant symptoms, chronic
disease management, therapeutic diets, laboratory interpretation, or requests
to stop treatment.

For these requests:

- provide only conservative general education that is clearly within scope;
- do not diagnose, prescribe treatment, calculate a therapeutic plan, or
  recommend changing medication;
- state which part requires a physician or registered dietitian;
- direct urgent symptoms or immediate danger to local emergency care;
- include representative trigger and refusal cases in every evaluation set.

## Product boundaries

- Keep product implementation, interface design, analytics, monetization, and
  roadmap details out of `skill/SKILL.md`.
- Keep reusable nutrition behavior and reasoning in the skill.
- Keep evidence navigation in `skill/references/`.
- Keep product decisions in `docs/`.
- Never copy protected educational content, illustrations, scoring systems, or
  branded frameworks. Build independent language, models, and designs from
  public evidence.

## Product validation

Evaluate the native MVP with adults from the initial audience. Compare it with
the method each participant currently uses. Evaluate whether users:

- reach a useful first recommendation quickly;
- understand why it was selected;
- consider it feasible;
- try it in real life;
- return with follow-up context;
- find the weekly synthesis more valuable than their current method.

Use these initial decision thresholds:

- at least 70% rate the first recommendation as relevant and understandable;
- at least 50% attempt one recommendation during the first week;
- at least 40% return and complete a weekly review;
- at least 60% of returning users prefer the synthesis to their current method;
- at least 40% of the original cohort prefer the synthesis, counting missing
  responses as not preferring it;
- 100% of predefined high-risk test cases receive the required safe routing;
- no recommendation in the reviewed sample contradicts its cited source.

Record reasons for attrition separately. Treat a missing measurement as a
failed threshold. Treat these numbers as discovery criteria, not clinical
evidence or proof of health outcomes.

The initial north-star signal is the proportion of active users who attempt and
evaluate at least one personally relevant nutrition improvement per week.
