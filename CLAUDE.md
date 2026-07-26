# Alere: Health Intelligence — working rules

Project-specific rules for working in this repository. These exist because each
one was violated in practice and cost real work.

The procedure that operationalises these rules — how to verify a claim, how to
confirm an identifier supports it rather than merely resolving, how to pick a
strength label, and which database answers which question — is
`docs/verification-playbook.md` and
`skill/references/sources/registry.md`. Read them before writing or challenging
an evidence entry.

## The standard applies to you, not just to the skill

The skill demands a resolvable source for every material claim. That rule governs
**your own statements in the conversation** identically. Saying "this is not
supported by evidence" is itself a claim about the literature; without a citation
it is exactly what the skill is built to refuse.

Symptom to watch for: writing a confident verdict about what science says, from
memory, while working on a file whose whole purpose is to forbid that.

## Verify before rejecting, not only before accepting

Credulity and over-correction are the same failure. Both substitute a prior for a
source.

- Before calling a claim unsupported, **search the literature.** A claim being
  popular in wellness marketing, or repeated by an unreliable source, is not
  evidence against it.
- A real mechanism can coexist with an unsupported consumer syndrome, invalid
  commercial tests, and false cure claims. Separate these explicitly instead of
  collapsing them into one verdict. Worked example:
  `skill/references/evidence/nutrients/intestinal-permeability.md`.
- An unreliable source is not an anti-authority. Correct claims stay correct
  regardless of who repeated them.

## Quote the source before characterising it

Read the actual wording before summarising a position, and quote it when the
summary carries weight. Paraphrase drifts toward the extreme, and an
absolutist reading is then easy to knock down.

Real instance, and note it cuts both ways. A first pass summarised the transcript
corpus as claiming "leaky gut is the root cause of all autoimmune disease" without
checking the wording. A correction pass then found hedged phrasing in `Урок 12` and
`Урок 14. Часть 4` ("может", "механизм не до конца понятен", "на стадии изучения")
and concluded the corpus had merely been hedging — also without checking the rest.
`Урок_14_Часть_6` in fact states the strong version outright: «первопричина
аутоиммунных процессов в нашем кишечнике», «мы с вами будем лечить первопричину»,
«первопричина изначально одна, поэтому и лечение будет одно», «я видела этих людей,
исцелившихся».

Both passes were wrong for the same reason: a verdict about 73 files drawn from a
handful of hits. Search the whole corpus, and when a claim appears in more than one
strength, say so — the hedged and unhedged forms coexist here.

## Count what supports, not only what contradicts

When assessing source material, tally corroborating content as deliberately as
problems. Reporting only the problems is a biased summary even when every listed
problem is real.

Real instance: the transcript corpus was described as a "map of misconceptions"
after cataloguing its dangerous claims without counting its mainstream-correct
ones — which turned out to be its core (legumes, fibre, microbiome, whole grains,
all consistent with the existing corpus and with the literature).

Corrected figure, and a lesson in itself: legumes appear ~194 times across 28 of
73 files, not the "438 across 67" an earlier pass recorded. That inflated count
came from a pattern where `\bнут\b` matched inside unrelated words (`минут`,
`нутриент`). A measured number is a claim too — verify the pattern before quoting
the count.

## Never invent an identifier

DOIs, PMIDs, trial names, guideline numbers, and effect sizes are either verified
or absent. A fabricated citation is worse than an acknowledged gap, and
`skill/scripts/validate-knowledge.rb` enforces a resolvable link per evidence
entry precisely so this cannot pass quietly.

When sources cannot be verified in the moment, say so and stop — do not write the
entry with placeholder authority.

A resolving identifier is not a verified one. Both defects found here resolved
cleanly and passed validation: real substitution numbers attributed to a paper
containing no substitution analysis, and a transposed PMID landing on a real,
topically adjacent paper. Check that the identifier points at the paper you read
*and* that the paper contains your number —
`docs/verification-playbook.md` §2 has the API routes.

## Search tooling

- `grep -E` does not accept `\|` for alternation; that is BRE syntax. Mixing them
  yields **zero hits silently**, which reads as "the topic is absent."
- Confirm a negative result with a second pattern before concluding absence.
- Wide-context regex over the 73-file transcript corpus can hit catastrophic
  backtracking. Use Python with a normalised single-line buffer for context
  extraction.
- `timeout` is not available on this machine (macOS, no coreutils).

## Repository conventions

- **Do not commit** unless explicitly asked.
- **Do not delete or revert uncommitted work.** Multiple sessions have work in
  progress here; `git checkout`, `git restore`, `git stash`, and `git rm` are
  off-limits without an explicit instruction.
- Add new files and make targeted edits; never overwrite another session's
  uncommitted changes.
- Run `ruby skill/scripts/validate-knowledge.rb` after touching anything under
  `skill/`. It checks evidence frontmatter, strength labels, resolvable
  citations, fixture schema, and banned runtime language.
- Evidence frontmatter `strength` accepts only: `strong`, `moderate`, `weak`,
  `disputed`, `insufficient`. There is no `none` — fixtures allow it, entries do
  not.
- Every evidence entry needs a `## Boundary` section and at least one resolvable
  link.

## The transcript corpus

`transcripts/` holds 73 files (~128k words) from a Russian-language nutrition
course plus several documentaries. Its status:

- **Not a citable source.** No resolvable citations anywhere in the course; claims
  appeal to "there are studies" without naming them. Licensed material — do not
  copy text into the corpus.
- **A list of topics to cover with real sources.** Where it raises a subject the
  corpus lacks, that is a signal to source it properly, not to cite the course.
- **Claim-by-claim, never in blocks.** Correct and incorrect statements sit in the
  same paragraph. Example: the conclusion that fish-oil supplements failed in
  large RCTs is right (Cochrane CD003177.pub5, high certainty for all-cause
  mortality and CV events); "one tablespoon of flax covers the omega-3
  requirement" is wrong, since it meets EFSA's ALA adequate intake but supplies no
  EPA/DHA against the separate 250 mg/day AI, and ALA→DHA conversion is ~9% in
  women and near-absent in men.
- **The recurring defect is magnitude, not direction.** Conclusions are often
  right while the numbers attached to them are garbled or invented. "Vegans
  convert ALA 80% better" has no source; the real finding is that non-fish-eaters'
  *intake* was 57–80% of fish-eaters'. Check every figure separately from the
  claim it supports.
- **One earlier assessment of this corpus was itself wrong.** "Antinutrients do
  not exist" was filed as an internal contradiction of the course. It is not a
  contradiction — it is a direct factual claim (`Урок_15`: «В них нет никаких
  антинутриентов, это еще один из мифов», soaking «не для того, чтобы снизить
  количество антинутриентов») and the literature contradicts it. Soaking measurably
  reduces phytate, RFO, tannins and lectins, and for kidney beans soaking plus
  vigorous boiling is a documented safety requirement — EFSA CONTAM,
  doi:10.2903/j.efsa.2026.9850. Classify against the literature, not against the
  corpus's own consistency.
- Quoting a claim inside an evaluation fixture is fair use and is the intended
  path for this material.
