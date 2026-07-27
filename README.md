# Alere: Health Intelligence

Alere is a maintained knowledge base of evidence-informed, practical decisions
for healthy longevity. It turns current knowledge and personal context into a
clear answer: what to keep, what to limit, what to add, what may be missing, and
what information is still needed.

The project combines an implementation-independent AI skill with a planned native
iOS application. The skill is the base: it holds the behavior, the evidence
corpus, practical food knowledge, and the safety boundaries. Its foundational
recipes, meal constructors, cooking methods, and substitutions help the
assistant suggest food that is both health-supporting and enjoyable. The
application is a client of that skill.

Nutrition is the first domain, including the metabolic conditions where dietary
evidence is strongest. The same approach may later expand to movement, sleep,
recovery, stress, and sustainable daily habits.

## Principles

- State how strong the evidence is, every time it matters.
- Cite the underlying source, never the assistant itself.
- After verification, say "no reliable source was found" instead of filling the
  gap.
- Prefer practical, sustainable improvements over rigid rules.
- Respect personal context, preferences, culture, budget, and accessibility.
- Do not diagnose, prescribe, or replace qualified medical care.

## Structure

### Skill — behavior and knowledge

- `skill/SKILL.md` — compact core workflow and reference routing
- `skill/references/policy/evidence-labels.md` — how strength of evidence is assessed
  and reported
- `skill/references/evidence/` — strength-labeled, cited evidence corpus
  (`conditions/`, `nutrients/`, `longevity/`, `guidelines/`)
- `skill/evaluations/` — versioned fixtures for answer quality, safety, and
  consistency
- `skill/references/workflows/` — task-specific response playbooks
- `skill/references/disordered-eating-safety.md` — restriction, elimination, and
  weight-loss safety; takes precedence over the nutrition question
- `skill/references/safety-and-context.md` — personalization and safety rules
- `skill/references/self-experimentation.md` — bounded personal experiments
- `skill/references/failure-modes.md` — detailed evidence, guidance, and safety
  errors loaded only for relevant requests
- `skill/references/sources/registry.md` — authoritative sources and usage rules
- `skill/maintenance/source-monitoring.yaml` — source roles, review cadence, and
  literature queries
- `skill/maintenance/review-queue.yaml` — unreviewed discoveries awaiting
  editorial verification
- `skill/maintenance/CHANGELOG.md` — user-relevant history of runtime knowledge
  changes
- `skill/references/practical/index.md` — routing into practical knowledge
- `skill/references/practical/` — reviewed recipes, constructors, menus, and
  localization
- `skill/references/knowledge/archive/` — quarantined imported material
- `skill/references/editorial-*.md` — development inputs, not runtime authority
- `skill/scripts/validate-knowledge.rb` — validates the corpus
- `skill/scripts/maintain-knowledge.rb` — checks maintenance deadlines and
  discovers review candidates
- `skill/agents/openai.yaml` — skill interface metadata

### Documentation — product decisions

- `docs/vision.md` — purpose and current scope
- `docs/concept.md` — strategy, evidence, competitive and regulatory analysis
- `docs/product.md` — product decisions and validation criteria
- `docs/assistant-capabilities.md` — situations and personalization boundaries
- `docs/verification-playbook.md` — how to verify a claim before it becomes an
  evidence entry, and how to confirm an identifier supports it
- `docs/knowledge-maintenance.md` — stable/frontier layers and the recurring
  update process
- `docs/clinical-review.md` and `docs/clinical-review-status.yaml` — reviewer
  procedure and machine-checked public-release gate
- `docs/superpowers/specs/` — approved product and technical designs
- `docs/superpowers/plans/` — implementation plans

## Validating corpus structure

```sh
ruby skill/scripts/validate-knowledge.rb
```

Checks that every evidence claim carries a strength label, that entries contain
citation identifiers or URLs, declare a boundary and a valid review date, that
evaluation fixtures are well-formed, and that prohibited runtime language does
not appear. A claim section without its own citation and an entry past its review
cycle are reported as warnings.

The script does not resolve identifiers, verify that a source supports a claim,
or test answer quality. Source verification follows
`docs/verification-playbook.md`. Answer quality is evaluated by running the
fixtures in `skill/evaluations/` against generated output and scoring them — see
that directory's README for the scoring rules and blocking failures.

## Contributing knowledge

Nothing enters the runtime corpus without passing
`skill/references/editorial-promotion-checklist.md`. Interesting is not
sufficient; a claim needs a source, a strength assessment, and a practical
benefit.

New components are added only when real use creates a clear need.
