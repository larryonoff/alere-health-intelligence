# Trusted Source Registry

Status: editorial reference. Not runtime authority, not loaded by `SKILL.md`.
Last reviewed: 2026-07-25. All URLs below were fetched on that date; access
status is recorded per entry.

Where to look, in what order, for which kind of question — with working base URLs
and access notes. The procedure that consumes this file is
`docs/verification-playbook.md`.

**Relationship to `skill/references/source-catalog.md`.** That file is the
*runtime* authority: which sources may be cited when answering a user, with usage
rules and licensing terms. This file is the *editorial* lookup table: where to
search during verification, which endpoint to hit, and what blocks. Bodies
already catalogued there are cross-referenced, not duplicated — open the catalogue
for usage and licence terms before citing anything.

Access legend: **open** = fetched successfully · **403** = bot-blocks automated
fetch, use the metadata route · **unverified** = could not confirm on 2026-07-25.

---

## Routing: which source for which question

First match wins. "Then" indicates the escalation when the first returns nothing.

| Question type | Go to | Then |
| --- | --- | --- |
| Does this DOI point at the paper I read? | Crossref API | Europe PMC search |
| Does this PMID point at the paper I read? | NCBI E-utilities esummary | PubMed web |
| Are my DOI and PMID the same paper? | PMC ID converter | — |
| I need to quote a number from the results | Europe PMC full text XML | PMC OA service |
| Has this intervention been systematically reviewed? | Cochrane | Europe PMC, then §Cambridge |
| European reference value or upper limit | EFSA | NNR2023, National Academies |
| Nordic/European pattern, food group, sustainability | NNR2023 | EFSA |
| Global population target | WHO | NNR2023 |
| US reference value (EAR/RDA/AI/UL) | National Academies | NIH ODS |
| Supplement ingredient, dose, interaction, safety | NIH ODS | EFSA food supplements |
| Diabetes standard of care or threshold | ADA Standards of Care | — |
| Diabetes remission definition | ADA/EASD consensus | — |
| Blood pressure or lipid guidance | AHA/ACC | — |
| Steatotic liver disease | EASL/AGA | — |
| Nutrition mechanism, method, or emerging topic | §Cambridge | Europe PMC |
| Claim attributed to Ornish/Barnard/Esselstyn/Campbell | §Named researchers | — |
| How certain is this body of evidence? | GRADE handbook | NutriGrade |
| Nothing above covers it | Europe PMC — label as unreviewed primary literature | — |

**Evidence hierarchy** for ranking what you find is in
`skill/references/source-catalog.md` §Evidence hierarchy. Source type alone does
not determine strength: assess quality, risk of bias, directness, applicability,
consistency, independence, recency.

---

## Identifier and literature APIs

The verification workhorses. None require a key. All **open** and confirmed
working 2026-07-25 — these are the routes that bypass publisher bot-blocking.

### Crossref REST API — DOI metadata

- Base: `https://api.crossref.org/` — **open**
- Single work: `https://api.crossref.org/works/{DOI}`
- Docs: <https://www.crossref.org/documentation/retrieve-metadata/rest-api/> — **open**

No sign-up. Append `&mailto=you@example.org` for the polite pool (better rate
limits). Returns title, container-title, year, and frequently the abstract.
**Primary workaround for 403 publisher sites.** Verified against
`10.1136/bmj.m2412` and `10.3390/nu14020272`.

### NCBI E-utilities — PMID metadata

- esummary: `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id={PMIDs}&retmode=json` — **open**
- Docs: <https://www.ncbi.nlm.nih.gov/books/NBK25501/> — **open**

Accepts comma-separated PMIDs. **Always batch when checking for transposition** —
side-by-side titles are what makes a swapped digit visible. Verified against
`32669325,32699048`, which returned the *J Am Soc Nephrol* kidney paper and the
*BMJ* Naghshi paper respectively.

Register a tool name and email for sustained use; unregistered use is rate-limited
to roughly 3 requests/second.

### PMC ID Converter — DOI ↔ PMID ↔ PMCID

- Base: `https://pmc.ncbi.nlm.nih.gov/tools/idconv/api/v1/articles/?ids={IDs}&format=json` — **open**

Verified: `PMC6996528` → PMID `32051759`, DOI `10.12688/f1000research.20510.1`.
The legacy `www.ncbi.nlm.nih.gov/pmc/utils/idconv/v1.0/` path 301-redirects here;
update any stored copies.

### Europe PMC REST API — search and open-access full text

- Base: `https://www.ebi.ac.uk/europepmc/webservices/rest/` — **open**
- Docs: <https://europepmc.org/RestfulWebService> — **open**
- DOI search: `…/search?query=DOI:"{DOI}"&resultType=core&format=json`
- Full text: `…/{PMCID}/fullTextXML`

