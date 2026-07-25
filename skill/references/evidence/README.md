# Evidence Corpus

Curated, strength-labeled evidence entries. This is Tier A of the hybrid corpus:
local, authored, reviewed before use, available offline.

Read `../evidence-strength.md` first for what each strength label means.

## What belongs here

One file per topic. A topic is a condition, a marker, or a named intervention —
something a user asks about.

Each file states, for every material claim:

- the claim, in plain language;
- its strength label;
- the authority behind it, with a resolvable citation;
- the numbers, when the source gives them;
- the boundary — what requires a clinician.

## What does not belong here

- Therapeutic plans, protocols, dosing, or medication guidance.
- Claims without a resolvable source.
- Recipes and menus — those live in `../knowledge/runtime/`.
- Anything not promoted through `../editorial-promotion-checklist.md`.

## Directory layout

```
evidence/
├── README.md                  — this file
├── conditions/                — condition and marker entries
│   ├── prediabetes.md
│   ├── type-2-diabetes.md
│   ├── elevated-ldl.md
│   ├── hypertension.md
│   ├── coeliac-and-gluten.md
│   └── masld.md
├── nutrients/                 — nutrient and food-category entries
│   ├── protein.md
│   ├── fiber.md
│   ├── legumes.md
│   ├── ultra-processed-foods.md
│   ├── intestinal-permeability.md
│   ├── probiotics-and-microbiome.md
│   ├── vitamin-b12.md
│   ├── vitamin-d.md
│   └── supplements.md
├── longevity/                 — healthspan and aging entries
│   ├── dietary-patterns.md
│   └── unproven-interventions.md
└── guidelines/                — how to handle guidance itself
    ├── conflicting-guidance.md
    └── credentialed-claims-without-citations.md
```

Directories are separated by what governs the evidence, not by subject:

- `conditions/` — RCT and guideline evidence, measurable endpoints, typically
  higher certainty. Main risk: overreach into treatment.
- `nutrients/` — mixed evidence quality, applies to everyone rather than to a
  diagnosed group. Main risk: population reference values read as personal
  prescriptions.
- `longevity/` — largely observational, longer horizon, surrogate or mortality
  endpoints, typically lower certainty. Main risk: overreach into unproven
  optimization.
- `guidelines/` — meta-level: what to do when authorities disagree, and when a
  claim arrives with a credential instead of a source.

Keeping `conditions/` and `longevity/` apart prevents strong condition evidence
from lending borrowed credibility to weaker longevity claims.

## Frontmatter contract

Every entry file carries:

```yaml
---
id: kebab-case-identifier
topic: condition | marker | intervention | pattern
strength: strong | moderate | weak | disputed | insufficient
authorities: [short names of the governing bodies or trials]
last_reviewed: YYYY-MM-DD
review_cycle: 12 months | annual
routing_required: true | false
---
```

`strength` in frontmatter is the **strongest** claim in the file. Individual
claims inside carry their own labels, which may be lower.

`routing_required: true` means the topic cannot be answered without naming what
belongs to a clinician.

## Citation rule

Every claim cites the underlying source, never this corpus and never the skill.
Include a resolvable identifier — DOI, PubMed ID, or a stable URL — so a reader
can verify the claim and reconstruct its history.

## Review

`last_reviewed` is not decoration. Guidelines change: ADA revises Standards of
Care annually, so condition entries anchored to it carry
`review_cycle: annual`. Everything else defaults to 12 months.

An entry past its review cycle is still usable, but its date must be stated when
a numerical target or guideline position is quoted.
