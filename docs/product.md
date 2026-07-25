# Alere Product Direction

Status: working product brief.  
Last reviewed: 2026-07-25.

Strategic reasoning, evidence, competitive analysis, and regulatory detail live
in `docs/concept.md`. This document states the resulting product decisions.

## Product thesis

Most nutrition apps are optimized for recording food, counting calories, and
displaying nutrient totals. Alere optimizes for **showing what is actually
proven, how strong that proof is, and one thing the person can do today.**

The purpose is healthy longevity — healthspan, not lifespan. Specific health
conditions are how people find the product; longevity is what it serves. The two
converge because the dietary patterns with the strongest condition outcomes are
the same ones with the strongest longevity evidence.

Alere is a personal nutrition intelligence assistant, not a calorie counter,
diet program, diagnostic tool, or substitute for professional care.

## The skill is the base

Alere's behavior and knowledge live in `skill/` as an Agent Skills package —
portable, provider-independent, human-reviewable, editorially governed. The iOS
application is a **client** of that skill, not a reimplementation of it.

Consequences:

- One source of truth; behavior cannot drift between skill and app.
- A clinician can review Markdown; they cannot review Swift.
- The skill is usable immediately in existing skill hosts, so the corpus can be
  validated by real use before the app exists.
- Each reference must fit the on-device token budget. A reference too large to
  load alongside a prompt must be split.

See `docs/concept.md` §4a.

## Initial audience

Start with adults who want to improve how they eat for long-term health and who
encounter a specific, evidence-heavy question — often prompted by a lab result,
a diagnosis in the family, or conflicting advice they cannot resolve.

They:

- want to understand what the evidence actually supports;
- are overwhelmed by confident, contradictory claims;
- do not want rigid dieting or constant calorie counting;
- need recommendations adapted to their preferences, budget, culture, cooking
  ability, and routine;
- may have a metabolic risk marker but are not seeking medical treatment.

The first alternative being replaced is an inconsistent mix of generic web
search, general-purpose AI chat, and calorie trackers that users abandon
because logging is too demanding.

## Initial condition scope

The MVP covers the **metabolic cluster**, chosen because five conditions share
one mechanism and therefore nearly one corpus: prediabetes, elevated LDL,
hypertension, MASLD, and type 2 diabetes.

Prediabetes is the entry point: the largest population, the sharpest motivation,
and no medication involvement — which keeps the product clearly outside
therapeutic territory.

Later waves and the conditions deliberately excluded — including the
eating-disorder risk that rules out weak-evidence elimination diets — are
specified in `docs/concept.md` §2.

## Value proposition

> Know what the evidence actually says, how strong it is, and one thing you can
> do today.

Alere should:

- accept information through natural conversation, text, or voice;
- state the strength of evidence behind every material claim;
- cite the underlying authority, checkably;
- be explicit about uncertainty when the user's description is incomplete;
- recognize what already works;
- recommend one clear priority rather than a list of optimizations;
- remember relevant preferences and previous attempts, with consent;
- say "no reliable source" instead of filling the gap.

## Differentiation

Alere competes on:

1. **Strength-of-evidence calibration** — the same product says "remission is
   documented" for one condition and "low-quality evidence, as an adjunct" for
   another. Trackers have nothing to show; general AI answers both with
   identical confidence.
2. **Traceable sources** — every material claim resolves to a real, checkable
   authority, never to the assistant itself.
3. **Reproducibility** — the same question yields a consistent answer, because
   answers are grounded in a fixed corpus rather than regenerated. Consistency
   and test–retest reliability are measured, not assumed.
4. **Diet quality over false precision** — patterns, variety, ranges, and stated
   uncertainty instead of implied exactness from incomplete descriptions.
5. **Next best action** — the smallest high-value change the user is ready to
   try.
6. **Non-judgmental use** — no calories, streaks, or food grades as required
   mechanics.
7. **Private by construction** — on-device processing, local-first storage, and
   consent-gated memory.

Photo recognition, barcode scanning, recipe generation, and generic AI chat
are useful capabilities but not durable differentiation.

## Knowledge architecture

A two-tier hybrid corpus, reached only through tools — never from model weights.

- **Tier A — local, authored, always available.** Curated condition entries and
  workflows in `skill/references/`, shipped with the app, searched on device.
  Works offline, zero cost, fully reviewed before shipping. This tier alone is a
  complete product.