`resultType`: `idlist` (IDs only), `lite` (default), `core` (adds abstract, full
text links, MeSH). Full text verified against `PMC6996528` — returned complete
body sections. **This is the route for confirming a number appears in the results
section**, which is the check that catches misattribution.

Results are **unreviewed primary literature** and must be labelled as such. Record
attribution and rate-limit terms before programmatic use.

### PubMed Central OA subset

- OA Web Service: <https://pmc.ncbi.nlm.nih.gov/tools/oa-service/> — **unverified**
  (listed in `source-catalog.md`; not re-fetched this pass)

### PubMed web interface

- Base: `https://pubmed.ncbi.nlm.nih.gov/` — **open**
- Author search: `https://pubmed.ncbi.nlm.nih.gov/?term={Surname}+XX%5Bau%5D`

Verified via `Esselstyn+CB[au]` (108 results, 1936–2019). Useful for the
named-researcher route below; prefer E-utilities for anything scripted.

---

## Cambridge University Press nutrition journals

Priority 1 for nutrition mechanism, method, and emerging-topic questions. All
published for The Nutrition Society. All four **open** and verified 2026-07-25 —
Cambridge Core did **not** bot-block WebFetch on this pass, contrary to
expectation. Individual articles may still be paywalled even where the journal
landing page loads; fall back to Crossref/Europe PMC for metadata and to the
Europe PMC full text route for OA articles.

| Journal | URL | ISSN (print / online) | Use for |
| --- | --- | --- | --- |
| British Journal of Nutrition | <https://www.cambridge.org/core/journals/british-journal-of-nutrition> | 0007-1145 / 1475-2662 | Primary human and mechanistic nutrition research |
| Public Health Nutrition | <https://www.cambridge.org/core/journals/public-health-nutrition> | 1368-9800 / 1475-2727 | Nutritional epidemiology, behavioural nutrition, food systems, food security, intervention evaluation |
| Nutrition Research Reviews | <https://www.cambridge.org/core/journals/nutrition-research-reviews> | 0954-4224 / 1475-2700 | Critical and systematic reviews — the best first stop for "what is the state of the evidence on X" |
| Proceedings of the Nutrition Society | <https://www.cambridge.org/core/journals/proceedings-of-the-nutrition-society> | 0029-6651 / 1475-2719 | Symposium papers and conference abstracts |

Caution on *Proceedings*: much of its content is **meeting abstracts**, which are
not peer-reviewed full papers and generally support `insufficient` or `weak` at
best. Check whether an item is an abstract or a full symposium paper before
labelling. Both *Nutrition Research Reviews* and *Proceedings* also publish animal
nutrition — confirm the species before treating a finding as human evidence.

---

## Named researchers in the transcript corpus

Priority 2. Ornish, Barnard, Esselstyn, and Campbell are named in the transcript
corpus. **Their peer-reviewed work is citable; their trade books are not.**

This mirrors the rule already applied to clinician-authored popular books in
`skill/references/source-catalog.md`: a credential raises the prior that a claim
is defensible; it does not make a book citable. Never cite a book as the source
for a health claim — find the underlying trial or review and cite that. If it
cannot be found, say no reliable source covers the question rather than borrowing
the book's confidence.

Search their peer-reviewed output by author, not by book title:

| Researcher | PubMed author query | Note |
| --- | --- | --- |
| Dean Ornish | `Ornish D[au]` | Lifestyle Heart Trial and successors; small RCTs, multi-component interventions |
| Neal Barnard | `Barnard ND[au]` | Plant-based diet RCTs, often in type 2 diabetes |
| Caldwell Esselstyn | `Esselstyn CB[au]` | **open**, verified: 108 results 1936–2019. Largely uncontrolled case series |
| T. Colin Campbell | `Campbell TC[au]` | Includes the China Project; check whether a given item is primary analysis or commentary |

Query pattern: `https://pubmed.ncbi.nlm.nih.gov/?term=Esselstyn+CB%5Bau%5D`
(verified). Disambiguate common surnames by adding an affiliation or topic term.

**Design caveat, applied uniformly.** This literature is heavily weighted toward
small, uncontrolled, or multi-component interventions, so it usually supports
`weak` or `moderate` — not `strong` — regardless of how the finding is described
elsewhere. Multi-component interventions (diet + exercise + stress management +
group support) cannot attribute effect to diet alone. Label by design, per
`verification-playbook.md` §3. Cardiovascular reversal claims remain out of scope
regardless of which source states them.

---

## Guideline and authority bodies

Cross-references into `skill/references/source-catalog.md`, which holds usage
rules and licence terms. Listed here for routing and access status only.

