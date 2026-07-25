# Editorial Promotion Checklist

Use this checklist before moving an idea, source, recipe, or protocol into
runtime knowledge.

Verify the claim **before** running this checklist. The procedure — how to search,
how to confirm an identifier actually supports its claim, and how to choose a
strength label — is `docs/verification-playbook.md`, with the source lookup table
in `docs/source-registry.md`. Both are repository documentation, not runtime
references.

## 1. Define the proposed addition

- State the user problem it solves.
- Identify whether it is a workflow, factual claim, numerical target, recipe,
  substitution, safety rule, or regional adapter.
- Confirm that the capability is not already present.

## 2. Classify the source

- guideline or official public-health source;
- systematic review or consensus statement;
- human randomized trial;
- observational or mechanistic evidence;
- educational summary;
- personal protocol, testimonial, or marketing material.

Record population, jurisdiction, publication or revision date, directness,
uncertainty, conflicts of interest, and current applicability.

## 3. Check independence

- Prefer an authority or independent research group over the seller of a
  product or protocol.
- Do not use a personal result to establish causality.
- Separate clinical outcomes from biomarkers and surrogate biological-age
  measures.
- Look for converging independent evidence when a claim is disputed or
  commercially valuable.

## 4. Check safety and scope

Do not promote content that would make the assistant diagnose, prescribe
tests, set supplement doses, change medication, recommend therapeutic diets,
or normalize experimental procedures.

Route pregnancy, children, allergies, eating-disorder signals, medication
interactions, significant symptoms, chronic disease, and laboratory
interpretation through `safety-and-context.md`.

## 5. Check licensing and provenance

- Record the canonical URL and license or reuse terms.
- Do not copy protected text, illustrations, branded frameworks, exact menus,
  or recipes into a potentially commercial product without suitable rights.
- Prefer independently written summaries of public facts.
- Preserve required attribution when reuse is permitted.

## 6. Choose destination

- `evidence/conditions/` — a claim about a condition or laboratory marker.
- `evidence/longevity/` — a claim about healthspan, ageing, or a longevity
  intervention.
- `evidence/guidelines/` — how to handle guidance itself, including conflicts
  between authorities.
- `evidence-strength.md` — a change to how strength itself is assessed or
  reported.
- `disordered-eating-safety.md` — anything affecting how restriction, weight
  loss, or elimination is handled.
- `source-catalog.md` — authoritative-source routing or a named limited source.
- `workflows.md` — reusable response behavior.
- `self-experimentation.md` — bounded behavioral testing.
- `knowledge/runtime/` — reviewed recipes and practical material safe for
  ordinary responses.
- `knowledge/archive/` — incomplete extraction retained only for review.
- `editorial-*.md` — research backlog not approved for runtime use.

### Additional requirements for `evidence/`

An entry is not promotable until all of these hold:

1. Every claim carries an explicit `**Strength:**` label from
   `evidence-strength.md`.
2. Every claim cites a resolvable identifier — DOI, PubMed ID, or stable URL —
   so the claim can be verified and its history reconstructed.
3. The strongest claim in the file matches the `strength` value in frontmatter.
4. A `## Boundary` section names what requires a clinician.
5. `last_reviewed` and `review_cycle` are set. Anything anchored to a guideline
   revised annually carries `review_cycle: annual`.
6. No disease-claim language and no medication guidance anywhere in the file.
7. The file is small enough to load alongside a prompt within a constrained
   context window. Split it rather than exceeding that.

`scripts/validate-knowledge.rb` enforces 1, 2, 4, 5, and 6 mechanically. Items 3
and 7 require human judgement.

## 7. Validate

1. Update routing in `SKILL.md` only when the new reference has a distinct
   trigger.
2. Add the smallest useful text; avoid duplicating another reference.
3. Run `scripts/validate-knowledge.rb` when runtime knowledge changes.
4. Run the skill creator's `quick_validate.py`.
5. Test at least one ordinary case, one uncertain case, and one unsafe
   overreach case.

Promotion requires a clear practical benefit. “Interesting” is not sufficient.
