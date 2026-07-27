# Alere: Health Intelligence — Vision

Last reviewed: 2026-07-26.

## Purpose

Alere helps people make better everyday decisions for long-term health by
showing what is actually proven, how strong that proof is, and one thing they
can do today. Nutrition is the first domain.

The goal is healthy longevity — healthspan, not merely lifespan. Specific health
conditions are how people arrive; long-term health is what the product serves.

It is not a diet program, a calorie counter, a food-ranking system, or a
replacement for medical care. Its role is to turn complex and often contradictory
nutrition information into a decision a person can realistically act on, without
overstating what the evidence supports.

## Core concept

Alere is not a research search engine or a collection of abstract healthy-eating
rules. It is a maintained knowledge base of evidence-informed, practical
decisions. It turns current health knowledge and personal context into a clear
answer:

- what to keep;
- what to limit;
- what to add;
- what may be missing;
- and what information is still needed before giving a responsible answer.

The knowledge base combines reviewed evidence with practical food knowledge:
foundational recipes, meal constructors, cooking methods, substitutions, and
principles for combining ingredients. Alere uses these foundations to suggest or
adapt meals that are both health-supporting and enjoyable, while accounting for
the person's preferences, available ingredients, budget, time, equipment,
culture, location, and relevant health constraints.

Search is an input to this knowledge system, not a substitute for it. New
research and guidance must be assessed for quality, applicability, consistency,
and practical value before becoming runtime knowledge. The knowledge base must
be reviewed and updated regularly, and it must distinguish:

- established consensus;
- credible newer evidence not yet widely reflected in routine care;
- preliminary or disputed findings;
- and claims that current evidence does not support.

Being newer than routine practice is not itself evidence of being better. Alere
should explain when evidence may not yet be reflected consistently across
clinics, hospitals, and other care settings without presenting novelty as
authority.

## What makes it different

Calibration. The same product says "remission is documented, and here is the
consensus statement that defines it" for one condition, and "the evidence is
low quality, and it belongs alongside your treatment rather than instead of it"
for another.

Trackers have nothing to show. General-purpose AI answers both with identical
confidence. Lifestyle-medicine programs tend to flatten both into "reversal."

## Current scope

Alere exists as an evolving AI skill — the portable definition of behavior and
knowledge — focused on:

- answering questions about diet and specific conditions or markers, with the
  strength of evidence stated and the underlying source cited;
- checking nutrition claims encountered elsewhere;
- explaining what is established about eating for long-term health, and what is
  sold without evidence;
- evaluating meals and eating patterns;
- suggesting realistic improvements and substitutions;
- adapting guidance to goals, preferences, culture, budget, and constraints.

The initial evidence corpus covers the metabolic cluster — prediabetes, type 2
diabetes, elevated LDL, hypertension, MASLD — plus dietary patterns for
healthspan and the longevity interventions that lack human evidence.

## Direction

The skill is the base. A native iOS application is its first client, built around
one loop: a question, a calibrated answer with its source, one practical action,
and feedback.

Nutrition is the starting domain, not the final boundary. Once the same evidence,
safety, personalization, and maintenance standards can be supported, Alere may
expand into other parts of lifestyle that shape long-term health, including
movement, sleep, recovery, stress, and sustainable daily habits.

Product interface, persistence, system integrations, and provider routing belong
outside the skill.

## Boundaries

Alere stays on the education side of the line between explaining evidence and
directing treatment. It does not diagnose, interpret laboratory results, set
supplement doses, design therapeutic plans, or give medication guidance — and it
says which part of a question requires a clinician.

When the local corpus has no reviewed answer, Alere checks current authoritative
sources when possible. If no reliable source is found—or verification is
unavailable—it says so rather than producing a plausible answer.

## Related documents

- `docs/concept.md` — strategy, evidence, competitive and regulatory analysis
- `docs/product.md` — product decisions and validation criteria
- `docs/assistant-capabilities.md` — situations and personalization boundaries
