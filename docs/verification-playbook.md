# Verification Playbook

Status: editorial procedure. Not runtime authority, not loaded by `SKILL.md`.
Last reviewed: 2026-07-25.

How to take a claim from "in hand" to "labelled entry or rejected." This is the
procedural half of the editorial toolchain; the source registry it depends on is
`skill/references/sources/registry.md`.

**What this file is for.** The existing references answer *may I cite this
source?* (`skill/references/sources/registry.md`) and *how do I promote material?*
(`skill/references/editorial-promotion-checklist.md`). Neither answers *how do I
actually check whether this claim is true, and how do I avoid the specific
mistakes already made here?* That is this file.

Read alongside:

- `CLAUDE.md` — the working rules these steps operationalise.
- `skill/references/policy/evidence-labels.md` — what each label means. This file says
  how to *arrive* at one; that file says what it *means*.
- `skill/references/editorial-promotion-checklist.md` — the 7-step gate that runs
  **after** verification succeeds.

---

## 0. The two-directions rule, first because it is skipped first

Every step below applies identically whether you expect to confirm the claim or
refute it. This is the project's most expensive recurring failure, and it has a
specific shape: a verdict issued from a prior instead of a source.

| Failure | What it looks like |
| --- | --- |
| Credulity | "Studies show X" → entry written, no source opened |
| Over-correction | "That's not supported by evidence" → no search run |

**Worked failure.** Intestinal permeability and zonulin were called unestablished
from memory. They are genuine published research: Fasano's zonulin review
(*F1000Research* 2020, PMC6996528, PMID 32051759) and interventional larazotide
reversal work (PMC9405438). The dismissal took one sentence; the correction took a
session. A claim being popular in wellness marketing is not evidence against it,
and an unreliable source is not an anti-authority — correct claims stay correct
regardless of who repeated them.

Three corollaries, all violated at least once here:

1. **Verify before rejecting, not only before accepting.** "Not supported by
   evidence" is itself a claim about the literature. Without a citation it is
   exactly what this project exists to refuse.
2. **Quote before characterising.** Read the wording before summarising a
   position. Paraphrase drifts toward the extreme, and the extreme is then easy to
   knock down. If the summary carries weight, quote it.
3. **Count what supports as deliberately as what contradicts.** Reporting only
   the problems is a biased summary even when every problem listed is real. The
   transcript corpus was called a "map of misconceptions" after its dangerous
   claims were catalogued and its mainstream-correct majority was not.

When a claim appears in more than one strength across a body of material, say
so. In the transcript corpus the hedged and unhedged forms of the permeability
claim genuinely coexist — `Урок 12` hedges ("может", "на стадии изучения") while
`Урок_14_Часть_6` states the strong version outright. A verdict about 73 files
drawn from a handful of hits was wrong twice, in opposite directions, for the
same reason.

---

## 1. The procedure

### Step 1 — Write the claim down as a testable proposition

Split it until each piece can be true or false independently. Most bad entries
are one sentence doing four jobs.

Decompose along: **population**, **exposure/dose**, **outcome**, **effect
direction and size**, **claimed certainty**. "Leaky gut causes autoimmune
disease" is not one claim — it is a mechanism claim, a diagnostic-entity claim, a
causal-direction claim, and a treatability claim, which land at *different
strengths*. Labelling the topic instead of the claim is the error
`policy/evidence-labels.md` Rule 1 names.

Also decide now what would falsify it. If nothing would, it is not a claim yet.

### Step 2 — Check the corpus before searching outward

```sh
rg -i 'zonulin|permeabilit' skill/references/evidence/
```

Prefer an existing entry over re-deriving a claim. If an entry exists, your job
is either to cite it or to change it deliberately, with the reason recorded.

### Step 3 — Search in priority order

Order is in `skill/references/sources/registry.md` §Routing. Do not stop at the first hit that
agrees with you — that is how confirmation bias enters a corpus built to prevent
it. Search until you can state what the *best-quality* evidence says, and note
disagreement when you find it.

Run at least two distinct query formulations before concluding absence. A single
zero-hit search is not evidence of absence, for the tooling reasons in §4.

### Step 4 — Open the source. Actually open it

Reading the abstract is the minimum; reading the results section is the standard
when you are about to quote a number. **Never** cite from a title, a search
snippet, another paper's description of it, or memory of having read it.

