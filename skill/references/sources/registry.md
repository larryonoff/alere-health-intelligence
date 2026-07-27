# Nutrition and Lifestyle Source Registry

This is the single source registry for both runtime source selection and
editorial verification. Use it to locate authoritative evidence and the tools
needed to verify identifiers. Do not treat it as a set of claims to repeat
without checking the linked source.

Last reviewed: 2026-07-26.

Monitoring roles, cadences, and queries live in
`../../maintenance/source-monitoring.yaml`. This registry explains how to use a
source; the manifest determines when it is checked. The operational process is
`../../../docs/knowledge-maintenance.md`.

## Read only the section you need

This file is larger than the other references. Under a constrained context
window, read `Usage rules` plus the one section that matches the question rather
than the whole file.

| Question | Section |
| --- | --- |
| A condition or laboratory marker | `Condition and marker authorities` |
| US guidance, supplements, or an academic assessment | `United States federal and academic sources` |
| Dietary patterns, general nutrition, activity, sleep | `Core sources` |
| European reference values, Poland, pesticide residues | `European and regional sources` |
| A named personal protocol, popular book, or consumer ranking | `Limited and secondary sources` |
| How to rank two sources against each other | `Evidence hierarchy` |
| How to verify a DOI, PMID, or full-text number | `Identifier and literature APIs` |
| A publisher blocks automated access | `Access notes and workarounds` |

Reviewed claims drawn from these sources, with strength labels and citations, live
in `evidence/`. Prefer an existing entry over re-deriving a claim from a source.

## Usage rules

1. Use the most recent version of a guideline or source page.
2. Prefer a guideline, systematic review, or consensus statement over a
   consumer-facing summary when answering a precise or high-risk question.
3. Check whether the recommendation applies to the user's age, country,
   pregnancy status, health conditions, medications, and dietary pattern.
4. Distinguish population guidance from individualized clinical care.
5. Do not turn dietary reference values into exact personal prescriptions
   without the context required to do so.
6. Cite the underlying source rather than this catalog.
7. Record uncertainty when reputable sources disagree or evidence is
   observational, indirect, or incomplete.
8. Never infer evidence strength from an institution, publisher, journal, or
   government label. Grade the claim and its underlying evidence.
9. Treat government guidance as one input when science, implementation,
   affordability, and policy may have been combined. Compare disputed guidance
   with its scientific review and independent evidence synthesis.
10. Treat a credible safety signal as a reason for immediate review, not as
    proof of causation and not as something to postpone until the normal cycle.

## Identifier and literature APIs

Use these routes to confirm that an identifier points to the cited paper and,
where possible, that the paper actually contains the attributed result.

### Crossref REST API

- Base: `https://api.crossref.org/`
- Single work: `https://api.crossref.org/works/{DOI}`
- Documentation:
  <https://www.crossref.org/documentation/retrieve-metadata/rest-api/>

Use for DOI metadata and as the first fallback when a publisher page blocks
automated access. A metadata match confirms the paper identity, not necessarily
a numerical result in its full text.

### NCBI E-utilities

- PMID summary:
  `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id={PMIDs}&retmode=json`
- Documentation: <https://www.ncbi.nlm.nih.gov/books/NBK25501/>

Batch PMIDs when checking for transposed digits so titles can be compared
side-by-side.

### PMC ID Converter

- `https://pmc.ncbi.nlm.nih.gov/tools/idconv/api/v1/articles/?ids={IDs}&format=json`

Use to map DOI, PMID, and PMCID identifiers.

### Europe PMC

- Base: `https://www.ebi.ac.uk/europepmc/webservices/rest/`
- Documentation: <https://europepmc.org/RestfulWebService>
- DOI search: `…/search?query=DOI:"{DOI}"&resultType=core&format=json`
- Full text: `…/{PMCID}/fullTextXML`

Use full-text XML to confirm a number in the results when an open-access version
exists. Search results remain unreviewed literature, not guidance.

### PubMed and PMC Open Access

- PubMed: <https://pubmed.ncbi.nlm.nih.gov/>
- PMC OA service: <https://pmc.ncbi.nlm.nih.gov/tools/oa-service/>

Prefer APIs for scripted identifier checks. Use the web interface for manual
author and topic searches.

## Nutrition literature routes

For nutrition mechanisms, methods, and emerging questions, useful Nutrition
Society journals include:

