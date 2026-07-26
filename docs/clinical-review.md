# Clinical Review Gate

Clinical review is required before a public health release. Evidence research,
identifier verification, structural validation, and model evaluation do not
substitute for review by a qualified clinician.

The machine-readable status is `clinical-review-status.yaml`. Every runtime
evidence entry must appear there. Entries with `routing_required: true` have
`priority: high`.

## Reviewer qualification

Use a registered dietitian, physician, or pharmacist whose current professional
scope covers the entry. One reviewer need not approve every topic. Record the
credential and jurisdiction exactly enough to verify it independently.

## Review packet

For each entry, give the reviewer:

1. the complete evidence entry;
2. every underlying source used by its claims;
3. `policy/evidence-labels.md`;
4. `safety-and-context.md`;
5. the matching evaluation fixtures;
6. the intended user-facing scope: education, not diagnosis or treatment.

Ask the reviewer to check:

- factual accuracy and citation faithfulness;
- population and outcome applicability;
- evidence-strength labels;
- numerical targets and effect sizes;
- contraindications, interactions, and escalation criteria;
- whether the boundary prevents individualized diagnosis or treatment;
- wording likely to be misunderstood as clinical advice.

## Recording a decision

Keep `status: pending` until review is complete. For an approved entry, replace
the compact manifest item with:

```yaml
- id: example-entry
  priority: high
  status: approved
  reviewer:
    name: Full name
    credential: Profession, registration or licence, jurisdiction
    reviewed_on: YYYY-MM-DD
    scope: Claims, boundaries, citations, and strength labels
    decision: Approved for the stated educational scope
```

Use `status: changes-requested` when any issue remains. Do not mark an entry
approved from an AI review, editorial review, source-resolution check, or
structural validator result.

## Release rule

No public health release while any shipped evidence entry is `pending` or
`changes-requested`. Internal research and evaluation builds must visibly state
that clinical review is incomplete.

Run the release gate with:

```sh
ALERE_PUBLIC_RELEASE=1 ruby skill/scripts/validate-knowledge.rb
```

It must fail until every shipped entry has valid approval metadata.
