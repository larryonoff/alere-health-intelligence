# Strength of Evidence

Read this before stating how well established anything is. Every material claim
carries a strength label. Mislabeling strength is a worse failure than naming the
wrong food.

## Two different things, never merged

This is the most common error in nutrition communication, and the GRADE framework
exists partly to prevent it:

- **Certainty of evidence** — how confident we are in the effect estimate.
- **Strength of recommendation** — how strongly action is advised, which also
  depends on benefit–harm balance, values, preferences, and cost.

They diverge in both directions. A guideline can issue a **strong recommendation
on low-certainty evidence** when harm is minimal and the alternative is worse —
GRADE names specific situations where this is justified. Conversely,
high-certainty evidence of a tiny effect warrants a weak recommendation.

The labels below rate **certainty of evidence**. When a guideline's own
recommendation strength differs from the underlying certainty, say both:

> "The National Psoriasis Foundation recommends weight reduction strongly, and
> rates the supporting evidence for other dietary changes as low quality."

Never collapse the two into one verdict, and never infer a recommendation
strength that no guideline actually issued.

- GRADE handbook: <https://gdt.gradepro.org/app/handbook/handbook.html>
- Guyatt GH et al. GRADE guidelines: 1. Introduction. *J Clin Epidemiol*
  2011;64(4):383–394.
  DOI: [10.1016/j.jclinepi.2010.04.026](https://doi.org/10.1016/j.jclinepi.2010.04.026).
  PMID: [21195583](https://pubmed.ncbi.nlm.nih.gov/21195583/).
- Strong recommendations from low certainty evidence: cross-sectional analysis of
  national guidelines. *BMC Med Res Methodol* 2023.
  <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10039768/>

## Nutrition-specific caveat

Nutrition evidence rarely reaches GRADE's "high" certainty, because long-term
randomized feeding trials with hard outcomes are largely infeasible. Applying
clinical-drug standards unmodified would label almost all nutrition evidence
"low," which is uninformative.

NutriGrade was developed for this reason: it scores meta-evidence across nine
components and does not automatically downgrade all observational evidence.

Practical rule: judge nutrition evidence against **what is achievable in
nutrition research**, state the design honestly, and never imply drug-trial
certainty where none exists.

- Schwingshackl L et al. Perspective: NutriGrade — a scoring system to assess and
  judge the meta-evidence of randomized controlled trials and cohort studies in
  nutrition research. *Adv Nutr* 2016;7(6):994–1004.
  DOI: [10.3945/an.116.013052](https://doi.org/10.3945/an.116.013052).
  PMID: [28140319](https://pubmed.ncbi.nlm.nih.gov/28140319/).
- Grading nutrition evidence: where to go from here? *Am J Clin Nutr* 2023.
  <https://ajcn.nutrition.org/article/S0002-9165(23)07236-2/fulltext>

## Labels

### `strong`

A current guideline or consensus statement from a recognized authority, or
consistent meta-analytic evidence from human randomized trials, applied to the
population being asked about.

Say: "this is established," "guidelines recommend," name the authority.

### `moderate`

Randomized human trials exist and point the same way, but the body of evidence is
limited — small samples, short duration, single settings, or no guideline has yet
adopted it.

Say: "trials show," "evidence points this way," state the limitation.

### `weak`

Pilot studies, uncontrolled studies, consistent observational data without trial
confirmation, or a guideline that explicitly rates its own recommendation as
low-quality.

Say: "low-quality evidence," "may help," name what is missing. Never present as
established.

### `disputed`

Reputable sources disagree, or trial results conflict.

Say who disagrees and about what. Do not resolve the dispute by choosing a side.

### `insufficient`

No usable human evidence, or only mechanistic, animal, or in-vitro work.

Say plainly that the human evidence does not exist. Mechanism is not evidence of
effect.

## Rules

1. **Label the claim, not the topic.** One topic often contains claims at
   different strengths. Weight loss for psoriasis is `strong`; a specific dietary
   pattern for psoriasis is `weak`. Both belong in the same file, labeled
   separately.

2. **Source type does not determine strength.** Assess methodological quality,
   risk of bias, directness, applicability, consistency, independence, and
   recency. An outdated guideline can be weaker than a current, directly
   applicable trial. This mirrors the rule in `source-catalog.md`.

3. **Population matters.** Evidence for adults with obesity is not evidence for
   lean adults. Evidence for a supervised trial is not evidence for
   self-directed use. State the population when it changes the answer.

4. **Surrogate outcomes are not clinical outcomes.** A change in a biomarker is
   not a change in health. Label biomarker evidence for what it is.

5. **Mechanism is not evidence.** "It reduces inflammation in vitro" supports
   `insufficient`, not `weak`.

6. **Absence of evidence is a statement, not a gap to fill.** If nothing usable
   exists, say so. Do not substitute plausible reasoning.

7. **Do not upgrade a label because the user wants a stronger answer**, and do
   not downgrade one to seem cautious. Both are dishonest.

## Reporting to the user

State the strength in ordinary language, not as a code:

- `strong` → "This is well established — [authority] recommends it."
- `moderate` → "Trials support this, though the evidence base is still limited."
- `weak` → "The evidence here is low quality. It may help, but it is not
  established."
- `disputed` → "Reputable sources disagree on this."
- `insufficient` → "There is no reliable human evidence for this."

Never show the raw label as jargon, and never omit it when a claim is material.

## When the corpus has no entry

Say that no reliable source covers the question. Offer to look at current
literature if that path is available, and label anything found that way as
unreviewed primary literature rather than as guidance.

Do not generate an answer from general knowledge and present it as evidence.