| Journal | Best use |
| --- | --- |
| [British Journal of Nutrition](https://www.cambridge.org/core/journals/british-journal-of-nutrition) | Human and mechanistic nutrition research |
| [Public Health Nutrition](https://www.cambridge.org/core/journals/public-health-nutrition) | Epidemiology, behaviour, food systems |
| [Nutrition Research Reviews](https://www.cambridge.org/core/journals/nutrition-research-reviews) | Critical and systematic reviews |
| [Proceedings of the Nutrition Society](https://www.cambridge.org/core/journals/proceedings-of-the-nutrition-society) | Symposium papers and conference abstracts |

Confirm the species and publication type. A conference abstract does not carry
the evidentiary weight of a peer-reviewed full paper.

When a claim is attributed to a named researcher, search the researcher's
peer-reviewed work. A trade book, course, or credential is not itself evidence.

## Core sources

### Harvard T.H. Chan School of Public Health — The Nutrition Source

- Home: <https://nutritionsource.hsph.harvard.edu/>
- Healthy Eating Plate:
  <https://nutritionsource.hsph.harvard.edu/healthy-eating-plate/>

Use for accessible explanations of dietary patterns, food groups, carbohydrate
quality, protein sources, dietary fats, beverages, and practical meal
composition.

Harvard Nutrition Source is Alere's leading academic synthesis for general
nutrition and practical translation. That role does not make it a clinical
guideline or allow its institutional name to substitute for evidence. For a
precise, disputed, numerical, exclusionary, or higher-risk claim, open and cite
the underlying guideline, review, or study and seek independent confirmation.

The Healthy Eating Plate is a flexible visual guide rather than a calorie or
serving prescription. Apply its principles across mixed dishes and cultural
eating patterns instead of assuming that every meal is served on a divided
plate.

Copyright note: the Healthy Eating Plate image is owned by Harvard University.
The downloadable image may be used without permission only for educational and
other non-commercial uses with Harvard's required attribution and copyright
credit. Commercial reuse and mounting the image on another system require
permission. Use the underlying ideas with independent language and design; do
not copy the illustration into a product.

### American College of Lifestyle Medicine

- Lifestyle medicine overview:
  <https://lifestylemedicine.org/about-lifestyle-medicine/>

Use for the six interconnected lifestyle domains:

- predominantly minimally processed, plant-forward nutrition;
- physical activity;
- restorative sleep;
- stress management;
- connectedness;
- avoidance of risky substances.

Use these domains as context, not as permission to diagnose, treat, or promise
reversal of disease. Nutrition remains the skill's primary domain. Refer users
to qualified professionals when a request crosses into individualized medical
care.

### World Health Organization — physical activity

- Guidelines:
  <https://www.who.int/publications/i/item/9789240015128>

Use for population-level physical-activity and sedentary-behaviour guidance.
Adapt activity to ability, pregnancy, chronic conditions, disability, injury,
and current fitness. Do not convert population targets into an individualized
training prescription.

### American Academy of Sleep Medicine and Sleep Research Society

- Adult sleep-duration consensus:
  <https://aasm.org/resources/pdf/adultsleepdurationconsensus.pdf>

Use for the general importance of adequate sleep opportunity in healthy adults.
Do not diagnose sleep disorders from wearable scores or assume one bedtime,
meal cutoff, device, or room setup is universally optimal.

### World Health Organization

- Healthy diet:
  <https://www.who.int/news-room/fact-sheets/detail/healthy-diet>
- Self-care for health and well-being:
  <https://www.who.int/news-room/fact-sheets/detail/self-care-health-interventions/>

Use for global public-health guidance and the broad principles of adequacy,
balance, moderation, diversity, and food safety. WHO guidance is particularly
useful for fruit and vegetable intake, fibre, fats, free sugars, sodium, and
population-level prevention.

Check the specific linked WHO guideline before giving a numerical target. Do
not assume that a global population target is automatically an individualized
clinical target.

## United States federal and academic sources

### Dietary Guidelines for Americans 2025–2030

- Guidelines: <https://www.dietaryguidelines.gov/>
- Scientific Report of the 2025 Dietary Guidelines Advisory Committee:
  <https://www.dietaryguidelines.gov/2025-advisory-committee-report>

Released 7 January 2026. **The guidelines depart from the Advisory Committee's
consensus report on several points, and leading academic groups dispute parts of
the result.** Do not cite the DGA as settled consensus without checking
`evidence/guidelines/conflicting-guidance.md` first. Cite the areas of agreement
freely; flag the disputed areas as disputed.

### NIH Office of Dietary Supplements

- Fact sheets: <https://ods.od.nih.gov/factsheets/list-all/>
- API: <https://ods.od.nih.gov/api/>
- Dietary Supplement Label Database: <https://dsld.od.nih.gov/>
- PubMed Dietary Supplement Subset:
  <https://ods.od.nih.gov/Research/PubMed_Dietary_Supplement_Subset.aspx>

The primary authority for supplement questions: ingredient, dose, interaction, and
safety information, maintained by NIH and available programmatically. Prefer it
over any commercial or advocacy source. Record API terms and attribution
requirements before programmatic use.

Fact sheets state population reference intakes and upper limits. They are not
individual prescriptions — dosing remains out of scope per
`safety-and-context.md`.

### National Academies of Sciences, Engineering, and Medicine

- Dietary Reference Intakes and nutrition reports: <https://nap.nationalacademies.org/>
- Reviews of the dietary guidelines process:
  <https://www.dietaryguidelines.gov/national-academies>

Use for the US reference-value framework (EAR, RDA, AI, UL) and for independent
assessment of federal nutrition policy.

### Harvard T.H. Chan School of Public Health — Nutrition Source

- <https://nutritionsource.hsph.harvard.edu/>

Strong for accessible, research-forward synthesis and for independent critique of
federal guidance. It is an academic communication resource, not a guideline body:
cite the underlying studies it references for a precise or high-risk claim.
Copyright terms for its illustrations are noted in the European sources section
below.

### Stanford Nutrition Studies Research Group

- <https://med.stanford.edu/nutrition/>

Use for independent academic assessment, particularly of dietary-pattern trials
and federal guidance.

### Tufts Friedman School of Nutrition Science and Policy

- Research: <https://nutrition.tufts.edu/research>

Use as a frontier feed for nutrition science, behaviour, food policy, food
systems, and practical implementation. A school article or press release is a
lead to verify, not runtime authority.

### NIH Office of Nutrition Research

- <https://grants.nih.gov/funding/find-a-fit-for-your-research/nih-institutes-centers-offices/ONR>

Use to identify emerging United States research priorities such as precision
nutrition, Food is Medicine, ultra-processed foods, and nutrition regulatory
science. Funding priorities identify active questions; they do not establish
answers or recommendations.

### PubMed Central Open Access subset

- OA Web Service API: <https://pmc.ncbi.nlm.nih.gov/tools/oa-service/>

Full-text open-access biomedical literature in JATS XML, suitable for programmatic
retrieval. Same labeling rule as Europe PMC: an individual article is unreviewed
primary literature, not guidance.

## Condition and marker authorities

Use these for questions about a specific condition or laboratory marker. Reviewed
claims drawn from them, with strength labels and citations, live in
`evidence/`. Open the underlying guideline before quoting a number.

### American Diabetes Association — Standards of Care

- Current standards:
  <https://diabetesjournals.org/care/issue/49/Supplement_1>
- Prevention or delay of diabetes (2026):
  <https://diabetesjournals.org/care/article/49/Supplement_1/S50/163924/>

**Revised annually.** Any numerical target, threshold, or recommendation quoted
from it must come from the current supplement. Entries anchored to ADA carry an
annual review cycle.

### ADA / EASD — remission of type 2 diabetes

- Consensus report: Riddle MC et al. *Diabetes Care* 2021;44(10):2438–2444.
  DOI: [10.2337/dci21-0034](https://doi.org/10.2337/dci21-0034)

Defines remission as HbA1c <6.5% sustained ≥3 months without glucose-lowering
pharmacotherapy. Use this definition rather than "reversal" or "cure."

### American Heart Association / American College of Cardiology

- Hypertension guideline (2025), summary and implications:
  <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12379440/>
- Dietary approaches for elevated LDL-C (2025):
  <https://www.acc.org/Latest-in-Cardiology/Articles/2025/07/01/01/Prioritizing-Health-Dietary-Approaches-For-Elevated-LDL-C>

Use for blood-pressure and lipid guidance. Diagnostic thresholds are guideline
definitions, not individualized targets.

### American Gastroenterological Association / EASL — steatotic liver disease

- AGA lifestyle modification guidance:
  <https://gastro.org/clinical-guidance/lifestyle-modification-using-diet-and-exercise-to-achieve-weight-loss-in-the-management-of-nonalcoholic-fatty-liver-disease-nafld/>
- EASL–EASD–EASO MASLD guidelines. *J Hepatol* 2024.
  DOI: [10.1016/j.jhep.2024.04.031](https://doi.org/10.1016/j.jhep.2024.04.031)
- Nomenclature consensus: Rinella ME et al. *Hepatology* 2023;78(6):1966–1986.
  DOI: [10.1097/HEP.0000000000000520](https://doi.org/10.1097/HEP.0000000000000520)

MASLD/MASH replaced NAFLD/NASH in 2023. Note the terminology change when citing
older literature.

### Cochrane Library

- <https://www.cochranelibrary.com/>

Use for systematic reviews of specific interventions. Check the review date and
whether it has been superseded.

### Europe PMC — primary literature

- REST API: <https://europepmc.org/RestfulWebService>

Use for a study the user names, a topic outside the reviewed corpus, or checking
whether guidance has been superseded. Results are **unreviewed primary
literature** and must be labeled as such — an individual study is not a
guideline. Record attribution and rate-limit terms before programmatic use.

## European and regional sources

### European Food Safety Authority

- Dietary reference values:
  <https://www.efsa.europa.eu/en/topics/topic/dietary-reference-values>

Use EFSA dietary reference values for European nutrient terminology and
population reference points. Keep Average Requirement, Population Reference
Intake, Adequate Intake, and upper or safe intake concepts distinct.

### Nordic Nutrition Recommendations 2023

- Publication:
  <https://www.norden.org/en/publication/nordic-nutrition-recommendations-2023>
- Full online report:
  <https://pub.norden.org/nord2023-003/>

Use for the evidence base behind Nordic and Baltic nutrient reference values,
food groups, dietary patterns, and sustainability. It is especially useful for
European questions involving plant-forward diets, whole grains, pulses, fish,
nuts, meat, alcohol, and highly processed foods.

### National Centre for Nutrition Education, Poland

- Talerz Zdrowego Żywienia:
  <https://ncez.pzh.gov.pl/abc-zywienia/talerz-zdrowego-zywienia/>

Use for practical Polish food-based guidance and local communication patterns,
including the constructive framing of eating more, eating less, and making
realistic substitutions. Check linked specialist materials for condition- or
age-specific topics rather than extrapolating from the general plate model.

### EFSA — Pesticide residues in food

- Topic:
  <https://www.efsa.europa.eu/en/topics/pesticide-residues-food>
- Annual EU report:
  <https://www.efsa.europa.eu/en/efsajournal/pub/10054>

Use the current EFSA annual report for European monitoring results and
consumer-risk assessment. A detected residue is not automatically a legal
exceedance or evidence that a food is unsafe. Do not discourage fruit and
vegetable intake based on detection alone.

### Polish official monitoring

- Plant Health and Seed Inspection:
  <https://www.gov.pl/web/piorin/pozostalosci-sor>
- National Institute of Public Health reports:
  <https://www.pzh.gov.pl/raport-analiza-potencjalnego-zagrozenia-zdrowia-konsumentow-wynikajacego-z-pozostalosci-pestycydow-w-zywnosci-dostepnej-na-polskim-rynku-w-roku-2023/>

Prefer current Polish and EU monitoring when answering questions about foods
sold in Poland.

## Limited and secondary sources

### Blueprint Protocol — personal N-of-1 case study

- Protocol: <https://protocol.bryanjohnson.com/>
- Content license:
  <https://creativecommons.org/licenses/by-nc/4.0/>

Use only when the user asks about this named protocol or when evaluating how a
personal protocol mixes ordinary habits, self-tracking, commercial products,
surrogate biomarkers, and experimental interventions.

Do not use it as clinical guidance or as a source of personal calorie, macro,
meal-timing, fasting, supplement, medication, sauna, laboratory, or biomarker
prescriptions. Its results come from one highly monitored individual exposed
to many simultaneous interventions, so causality and general applicability
cannot be inferred.

The site includes products sold or linked by the protocol owner and describes
on-label, off-label, unlicensed, and research-use-only interventions. Treat
commercial claims, testimonials, biological-age claims, and personal biomarker
changes as hypotheses requiring independent verification.

The site's CC BY-NC 4.0 license requires attribution and prohibits commercial
reuse under its terms. Do not copy its branded recipes, text, graphics, or
protocol into a commercial product. Independently express ordinary public
nutrition principles and support them with authoritative sources.

### Clinician-authored popular books

Named examples currently tracked:

- *The Plant-Based Solution* — Joel Kahn, MD (cardiologist);
- *The Plant Power Doctor* — Gemma Newman, MD (general practitioner);
- *A Parent's Guide to Intuitive Eating* — Yami Cazorla-Lancaster, DO
  (paediatrician).

Use only when the user names the book or its author. These are trade books by
licensed clinicians: an educational summary with a commercial interest, not a
guideline, systematic review, or consensus statement. The author's credential
raises the prior that a claim is defensible; it does not make the book citable.

Never cite a book as the source for a health claim. Find the underlying
guideline, review, or trial and cite that instead. If it cannot be found, say
that no reliable source covers the question rather than borrowing the book's
confidence — trade books state well-established and speculative claims in the
same voice, and cite supporting literature far more often than contradicting
literature.

When the reviewed corpus already covers the question, answer from the corpus at
the corpus strength label, and identify the book as a clinician's popular book.
Do this whether the book agrees or disagrees; agreement is not verification. Do
not disparage the author.

Cardiovascular reversal claims, single-pattern superiority claims, supplement
and testing suggestions, and cycle-based or hormonal nutrition claims are out of
scope regardless of which book states them. Children's nutrition remains routed
by `safety-and-context.md`; a paediatric book does not open paediatric scope.

Editorial analysis: `editorial-clinician-books.md`.

### Environmental Working Group — Shopper's Guide

- Methodology: <https://www.ewg.org/foodnews/methodology.php>
- Underlying USDA Pesticide Data Program:
  <https://www.ams.usda.gov/datasets/pdp>

This guide analyzes United States sampling and should not be treated as a
global food-safety authority, a clinical risk score, or a ranking of produce
sold in Poland. If it is mentioned, identify it as EWG's interpretation of
USDA monitoring data and compare its claims with current official EU or Polish
risk assessments. Never use “clean” and “dirty” as moral labels for food or as
a reason to avoid eating fruits and vegetables.

## Evidence hierarchy

Assess methodological quality, risk of bias, certainty, directness,
applicability, consistency, independence, and recency before ranking evidence.
Source type alone does not determine strength: a weak or outdated guideline or
meta-analysis can be less reliable than a well-designed, directly applicable
trial.

Use this default search order, then judge the evidence using the criteria
above:

1. Current clinical or public-health guidelines from recognized authorities.
2. Systematic reviews and meta-analyses of relevant human studies.
3. Randomized controlled trials.
4. Well-designed prospective observational studies.
5. Mechanistic, laboratory, or animal research.
6. Expert commentary and educational summaries.
7. Testimonials, marketing claims, and unsourced social content.

Do not use testimonials or marketing claims as efficacy evidence.

### Stable and frontier are different questions

Use two labels independently:

- **stable** — suitable to anchor a user recommendation after applicability and
  safety checks;
- **frontier** — credible new evidence worth monitoring or discussing, but not
  yet sufficient to silently change a stable recommendation.

Harvard, Stanford, Tufts, NIH, universities, and journals may surface frontier
evidence earlier than guidance bodies. WHO, EFSA, NNR, and clinical guideline
organizations may be slower because they synthesize, contextualize, and govern
recommendations. Neither speed nor institutional caution determines truth.

Changing a stable recommendation normally requires an applicable current
guideline or systematic synthesis plus independent confirmation. An urgent
safety signal may restrict a recommendation immediately while verification is
underway.

## Maintenance

Use `../../maintenance/source-monitoring.yaml` for per-source cadence. Run:

```sh
ruby skill/scripts/maintain-knowledge.rb check
ruby skill/scripts/maintain-knowledge.rb scan
```

Review this registry at least every 12 months and whenever a linked organization
publishes a major guideline update, a credible safety signal appears, or an API
path stops working. Check links, revision dates, access status, changed
recommendations, conflicts, and all attribution, reuse, licensing, and mounting
terms. Scan results are unreviewed editorial candidates and never enter runtime
automatically.

### Access notes and workarounds

As last checked on 2026-07-25, automated requests could receive `403` from
Cochrane Library, MDPI, and `diabetesjournals.org`. A `403` is not evidence that
a source is absent or invalid. Confirm metadata through Crossref, NCBI, or
Europe PMC and use an open full-text route when a specific result must be
verified.

A paywalled abstract can confirm paper identity and broad conclusions, but may
be insufficient to attribute an exact number. If the relevant results section
cannot be inspected, do not attribute the number.
