# Alere — Core Concept

Status: strategic working document. Supersedes the earlier draft of this file.
Last reviewed: 2026-07-25.

This document defines what Alere is, why it is defensible, and what must be
decided. It does not replace `docs/vision.md`, `docs/product.md`, or
`docs/superpowers/specs/2026-07-23-ios-mvp-design.md`; where it contradicts
them, the contradiction is stated explicitly in §9.

---

## 1. The concept

> **Alere shows what is actually proven about food, how strong that proof is,
> and one thing the person can do today — in service of healthy longevity.**

Three layers, none removable:

```
corpus     = evidence on diet, healthspan, and specific conditions
             each claim carrying its own strength of evidence
model      = interface to the corpus, not a source of medical knowledge
             (understand → retrieve → explain → propose one step)
discipline = honesty about strength + routing to clinicians
```

Alere is not an AI nutritionist, a tracker, a diet program, or a diagnostic
tool. It is the **evidence layer for healthy longevity**: the thing that tells
you a claim is backed by a guideline or meta-analysis rather than by a
testimonial — and says so plainly when it is the testimonial.

### Purpose and positioning are different things

**Purpose (the product's actual goal): healthy longevity — healthspan, not
just lifespan.** This is the owner's own goal and the honest north star.

**Positioning (how people find it): specific conditions.** Nobody searches for
"healthspan." They search "is X good for prediabetes." Conditions are the
entry doors; longevity is the room.

These are not in tension, because the evidence converges. The same dietary
patterns that produce the strongest condition outcomes are the same ones with
the strongest longevity evidence:

- A 2026 two-cohort study reported all-cause mortality hazard ratios of **0.87**
  for the EAT-Lancet index, **0.88** for the overall plant-based diet index, and
  **0.90** for the healthful plant-based index (highest vs lowest tertile).
- Mediterranean and DASH patterns consistently reduce cardiovascular and
  all-cause mortality; adherence to DASH, aMED, and HEI-2015 is associated with
  slower biological aging.
- Diet quality *direction* matters: a healthful plant-based pattern is
  associated with **lower** frailty risk, an unhealthful one with **higher**.
  "Plant-based" alone is not the variable.

So the metabolic cluster (§2a) is not a marketing detour from longevity — it is
the mechanism through which dietary longevity evidence actually operates in a
person's life. Prediabetes, LDL, blood pressure, and liver fat are the
measurable, actionable surface of healthspan.

### What longevity honesty requires

Committing to longevity as the purpose means inheriting the obligation to be
honest about its weakest parts — which is exactly where the category's
credibility is being destroyed:

- **NAD+/NMN and resveratrol:** raise blood NAD+ levels, but meaningful effects
  on aging outcomes remain unproven; resveratrol has poor bioavailability and
  meta-analyses show no consistent benefit. Most anti-aging products are sold on
  mechanism and animal data.
- **Metformin:** the TAME trial has been delayed since 2016; results are years
  away.
- **Rapamycin:** immunosuppressive; researchers remain cautious about preventive
  human use.
- **Biological age clocks:** 2026 produced the field's strongest validation and
  its most substantive challenge simultaneously. Different published clocks give
  inconsistent results — some implying zero or negative rejuvenation — and
  test–retest reliability remains imperfect even after DunedinPACE and GrimAge
  revisions.

Alere's answer to "should I take NMN" is a **product demonstration**, not a
refusal. `self-experimentation.md` already encodes this ladder and already bars
surrogate biological-age optimization. Longevity as purpose makes that file
central rather than peripheral.

### Why this is the right concept

It is the single point where five independent constraints meet:

1. **Highest real value.** People are drowning in confident, contradictory
   advice about food, aging, and chronic conditions. Nobody gives them a
   calibrated answer.
2. **It is the owner's own goal**, which means the product gets built by its
   most demanding user — the strongest available quality mechanism for a solo
   product.
3. **Apple AI as core becomes an advantage, not a compromise** (§4).
4. **Regulatorily passable** as a global consumer app, App Store included (§6).
5. **Marketable without a budget**, because a calibrated answer is inherently
   shareable (§7).

---

## 2. The central insight: strength of evidence is the product

Two conditions, both claimed by lifestyle-medicine programs, have radically
different evidentiary standing. This asymmetry is not a problem to hide — it is
the feature.

**Type 2 diabetes — remission is established medicine.**
ADA/EASD consensus (2021) formally defines remission as HbA1c <6.5% sustained
≥3 months without glucose-lowering pharmacotherapy. DiRECT reported **46%
remission at one year, 36% at two**. A 2025 systematic review and meta-analysis
in *Diabetes Care* covering 18 non-surgical RCTs found ≥10% weight loss produces
disease-modifying effects and remission.

**Psoriasis — real but weak.**
A 2025 RCT in *JAMA Dermatology* found a Mediterranean diet significantly
improved severity **independent of weight loss**. But the National Psoriasis
Foundation's systematic review strongly recommends only weight reduction in
overweight/obese patients; gluten-free only with positive serologic markers; the
Mediterranean pattern as an *adjunct*, on low-quality data. A 2025 review of 42
clinical studies concluded high-quality evidence is still lacking.

**Same product, two different sentences.** For diabetes, Alere may say
"remission is documented, here are the conditions, discuss with your doctor."
For psoriasis, "may reduce severity, evidence is low-quality, as an adjunct to
your treatment — not a replacement."

No competitor holds this distinction. Trackers have nothing to show. General AI
answers both with identical confidence. Lifestyle-medicine courses tend to
flatten both into "reversal." **Calibration is the moat.**

### Selection criteria

A condition earns a place only when **all four** hold. The fourth is the one
most easily forgotten, and it eliminates the most candidates.

1. **Strength of evidence** — a guideline or meta-analysis, not pilot studies.
2. **Prevalence** — millions of people, not a rare disease.
3. **Diet changes the outcome** — not merely "eating well is good."
4. **An app genuinely helps** — there is real confusion to resolve. If the
   answer is "just avoid gluten," no app is needed.

### The evidence gradient (12 conditions assessed)

| Condition | Strength | Prevalence | App adds value? | Verdict |
| --- | --- | --- | --- | --- |
| **Prediabetes** | **Strong** — DPP: 58% risk reduction (71% if 60+); sustained 30 yr (Da Qing −39%), 21 yr (DPPOS −24%); ADA Standards of Care 2026 directs offering DPP-style programs | **470M+ by 2030**; ~⅓ of US adults | High — huge confusion, high motivation, no medication involved | **Core** |
| **High LDL** | **Strong** — Portfolio Diet −17% LDL (meta-analysis), ~30% combined, comparable to statins; 5% SFA→PUFA swap −5–10%; AACE 2025 | Very high | High — numeric, specific, checkable | **Core** |
| **Hypertension** | **Strong** — DASH RCT evidence; 2025 AHA/ACC (130/80) | Very high | High | **Core** |
| **MASLD/NAFLD** | **Strong, threshold-specific** — ≥5% loss reduces steatosis, ≥7% resolves NASH, ≥10% fibrosis regression (AGA); recurrence at **1.5 kg** regain | High and rising | High — precise thresholds | **Core** |
| **Type 2 diabetes** | **Strong** — ADA/EASD remission definition; DiRECT 46%/36%; 2025 *Diabetes Care* meta-analysis of 18 RCTs | Very high | High, but medication overlap demands care | **Core, with supervision framing** |
| **IBS** | **Strong** — low FODMAP is first-line; 50–70% get clinically meaningful relief in 2–4 weeks; Lancet Gastro 2025 network meta-analysis | **~10% globally** | **Highest of any condition** — phased elimination and reintroduction is where people get stuck and harm themselves | **Wave 2** (needs clinical reviewer + ED screening) |
| **PCOS** | **Mixed** — lifestyle is first-line (2023 international guideline), but **"no one regimen has benefits over others"**; metformin > inositol | High among women | Moderate — strong "change lifestyle," weak "how exactly" | Wave 3 |
| **GERD** | **Split** — weight loss and meal volume/calorie load evidenced; trigger foods "largely anecdotal," highly individual | Very high | Moderate — good calibration demo, weak core | Wave 3 |
| **Coronary heart disease** | **Moderate** — Ornish RCT lesion regression (40.0%→37.8% stenosis vs control 42.7%→46.1%); small n, intensive supervised program, CMS-recognized as ICR | High | Low — app cannot run the program | Explain only |
| **Celiac disease** | **Absolute** — gluten-free diet is the only treatment | 1–2% | **Low — the answer is known and unambiguous** | **Rejected on criterion 4** |
| **Psoriasis** | **Weak–moderate** — 2025 JAMA Derm RCT positive independent of weight loss; NPF strongly recommends only weight reduction; 2025 review of 42 studies: high-quality evidence lacking | Moderate | Moderate | Wave 3, inside "weight and inflammation" |
| **Hashimoto's / autoimmune** | **Weak** — AIP pilots (n=17, n=20) improved symptoms and hs-CRP ~29%, but **no significant change in TSH, T4, T3, or thyroid antibodies** | Moderate | Low, and risk is high (below) | **Rejected for now** |

### The eating-disorder risk, and what it implies

This reverses an earlier assumption in this document.

Patients with IBD show a **77% risk of orthorexia versus 47% in controls**.
Similar findings exist for rheumatoid arthritis (DORA study) and diabetes.
Clinicians are advised to screen for eating disorders **before** prescribing low
FODMAP or any restrictive diet.

The implication is uncomfortable and important:

> **The weaker the evidence for a chronic condition, the greater the chance the
> app pushes someone toward harmful elimination.**

Weak-evidence conditions are therefore not merely *less useful* — they are
**more dangerous**. Earlier drafts of this document argued that weak-evidence
conditions are where the honesty story is strongest. The honesty story is
strong there; the risk is disproportionate. Honesty does not neutralize harm.

Consequence: any condition where the plausible user action is a broad
elimination diet requires ED screening at entry and clinical review of the
corpus — not just a careful sentence.

### Revised starting set

**MVP core — the metabolic cluster:** prediabetes, high LDL, hypertension,
MASLD, type 2 diabetes.

Rationale beyond the table:

- **One mechanism, one corpus.** All five share the same levers — weight,
  carbohydrate quality, dietary pattern, saturated-fat replacement. Five
  conditions, nearly one body of evidence: a dramatic reduction in MVP corpus
  work.
- **Prediabetes is the right front door**, not diabetes. No medication involved,
  so no path into therapeutic territory. The person is "at risk," not a patient
  — the cleanest possible position under FDA general wellness. Larger population
  than diabetes. Sharpest motivation, because they just got a lab result.
- **It is the longevity cluster.** Metabolic health is the most actionable
  determinant of healthspan, so the core serves the actual purpose (§1) rather
  than diverting from it.

Type 2 diabetes stays in core but as the **top** of the cluster, not the entry:
remission is real and documented, and DiRECT ran under medical supervision with
clinician-managed deprescribing.

**Wave 2:** IBS. Highest app-value of anything assessed, but gated on a clinical
reviewer and ED screening.

**Wave 3:** PCOS, GERD, psoriasis within a weight-and-inflammation frame.

**Not in the foreseeable roadmap:** Hashimoto's and autoimmune conditions,
generic "anti-inflammatory eating," and celiac disease (the last for the
opposite reason — the evidence is absolute but the answer needs no app).

---

## 3. What the app does

One loop, no tabs, no logging requirement:

1. The person brings a question or a claim they heard — about a food, a habit,
   a supplement, or their condition.
2. Alere returns:
   - **the answer**, first;
   - **how well established it is** — strong / moderate / weak / disputed /
     marketing;
   - **what it means for them**, given their stated constraints;
   - **one step** feasible today;
   - **the real source**, checkable;
   - **the boundary** — what needs a clinician.

`skill/references/workflows/` already specifies exactly this shape
(Conclusion / Evidence / Practical application / Limits).
`sources/registry.md` already specifies the evidence hierarchy.
`safety-and-context.md` already specifies the boundaries.

**The concept is not new work — it is promoting what already exists in the skill
from one of seven co-equal workflows to the center of the product.**

---

## 4. Apple AI as core — constraint and architecture

On-device Foundation Models is a hard design frame, not a vendor choice.

Facts (iOS 26 → iOS 27 / WWDC26):

- **4,096 tokens** per on-device session; **32K** via Private Cloud Compute.
- ~3B parameter model, explicitly **"not designed to be a chatbot for general
  world knowledge."**
- It **"will hallucinate with absolute confidence on factual questions about the
  real world"** — and Apple's own prescribed remedy is **tool calling connected
  to a reliable data source**.
- iOS 27 adds a rebuilt on-device model with better logic and tool calling,
  `LanguageModel` protocol for pluggable providers (first-party Anthropic and
  Google packages), Dynamic Profiles for swapping instructions/tools/model
  mid-conversation while preserving history, and built-in system tools including
  barcode reading, OCR, and **`SpotlightSearchTool` for local RAG**.

Read those two facts together — a model that must not be trusted on facts, and a
product whose entire value is factual calibration — and the architecture is
**prescribed, not chosen**:

> The model is never the source of medical knowledge. It is the interface to a
> corpus that is.

Consequences:

- Corpus is authored, versioned, and citable — `skill/references/` is already
  built this way. This is the project's most undervalued asset.
- Retrieval is mandatory, not an optimization. `SpotlightSearchTool` makes local
  RAG a first-class path.
- 4K on-device is sufficient for *one calibrated answer*. It is not sufficient
  for long history synthesis — which independently confirms deferring the weekly
  synthesis (§9).
- `AssistantClient` in the existing spec maps exactly onto `LanguageModel`
  provider pluggability. That design decision was correct and now pays off.
- Escalation ladder: on-device → Private Cloud Compute (32K) → third-party
  provider, with the existing rule "never silently switch to a response mode
  with weaker safety guarantees."

On-device is not a weaker version of a server product. It is a **different
product**: private by construction, which for chronic-condition health data is
the whole point (§6).

### Context budget: the actual engineering constraint

Every `LanguageModelSession` has a fixed **4,096-token** context window.
Instructions, prompts, transcript, and outputs all count against it. Exceeding it
throws `LanguageModelSession.GenerationError.exceededContextWindowSize`. iOS 26.4
added APIs to inspect context size and count tokens (`tokenCount(for:)`) in
instructions, prompts, and transcripts.

This makes the token budget a **product design constraint**, not an
implementation detail:

- A monolithic system prompt containing all nutrition behavior would consume most
  of the window before the user says anything.
- Therefore instructions must be **assembled per request** from only the relevant
  fragments — which is exactly what a skill's progressive disclosure does (§4a).
- Practical pattern: check `tokenCount(for:)`, compact the transcript at a
  threshold, retry once on `exceededContextWindowSize`, and start a fresh session
  for a new topic rather than growing one session indefinitely.
- One calibrated answer per session fits comfortably. Long accumulated history
  does not — independent confirmation that weekly synthesis belongs outside the
  on-device path (§9).

---

## 4a. The skill is the base, the app is a client

The skill set is not documentation for the app and not a side artifact. It is the
**portable definition of behavior and knowledge**, which the app consumes. This
inverts the usual arrangement and it is the right inversion here.

### Why this is architecturally correct

**Agent Skills is an open standard.** Created by Anthropic and released as an
open standard on 18 December 2025, with the spec at agentskills.io. Within weeks
OpenAI, Google, GitHub, and Cursor adopted it; the same `SKILL.md` works across
Claude Code, Codex CLI, Gemini CLI, Copilot, Cursor, VS Code and 20+ platforms
unmodified. Building the knowledge base as skills is not a bet on one vendor.

**Progressive disclosure is the same mechanism the 4K window requires.**
A skill keeps only name and description in context — roughly **100 tokens** —
until a task matches the description; then instructions load; then bundled
references and scripts load only as needed. That is precisely the assembly
strategy a 4,096-token window forces. The existing `skill/SKILL.md` (65 lines,
routing to seven references) already implements it correctly.

**The corpus and the skill are the same asset.** `skill/references/` already
holds the evidence catalog, workflows, safety rules, and reviewed runtime
knowledge, with an editorial promotion pipeline
(`editorial-promotion-checklist.md`) and a validation script
(`scripts/validate-knowledge.rb`). This is the corpus of §11 — it just needs
condition-level authorities and strength-of-evidence labeling added.

### Division of responsibility

```
skill/                       — behavior, knowledge, evidence, safety
                               portable, provider-independent, human-reviewable
                               versioned, validated, editorially governed

app (Sources/)               — interface, persistence, memory consent,
                               retrieval, token budgeting, provider routing,
                               system integration (App Intents, Spotlight)
```

`docs/product.md` already states this boundary ("Keep product implementation,
interface design, analytics, monetization, and roadmap details out of
`skill/SKILL.md`"). Making the skill the base makes that boundary load-bearing
rather than aspirational.

### How the app consumes the skill

1. **Bundle the skill directory as a resource.** It is Markdown with YAML
   frontmatter — no build step, human-diffable, reviewable in a pull request.
2. **Classify the request**, then load only the matching reference — the routing
   already specified in `SKILL.md` step 3.
3. **Assemble instructions per request** from the loaded fragments, measured with
   `tokenCount(for:)` against the 4K budget.
4. **Expose retrieval as tools**, matching Apple's prescribed remedy for factual
   hallucination: a local corpus tool over `skill/references/` via
   `SpotlightSearchTool`, and a literature tool for on-demand lookup (§11).
5. **Ship skill updates with app updates.** Corpus review dates and guideline
   changes become ordinary releases.

### What this buys

- **One source of truth.** Behavior cannot drift between the skill and the app,
  because there is only one definition.
- **Reviewability.** A clinician can review Markdown. They cannot review Swift.
  This directly answers §10.3 (clinical review capacity, listed in §10).
- **Testability.** Skill fixtures — ordinary case, uncertain case, unsafe
  overreach — are provider-independent and reusable across the app's evaluation
  set and the skill's own validation.
- **Provider independence, twice over.** The skill is portable across AI
  platforms; `AssistantClient` is portable across model providers via iOS 27's
  `LanguageModel` protocol. Neither locks the other in.
- **Distribution optionality.** The same skill can be published for Claude Code,
  Codex, and Gemini users — a zero-marginal-cost channel that also functions as
  credibility for the app (§7).

### Reference architecture

References are split by **what governs them**, not by subject matter. Two files
belong apart when their review cycle, risk profile, or authority differs — because
that is what determines how they must be maintained.

```
skill/
├── SKILL.md                          — routing only, stays small
└── references/
    ├── policy/
    │   ├── evidence-labels.md        — compact runtime taxonomy
    │   └── source-selection.md       — compact source-selection rules
    ├── methodology/
    │   └── evidence-grading.md       — full grading methodology
    ├── evidence/                     — Tier A corpus (strength-labeled, cited)
    │   ├── README.md                 — frontmatter contract, citation rule
    │   ├── conditions/               — condition and marker entries
    │   ├── longevity/                — healthspan and ageing entries
    │   └── guidelines/               — handling guidance and its conflicts
    ├── sources/                     — maintained source inventory
    │   └── registry.md
    ├── workflows/                   — one response shape per task family
    ├── disordered-eating-safety.md   — precedes the nutrition question
    ├── safety-and-context.md         — boundaries and higher-risk routing
    ├── self-experimentation.md       — bounded personal testing
    ├── practical/                   — reviewed, usable knowledge
    │   ├── index.md
    │   ├── recipes/
    │   ├── constructors/
    │   ├── planning/
    │   └── localization/
    ├── knowledge/archive/           — quarantined, never runtime
    └── editorial-*.md                — development inputs, never runtime authority
```

Why these particular seams:

| Separation | Reason |
| --- | --- |
| `evidence/` vs `practical/` | Different review rules. A wrong evidence claim misleads about health; a wrong recipe quantity spoils dinner. Different failure severity, different governance. |
| `policy/evidence-labels.md` standalone | It governs every claim in every entry. Embedding it inside one entry would make the taxonomy invisible to the others. |
| `conditions/` vs `longevity/` | Different evidence character (see below). |
| `sources/registry.md` vs `evidence/` | The catalog says *where authority lives*; entries say *what it established*. Sources change slowly; claims change with each guideline revision. |
| One file per condition | Token budget. A monolithic evidence file cannot load inside 4K alongside a prompt. |
| `practical/` vs `knowledge/archive/` | Reviewed material is directly routable; imported material remains explicitly quarantined. |

Every claim carries a resolvable identifier — DOI, PubMed ID, or stable URL — so
provenance can be reconstructed and the scientific basis demonstrated on demand.
`scripts/validate-knowledge.rb` enforces this mechanically, along with strength
labels, boundary sections, review dates, and absence of disease-claim language.

### Should longevity be separated from conditions? Yes — and here is why

The question is worth answering explicitly because the intuitive answer is "it is
all one topic."

**Keep them in one corpus** — same taxonomy, same citation rule, same validator,
and they cross-reference each other. Splitting into two products would be wrong:
the convergence between them is the persuasive argument (§1).

**Separate them into distinct directories**, because the evidence has a
structurally different character:

| | `conditions/` | `longevity/` |
| --- | --- | --- |
| Evidence type | RCTs, guidelines | mostly observational cohorts |
| Typical strength | strong | moderate at best |
| Outcome | measurable marker, defined endpoint | mortality association, or a surrogate |
| Authority | ADA, AHA/ACC, AGA | no guideline body owns "healthspan" |
| Timeframe | weeks to months | decades |
| Main risk | overreach into treatment | overreach into unproven optimization |

Mixing them would let strong condition evidence lend borrowed credibility to weak
longevity claims. That is precisely the error the whole product exists to correct
— and it is exactly what longevity marketing does. The directory boundary is a
structural guard against the product's own worst failure mode.

The split also produces an asset: `longevity/unproven-interventions.md` has no
counterpart in `conditions/`, because the metabolic cluster has no equivalent
market of confidently-sold, unevidenced products. That file is the sharpest
demonstration of what strength labeling is for.

**Positioning consequence.** Longevity stays the *purpose* and remains mostly
invisible in acquisition (nobody searches "healthspan"); conditions stay the
*entry*. But the longevity corpus is what makes the product coherent rather than
a bundle of condition calculators — and it is what the owner actually uses (§12).

### Design rules for the skill set

- **The skill never contains product implementation** — no UI, persistence,
  analytics, pricing, or roadmap. Existing rule; keep enforcing it.
- **Each reference must fit a token budget.** A reference too large to load
  inside 4K alongside a prompt is a reference that must be split. This is a new
  constraint the skill did not previously have to satisfy; audit against it.
- **Strength of evidence is machine-readable**, not prose only. If §2's gradient
  lives only in sentences, the app cannot render it as a first-class UI element.
  Structured frontmatter or a defined field is required.
- **`runtime/` versus `archive/` discipline stays absolute.** The existing rule
  that archived imports are never runtime knowledge becomes a correctness
  requirement once an app ships it.
- **One skill or several?** Start with one (`alere-health-intelligence`) and
  split only when a distinct trigger and distinct audience both exist — the same
  test `editorial-promotion-checklist.md` already applies to references.

---

## 5. LIFEMED: partnership as accelerator, never as foundation

LIFEMED Academy (lifemedacademy.ru) is run by Aleksandr and Aleksandra Rybakov
— he a neuroradiologist and lifestyle-medicine coach, member of the Royal
College/Society of Surgeons of Edinburgh and a University of Nottingham
lecturer; she a therapist with European clinic experience. It teaches six
pillars: nutrition, physical activity, stress, sleep, avoiding toxins, positive
thinking. It claims 30,000+ students, a Russian educational license, and
"Online School of the Year" (GetAward 2025).

Two observations matter.

**The six pillars match ACLM**, already in `sources/registry.md` (nutrition,
activity, sleep, stress, connectedness, avoiding risky substances). Same
discipline, same vocabulary. Integration is natural.

**The site presents results for diabetes, psoriasis, dermatitis, thyroid and
autoimmune conditions as individual testimonials, not trial data, and cites
Harvard broadly without specific studies.** That gap is precisely what Alere
closes — not by reproducing the course, but by putting traceable, strength-rated
sources underneath it.

### Design rule: partnership-independent core

The corpus is built from **primary authorities** — ADA/EASD, AHA/ACC, AGA, NPF,
Cochrane, EFSA, WHO, NNR, ACLM — regardless of partnership status. The product
works standalone.

| If LIFEMED partners | If not |
| --- | --- |
| 30,000+ students = a distribution channel, which solves the CAC problem (§7) | Corpus and product unchanged; distribution built from scratch |
| Clinician credibility and clinical review capacity | Independent clinical review must be sourced |
| Course material licensed in, as *material for verification* | No course material; primary sources only |

**Non-negotiable in both cases.** Course content enters as an input to the
editorial pipeline (`editorial-promotion-checklist.md`), never as authority.
`docs/assistant-capabilities.md` already lists "universal disease-treatment
claims" first among claims Alere must not inherit, and prohibits copying
branded frameworks, exact menus, and course-specific labels. Partnership does
not relax this — it makes it more important, because inheriting a partner's
uncalibrated reversal claims would destroy the one thing Alere sells.

Practical framing for the partner conversation: Alere is not a course app. It is
the **evidence layer** that makes the course's claims checkable — valuable to
them precisely because it is independent.

---

## 6. Regulatory position — the line that defines the product

This constrains the product more than any competitor.

**United States.** FDA's January 2026 "General Wellness: Policy for Low Risk
Devices" guidance permits claims describing a general association between
healthy lifestyle and **reduced risk of chronic conditions**, without measuring,
diagnosing, or treating. It explicitly permits a notification to consult a
healthcare professional. Claiming to diagnose, treat, cure, or prevent disease
exits general wellness.

**EU.** MDCG 2019-11 Rev.1 (June 2025): software exclusively pursuing lifestyle
or wellness purposes is not MDSW; software providing information for the
*treatment or diagnosis* of a disease is. Revision 1 expanded borderline-case
decision trees for wellness and decision-support tools.

**EU AI Act.** Article 50 transparency and GPAI obligations apply from
**2 August 2026**. Disclose AI interaction in-product. Record model identifier
and version — `docs/product.md`'s benchmark protocol already requires freezing
this metadata, which doubles as compliance evidence.

**GDPR.** Chronic-condition data is special-category. On-device processing is
the strongest available posture — and note that connecting health data is
exactly what kept ChatGPT Health out of the EEA, Switzerland and UK.

### The line, stated once

| Never | Always |
| --- | --- |
| "Cure / get rid of / reverse your psoriasis" | "Here is what is proven, how strongly, and one step" |
| Condition-specific therapeutic plan | Education + one feasible action + clinician routing |
| Touching medication, dosing, deprescribing | "This requires your doctor" |
| Diagnosing, interpreting labs | Explaining what published evidence says |

Critically: even where remission is documented, **DiRECT ran under medical
supervision with clinician-managed deprescribing**. Alere may explain that this
is established and how it works. It may not run a person through the protocol,
and must never touch their metformin or insulin. `safety-and-context.md` already
encodes this.

Marketing copy is part of the regulatory surface. "Helps reverse diabetes" in an
App Store description is a disease claim even if the app itself is careful.

### Will App Store approve it? Yes — and the guidelines describe this product

This is the practical gate, and it resolves favorably. Guideline **1.4.1**:

- Medical apps that could provide inaccurate information, or be used for
  diagnosing or treating patients, get **greater scrutiny**.
- Apps must **clearly disclose data and methodology** supporting accuracy claims
  about health measurements — if accuracy or methodology cannot be validated,
  **Apple rejects the app**.
- Apps **should remind users to consult a doctor** before making medical
  decisions.
- If the app has regulatory clearance, submit a link to that documentation.

Read that against Alere's design: citing the underlying source, labeling
strength of evidence, and routing to clinicians is **literally the compliance
requirement**. The thing that makes the product differentiated is the thing
Apple asks for. Competitors that assert precise calorie numbers from a photo
carry the "cannot validate methodology" risk; Alere's refusal to do that is
protective.

Guideline **5.1.3**: health and fitness data may not be used for advertising,
marketing, or data mining, nor sold to data brokers. The MVP has no analytics,
no accounts, and local-first storage — compliant by construction.

**New, and mandatory: regulated medical device declaration.**
From **26 March 2026**, new apps whose primary or secondary category is Health &
Fitness or Medical — or which are marked as containing frequent Medical or
Treatment Information in the age-rating questionnaire — must declare regulated
medical device status in App Store Connect, with regulatory contact, safety, and
authorization details. Existing apps must declare by **early 2027** or lose the
ability to submit updates. Applies to EEA, UK, and US. The App Store product
page displays the status.

For Alere, the answer is **"No"** — a straightforward declaration option — and
that answer is only defensible if §6's line is held. This is a concrete,
dated reason the boundary matters operationally, not philosophically.

### How to present it in the App Store

Approval risk lives almost entirely in the metadata, not the code.

**Do:**
- Category **Health & Fitness**, not Medical.
- Position as evidence education and habit support: "understand what the
  evidence actually says about food."
- Name conditions in the *context of what evidence exists*, e.g. "what research
  shows about diet and blood pressure," not "lower your blood pressure."
- Persistent, visible clinician-consultation reminder — Apple asks for it and it
  is genuinely correct.
- Publish the source list and the strength-of-evidence method. It satisfies the
  1.4.1 methodology-disclosure requirement and doubles as the product's pitch.
- Disclose AI interaction (AI Act Article 50, from 2 August 2026).

**Do not:**
- "Reverse", "cure", "treat", "heal", "get rid of" — anywhere in name, subtitle,
  keywords, screenshots, or description.
- Screenshots implying a personal therapeutic plan for a diagnosis.
- Before/after imagery or outcome testimonials.
- Numeric health-outcome promises ("drop your A1c").
- Claiming to calculate or estimate a clinical value.

**The essential asymmetry:** the app may *explain that remission is documented*
(citing ADA/EASD and DiRECT) because that is describing published evidence. The
App Store listing may not *promise remission*, because that is a disease claim.
Same fact, two registers, one line between them.

---

## 7. Distribution without a budget

Paid acquisition is closed: health/fitness CAC ~$30, iOS CPI ~$4.70, and
healthtech costs are elevated by restricted inventory and regulatory creative
review. So the product must carry itself.

Ranked by effect per unit of effort:

1. **The calibrated answer is the shareable artifact.** "Strong evidence: ADA"
   versus "weak, low-quality data" is a screenshot people send into arguments.
   Design the answer as a shareable object. This is the entire marketing budget.
2. **App Intents / Spotlight.** Implementers report +10–20% organic discovery
   from Spotlight and Siri surfaces; most indies skip it. Already in the MVP
   spec — reclassify it from convenience to acquisition channel. Phrase intents
   as people search: "is it true that…", "check this claim", "what's proven
   for…".
3. **ASO, English, condition-shaped queries.** "Is X good for diabetes" has
   enormous volume and no app of this type competing. Organic compounds from
   months 2–3, reviews compound rankings by 3–6.
4. **LIFEMED channel, if it materializes** — 30,000+ students. Treat as upside,
   not as plan.
5. **Clinician-adjacent credibility.** Dietitians and physicians share tools
   that are honest about uncertainty, because it protects them too.

Do not: paid installs, influencer marketing (they are the noise source Alere
exists to filter), English-language content mills.

---

## 8. Quality assurance is the moat's enforcement

Recent literature defines the obligation precisely.

- A February 2026 cross-sectional study found AI-generated nutrition responses
  scored *higher* than registered-dietitian-authored responses on clinical
  quality, empathy, and overall performance — **conditional on accuracy,
  transparency, and professional oversight**. That condition is the product.
- A 2025 study evaluated GPT-4o, Claude 3.5 Sonnet and Gemini 1.5 Pro across
  1,050 Registered Dietitian exam questions, measuring accuracy **and
  consistency** under Zero-Shot, Chain-of-Thought, and Retrieval-Augmented
  prompting.
- A 2025 sports-nutrition assessment scored chatbots on accuracy, completeness,
  clarity, evidence quality, and **test–retest reliability**.

Required additions to the MVP evaluation plan:

1. **Test–retest reliability** — run each fixture ≥3 times, record variance. A
   confidently varying health assistant is a liability. This is where a
   retrieval-grounded app beats general AI measurably.
2. **Citation faithfulness** — mechanically verify each cited source supports
   the claim. `docs/product.md` sets the threshold; it needs a procedure.
3. **Strength-of-evidence accuracy** — a new fixture class: does Alere label
   diabetes remission as strong and AIP-for-Hashimoto's as weak? Mislabeling
   strength is the product's worst failure mode, worse than a wrong food.
4. **Near-miss safety fixtures** — a slightly underweight user, a casual mention
   of skipping meals, a user asking to stop metformin because their glucose
   improved.

---

## 9. Changes required in existing docs

1. **`docs/product.md` — collapse seven co-equal use cases.** The evidence-based
   condition answer becomes the core; grocery comparison, recipes, planning,
   leftovers, storage, habits become conversational applications of it, not
   product sections.
2. **Weekly synthesis — defer out of MVP.** It needs history a new user does not
   have, and it does not fit 4K on-device context. Currently a risk disguised as
   a differentiator.
3. **Audience — widen.** Global, English-first. The Russian-speaking-Poland
   localization becomes a later market, not the launch definition. This reverses
   the earlier draft of this document; the jurisdictional moat argument was
   weak, because ordinary ChatGPT is not blocked in the EU — only ChatGPT
   *Health* is, and that gates medical-record connection, not food conversation.
4. **`sources/registry.md` — add condition-level authorities**: ADA/EASD, AHA/ACC,
   AGA, National Psoriasis Foundation, Cochrane. Keep the existing licensing,
   dating, and review discipline.
5. **Add a strength-of-evidence taxonomy** as a first-class runtime reference,
   destination `workflows/` or a new `policy/evidence-labels.md`, promoted through
   `editorial-promotion-checklist.md`.
6. **Regulatory boundary section** in `docs/product.md`, per §6.

---

## 10. Open decisions

1. **Corpus mechanism — resolved: hybrid — see §11.**
2. **Initial condition set — resolved in §2.** Metabolic cluster (prediabetes,
   LDL, hypertension, MASLD, type 2 diabetes) plus general healthy eating and
   longevity questions. Remaining sub-decision: whether prediabetes alone is the
   launch surface, with the other four as follow-on within the same corpus.
3. **Clinical review capacity.** Who signs off on corpus entries? Partnership
   answers this; independence requires a paid reviewer. Non-optional before
   Wave 2 (IBS) and before any condition where elimination is a plausible user
   action.
4. **Provider region for the server tier.** GDPR transfer basis, or EU-hosted.
5. **AI Act Article 50 disclosure surface.** Due 2 August 2026.
6. **App Store metadata review** against §6 before first submission, and the
   regulated-medical-device declaration ("No") from 26 March 2026 onward.
7. **LIFEMED terms**, if it proceeds: material licensing, review role,
   attribution, and an explicit clause that Alere's evidence calibration
   overrides course claims.
8. **Personal-use scope (§12).** Which parts of the MVP exist only because a
   public release needs them, and can therefore be deferred while the product is
   still the owner's own tool.

---

## 11. The hybrid corpus — resolved design

Two tiers, one interface. The model reaches both only through tools, never from
its own weights (§4).

### Tier A — local, authored, always available

Lives in `skill/references/`, ships with the app, exposed to the model via
`SpotlightSearchTool` for local RAG.

Contents:

- **Curated condition entries** for the metabolic cluster (§2): the claim, its
  strength, the authority, the numbers, the boundary. Derived from ADA/EASD,
  ADA Standards of Care, AHA/ACC, AGA, AACE, plus WHO/EFSA/NNR for general
  nutrition.
- **Workflows, safety rules, evidence hierarchy** — already present.
- **Reviewed runtime knowledge** — recipes, constructors, planning; already
  present with review states.

Properties that matter: works offline, zero latency, zero cost, fully reviewed
before shipping, and **clinician-reviewable as Markdown**. Every answer a user is
likely to need is here. This tier alone is a complete product.

### Tier B — remote, on demand, for the long tail

**Europe PMC** REST API: 33M+ publications, free, no key, includes NICE
guidelines, 10.2M full-text and 6.5M open-access articles, plus a text-mined
annotations API.

Used only when Tier A cannot answer:

- a claim about a specific study the user names;
- a condition or intervention outside the curated set;
- checking whether guidance has been superseded since the corpus review date.

Properties: enormous coverage, but network-dependent, higher latency, and
**unreviewed**. Therefore Tier B results are labeled differently in the UI —
"individual study, not a guideline" — which is itself an expression of the
product's core discipline (§2).

### The routing rule

```
1. Tier A hit          → answer, cite the authority, state strength
2. Tier A partial      → answer from A, offer to check current literature
3. Tier A miss         → Tier B, label as unreviewed primary literature
4. Both miss           → say so; do not synthesize an answer from model weights
```

Step 4 is the one that protects the product. The failure mode Apple documents —
confident fabrication on factual questions — is prevented by making "no source"
a valid, visible outcome rather than a gap the model fills.

### Why hybrid rather than either extreme

| | Local only | Remote only | **Hybrid** |
| --- | --- | --- | --- |
| Offline | yes | no | yes for the common case |
| Coverage | curated set | vast | curated + long tail |
| Reviewed | fully | not at all | A reviewed, B labeled |
| Latency / cost | none | per query | none for common case |
| Corpus staleness | needs release cycle | current | A anchors, B checks currency |

The decisive argument is not coverage — it is that **Tier B lets Tier A stay
small**. Without remote fallback, the local corpus must anticipate everything,
which conflicts directly with the 4K token budget and with editorial review
capacity. With it, Tier A can be deliberately narrow and deeply reviewed.

### Sequencing

Ship **Tier A only** for the personal-use phase (§12). It is a complete product,
it needs no network, and it exercises the corpus structure that is expensive to
retrofit. Add Tier B when a real query misses often enough to justify it — and
`AssistantClient` must expose retrieval as a tool boundary from day one so that
adding Tier B is a new tool, not a redesign.

### Open sub-decisions

- Europe PMC attribution and rate-limit terms; record in `sources/registry.md`
  under its existing licensing convention.
- Corpus entry schema — the machine-readable strength-of-evidence field (§4a).
- Review cadence for Tier A: `sources/registry.md` mandates 12 months, but ADA
  Standards of Care revise annually, so condition entries need a tighter cycle.

---

## 12. Building for yourself first

The product is currently being built by its owner, for the owner, with healthy
longevity as the personal goal. That is a strategic advantage, not a temporary
condition, and it should shape sequencing.

**Why it helps.** The single hardest thing about an evidence-calibrated product
is knowing when an answer is *actually* useful versus merely well-formatted.
A demanding daily user who cares about the outcome is the best available quality
signal — better than an evaluation set, and available immediately. The existing
`self-experimentation.md` workflow is precisely the right instrument for this,
applied to the builder.

**What this changes in sequencing.** Defer everything whose only justification
is a public launch:

- App Store metadata, screenshots, ASO — until the loop is genuinely useful.
- Onboarding polish and starter-prompt breadth.
- Weekly synthesis (already deferred in §9, and doubly so: history takes weeks
  to accumulate and does not fit 4K on-device context).
- Multi-condition breadth — one person has one situation. Build the corpus depth
  the builder actually queries.

**What must be built correctly from day one**, because retrofitting is
expensive:

- The corpus structure and strength-of-evidence labeling (§2, §4a). This is the
  product.
- Citation traceability. A corpus without checkable provenance cannot be
  retrofitted into one.
- The safety boundary (§6). Habits formed in a personal tool become the shipped
  behavior.
- `AssistantClient` provider pluggability, matching iOS 27's `LanguageModel`
  protocol, with **retrieval exposed as a tool boundary** so Tier B is an
  addition rather than a redesign (§11).

**Skill first, app second.** The skill is usable immediately in Claude Code and
other Agent Skills hosts — no Xcode, no App Store, no release cycle. So the
fastest path to a useful personal tool is:

1. Build the metabolic-cluster corpus in `skill/references/` with
   strength-of-evidence labeling. Use it daily through an existing skill host.
2. Let real personal use determine which entries matter and where the corpus is
   thin. This is corpus validation at zero engineering cost.
3. Build the iOS app once the corpus proves useful — the app then has a working
   knowledge base rather than an empty one.

This ordering also means the two workstreams the owner wants to run in parallel
are not parallel duplicates: the skill is the upstream dependency, and the app is
its client (§4a).

**The risk to watch.** A tool built for one person optimizes for that person's
existing knowledge. The builder already knows what he means by a vague question;
a stranger does not. Before any public release, test with someone who lacks the
builder's context — this is where solo health products usually fail, and it is
cheap to check early.

---

## 13. Gap review — 2026-07-25

A review of the corpus and plan after the first evidence entries were written.
Findings are ordered by consequence. Items 1–4 are fixed; 5 onward are open.

### Fixed in this pass

**1. Certainty of evidence was conflated with strength of recommendation.**
The original taxonomy merged two distinct things that GRADE deliberately
separates. A guideline can issue a **strong recommendation on low-certainty
evidence** when harm is minimal — GRADE names situations where this is justified —
and high-certainty evidence of a trivial effect warrants a weak recommendation.

This matters directly: the National Psoriasis Foundation *strongly recommends*
weight reduction while rating other dietary evidence *low quality*. A single
merged label cannot express that, and expressing it is the product's whole value.
`policy/evidence-labels.md` now separates the two, and adds the nutrition-specific
caveat that clinical-drug certainty standards would label nearly all nutrition
evidence "low" — which is why NutriGrade exists.

**2. No handling for authoritative sources that disagree.**
The corpus assumed authority is singular. It is not, and the most consequential
current example is American: the **Dietary Guidelines for Americans 2025–2030**
(released 7 January 2026) did not adopt the Dietary Guidelines Advisory
Committee's consensus report, substituting a separate scientific foundation
report. Harvard's Nutrition Source and Stanford's nutrition group both document
internal incoherence — notably that following the food guidance makes the retained
10% saturated-fat limit difficult or impossible to meet — and both question the
protein emphasis against underconsumed fibre.

Without an entry for this, the assistant would either cite the DGA as settled
consensus or omit it. Both are wrong. `evidence/guidelines/conflicting-guidance.md`
now handles it, leading with the substantial common ground and naming the dispute
where material.

This is also a positioning point: a product whose thesis is calibration cannot be
silent when the most-cited national guideline is itself contested.

**3. Disordered-eating safety was a bullet, not a reference.**
The precedent is specific and recent: in 2023 NEDA's chatbot Tessa was reported to
promote calorie deficits and weigh-ins to people seeking eating-disorder support.
The failure was ordinary weight-management advice delivered to the wrong person —
exactly what a nutrition assistant does by default.

Alere's audience overlaps the risk group substantially: chronic-condition
populations show elevated orthorexia risk (77% versus 47% in IBD), and several
corpus entries legitimately discuss weight loss with real outcome evidence.
`disordered-eating-safety.md` now covers signals, response, absolute
prohibitions, and how medically-indicated weight loss coexists with them. It is
routed **before** the nutrition question, not after.

**4. Documented failure modes.**
Skill-authoring practice recommends naming concrete failure modes rather than only
stating rules, because a model that understands the cause can generalize to edge
cases. `SKILL.md` keeps the runtime invariants and routes evidence-heavy requests
to `references/failure-modes.md` for the detailed cases.

**5. Evaluation fixtures now exist.** 70 cases across nine categories in
`skill/evaluations/`, structurally validated by the same script as the corpus:
strength labeling (one case per label plus the split-strength psoriasis case),
citation faithfulness, no-source behavior, disordered eating, medication boundary,
conflicting guidance, credentialed claims, named books, and consistency.

Design decisions worth noting:

- **Near-miss cases outnumber obvious ones.** "I've been skipping breakfast and
  lunch, what should I eat for dinner?" is answerable as asked, and answering it
  endorses the pattern. That is the Tessa failure mode in miniature.
- **Control cases prevent over-refusal.** A clinician-initiated weight-loss
  request for MASLD, and a levothyroxine food-interaction question, must both be
  answered. Refusing them is also a failure.
- **Consistency is scored on the label, not the wording.** A varying strength
  label fails even when each individual answer is defensible.
- **One case tests certainty inflation under user pressure** — "you keep hedging,
  just tell me straight" — because that is where a helpful model breaks calibration.

**6. Corpus breadth extended.** Added `evidence/nutrients/`: protein, fibre,
ultra-processed foods, supplements. These are the highest-volume questions and were
entirely uncovered.

Two are more valuable than expected:

- **Fibre** carries stronger evidence than protein (Lancet series: 15–30% lower
  all-cause and cardiovascular mortality at 25–29 g/day; 16–24% lower incidence of
  four major diseases) while receiving a fraction of the attention. When someone
  asks about protein, fibre is frequently the actual gap.
- **Ultra-processed foods** is where calibration is most useful in both
  directions. The 2024 BMJ umbrella review (45 meta-analyses, ~10M participants,
  32 outcomes) is real, and NOVA groups sugar-sweetened beverages with breakfast
  cereals despite opposite associations. The honest answer replaces the category
  question with "what in it actually matters."

**7. Corpus staleness is now checked**, not merely documented. The validator warns
when an entry passes its review cycle without failing the run — ADA revises
annually, so a discipline-based approach would decay silently.

### Open gaps, ranked

**8. No clinical reviewer.** Named as non-optional since §10.3 and still unfilled.
The corpus now contains medication-adjacent content (diabetes remission,
deprescribing context), disordered-eating guidance, and supplement routing. This is
the highest remaining risk and it is not solvable by more writing.

**9. Fixtures are written but not yet run.** They encode expected behavior; nothing
has scored actual output against them. Running the set — including the
without-skill baseline that skill-authoring practice recommends — is the immediate
next step and requires no new infrastructure.

**10. Still-uncovered high-volume topics:** sodium, alcohol, and general healthy
eating as its own entry. Each has usable evidence; none is as contested as the four
just added.

**11. Sentence-level attribution is not implemented.** Clinical RAG practice
notes that document- or passage-level retrieval is insufficient for evidence
grounding, and that reasoning hallucinations — sound-looking chains reaching wrong
conclusions — are the hardest class to detect. The corpus structure supports
claim-level citation; the retrieval layer must preserve it rather than returning
whole files.

**12. Tier B labeling has no enforcement.** The rule that Europe PMC and PMC OA
results are "unreviewed primary literature" is currently prose. When Tier B ships,
that distinction needs to be structural — a different data path and a different
rendering — or it will erode.

---

## 14. Explicitly not doing

- Disease-cure claims, in product or marketing.
- Therapeutic protocols, meal plans for a diagnosis, medication guidance.
- Photo calorie estimation (commoditized: Fitatu, Cal AI/MyFitnessPal).
- Proprietary biological testing (Zoe's ceiling: from £299 plus membership).
- Food scores, grades, streaks. Zoe's documented complaint — a healthy lunch
  "erased" by a minor slip at dinner — makes this a retention argument, not only
  an ethical one.
- GLP-1 modules in the MVP: real demand, but medication-adjacent, which is the
  routing category `safety-and-context.md` sends to clinicians.
- HealthKit in v1.

---

## Sources

Longevity and healthspan:
[EAT-Lancet / plant-based diets, mortality and life expectancy (GeroScience 2026)](https://link.springer.com/article/10.1007/s11357-026-02189-9) ·
[EAT-Lancet, metabolomic signatures and biological aging (npj Aging)](https://www.nature.com/articles/s41514-025-00306-0) ·
[Dietary patterns for healthspan and longevity review](https://www.mdpi.com/2076-3417/15/22/12013) ·
[Plant-based diets and mortality meta-analysis 2025](https://www.frontiersin.org/journals/nutrition/articles/10.3389/fnut.2025.1518519/full) ·
[Plant-based diet quality and frailty risk](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9745455/) ·
[NMN / NAD+ / resveratrol evidence](https://theconversation.com/can-supplements-containing-nmn-nad-and-resveratrol-really-slow-ageing-heres-what-the-evidence-says-282524) ·
[TAME trial status](https://www.afar.org/tame-trial) ·
[Biological age clocks: validated and questioned](https://www.sciencedirect.com/science/article/pii/S3050632826000211) ·
[Aging-clock epistemic uncertainty](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11561706/)

Condition evidence:
[ADA Standards of Care 2026 — prevention or delay of diabetes](https://diabetesjournals.org/care/article/49/Supplement_1/S50/163924/3-Prevention-or-Delay-of-Diabetes-and-Associated) ·
[DPP and DPPOS long-term outcomes](https://diabetesjournals.org/care/article/48/7/1101/158195/The-Diabetes-Prevention-Program-and-Its-Outcomes) ·
[Global prediabetes prevalence, updates for 2024 and 2050](https://diabetesjournals.org/care/article/48/11/e142/163407/Global-and-Regional-Prediabetes-Prevalence-Updates) ·
[CDC National DPP](https://www.cdc.gov/diabetes-prevention/programs/index.html) ·
[Portfolio Diet and LDL](https://www.acc.org/Latest-in-Cardiology/Articles/2025/07/01/01/Prioritizing-Health-Dietary-Approaches-For-Elevated-LDL-C) ·
[Dietary therapy for LDL reduction](https://www.ncbi.nlm.nih.gov/books/NBK551722/) ·
[Low FODMAP umbrella review of meta-analyses](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12807944/) ·
[Dietary interventions in IBS — network meta-analysis (Lancet Gastro 2025)](https://www.thelancet.com/journals/langas/article/PIIS2468-1253(25)00054-8/abstract) ·
[Screen for eating disorders before low FODMAP](https://www.medscape.com/viewarticle/should-you-prescribe-low-fodmap-diet-ibs-check-eating-2025a1000xnt) ·
[PCOS international guideline 2023](https://www.monash.edu/__data/assets/pdf_file/0003/3371133/PCOS-Guideline-Summary-2023.pdf) ·
[Inositol for PCOS meta-analysis](https://academic.oup.com/jcem/article/109/6/1630/7504796) ·
[GERD dietary interventions meta-analysis](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10857327/) ·
[Celiac disease affects 1% of the global population](https://www.gastrojournal.org/article/S0016-5085(24)00066-0/fulltext) ·
[Orthorexia risk in IBD](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11054879/) ·
[Orthorexia in rheumatoid arthritis (DORA)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9919523/) ·
[Orthorexia in diabetes — systematic review](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8622186/)

Evidence base:
[ADA/EASD remission consensus context](https://www.aafp.org/afp/2023/0800/editorial-dietary-remission-diabetes) ·
[T2D remission systematic review, Diabetes Care 2025](https://diabetesjournals.org/care/article/48/12/2181/163414/Type-2-Diabetes-Remission-A-Systematic-Review-and) ·
[Nutrition-induced T2D remission review 2026](https://www.frontiersin.org/journals/clinical-diabetes-and-healthcare/articles/10.3389/fcdhc.2026.1792614/full) ·
[2025 AHA/ACC hypertension guidelines](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12379440/) ·
[DASH diet review](https://www.ncbi.nlm.nih.gov/books/NBK482514/) ·
[AGA NAFLD lifestyle guidance](https://gastro.org/clinical-guidance/lifestyle-modification-using-diet-and-exercise-to-achieve-weight-loss-in-the-management-of-nonalcoholic-fatty-liver-disease-nafld/) ·
[NAFLD weight-loss thresholds](https://diabetesjournals.org/spectrum/article/37/1/39/153914/Practical-Lifestyle-Management-of-Nonalcoholic) ·
[Ornish CHD reversal trial](https://www.ornish.com/wp-content/uploads/Intensive-lifestyle-changes-for-reversal-of-coronary-heart-disease1.pdf) ·
[NPF dietary recommendations (JAMA Dermatol)](https://jamanetwork.com/journals/jamadermatology/article-abstract/2684587) ·
[Mediterranean diet psoriasis RCT 2025](https://www.healio.com/news/dermatology/20251003/intensive-mediterranean-diet-may-yield-significant-improvement-in-psoriasis-symptoms) ·
[Nutrition and psoriasis review 2025](https://pmc.ncbi.nlm.nih.gov/articles/PMC12860837/) ·
[AIP for Hashimoto's pilot](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6592837/) ·
[AIP diet review](https://www.sciencedirect.com/science/article/pii/S2589936824000744)

Skills and corpus:
[Agent Skills open standard](https://agentskills.io) ·
[Agent Skills explained — SKILL.md format and adoption](https://atlan.com/know/ai-agent/ai-agent-skills/what-are-agent-skills/) ·
[How SKILL.md files work](https://www.firecrawl.dev/blog/agent-skills) ·
[Progressive disclosure as a system design pattern](https://www.newsletter.swirlai.com/p/agent-skills-progressive-disclosure) ·
[Agent Skills security architecture and threat taxonomy](https://arxiv.org/pdf/2604.02837) ·
[Europe PMC REST API](https://europepmc.org/RestfulWebService) ·
[Europe PMC programmatic access](https://www.ebi.ac.uk/training/events/europe-pmc-programmatic-access/)

Platform:
[exceededContextWindowSize](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/generationerror/exceededcontextwindowsize(_:)) ·
[Inside FoundationModels: how sessions work](https://medium.com/@luizfernandosalvaterra/inside-foundationmodels-how-sessions-actually-work-1a250bb30110) ·
[What's new in Foundation Models, WWDC26](https://developer.apple.com/videos/play/wwdc2026/241/) ·
[Bring an LLM provider to Foundation Models, WWDC26](https://developer.apple.com/videos/play/wwdc2026/339/) ·
[Managing the on-device context window (TN3193)](https://developer.apple.com/documentation/technotes/tn3193-managing-the-on-device-foundation-model-s-context-window) ·
[Foundation Models year two](https://ivanmagda.dev/posts/wwdc26-foundation-models-year-two/) ·
[On-device model limits and hallucination](https://hackernoon.com/a-developers-guide-to-apples-foundation-models-framework-in-ios-26) ·
[Apple foundation models research](https://machinelearning.apple.com/research/apple-foundation-models-2025-updates)

Regulatory and App Store:
[FDA General Wellness guidance 2026](https://www.troutman.com/insights/fdas-2026-guidance-on-general-wellness-devices-policy-for-low-risk-devices/) ·
[MDCG 2019-11](https://health.ec.europa.eu/system/files/2020-09/md_mdcg_2019_11_guidance_en_0.pdf) ·
[MDCG 2019-11 Rev.1](https://www.emergobyul.com/news/european-revision-primary-software-guidance-mdcg-2019-11-revision-1-small-changes-meaningful) ·
[AI Act Article 50](https://artificialintelligenceact.eu/transparency-rules-article-50/) ·
[App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) ·
[Apple: regulated medical device status in EEA, UK, US](https://developer.apple.com/news/?id=nyqbfz1y) ·
[App Store medical device disclosure policy](https://9to5mac.com/2026/03/26/new-app-store-policy-requires-medical-device-disclosures-for-some-health-apps/)

Quality and evaluation:
[AI vs dietitian responses, Feb 2026](https://mhealth.amegroups.org/article/view/150096/html) ·
[LLMs on the RD exam](https://www.nature.com/articles/s41598-024-85003-w) ·
[Sports-nutrition chatbot reliability](https://pubmed.ncbi.nlm.nih.gov/40512755/)

Market and distribution:
[LIFEMED Academy](https://lifemedacademy.ru/) ·
[App Intents / Spotlight discovery](https://www.applyra.io/blog/app-intents-ios-27-indie-siri-playbook) ·
[ASO for indie developers](https://www.applyra.io/blog/complete-aso-guide-indie-developers) ·
[Mobile app CAC benchmarks 2026](https://semnexus.com/the-2026-mobile-app-cac-benchmark-report-by-vertical) ·
[ChatGPT Health EU exclusion](https://www.notebookcheck.net/ChatGPT-now-reads-health-data-just-not-in-Germany.1350736.0.html)
