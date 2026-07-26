---
id: conflicting-guidance
topic: pattern
strength: disputed
authorities: [USDA, HHS, DGAC, Harvard Chan, Stanford, NASEM]
last_reviewed: 2026-07-25
review_cycle: annual
routing_required: false
---

# When authoritative sources disagree

Read this when a user cites a national guideline, or when two reputable sources
conflict. Do not resolve a genuine disagreement by silently picking a side.

The working case below is live and consequential: the current US Dietary
Guidelines depart from the scientific report commissioned to inform them.

## Why this file exists

`sources/registry.md` ranks source types, and `policy/evidence-labels.md` rates
certainty. Neither answers what to do when two bodies of comparable standing
reach different conclusions from the same literature.

Government guidelines carry policy authority. That is not identical to scientific
consensus, because guideline development involves committee composition, public
comment, industry input, and political process alongside evidence review. Usually
these align. When they do not, saying so is the honest answer.

## Working case: US Dietary Guidelines for Americans 2025–2030

**Strength: disputed.**

Released 7 January 2026 by USDA and HHS.

- Guidelines: <https://www.dietaryguidelines.gov/>
- Scientific Report of the 2025 Dietary Guidelines Advisory Committee (the
  independent expert review):
  <https://www.dietaryguidelines.gov/2025-advisory-committee-report>

#### What is not disputed

Broad agreement across the guidelines and their academic critics on: more
vegetables and fruits, whole grains over refined grains, limiting added sugars,
avoiding excess sodium, and reducing highly processed foods. The 2025–2030
edition is the first to name highly processed foods explicitly as a category to
avoid, and strengthened its added-sugar position.

Where sources agree, cite the agreement — it is stronger for being unanimous.

#### What is disputed

**Process.** USDA and HHS did not adopt the Dietary Guidelines Advisory
Committee's consensus report, substituting a separate scientific foundation
report. Academic critics have raised concerns about transparency of authorship
and reviewers' industry ties.

**Saturated fat coherence.** The 10%-of-calories limit is retained, while the
accompanying guidance emphasizes red meat, full-fat dairy, and beef tallow.
Harvard's Nutrition Source and Stanford's nutrition group both note that
following the food guidance makes the numeric limit difficult or impossible to
meet.

**Protein emphasis.** Substantially higher protein intake is recommended without
distinguishing sources. Both Harvard and Stanford note that most Americans
already meet protein needs, that fibre is underconsumed by comparison, and that
plant protein and fish are associated with more favourable outcomes than diets
high in red meat.

**Processing specificity and alcohol** guidance are criticized as too vague to
act on.

- Harvard T.H. Chan Nutrition Source assessment, January 2026:
  <https://nutritionsource.hsph.harvard.edu/2026/01/09/dietary-guidelines-for-americans-2025-2030/>
- Stanford Nutrition Studies Research Group assessment:
  <https://med.stanford.edu/nutrition/news/press/2025_2030_Dietary_Guidelines.html>
- NASEM reports on the guideline development process:
  <https://www.dietaryguidelines.gov/national-academies>

#### How to answer a question touching this

1. Lead with the substantial common ground — it covers most practical questions.
2. Where the dispute is material to the user's question, name it: which bodies
   disagree, and about what.
3. Prefer the position with converging independent support. On saturated fat and
   cardiovascular risk, that support is strong and long-standing — see
   `../conditions/elevated-ldl.md` and the Cochrane review cited there.
4. Do not characterize the disagreement in political terms. Describe the
   evidentiary and process disagreement, and let the user decide.
5. Note that guidelines are population policy, not individual prescription — the
   existing rule in `sources/registry.md`.

## General rules for conflicting guidance

1. **Check recency and scope first.** Many apparent conflicts are one source
   being older, or addressing a different population.
2. **Distinguish the type of disagreement:** about the evidence, about how to
   weigh benefit against harm, or about how to communicate. Only the first is
   settled by more data.
3. **Look for convergence.** When several independent bodies agree and one
   differs, that is informative — but check whether the outlier has newer data.
4. **Regional differences are often legitimate.** EFSA, WHO, NNR, and US
   guidelines can differ on a numeric target because of different populations,
   fortification policies, and baseline intakes. This is not error. State which
   applies to the user.
5. **Declared interests matter and are checkable.** Note funding and committee
   composition when documented. Do not speculate about motive.
6. **Say when you cannot resolve it.** "Reputable sources disagree, and here is
   the substance of the disagreement" is a complete, honest answer.

## Boundary

- Do not use a disagreement between guidelines to justify any specific
  intervention, supplement, or restrictive diet.
- Do not present a contrarian position as suppressed truth. Disagreement among
  experts is normal; conspiracy framing is not evidence.
- Do not give individual clinical advice on the basis of a guideline dispute.
  Route per `../../safety-and-context.md`.

Related: `../../policy/source-selection.md`, `../../policy/evidence-labels.md`,
`../conditions/elevated-ldl.md`, `../longevity/dietary-patterns.md`.
