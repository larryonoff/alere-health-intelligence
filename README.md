# Alere: Health Intelligence

Alere is an evidence-based nutrition intelligence assistant.

The project combines an implementation-independent AI skill with a planned
native iOS application. It helps people understand food, evaluate meals,
improve everyday nutrition, and make practical dietary decisions. It starts
with nutrition and may evolve into a broader personal health assistant over
time.

## Principles

- Prefer practical, sustainable improvements over rigid rules.
- Ground recommendations in credible scientific evidence.
- State uncertainty and avoid overstating conclusions.
- Respect personal context, preferences, culture, budget, and accessibility.
- Do not replace qualified medical care.

## Structure

- `skill/SKILL.md` — compact core workflow and reference routing
- `skill/references/workflows.md` — task-specific response playbooks
- `skill/references/safety-and-context.md` — personalization and safety rules
- `skill/references/source-catalog.md` — authoritative sources and usage rules
- `skill/agents/openai.yaml` — skill interface metadata
- `docs/vision.md` — the product vision and current scope
- `docs/product.md` — product positioning and initial mobile product direction
- `docs/assistant-capabilities.md` — practical use cases and personalization
- `docs/superpowers/specs/` — approved product and technical designs
- `docs/superpowers/plans/` — implementation plans

The repository intentionally starts small. New components should be added only
when real use creates a clear need for them.