This is where the "real numbers, wrong paper" defect enters (§3), and it is not
caught downstream — the validator checks that a link resolves, not that it
supports anything.

### Step 5 — Confirm the identifier supports the claim

Full procedure in §2. This is a separate step from Step 4 and cannot be merged
into it: Step 4 establishes what the paper says, Step 5 establishes that the
identifier you are about to write points at *that* paper.

### Step 6 — Assign a strength label

Full procedure in §3.

### Step 7 — Write it, or reject it in writing

If it passes, write the entry per `evidence/README.md`'s frontmatter contract and
run it through `editorial-promotion-checklist.md`.

If it fails, **record the rejection and why.** An unrecorded rejection gets
re-litigated next session from the same missing evidence. If sources cannot be
verified in the moment, say so and stop — do not write the entry with placeholder
authority.

---

## 2. Confirming an identifier supports its claim

A resolving identifier proves only that *something* is there. Both real defects
in this repo resolved cleanly and passed validation silently. The validator's
citation check is `text.match?(%r{doi\.org/|pubmed\.ncbi\.nlm\.nih\.gov/|https?://})`
— a regex for link *shape*. Nothing mechanical can do this step for you.

### The three-question test

For every identifier, before writing it:

1. **Does it resolve?** (weakest question, the only automatable one)
2. **Is the thing it resolves to the paper you actually read?** — catches
   transposition.
3. **Does that paper contain the specific number, population, and analysis you
   are attributing to it?** — catches misattribution.

### Route A — DOI via Crossref

Metadata only, no paywall, no bot-blocking, no key. **This is the workaround for
publisher sites that 403 WebFetch** (MDPI, Cochrane, diabetesjournals.org).

```sh
curl -s 'https://api.crossref.org/works/10.1136/bmj.m2412' | jq '.message | {title, "container-title", volume, issued}'
```

Verified 2026-07-25: returns `"Dietary intake of total, animal, and plant
proteins and risk of all cause, cardiovascular, and cancer mortality: systematic
review and dose-response meta-analysis of prospective cohort studies"`, *BMJ*,
2020. Add `&mailto=you@example.org` for Crossref's polite pool.

Crossref often carries the abstract, which is enough to answer question 3 for
many claims:

```sh
curl -s 'https://api.crossref.org/works/10.3390/nu14020272' | jq -r '.message.abstract'
```

### Route B — PMID via NCBI E-utilities

Check PMIDs in **batches**, because the error you are hunting is a
transposed digit that lands on a real, topically adjacent paper. Seeing the
titles side by side is what makes it visible.

```sh
curl -s 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=32669325,32699048&retmode=json' \
  | jq -r '.result[]? | select(type=="object") | "\(.uid)\t\(.source)\t\(.title)"'
```

Verified 2026-07-25 — this is the actual repo defect:

| PMID | Journal | Title |
| --- | --- | --- |
| 32669325 | *J Am Soc Nephrol* | The Effects of High-Protein Diets on Kidney Health and Longevity |
| 32699048 | *BMJ* | Dietary intake of total, animal, and plant proteins… |

`32669325` was used for Naghshi. It resolves, it is real, it is about protein —
and it is the wrong paper. **Nothing but reading the returned title catches
this.** Docs: <https://www.ncbi.nlm.nih.gov/books/NBK25501/>.

### Route C — Cross-check identifiers against each other

Never carry a DOI and a PMID that you verified independently but never checked
were the *same paper*. The PMC ID converter maps all three:

```sh
curl -s 'https://pmc.ncbi.nlm.nih.gov/tools/idconv/api/v1/articles/?ids=PMC6996528&format=json' | jq '.records'
```

Verified 2026-07-25: PMC6996528 → PMID 32051759, DOI
`10.12688/f1000research.20510.1`. Note the old `www.ncbi.nlm.nih.gov/pmc/utils/idconv/v1.0/`
path now 301-redirects here.

If the converter's PMID and the PMID you wrote disagree, one of them is wrong.
Stop and resolve it — do not write both.

### Route D — Full text, for when you must quote

Open-access full text as XML, no paywall:

```sh
curl -s 'https://www.ebi.ac.uk/europepmc/webservices/rest/PMC6996528/fullTextXML'
```

Verified 2026-07-25: returns complete body sections for the Fasano review. Use
this to confirm a number appears in the results, and to quote the authors' own
certainty language (§3).