- **Tier B — remote, on demand.** Europe PMC for the long tail: a named study, a
  condition outside the curated set, or checking whether guidance has been
  superseded. Labeled as unreviewed primary literature.

When both tiers miss, Alere says so. It does not synthesize an answer from model
weights. See `docs/concept.md` §11.

Tier A ships first. Retrieval is exposed as a tool boundary from day one so that
Tier B is an addition rather than a redesign.

## Competitive test

| Alternative | Established strength | Alere must demonstrate |
| --- | --- | --- |
| Calorie trackers | Databases, logging, nutrient totals | Useful guidance from incomplete records without mandatory calorie counting |
| Behavior programs | Lessons, structure, accountability | A relevant action without enrolling the user in a fixed weight-loss program |
| Personalized nutrition platforms | Scores, research, optional testing | Practical personalization without requiring proprietary biological tests |
| Lifestyle-medicine courses | Structure, coaching, community | Traceable sources and calibrated strength instead of flattened "reversal" claims |
| General-purpose AI | Flexible conversation, broad knowledge | Traceable sources, calibrated strength, and reproducible answers |

The primary competitor is general-purpose AI, not calorie trackers. The
falsifiable advantage is therefore about **calibration and reproducibility**, not
about knowing more:

> Given the same condition-related nutrition question, Alere states the strength
> of the underlying evidence more accurately than a general-purpose AI, cites a
> source that actually supports the claim, and gives a materially consistent
> answer when asked again.

Test with matched question sets spanning the evidence gradient — questions whose
correct answer is "strong evidence," questions whose correct answer is "weak,
low-quality evidence," and questions whose correct answer is "no reliable
source." Score against authoritative references established in advance by a
qualified reviewer.

Measure:

- **strength-labeling accuracy** — does the stated confidence match the reference
  assessment;
- **citation faithfulness** — does the cited source support the claim;
- **consistency** — run each question at least three times; record variance;
- **appropriate refusal** — does it decline to answer when no reliable source
  exists, rather than producing something plausible;
- **feasibility and clarity** of the recommended action, rated 1–5.

Before the test, freeze the general-purpose AI provider, model identifier and
version, system instructions, comparison prompt, sampling settings, date, and
memory state. Run the comparison arm **both with memory enabled and with a prior
conversation present** — beating a stateless chatbot is no longer the claim that
matters. Store this metadata with every output and rerun after a material model,
prompt, or corpus change. Present outputs in randomized, unlabeled order.

Treat the claim as supported only if Alere's strength-labeling accuracy and
citation faithfulness each exceed both baselines by a clear margin, its
consistency variance is lower, and it refuses appropriately where baselines
fabricate. Preserve the raw prompts, outputs, ratings, and scoring method so the
comparison can be repeated.

## Core product loop

1. Learn the user's goal and minimum relevant context.
2. Receive a question, claim, meal, choice, or recurring difficulty.
3. Retrieve the relevant evidence from the corpus.
4. Answer, stating strength of evidence and the underlying source — or state
   plainly that no reliable source covers it.
5. Offer one practical action and alternatives.
6. Ask whether the action was feasible and useful.
7. Adapt future guidance from the result.

The loop delivers value on the first interaction and requires no accumulated
history. Pattern summarization over time is a later addition, not part of the
core loop.

## Practical use cases

The core capability is the **evidence-calibrated answer**: what is proven, how
strongly, what it means here, one step, the source, the boundary.

Everyday food choices, grocery-product comparison, recipe adaptation, meal and
shopping planning, using ingredients already at home, storage questions, and
small sustainable habits are **applications of that core within conversation** —
not separate top-level application sections and not co-equal features.

Detailed behavior and personalization boundaries are maintained in
`docs/assistant-capabilities.md`.

## Sequencing: skill first, app second

The skill is usable immediately in existing Agent Skills hosts, with no release
cycle. So:

1. Build the metabolic-cluster corpus in `skill/references/` with
   strength-of-evidence labeling, and use it daily.
2. Let real use determine which entries matter and where the corpus is thin.
   This validates the corpus at no engineering cost.
3. Build the iOS app once the corpus proves useful, so it launches with a working
   knowledge base rather than an empty one.

## First native product

The first validation vehicle is a native iOS MVP built on the skill.

Include:

- one optional primary goal;
- conversation with limited, user-approved context;
- question or situation capture by text or voice;
- an answer carrying explicit strength of evidence and a checkable source;
- one prioritized next action;
- a follow-up asking whether it was attempted and useful;
- safety routing for higher-risk requests;
- an AI-interaction disclosure and a clinician-consultation reminder.

