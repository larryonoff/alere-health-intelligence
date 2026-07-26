# Evidence Grading Methodology

This is the maintenance rationale behind `../policy/evidence-labels.md`. Normal
answers should load the compact policy, not this document. Every material claim
carries a strength label; mislabeling strength is a worse failure than naming the
wrong food.

**The labels, the runtime rules, and the user-facing wording are defined in
`../policy/evidence-labels.md` and only there.** This file explains why that
taxonomy is shaped the way it is and records the sources behind it. When the two
appear to disagree, the policy wins and this file is out of date. Changing a
label definition means editing the policy — never restating it here, because a
second copy is how the two drifted apart before.

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

Definitions, runtime rules, and the ordinary-language wording for each label:
`../policy/evidence-labels.md`. Do not restate them here.

What follows is the reasoning a maintainer needs when applying or revising that
taxonomy.

### Why these five, and not GRADE's four

GRADE rates certainty as high, moderate, low, or very low. Two departures:

- **`disputed` has no GRADE equivalent.** GRADE grades one body of evidence;
  it has no label for "reputable authorities reach different conclusions." That
  situation is common in nutrition — the EFSA and NNR2023 vitamin D reference
  values differ by design, not by error — and collapsing it into a certainty
  rating destroys the information the user needs. Averaging disagreement is a
  named failure mode in `../failure-modes.md`.
- **`insufficient` is a floor, not GRADE's "very low."** It marks the absence of
  usable human evidence rather than a weak estimate. The distinction matters
  because mechanistic and in-vitro work often reads as supportive; it is not.

### Applying a label

- **Population is part of the label, not a caveat after it.** Evidence for
  adults with obesity is not evidence for lean adults; evidence from a
  supervised trial is not evidence for self-directed use. A `strong` label
  holds for the population that was studied, and re-labeling is required when
  the question moves outside it. This is the concrete form of borrowed
  credibility in `../failure-modes.md`.
- **One topic carries claims at several strengths.** Weight loss for psoriasis
  is `strong`; a specific dietary pattern for psoriasis is `weak`. Both belong
  in the same entry, labeled separately. Entry-level labels in frontmatter
  summarize; per-claim labels govern.
- **A guideline that rates its own recommendation as low-quality is `weak`**,
  regardless of the issuing body's stature. Assess methodological quality, risk
  of bias, directness, applicability, consistency, independence, and recency —
  see `../policy/source-selection.md`. An outdated guideline can be weaker than
  a current, directly applicable trial.

## When the corpus has no entry

Say that the local corpus has no reviewed answer. If external verification is
available, search current authoritative sources first and use unreviewed primary
literature only when no suitable guideline or synthesis covers the question.
Label primary literature as unreviewed rather than as guidance.

Say no reliable source was found only after searching. If verification is
unavailable, state that limitation. Do not generate an answer from general
knowledge and present it as evidence.