Search by DOI when you have no PMC ID:

```sh
curl -s 'https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=DOI:%2210.3390/nu14020272%22&resultType=core&format=json' \
  | jq -r '.resultList.result[0] | "\(.pmid)\t\(.title)"'
```

Verified 2026-07-25: returns PMID 35057453, *Nutrients* 2022, abstract present.

### The two defect signatures, and what catches each

| Defect | Repo instance | Why review misses it | Catch |
| --- | --- | --- | --- |
| **Misattribution** — real numbers, wrong paper | `protein.md` quoted substitution RRs 0.54–0.95 (all-cause) and 0.58–0.91 (CVD) against Naghshi *BMJ* 2020;370:m2412, which contains **no substitution analysis**; the figures are from *Nutrients* 2022;14(2):272 | The DOI resolves and the paper is topically correct | Question 3. Search the full text for the actual number before attributing it |
| **Transposition** — digits swapped | PMID 32669325 for Naghshi; the real PMID is 32699048 | Resolves to a real, topically adjacent paper | Question 2. Batch-esummary and read the titles |

Misattribution has a tell worth learning: a claim citing a source that is
*plausible but does the wrong analysis*. When a source supports the topic but you
cannot find your specific number in it, the number came from somewhere else.
Find that somewhere and cite it, as `protein.md` now does with the separate Zheng
citation.

---

## 3. Mapping a source onto the five labels

Labels are defined in `skill/references/policy/evidence-labels.md`
(`strong` / `moderate` / `weak` / `disputed` / `insufficient`; there is no
`none` — fixtures allow it, entries do not). This section is the *procedure* for
choosing one.

### Rule 1 — The source's own certainty rating governs

**If the source grades its own certainty, that grade caps your label.** You do
not get to exceed the authors' stated confidence in their own work.

**Worked failure.** `fiber.md` labels the 25–29 g/day claim `strong`, while
Reynolds 2019 grades dietary-fibre certainty as **moderate**. The entry is more
confident than the paper it cites. That is indefensible in either direction: it
cannot be repaired by argument, only by matching the source or citing a different
one.

Practical check — search the full text (Route D) for `GRADE`, `certainty`,
`quality of evidence`, `moderate`, `low`. If the paper says moderate, you write
`moderate`.

### Rule 2 — Never merge certainty with recommendation strength

The distinction GRADE exists to protect. A guideline can issue a **strong
recommendation on low-certainty evidence** when harm is minimal. Our labels rate
**certainty**. When they diverge, state both, as `policy/evidence-labels.md` shows.

### Rule 3 — Judge against what nutrition research can achieve

Long-term randomised feeding trials with hard outcomes are largely infeasible, so
applying drug-trial standards unmodified would label nearly everything `weak` —
uninformative. Use NutriGrade's logic: state the design honestly, do not
automatically downgrade all observational evidence, and never imply drug-trial
certainty where none exists.

### Decision aid

Read top to bottom; the first row that matches wins.

| If | Label |
| --- | --- |
| The source grades its own certainty | **That grade**, as a ceiling (Rule 1) |
| Reputable sources disagree, or trials conflict | `disputed` |
| Only mechanistic, animal, or in-vitro evidence | `insufficient` |
| No usable human evidence at all | `insufficient` |
| Current guideline from a recognised authority, applied to the population asked about | `strong` |
| Consistent meta-analysis of human RCTs | `strong` |
| RCTs agree but are small, short, single-setting, or no guideline has adopted it | `moderate` |
| Consistent observational data, no trial confirmation | `weak` |
| Pilot, uncontrolled, or a guideline rating its own recommendation low-quality | `weak` |

Then apply the traps that do not fit a table:

- **Population shift** — evidence for adults with obesity is not evidence for lean
  adults; a supervised trial is not self-directed use.
- **Surrogate outcomes** — a biomarker change is not a health change. Label it for
  what it is.
- **Mechanism is not evidence** — "reduces inflammation in vitro" is
  `insufficient`, not `weak`.
- **Borrowed credibility** — a citation covers only what it actually says.
  Re-check when the claim shifts population, dose, or outcome.
- **Absence is a finding.** If nothing usable exists, say so. Do not substitute
  plausible reasoning.
- **Do not move a label for social reasons** — not up because the user wants
  certainty, not down to seem cautious. Both are dishonest.