Language and locale: **English first**, as a global product. The
Russian-speaking-in-Poland localization becomes a later market rather than the
launch definition.

Defer:

- **weekly pattern summary** — it requires accumulated history a new user does
  not have, and it does not fit the on-device context budget;
- Tier B remote retrieval;
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

## Regulatory boundary

The boundary between education and treatment is what keeps Alere a consumer
wellness product rather than a regulated medical device. It is a product
constraint, not a disclaimer.

| Never | Always |
| --- | --- |
| "Cure", "reverse", "treat", "get rid of" a disease | "Here is what is proven, how strongly, and one step" |
| A condition-specific therapeutic plan | Education, one feasible action, clinician routing |
| Medication, dosing, or deprescribing guidance | "This requires your doctor" |
| Diagnosing or interpreting laboratory results | Explaining what published evidence says |

The essential asymmetry: Alere may **explain that remission is documented**,
citing the underlying consensus and trial, because that describes published
evidence. Alere may not **promise remission**, because that is a disease claim.

Marketing copy is part of the regulatory surface. Disease-claim language in an
App Store name, subtitle, keywords, screenshots, or description is a disease
claim even when the app itself is careful.

Requirements this creates:

- App Store category **Health & Fitness**, not Medical.
- Declare regulated-medical-device status as "No" in App Store Connect —
  mandatory for new Health & Fitness or Medical apps from 26 March 2026.
- Publish the source list and the strength-of-evidence method, satisfying App
  Store guideline 1.4.1's methodology-disclosure requirement.
- Keep a visible clinician-consultation reminder.
- Disclose AI interaction, per EU AI Act Article 50, applicable from
  2 August 2026.
- No health data used for advertising, marketing, data mining, or sold to data
  brokers (guideline 5.1.3) — satisfied by having no analytics and no accounts.

Detailed reasoning and citations: `docs/concept.md` §6.

## Product boundaries

- Keep product implementation, interface design, analytics, monetization, and
  roadmap details out of `skill/SKILL.md`.
- Keep reusable nutrition behavior, reasoning, and evidence in the skill; the app
  is a client of the skill, never a parallel implementation.
- Keep evidence navigation in `skill/references/`.
- Keep product decisions in `docs/`.
- Never copy protected educational content, illustrations, scoring systems, or
  branded frameworks. Build independent language, models, and designs from
  public evidence.
- Third-party course or program material enters only through the editorial
  promotion pipeline as material for verification, never as authority.

## Product validation

Evaluate the native MVP with adults from the initial audience. Compare it with
the method each participant currently uses. Evaluate whether users:

- reach a useful answer quickly;
- understand how strong the underlying evidence is;
- consider the recommended action feasible;
- try it in real life;
- return with follow-up context;
- trust the answer more than their current method.

Use these initial decision thresholds:

- at least 70% rate the first answer as relevant and understandable;
- at least 50% attempt one recommendation during the first week;
- at least 60% correctly report how strong the evidence was, when asked
  afterwards — the product fails if calibration does not transfer to the user;
- 100% of predefined high-risk test cases receive the required safe routing;
- no recommendation in the reviewed sample contradicts its cited source.

Record reasons for attrition separately. Treat a missing measurement as a
failed threshold. Treat these numbers as discovery criteria, not clinical
evidence or proof of health outcomes.

## Answer-quality evaluation

Distinct from user testing, and required after any prompt, corpus, or provider
change:

- **Citation faithfulness** — mechanically verify that each cited source supports
  the claim made.
- **Strength-of-evidence accuracy** — a fixture class checking that strong
  evidence is labeled strong and weak labeled weak. Mislabeling strength is the
  product's worst failure mode, worse than naming the wrong food.
- **Test–retest reliability** — run each fixture at least three times and record
  variance. A confidently varying health assistant is a liability, and this is
  where a corpus-grounded product beats general AI measurably.
- **Near-miss safety fixtures** — not only unambiguous triggers but borderline
  cases: a slightly underweight user, a casual mention of skipping meals, a user
  asking to stop medication because a marker improved.
- **No-source behavior** — when the corpus cannot answer, the assistant says so
  rather than synthesizing from model weights.

The initial north-star signal is the proportion of active users who attempt and
evaluate at least one personally relevant nutrition improvement per week.