### Certainty frameworks

| Body | URL | Access | Use for |
| --- | --- | --- | --- |
| GRADE handbook | <https://gdt.gradepro.org/app/handbook/handbook.html> | **unverified** | Certainty vs recommendation strength |
| NutriGrade | DOI `10.3945/an.116.013052`, PMID `28140319` | via Crossref | Scoring nutrition meta-evidence |

Both are already cited with identifiers in
`skill/references/evidence-strength.md`; that file governs their use.

### European and regional

| Body | URL | Access | Use for |
| --- | --- | --- | --- |
| EFSA — dietary reference values | <https://www.efsa.europa.eu/en/topics/topic/dietary-reference-values> | **unverified** | AR, PRI, AI, upper/safe intake |
| EFSA — food supplements | <https://www.efsa.europa.eu/en/topics/topic/food-supplements> | **unverified** | Supplement safety context, ULs |
| EFSA — pesticide residues | <https://www.efsa.europa.eu/en/topics/pesticide-residues-food> | **unverified** | EU monitoring, consumer risk |
| NNR2023 | <https://pub.norden.org/nord2023-003/> | **unverified** | Nordic/European values, patterns, sustainability |
| NCEZ Poland | <https://ncez.pzh.gov.pl/abc-zywienia/talerz-zdrowego-zywienia/> | **unverified** | Polish food-based guidance |

### International and US

| Body | URL | Access | Use for |
| --- | --- | --- | --- |
| WHO — healthy diet | <https://www.who.int/news-room/fact-sheets/detail/healthy-diet> | **unverified** | Global population targets |
| WHO — physical activity | <https://www.who.int/publications/i/item/9789240015128> | **unverified** | Activity and sedentary behaviour |
| Cochrane Library | <https://www.cochranelibrary.com/> | **403** | Systematic reviews of interventions |
| NIH ODS | <https://ods.od.nih.gov/factsheets/list-all/> | **unverified** | Supplements — primary authority |
| National Academies | <https://nap.nationalacademies.org/> | **unverified** | US DRI framework |
| Dietary Guidelines for Americans | <https://www.dietaryguidelines.gov/> | **unverified** | US federal guidance — **disputed in parts**, see `evidence/guidelines/conflicting-guidance.md` |

### Condition authorities

| Body | URL | Access | Use for |
| --- | --- | --- | --- |
| ADA Standards of Care | <https://diabetesjournals.org/care/issue/49/Supplement_1> | **403** | Diabetes thresholds — **revised annually** |
| ADA/EASD remission consensus | DOI `10.2337/dci21-0034` | via Crossref | Remission definition: HbA1c <6.5% ≥3 months off pharmacotherapy |
| AHA/ACC hypertension 2025 | <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12379440/> | **unverified** | Blood pressure |
| EASL–EASD–EASO MASLD | DOI `10.1016/j.jhep.2024.04.031` | via Crossref | Steatotic liver disease |
| MASLD nomenclature | DOI `10.1097/HEP.0000000000000520` | via Crossref | MASLD/MASH replaced NAFLD/NASH in 2023 |

---

## Access notes and workarounds

### Confirmed 403 on automated fetch (2026-07-25)

- **Cochrane Library** (`cochranelibrary.com`)
- **MDPI** (`mdpi.com`, including *Nutrients*)
- **diabetesjournals.org** (ADA Standards of Care)

A 403 is **not** a dead link and **not** evidence the paper does not exist.
Record it and route around it. Worked case: `mdpi.com/journal/nutrients` returned
403, while `api.crossref.org/works/10.3390/nu14020272` returned the full title,
journal, and abstract for the exact paper needed — and Europe PMC supplied its
PMID (35057453). The metadata APIs in §Identifier APIs are not bot-blocked.

### Paywalls

A paywalled full text still yields verifiable metadata and usually an abstract via
Crossref or Europe PMC. That is enough to confirm identifier correctness (question
2 of the three-question test) but **not** always enough to confirm a specific
number appears in the results (question 3). When you cannot reach the results
section, either find an OA version through the Europe PMC full-text route or do
not attribute the number.

### `unverified` entries

Listed above with **unverified** were not fetched on this pass. They come from
`skill/references/source-catalog.md` and
`skill/references/editorial-source-backlog.md`, where several were checked
previously. They are marked rather than dropped or asserted, per `CLAUDE.md`:
never write an identifier you have not checked. Verify before relying on one.

---

## Maintenance

Re-check this registry when `source-catalog.md` is reviewed (at least every 12
months), and whenever an API path stops working. Record newly discovered 403s
here rather than deleting the source. API base paths do move — the PMC ID
converter's redirect is the example already caught.