Frontmatter `strength` is the **strongest** claim in the file; individual claims
carry their own, which may be lower.

---

## 4. Tooling traps

All of these produced a wrong conclusion here at least once.

### `grep -E` does not accept `\|`

`\|` is BRE alternation. In ERE it matches a literal pipe, so the pattern
silently returns **zero hits** — which reads as "the topic is absent."

```sh
rg -i 'zonulin|permeabilit' transcripts/     # correct
grep -E 'zonulin\|permeabilit' transcripts/  # zero hits, no error
```

**Confirm every negative result with a second, differently-shaped pattern before
concluding absence.** A zero-hit search is a claim about the corpus and needs the
same scepticism as a claim about the literature.

### Catastrophic backtracking on the transcript corpus

Wide-context regex over 73 files (~128k words) can hang. Use Python with a
normalised single-line buffer for context extraction rather than a multiline
regex with wide `.{0,N}` windows.

### `timeout` is unavailable

macOS without coreutils. Do not write it into a command expecting it to work.
(`gtimeout` if coreutils is installed, otherwise restructure.)

### Publisher sites 403 WebFetch

Not a dead link and not evidence the paper does not exist. Verified 2026-07-25 as
403: Cochrane Library, MDPI, diabetesjournals.org. Use the metadata APIs in §2 —
they are not bot-blocked. Record access status in the registry rather than
dropping the source.

### Non-obvious: a resolving link proves nothing about support

Restated here because it is a *tooling* trap, not just an editorial one. The
validator's citation check is a regex for URL shape. Passing validation means the
text contains something link-shaped — not that the citation is correct, not that
it supports the claim.

---

## 5. Worked example, end to end: intestinal permeability

Chosen because one topic lands at three different strengths, so it exercises
every part of the procedure. Result: `skill/references/evidence/nutrients/intestinal-permeability.md`.

**Step 0 — the starting position was a rejection.** "Leaky gut is not supported
by evidence," issued from memory, no search. Per §0 that is a claim about the
literature with no citation. Restart.

**Step 1 — decompose.** The single popular claim splits into four propositions
that turn out to have different answers:

| # | Proposition |
| --- | --- |
| A | Tight junctions and zonulin regulate barrier permeability; deregulation is implicated in specific autoimmune disease |
| B | "Leaky gut syndrome" is a diagnosable entity with a validated test |
| C | Permeability is the root cause of all autoimmune disease |
| D | Commercially sold zonulin ELISA tests measure zonulin |

Collapsing A–D into one verdict is what produced both the original credulous
version *and* the over-corrected dismissal.

**Step 3–4 — search and open.** For A, Fasano's review; the strongest directional
evidence is interventional, not correlational — *R. gnavus* strains from lupus
patients induced zonulin-mediated permeability, reversed by larazotide acetate.

**Step 5 — confirm identifiers.** Route D returned the Fasano full text and
confirmed the title. Route C mapped PMC6996528 → PMID 32051759 → DOI
`10.12688/f1000research.20510.1`, all three consistent.

**Step 6 — label each proposition separately:**

| # | Label | Reasoning |
| --- | --- | --- |
| A | `moderate` | Mechanism published and interventionally supported in models, but not shown diet-modifiable in a given patient, and not shown to treat established disease |
| B | `insufficient` | No accepted diagnosis, no validated test |
| C | `insufficient` | Causal direction unsettled and condition-dependent; for Crohn's and coeliac, altered permeability looks like a consequence |
| D | `moderate` | The assay-invalidity finding is itself well replicated — kits fail to detect recombinant pre-haptoglobin-2 and recognise properdin |

D shows why Rule 1 of §3 needs care about *what* is being labelled: the evidence
that the test does not work is solid, but labelling it `strong` would make the
entry read as strong evidence *about permeability*. The file records that
reasoning inline rather than leaving the label to be second-guessed.

**Step 7 — both directions in the output.** The entry says the mechanism is real
research and must not be called a myth, *and* that the syndrome, its tests, and
its cure claims are unsupported. Frontmatter carries `strength: moderate` (the
strongest claim), `routing_required: true`, and a `## Boundary` naming what
belongs to a clinician — including that larazotide is investigational and must
never be presented as available treatment.

**What the example demonstrates:** the four-way split is the whole result. No
single label is a defensible answer to "is leaky gut real?", and the procedure's
value is that it forces the question apart before a verdict is issued.
