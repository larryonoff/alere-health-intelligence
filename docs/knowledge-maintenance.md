# Knowledge Maintenance

Status: operational process  
Last reviewed: 2026-07-26

Alere maintains a reviewed knowledge base; it does not copy search results into
runtime answers. Search, universities, journals, public bodies, and clinical
organizations are inputs to the same claim-level verification process. No
institution is a source of truth by brand.

## Two knowledge layers

### Stable

Material supported by applicable guidance, current systematic synthesis, or
consistent independent human evidence. Stable does not mean permanent. Every
entry retains a review date and may be revised, restricted, or withdrawn.

### Frontier

Credible newer evidence that may not yet be reflected in routine care or formal
guidance. Frontier material is useful for early detection and honest discussion,
but it does not silently change stable recommendations.

An item moves from frontier to stable only after claim-level verification,
independent confirmation, evaluation, and any required clinical review. A
credible safety signal may restrict or suspend a stable recommendation before
the full promotion process finishes.

## Source roles

`skill/maintenance/source-monitoring.yaml` is the machine-readable monitoring
manifest. Roles are deliberately separate:

- `academic-synthesis` translates a broad evidence base into practical language;
- `evidence-synthesis` evaluates a defined question systematically;
- `public-health-guidance` and `regulatory-science` establish population and
  regional baselines;
- `clinical-guidance` applies to a named condition and preserves its own evidence
  grade;
- `primary-research` and `research-publications` detect the frontier;
- `regional-guidance` provides local applicability;
- `government-guidance` may mix evidence with policy and always requires
  independent comparison when disputed.

Harvard Nutrition Source is the leading academic synthesis for general nutrition
and practical translation. It is not a substitute for its underlying sources,
condition-specific guidance, European reference values, or independent
confirmation. The same rule applies to every university.

## Update cycle

1. **Scan.** Run `ruby skill/scripts/maintain-knowledge.rb scan`. It queries
   Europe PMC for the monitored review topics and appends unseen results to
   `skill/maintenance/review-queue.yaml`. Web pages and organizations without a
   stable feed are reported when their manual check is due.
2. **Triage.** Mark a candidate `relevant`, `not-relevant`, `duplicate`, or
   `needs-full-text`. A candidate is never runtime authority.
3. **Verify.** Follow `docs/verification-playbook.md`: state the claim, search in
   both directions, open the source, confirm the identifier and attributed
   result, assess bias, applicability, conflicts, and recency.
4. **Compare.** Record whether the candidate confirms, narrows, contradicts, or
   supersedes the existing entry. Check at least one independent source.
5. **Promote or reject.** Use
   `skill/references/editorial-promotion-checklist.md`. Record rejections so the
   same weak claim is not repeatedly reconsidered.
6. **Evaluate.** Run corpus validation and the affected answer fixtures.
7. **Review and release.** Obtain clinical review when required. Publish a
   versioned corpus change with a concise record of what changed and why.

## Urgent path

Do not wait for the normal cadence when a credible source reports:

- a serious harm or contraindication;
- a retraction, correction, or materially wrong citation;
- withdrawal or replacement of a guideline;
- a recommendation that may be unsafe for a defined subgroup;
- a blocking failure found by an evaluation or user report.

Restrict the affected runtime claim, open a high-priority review item, verify the
signal against independent evidence, and require approval before restoring or
expanding the recommendation.

## Commands

```sh
ruby skill/scripts/maintain-knowledge.rb check
ruby skill/scripts/maintain-knowledge.rb scan --dry-run
ruby skill/scripts/maintain-knowledge.rb scan --dry-run --all --fail-on-candidates
ruby skill/scripts/maintain-knowledge.rb scan
ruby skill/scripts/validate-knowledge.rb
ALERE_PUBLIC_RELEASE=1 ruby skill/scripts/validate-knowledge.rb
```

`check` is offline and suitable for CI. `scan` needs network access. It creates
editorial candidates only and must never edit `references/evidence/` or
`references/practical/`.

## Scheduling

Run `scan` weekly. The manifest keeps a shorter cadence for safety searches and
a longer cadence for stable guidance pages. Run `check` on every change and on a
daily schedule so an overdue source or literature query becomes visible even
when no editor starts a scan.

`.github/workflows/knowledge-maintenance.yml` runs the offline check daily and a
full network scan every Monday. The scheduled scan is read-only: it fails with
the discovered titles and links when candidates exist, making review work
visible without modifying or publishing the corpus. Editors run the non-dry
scan locally to persist selected discoveries in the queue.
