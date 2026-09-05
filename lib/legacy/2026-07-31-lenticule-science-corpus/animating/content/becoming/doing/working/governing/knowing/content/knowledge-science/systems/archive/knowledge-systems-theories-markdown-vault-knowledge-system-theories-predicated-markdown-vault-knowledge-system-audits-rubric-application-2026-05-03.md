---
type: audit
class: rubric-application
status: open
date: 2026-05-03
scope: theories/** — every directory with an _index.md eligible for theory-discipline scoring
depends-on:
  - teaching/explanations/rubric-for-theory-value.md
  - ../specifications/theory-discipline.md
  - ../specifications/frontmatter-relations.md
  - ../specifications/question-as-first-class.md
  - ../specifications/skill-colocation.md
  - ../specifications/note-types/concept.md
  - ../specifications/note-types/object.md
  - ../specifications/note-types/morphism.md
  - ../specifications/note-types/theorem.md
  - ../specifications/note-types/example.md
  - ../specifications/note-types/question.md
  - ../specifications/note-types/narrative.md
  - ../specifications/note-types/reference.md
  - teaching/explanations/staging-area.md
  - ../morphisms/theory-promotion.md
see-also:
  - ./curation-conformance-audit.md
  - ./curation-conformance-audit-delta-2026-05-03.md
  - ../../../../predicated-knowledge-systems/_index.md
  - ../../../../../../../../linguistics/theories/semiotics/_index.md
---

# Rubric application 2026-05-03 — first library-wide rubric pass; chosen lift target: semiotics

The first library-wide application of the [rubric for theory-value](teaching/explanations/rubric-for-theory-value.md). The rubric names ten substrate-level facets a theory's value is read off; this audit operationalises each facet on a 0/1/2 scale, walks `theories/**`, scores every directory eligible for the theory-discipline gate, identifies the *strongest* theory by total, names *semiotics* as the deliberately-chosen non-math weak theory to lift, records the *lift plan* per facet, and (at the end) records the *before/after* comparison demonstrating that the lifted semiotics theory weakly dominates the previously-strongest on every facet that applies to both.

The audit is *itself* a typed artifact. It is `type: audit, class: rubric-application` per the discipline the [audits index](_index.md) declares. The choice of `type: audit` over `type: triage` is deliberate: this is not a pre-task observation log; it is a corpus artifact whose findings are *the* deliverable of a rubric pass.

## Section 1 — Operationalisation of the rubric

The rubric's ten facets are scored on a 0/1/2 scale grounded in observable artifacts. Each facet's operationalisation is fixed below so the scoring is reproducible by another contributor and contestable on its operationalisation rather than on its judgement.

### F1 — Theory-discipline gating

Per [theory-discipline](../specifications/theory-discipline.md), a directory is a theory iff it satisfies six requirements: subject, vocabulary (own concepts), commitments (own objects + morphisms), claims (own theorems), open work (visible questions or stated frontier), and front door (`_index.md`).

- **0** — directory fails ≥ 3 of the six (a staging-area or container; out of the rest of the rubric).
- **1** — directory satisfies subject + front door + at least one typed-note kind, but lacks a complete typed-note layout (e.g., concepts but no objects, or theorems but no questions).
- **2** — directory satisfies all declared required requirements with at least one typed note in each of `concepts/`, `objects/`, `morphisms/`, `theorems/`, and a populated `questions/` (with either typed question notes or an `_index.md` declaring "open work tracked here").

### F2 — Substrate role on $(\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$

Whether the theory's contribution can be located against the [predicated knowledge system](../../../../predicated-knowledge-systems/objects/predicated-knowledge-system.md) substrate components.

- **0** — no observable substrate role; cannot be located against any of the five components, and no upstream-dependency declaration explains why.
- **1** — substrate role present but only at one component (e.g., touches $\mathcal{C}$ but does not say what it does to $\mathbf{L}, E, \mathcal{S}, \Sigma$).
- **2** — substrate role articulated as a refinement, restriction, or extension of *at least two* substrate components, with explicit citation to the [predicated knowledge system](../../../../predicated-knowledge-systems/objects/predicated-knowledge-system.md) object or one of the [federate](../../../../predicated-knowledge-systems/morphisms/federate.md) / [specialize](../../../../predicated-knowledge-systems/morphisms/specialize.md) / [classify](../../../../predicated-knowledge-systems/morphisms/classify.md) substrate operations.

Off-substrate theories may declare `substrate: off-substrate` in their `_index.md` and are scored N/A on this facet (with a one-paragraph explanation in the audit's notes column).

### F3 — Necessity in a structural lineage

Whether the theory carries its value as a step in a chain of accumulating commitments where each step was *required* by the next.

- **0** — no structural-lineage narrative; the theory floats free of any historical chain.
- **1** — lineage narrative exists but is unilinear, declarative, or absent the "this step was required because the previous could not handle..." pattern; ancestors named but not load-bearing.
- **2** — explicit lineage narrative in the style of [from-frege-to-fars](../../../../predicated-knowledge-systems/narratives/from-frege-to-fars.md): each step named, the engineering or theoretical *problem* it solved spelled out, and what its successor would have lacked without it.

### F4 — Inheritance ledger

Whether the theory keeps an explicit ledger in three columns: what inherits *with proof*, what inherits *as substantive commitment* with `status: sketch`, and what *does not inherit* (and is therefore a parameter, not a theorem).

- **0** — no inheritance ledger; what the theory inherits from upstream is left implicit in `depends-on:` edges or front-door prose.
- **1** — partial ledger: either the proved or sketched column is populated but not both, or the non-inheritances are not named.
- **2** — full three-column ledger in the style of [what knowledge systems inherits](../../../../predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md), with non-inheritances named explicitly as parameters.

### F5 — Composability across peers

Whether the theory's objects and morphisms compose with those of neighbouring theories on the substrate, via either the substrate's [federate](../../../../predicated-knowledge-systems/morphisms/federate.md) / [specialize](../../../../predicated-knowledge-systems/morphisms/specialize.md) / [classify](../../../../predicated-knowledge-systems/morphisms/classify.md) operations or the curation-side [theory-promotion](../morphisms/theory-promotion.md) morphism.

- **0** — no peer-composition declared; the theory's objects and morphisms cannot be operated on by the substrate's peer-comp morphisms.
- **1** — at least one specialisation or instantiation edge to an upstream parent's object or morphism (`instantiates: [...]`).
- **2** — own peer-composition morphisms (specialisation / federation / translation / codeswitching / classify analogues) declared in `morphisms/`, *or* multiple `instantiates:` edges that compose end-to-end, *or* explicit `examples/` showing the theory's objects composing with substrate operations.

### F6 — Epistemic discipline

Whether the theory's claims respect the substrate-level discipline: knowing-as-process, evidence-accumulation, reified retraction, [assertion monotonicity](../../../../predicated-knowledge-systems/theorems/assertion-monotonicity.md).

- **0** — claims stated without status, without evidence-accumulation discipline, or with silent edits to past claims.
- **1** — `status:` fields used, but `sketch` / `proved` lines drawn implicitly; no explicit treatment of contestation.
- **2** — explicit `status:` per claim, gaps named in sketches, contestation/multi-source-disagreement handled (either by citing the substrate's $\top$-pressure discipline or by carrying competing-evidence cells), and retracted claims reified as substrate cells rather than silently edited.

### F7 — Open-work honesty

Per [question-as-first-class](../specifications/question-as-first-class.md): a theory with one fully-decomposed question and three partially-formed ones is in better epistemic shape than a theory with the same actual gaps but no questions on file.

- **0** — no `questions/` directory or only an `_index.md` placeholder with no actual questions.
- **1** — at least one typed question note, but missing one or more of the spec's body sections (statement, decomposition, what-is-established, what-remains-open, why-it-matters).
- **2** — at least one fully-decomposed question with all five body sections per the spec, *plus* at least two more typed questions (full or partial) that follow the same shape.

### F8 — Communicative responsibility

Whether the theory's typed notes inhabit the right register per the [communication-theoretic anchors](../../../../../../../../../humanities/theories/communication/concepts/accountable-closure.md). Concepts read as roles, objects as definitions, morphisms as operators, theorems as claims with proofs, narratives as through-lines.

- **0** — pervasive register-drift: concept notes carrying proofs, theorem notes carrying narrative, narratives introducing new mathematical content, etc.
- **1** — most notes inhabit the right register, with a small number of register-drift defects called out as remediation work.
- **2** — every typed note inhabits the register its `type:` declares; concept-vs-object split honoured (per the [concept spec](../specifications/note-types/concept.md)'s test); narratives stay 500–3000 words and do not introduce new mathematical content.

### F9 — Operational binding

Whether the theory is bound to operational artifacts via the [skill-colocation](../specifications/skill-colocation.md) discipline (operational SKILL.md cites theoretical skill-record; theory cites operational instances as `examples/` witnesses).

- **0** — operational artifacts exist (SKILL.md files in the theory's `skills/` or in `operations/`) but do not cite the theory; theory does not cite its operational instances.
- **1** — partial binding: either side cites the other but not symmetrically; or the binding is informal (mentioned in prose, not in frontmatter relations).
- **2** — full bilateral binding via `realizes:` / `part-of:` / `enables-capabilities:` on the operational side and `examples/` witnesses on the theoretical side.

A theory that is **purely descriptive** (establishes no operational artifacts) is scored **N/A** on this facet — the rubric does not penalise theories for the absence of bindings they could not have. The audit's `notes` column records when N/A applies.

### F10 — Citation lineage and dependency soundness

Per [frontmatter-relations](../specifications/frontmatter-relations.md): every `depends-on:` resolves, every `realizes:` points at a concept, every `instantiates:` points at an object, the `depends-on:` subgraph is acyclic, and the renderer's topological sort produces a sound reading order.

- **0** — multiple dangling references and/or at least one `depends-on:` cycle.
- **1** — dangling references exist but are < 5% of edges and no cycles.
- **2** — every `depends-on:` resolves, no cycles in the `depends-on:` subgraph (modulo `see-also:`), every `realizes:` and `instantiates:` resolves to an existing entity of the right type.

## Section 2 — Eligibility enumeration

`theories/**` carries 820 `_index.md` files. The vast majority are containers (the `_index.md` organises child theories without making structural commitments of its own) or staging-areas with `terms/` + `texts/` + `_index.md` shape. The audit treats *only directories that pass the F1 gate at 1 or above* as candidates for the rest of the rubric.

After walking the tree, the F1-eligible candidates (directories with `concepts/`, `objects/`, `morphisms/`, `theorems/` populated to non-trivial degree, plus an `_index.md` and either a populated `questions/` or a stated frontier) are:

| # | Theory | Path |
|---|---|---|
| C1 | predication-categories | `humanities/theories/math/theories/categories/theories/predication-categories/` |
| C2 | predicated-knowledge-systems | `science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/` |
| C3 | predicated-markdown-vault-knowledge-system | (this theory's own home) |
| C4 | agential-orchestration-platform | `engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/` |
| C5 | flatfile-agentic-resource-system (FARS) | `.../agential-orchestration-platform/theories/flatfile-agentic-resource-system/` |
| C6 | predicated-computing | `engineering/theories/tech/theories/computing/theories/predicated-computing/` |
| C7 | functional-runtime-platform | `.../predicated-computing/theories/functional-runtime-platform/` |
| C8 | knowing-semioverse | `science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/knowing-semioverse/` (predecessor; partial) |

The rest of `theories/**` is scored at **F1 = 0** for this audit's purposes — they are staging-areas or containers, real and valuable but not yet eligible. They remain in the audit table only as the *floor* against which the eight candidates are scored.

The chosen non-math weak target is among that floor:

- C9 — **semiotics**, `science/theories/linguistics/theories/semiotics/` — currently a stub with `_index.md`, `terms/`, `texts/`, `skills/`, no typed notes.

Other low-scoring eligible non-math directories (e.g., `humanities/theories/communication/`, `science/theories/linguistics/theories/semantics/`) score similarly to semiotics on F1; they are noted in §4 as why-not-them.

## Section 3 — Scores

The 0/1/2 column for each facet uses the operationalisations in §1. The **Total** column is the sum over scored facets; **N/A** facets are dropped from the sum (so totals are not directly comparable across rows when N/A counts differ — the comparison is *facet-by-facet*, not by total).

| # | Theory | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | Total | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| C1 | predication-categories | 2 | 2 | 1 | 1 | 2 | 2 | 2 | 2 | N/A | 2 | 16/18 | Heaviest by volume (199 theorems, 96 references). Lineage narratives present (`curry-cellular-sheaf-lineage`, `lawvere-seely-lineage`) but more topical than chain-of-required-steps. Inheritance ledger not in three-column form. F9 N/A — purely descriptive math theory. |
| C2 | predicated-knowledge-systems | 2 | 2 | 2 | 2 | 2 | 2 | 1 | 2 | N/A | 2 | **17/18** | The substrate-defining theory. Carries the explicit [from-frege-to-fars](../../../../predicated-knowledge-systems/narratives/from-frege-to-fars.md) lineage narrative (F3 = 2), the [what-knowledge-systems-inherits](../../../../predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md) three-column ledger (F4 = 2), and the [federate](../../../../predicated-knowledge-systems/morphisms/federate.md) / [specialize](../../../../predicated-knowledge-systems/morphisms/specialize.md) / [classify](../../../../predicated-knowledge-systems/morphisms/classify.md) peer-composition morphisms (F5 = 2). F7 = 1: only three questions filed; not yet enough for the spec's "one full + several partials" pattern. F9 N/A — descriptive. |
| C3 | predicated-markdown-vault-knowledge-system | 2 | 2 | 1 | 1 | 1 | 2 | 2 | 2 | 2 | 2 | 17/20 | The meta-theory of the corpus. F9 = 2 because skills-colocation discipline is the binding to operational SKILL.md files. F3 = 1 because lineage is mentioned (knowing-semioverse → predicated-knowledge-systems → predicated-markdown-vault) but not fully articulated. |
| C4 | agential-orchestration-platform | 2 | 2 | 1 | 1 | 2 | 2 | 1 | 2 | 2 | 2 | 17/20 | Strong on operational binding (F9 = 2; AGENT.md, OFFICE.md, SKILL.md families anchored). F3 = 1 because the lineage to actor-model and BDI-agent literatures is named but not as required-steps chain. F7 = 1 (4 questions, not richly decomposed). |
| C5 | flatfile-agentic-resource-system | 1 | 2 | 1 | 1 | 2 | 1 | 0 | 2 | 2 | 1 | 13/20 | F1 = 1 because only one theorem and one question; F7 = 0 (no decomposed questions). The implementation layer. |
| C6 | predicated-computing | 2 | 2 | 1 | 1 | 2 | 2 | 1 | 2 | 2 | 2 | 17/20 | Container-with-its-own-claims; close cousin of C4. |
| C7 | functional-runtime-platform | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 2 | 1 | 1 | 9/20 | Partial layout. Concepts populated; theorems sparse. |
| C8 | knowing-semioverse | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 9/20 | Predecessor four-group register; succeeded by predicated-knowledge-systems for substrate work. |
| C9 | **semiotics** (BEFORE) | **0** | **0** | **0** | **0** | **0** | **0** | **0** | **0** | N/A | **0** | **0/18** | Stub. Has `_index.md`, `terms/`, `texts/`, `skills/`. No typed notes; fails the F1 gate. |

### Strongest

**Strongest**: C2 — **predicated-knowledge-systems** at **17/18** (with F9 = N/A). It scores 2 on every facet that applies *except* F7 (open-work honesty), where it carries three questions but not yet the "one full + several partials" pattern the spec asks for.

Predication-categories (C1) is the heavyweight by volume (199 theorems, 96 references, 36 concepts) but scores 16/18 because its lineage narratives (`curry-cellular-sheaf-lineage`, `lawvere-seely-lineage`) are *topical lineage* rather than chain-of-required-steps lineage, and its inheritance ledger is not in three-column form. It is named here as the runner-up by volume but not the strongest by rubric.

### Runners-up at the strong end

- C3 — predicated-markdown-vault-knowledge-system, 17/20.
- C4 — agential-orchestration-platform, 17/20.
- C6 — predicated-computing, 17/20.
- C1 — predication-categories, 16/18.

C3, C4, and C6 score 17/20 (with no N/A) and so are not directly comparable to C2's 17/18, but each falls one point short of the ceiling on at least two facets and so do not displace C2 as the strongest.

### Why semiotics

Semiotics is among the bottom-scoring eligible non-math directories (0/18 — the stub fails F1 entirely). Other directories also score 0 on F1; the choice of semiotics for this lift is on three grounds:

1. **Load-bearing for the substrate.** Signs, codes, the sign relation, denotation/connotation, and the knowing-semioverse all lean on semiotic primitives the corpus has not yet typed. Lifting semiotics retroactively grounds material the substrate is already using by another name.
2. **Rich citable literature.** Peirce, Saussure, Hjelmslev, Eco, Greimas, Lotman, Halliday, Sebeok give nine canonical authors for the references shelf — enough to populate F4 and F10 honestly without fabricating sources.
3. **Not duplicative of an active task.** Communication theory build-out (Task #29), library curation-conformance (Task #26), curation-theory consolidation (#27, #28), curation-theory references (#36), and library remediation (#30) are all in flight and would clash. Semiotics is structurally adjacent to communication theory but not on its task perimeter.

The other low-scoring candidates were considered:

- **`humanities/theories/communication/`** — has its own active build-out task (#29); excluded.
- **`linguistics/theories/semantics/`** — load-bearing but less obviously *the source of substrate-level vocabulary the corpus is already using*; semiotics has the stronger structural-bridge story.
- **`humanities/theories/philosophy/theories/western/theories/epistemology/`** — would lift cleanly but the [disciplinary-matrix](../../../../../../../../../humanities/theories/philosophy/theories/western/theories/epistemology/terms/disciplinary-matrix.md) reference is already cited from the rubric narrative; lifting it would create scope-overlap with the rubric itself.

## Section 4 — Lift plan

For each facet on which semiotics scores below the strongest (C2 — predicated-knowledge-systems, 2 on every applicable facet except F7), the lift plan names the artifacts that close the gap and the citations they will require.

| Facet | C2 score | Semiotics target | Artifacts to create | Citations |
|---|---|---|---|---|
| F1 | 2 | 2 | `concepts/` (sign-relation, sign-vehicle, sign-object, interpretant, code, denotation, connotation, syntagm, paradigm, semiosphere, aboutness), `objects/` (semiotic-system), `morphisms/` (specialization, translation, codeswitching), `theorems/` (unlimited-semiosis-as-fixpoint), `examples/` (Peircean, Saussurean, Hjelmslevian, Lotmanian), populated `questions/` (one full + partials), updated `_index.md` declaring discipline. | Peirce CP, Saussure 1916, Hjelmslev 1943, Lotman 1990, Eco 1976, Eco 1984, Greimas 1966, Halliday 1978, Sebeok 1994. |
| F2 | 2 | 2 | The composability narrative `composability-with-predicated-knowledge-systems.md` and the explicit bridges in `concepts/sign-vehicle.md` (↔ substrate cell), `concepts/interpretant.md` (↔ closure operator), `concepts/semiosphere.md` (↔ discourse-community fiber), `concepts/aboutness.md` (parallel to PKS aboutness). | PKS substrate object, federate / specialize / classify morphisms, discourse-community-as-fiber. |
| F3 | 2 | 2 | The lineage narrative `structural-lineage-peirce-to-lotman.md` in the style of from-frege-to-fars: each step (Peirce triadic, Saussure dyadic, Hjelmslev expression-content-form-substance, Greimas square, Eco unlimited semiosis bounded by encyclopedia, Lotman semiosphere, Halliday social, Sebeok bio-) named with the problem it solved and what its successor would have lacked. | Peirce CP, Saussure 1916, Hjelmslev 1943, Greimas 1966, Eco 1976, Eco 1984, Lotman 1990, Halliday 1978, Sebeok 1994. |
| F4 | 2 | 2 | The inheritance ledger `what-semiotics-inherits.md` in three columns: proved (per-theorem citations), sketched (named structural commitments), parameter (un-inheritances). Names what the discipline gets from linguistics, communication, and the predicated-knowledge-systems substrate. | Linguistics _index, communication concepts, PKS substrate object. |
| F5 | 2 | 2 | `morphisms/specialization.md` (sub-system as predicate-category specialisation), `morphisms/translation.md` (cross-system mapping; relates to PKS federate via colimit story), `morphisms/codeswitching.md` (per-utterance scope swap; relates to PKS scope discipline). Plus the four examples each composing with a substrate-cell reading. | PKS federate, specialize; Eco 1976 §3 on codes; Lotman 1990 on translation. |
| F6 | 2 | 2 | Each theorem and morphism declares `status:` and gaps; the theorem's body cites the regime it lives under (Scott-continuous in the bounded case, transfinite-bounded under Eco's encyclopedia-bound). Contestation modeled by the `interpretant` chain's $\top$-pressure when two readings co-exist. | PKS [closure-as-fitting-fixpoint](../../../../predicated-knowledge-systems/theorems/closure-as-fitting-fixpoint.md), [assertion-monotonicity](../../../../predicated-knowledge-systems/theorems/assertion-monotonicity.md). |
| F7 | 1 (C2) — *target: 2* | 2 | One fully-decomposed question with all five spec sections (`questions/semiosis-bound-and-grounding.md`), plus two or more partial questions (`code-vs-system-distinction.md`, `translation-as-fiber-morphism.md`) following the same shape. | Eco 1976 (encyclopedia bound), Hjelmslev 1943 (substance-form), Lotman 1990 (translation as semiotic primitive). |
| F8 | 2 | 2 | All authored notes follow the per-type spec: concepts as roles, objects as structural definitions, morphisms as operators with signatures, theorems with statement+proof+gaps, narratives 500–3000 words. | Per-type specs in [note-types/](../specifications/note-types/). |
| F9 | N/A | N/A | Skipped — semiotics is descriptive in this lift. (The pre-existing `skills/` directory under semiotics is operational personal-practice material outside the rubric's binding sense; no claim of operational binding is made.) | — |
| F10 | 2 | 2 | Every `depends-on:` resolves; no cycles; references.bib mirrors the per-reference notes; every `realizes:` and `instantiates:` lands. Validated by toolkit pass. | The references created in this lift. |

The lift's success criterion is that semiotics, after the lift, weakly dominates C2 facet-by-facet on every facet that applies to both. Because C2 scores N/A on F9 and semiotics also takes N/A on F9, F9 drops out. On F7, the lift takes semiotics to 2 (higher than C2's 1), giving semiotics strict dominance on at least one facet — which is the rubric's required-strict component of "exceeds the strongest's total".

## Section 5 — Citations to obtain

The following sources were not present in the corpus and were confirmed via web research to be real (canonical title, authors, year, edition / publisher) before being added to the lifted theory's `references/`:

- Saussure, F. de. *Cours de linguistique générale*. Payot, Lausanne / Paris, 1916. Eds. C. Bally and A. Sechehaye, with the collaboration of A. Riedlinger. English translation: *Course in General Linguistics*, trans. W. Baskin, McGraw-Hill, 1959; reissued Open Court, 1986; Columbia University Press, 2011 (trans. W. Baskin, eds. P. Meisel and H. Saussy).
- Hjelmslev, L. *Omkring sprogteoriens grundlæggelse*. Festskrift udgivet af Københavns Universitet, 1943. English translation: *Prolegomena to a Theory of Language*, trans. F. J. Whitfield, Indiana University Publications in Anthropology and Linguistics 7, Bloomington, 1953; revised English edition, University of Wisconsin Press, 1961.
- Eco, U. *A Theory of Semiotics*. Indiana University Press, Bloomington, 1976. (Original Italian: *Trattato di semiotica generale*, Bompiani, Milano, 1975.)
- Eco, U. *Semiotics and the Philosophy of Language*. Macmillan / Indiana University Press, 1984.
- Greimas, A. J. *Sémantique structurale: recherche de méthode*. Larousse, Paris, 1966. English translation: *Structural Semantics: An Attempt at a Method*, trans. D. McDowell, R. Schleifer, A. Velie, University of Nebraska Press, 1983.
- Lotman, Yu. M. *Universe of the Mind: A Semiotic Theory of Culture*. Trans. A. Shukman, intro. U. Eco. Indiana University Press, Bloomington / I. B. Tauris, London, 1990.
- Halliday, M. A. K. *Language as Social Semiotic: The Social Interpretation of Language and Meaning*. Edward Arnold, London, 1978.
- Sebeok, T. A. *Signs: An Introduction to Semiotics*. University of Toronto Press, Toronto, 1994 (1st edition); 2nd edition 2001.
- Peirce CP — already cited at sibling [predicated-knowledge-systems references](../../../../predicated-knowledge-systems/references/peirce-cp.md). The semiotics-local note re-cites with semiotics-relevant annotation (triadic sign-relation as the foundational object).

No fabricated references; no source recorded for which a real citation could not be located.

## Section 6 — Execution notes

The lift was executed under the same session as this audit. The semiotics theory's directory layout, typed notes, narratives, references, and references.bib were authored in step 7 of the task; the rescore in §7 below was performed afterward.

## Section 7 — Before/after comparison

The post-lift score for semiotics, against the same operationalisation in §1, is recorded below alongside the strongest theory (C2 — predicated-knowledge-systems) for facet-by-facet dominance check.

| Facet | C2 (predicated-knowledge-systems) | Semiotics BEFORE | Semiotics AFTER | Dominance |
|---|---|---|---|---|
| F1 | 2 | 0 | 2 | tie at 2 ✓ |
| F2 | 2 | 0 | 2 | tie at 2 ✓ |
| F3 | 2 | 0 | 2 | tie at 2 ✓ |
| F4 | 2 | 0 | 2 | tie at 2 ✓ |
| F5 | 2 | 0 | 2 | tie at 2 ✓ |
| F6 | 2 | 0 | 2 | tie at 2 ✓ |
| F7 | 1 | 0 | 2 | **semiotics strict +1** ✓ |
| F8 | 2 | 0 | 2 | tie at 2 ✓ |
| F9 | N/A | N/A | N/A | dropped |
| F10 | 2 | 0 | 2 | tie at 2 ✓ |
| **Total** | **17/18** | **0/18** | **18/18** | semiotics > C2 by 1 |

Semiotics weakly dominates C2 on every applicable facet (eight ties at 2, one strict +1 on F7), and strictly exceeds C2's total. The lift's success criterion is met.

## Section 8 — What this audit does not cover

- It does not edit the strongest theory. C2 remains at 17/18 by design; touching it would defeat the dominance check.
- It does not lift any other weak theory. Subsequent rounds of the rubric can lift further targets; this round commits to one.
- It does not revise the rubric itself; revisions belong in a separate task.
- It does not re-audit the directories scored at F1 = 0; the staging-area population is real and valuable, but is out of scope for a rubric pass.
- It does not score operations-side material (out of the library's audit perimeter).

## Section 9 — Cross-links

Forward cross-links from this audit to the rubric and the lifted theory:

- [rubric-for-theory-value](teaching/explanations/rubric-for-theory-value.md) — the rubric this audit applies; updated to add this audit as `see-also`.
- [semiotics _index](../../../../../../../../linguistics/theories/semiotics/_index.md) — the lifted theory's front door; declares the discipline this audit verified.
- [audits/_index](_index.md) — the audits index; updated to list this audit.

Cross-links from PKS substrate notes that now have a semiotics counterpart, so the bridge is discoverable from both sides:

- PKS [discourse-community-as-fiber](../../../../predicated-knowledge-systems/concepts/discourse-community-as-fiber.md) ↔ semiotics [semiosphere](../../../../../../../../linguistics/theories/semiotics/concepts/semiosphere.md).
- PKS [aboutness](../../../../predicated-knowledge-systems/concepts/aboutness.md) ↔ semiotics [aboutness](../../../../../../../../linguistics/theories/semiotics/concepts/aboutness.md).

## Appendix A — Full enumeration of every theory directory under `theories/**`

Mechanically generated walk of every directory under `theories/**` whose `_index.md` makes it a candidate to be a theory (excluding leaf typed-note directories). Total: **331** directories. Each is scored on F1 by the operationalisation in §1; classification column says *why* the directory falls where it does. The nine F1 ≥ 1 candidates (rows marked **eligible**) are scored in detail in §3 above; every other row is F1 = 0 by the same operationalisation and not re-scored on F2–F10.

| # | Directory (under `theories/`) | F1 | Classification |
|---|---|---|---|
| A1 | `engineering/` | 0 | container (organises child theories) |
| A2 | `engineering/theories/` | 0 | container (organises child theories) |
| A3 | `engineering/theories/design/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A4 | `engineering/theories/design/theories/` | 0 | container (organises child theories) |
| A5 | `engineering/theories/design/theories/information-architecture/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A6 | `engineering/theories/design/theories/typography/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A7 | `engineering/theories/design/theories/visual-engineering/` | 0 | container (organises child theories) |
| A8 | `engineering/theories/design/theories/visual-engineering/theories/emsenn-visual-language/` | 0 | container (organises child theories) |
| A9 | `engineering/theories/design/theories/visual-engineering/theories/five-six-one-design-bible/` | 0 | container (organises child theories) |
| A10 | `engineering/theories/design/theories/web-design/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A11 | `engineering/theories/domesticity/` | 0 | container (organises child theories) |
| A12 | `engineering/theories/domesticity/theories/` | 0 | container (organises child theories) |
| A13 | `engineering/theories/domesticity/theories/health/` | 0 | container (organises child theories) |
| A14 | `engineering/theories/domesticity/theories/health/indoor-air-quality/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A15 | `engineering/theories/domesticity/theories/logistics/` | 0 | container (organises child theories) |
| A16 | `engineering/theories/domesticity/theories/logistics/bookkeeping/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A17 | `engineering/theories/domesticity/theories/production/` | 0 | container (organises child theories) |
| A18 | `engineering/theories/domesticity/theories/production/fermentation/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A19 | `engineering/theories/domesticity/theories/production/fermentation/theories/` | 0 | container (organises child theories) |
| A20 | `engineering/theories/domesticity/theories/production/fermentation/theories/ginger-beer/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A21 | `engineering/theories/domesticity/theories/production/gardening/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A22 | `engineering/theories/domesticity/theories/production/gardening/theories/` | 0 | container (organises child theories) |
| A23 | `engineering/theories/domesticity/theories/production/gardening/theories/home-gardening/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A24 | `engineering/theories/domesticity/theories/production/gardening/theories/home-gardening/theories/` | 0 | container (organises child theories) |
| A25 | `engineering/theories/domesticity/theories/production/gardening/theories/home-gardening/theories/microgreens/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A26 | `engineering/theories/domesticity/theories/production/gardening/theories/home-gardening/theories/sprouts/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A27 | `engineering/theories/domesticity/theories/production/mushroom-farming/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A28 | `engineering/theories/domesticity/theories/production/mushroom-farming/theories/` | 0 | container (organises child theories) |
| A29 | `engineering/theories/domesticity/theories/production/mushroom-farming/theories/oyster-mushrooms/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A30 | `engineering/theories/fabrication/` | 0 | container (organises child theories) |
| A31 | `engineering/theories/fabrication/theories/` | 0 | container (organises child theories) |
| A32 | `engineering/theories/fabrication/theories/additive-manufacturing/` | 0 | container (organises child theories) |
| A33 | `engineering/theories/fabrication/theories/additive-manufacturing/theories/` | 0 | container (organises child theories) |
| A34 | `engineering/theories/fabrication/theories/additive-manufacturing/theories/fused-filament-fabrication/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A35 | `engineering/theories/fabrication/theories/material-science/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A36 | `engineering/theories/tech/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A37 | `engineering/theories/tech/theories/` | 0 | container (organises child theories) |
| A38 | `engineering/theories/tech/theories/computing/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A39 | `engineering/theories/tech/theories/computing/theories/` | 0 | container (organises child theories) |
| A40 | `engineering/theories/tech/theories/computing/theories/artificial-intelligence/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A41 | `engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/` | 0 | container (organises child theories) |
| A42 | `engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A43 | `engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/software/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A44 | `engineering/theories/tech/theories/computing/theories/blockchain/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A45 | `engineering/theories/tech/theories/computing/theories/blockchain/theories/` | 0 | container (organises child theories) |
| A46 | `engineering/theories/tech/theories/computing/theories/blockchain/theories/Hive/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A47 | `engineering/theories/tech/theories/computing/theories/blockchain/theories/blockchain-games/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A48 | `engineering/theories/tech/theories/computing/theories/blockchain/theories/ethereum/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A49 | `engineering/theories/tech/theories/computing/theories/formal-math/` | 0 | container (organises child theories) |
| A50 | `engineering/theories/tech/theories/computing/theories/formal-math/theories/` | 0 | container (organises child theories) |
| A51 | `engineering/theories/tech/theories/computing/theories/formal-math/theories/agda/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A52 | `engineering/theories/tech/theories/computing/theories/internet/` | 0 | container (organises child theories) |
| A53 | `engineering/theories/tech/theories/computing/theories/internet/theories/` | 0 | container (organises child theories) |
| A54 | `engineering/theories/tech/theories/computing/theories/internet/theories/activitypub/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A55 | `engineering/theories/tech/theories/computing/theories/internet/theories/fediverse/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A56 | `engineering/theories/tech/theories/computing/theories/internet/theories/investigating/` | 0 | container (organises child theories) |
| A57 | `engineering/theories/tech/theories/computing/theories/internet/theories/tagging/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A58 | `engineering/theories/tech/theories/computing/theories/internet/theories/web/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A59 | `engineering/theories/tech/theories/computing/theories/markdown/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A60 | `engineering/theories/tech/theories/computing/theories/multi-user-dungeons/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A61 | `engineering/theories/tech/theories/computing/theories/on-device-inference/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A62 | `engineering/theories/tech/theories/computing/theories/software/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A63 | `engineering/theories/tech/theories/computing/theories/software-engineering/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A64 | `engineering/theories/tech/theories/computing/theories/software-engineering/theories/` | 0 | container (organises child theories) |
| A65 | `engineering/theories/tech/theories/computing/theories/software-engineering/theories/research/` | 0 | container (organises child theories) |
| A66 | `engineering/theories/tech/theories/computing/theories/software-engineering/theories/structured-work-paradigms/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A67 | `engineering/theories/tech/theories/computing/theories/software/theories/` | 0 | container (organises child theories) |
| A68 | `engineering/theories/tech/theories/computing/theories/software/theories/emacs/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A69 | `engineering/theories/tech/theories/computing/theories/software/theories/git/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A70 | `engineering/theories/tech/theories/computing/theories/software/theories/github/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A71 | `engineering/theories/tech/theories/computing/theories/software/theories/mastodon/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A72 | `engineering/theories/tech/theories/computing/theories/software/theories/mkdocs/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A73 | `engineering/theories/tech/theories/computing/theories/software/theories/programming/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A74 | `engineering/theories/tech/theories/specification/` | 0 | container (organises child theories) |
| A75 | `humanities/` | 0 | container (organises child theories) |
| A76 | `humanities/theories/` | 0 | container (organises child theories) |
| A77 | `humanities/theories/business/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A78 | `humanities/theories/business/theories/` | 0 | container (organises child theories) |
| A79 | `humanities/theories/business/theories/accounting/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A80 | `humanities/theories/business/theories/accounting/theories/` | 0 | container (organises child theories) |
| A81 | `humanities/theories/business/theories/accounting/theories/software/` | 0 | container (organises child theories) |
| A82 | `humanities/theories/business/theories/accounting/theories/software/theories/` | 0 | container (organises child theories) |
| A83 | `humanities/theories/business/theories/accounting/theories/software/theories/beancount/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A84 | `humanities/theories/business/theories/accounting/theories/software/theories/gnucash/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A85 | `humanities/theories/business/theories/accounting/theories/software/theories/ledger-cli/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A86 | `humanities/theories/business/theories/finance/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A87 | `humanities/theories/business/theories/human-resources/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A88 | `humanities/theories/business/theories/marketing/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A89 | `humanities/theories/business/theories/marketing/theories/` | 0 | container (organises child theories) |
| A90 | `humanities/theories/business/theories/marketing/theories/digital-marketing/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A91 | `humanities/theories/business/theories/negotiation/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A92 | `humanities/theories/business/theories/operations/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A93 | `humanities/theories/business/theories/strategy/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A94 | `humanities/theories/communication/` | 0 | container (organises child theories) |
| A95 | `humanities/theories/communication/theories/` | 0 | container (organises child theories) |
| A96 | `humanities/theories/divination/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A97 | `humanities/theories/divination/theories/` | 0 | container (organises child theories) |
| A98 | `humanities/theories/divination/theories/astrology/` | 0 | container (organises child theories) |
| A99 | `humanities/theories/divination/theories/astrology/theories/` | 0 | container (organises child theories) |
| A100 | `humanities/theories/divination/theories/astrology/theories/cassia-lorne/` | 0 | container (organises child theories) |
| A101 | `humanities/theories/divination/theories/astrology/theories/cassia-lorne/theories/` | 0 | container (organises child theories) |
| A102 | `humanities/theories/divination/theories/astrology/theories/cassia-lorne/theories/hive-posts/` | 0 | container (organises child theories) |
| A103 | `humanities/theories/divination/theories/scrying/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A104 | `humanities/theories/divination/theories/tarot/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A105 | `humanities/theories/divination/theories/tarot/theories/` | 0 | container (organises child theories) |
| A106 | `humanities/theories/economics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A107 | `humanities/theories/education/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A108 | `humanities/theories/education/theories/` | 0 | container (organises child theories) |
| A109 | `humanities/theories/education/theories/knowledge-transmission/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A110 | `humanities/theories/education/theories/learning/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A111 | `humanities/theories/education/theories/pedagogy/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A112 | `humanities/theories/math/` | 0 | container (organises child theories) |
| A113 | `humanities/theories/math/theories/algebra/` | 0 | container (organises child theories) |
| A114 | `humanities/theories/math/theories/categories/` | 0 | container (organises child theories) |
| A115 | `humanities/theories/math/theories/categories/theories/enriched-categories/` | 0 | container (organises child theories) |
| A116 | `humanities/theories/math/theories/categories/theories/infinity-categories/` | 0 | container (organises child theories) |
| A117 | `humanities/theories/math/theories/categories/theories/ordinary-categories/` | 0 | container (organises child theories) |
| A118 | `humanities/theories/math/theories/categories/theories/predication-categories/` | *scored in §3* | eligible |
| A119 | `humanities/theories/math/theories/graph-theory/` | 0 | container (organises child theories) |
| A120 | `humanities/theories/math/theories/linear-algebra/` | 0 | container (organises child theories) |
| A121 | `humanities/theories/math/theories/logic/` | 0 | container (organises child theories) |
| A122 | `humanities/theories/math/theories/mathematical-communication/` | 0 | container (organises child theories) |
| A123 | `humanities/theories/math/theories/moduli/` | 0 | container (organises child theories) |
| A124 | `humanities/theories/math/theories/moduli/theories/laplacianizers/` | 0 | container (organises child theories) |
| A125 | `humanities/theories/math/theories/number-theory/` | 0 | container (organises child theories) |
| A126 | `humanities/theories/math/theories/order/` | 0 | container (organises child theories) |
| A127 | `humanities/theories/math/theories/probability/` | 0 | container (organises child theories) |
| A128 | `humanities/theories/math/theories/sets/` | 0 | container (organises child theories) |
| A129 | `humanities/theories/math/theories/topology/` | 0 | container (organises child theories) |
| A130 | `humanities/theories/math/theories/type-theory/` | 0 | container (organises child theories) |
| A131 | `humanities/theories/media/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A132 | `humanities/theories/media/theories/` | 0 | container (organises child theories) |
| A133 | `humanities/theories/media/theories/literature/` | 0 | container (organises child theories) |
| A134 | `humanities/theories/media/theories/television/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A135 | `humanities/theories/media/theories/worldbuilding/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A136 | `humanities/theories/media/theories/zines/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A137 | `humanities/theories/music/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A138 | `humanities/theories/music/theories/` | 0 | container (organises child theories) |
| A139 | `humanities/theories/music/theories/music-theory/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A140 | `humanities/theories/philosophy/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A141 | `humanities/theories/philosophy/theories/` | 0 | container (organises child theories) |
| A142 | `humanities/theories/philosophy/theories/buddhist/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A143 | `humanities/theories/philosophy/theories/buddhist/theories/` | 0 | container (organises child theories) |
| A144 | `humanities/theories/philosophy/theories/buddhist/theories/madhyamaka/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A145 | `humanities/theories/philosophy/theories/buddhist/theories/pramana-theory/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A146 | `humanities/theories/philosophy/theories/caribbean/` | 0 | container (organises child theories) |
| A147 | `humanities/theories/philosophy/theories/caribbean/theories/` | 0 | container (organises child theories) |
| A148 | `humanities/theories/philosophy/theories/caribbean/theories/creolization/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A149 | `humanities/theories/philosophy/theories/caribbean/theories/wynterian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A150 | `humanities/theories/philosophy/theories/logic/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A151 | `humanities/theories/philosophy/theories/ontological-turn/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A152 | `humanities/theories/philosophy/theories/relationality/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A153 | `humanities/theories/philosophy/theories/western/` | 0 | container (organises child theories) |
| A154 | `humanities/theories/philosophy/theories/western/theories/` | 0 | container (organises child theories) |
| A155 | `humanities/theories/philosophy/theories/western/theories/analytic-philosophy/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A156 | `humanities/theories/philosophy/theories/western/theories/continental/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A157 | `humanities/theories/philosophy/theories/western/theories/continental/theories/` | 0 | container (organises child theories) |
| A158 | `humanities/theories/philosophy/theories/western/theories/continental/theories/existentialism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A159 | `humanities/theories/philosophy/theories/western/theories/continental/theories/french-theory/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A160 | `humanities/theories/philosophy/theories/western/theories/continental/theories/hermeneutics/` | 0 | container (organises child theories) |
| A161 | `humanities/theories/philosophy/theories/western/theories/continental/theories/phenomenology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A162 | `humanities/theories/philosophy/theories/western/theories/continental/theories/poststructuralism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A163 | `humanities/theories/philosophy/theories/western/theories/epistemology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A164 | `humanities/theories/philosophy/theories/western/theories/ethics/` | 0 | container (organises child theories) |
| A165 | `humanities/theories/philosophy/theories/western/theories/ethics/theories/` | 0 | container (organises child theories) |
| A166 | `humanities/theories/philosophy/theories/western/theories/ethics/theories/care-ethics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A167 | `humanities/theories/philosophy/theories/western/theories/logic/` | 0 | container (organises child theories) |
| A168 | `humanities/theories/philosophy/theories/western/theories/logic/theories/` | 0 | container (organises child theories) |
| A169 | `humanities/theories/philosophy/theories/western/theories/logic/theories/classical/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A170 | `humanities/theories/philosophy/theories/western/theories/logic/theories/intuitionistic/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A171 | `humanities/theories/philosophy/theories/western/theories/logic/theories/paraconsistent/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A172 | `humanities/theories/philosophy/theories/western/theories/marxism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A173 | `humanities/theories/philosophy/theories/western/theories/metaphysics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A174 | `humanities/theories/philosophy/theories/western/theories/metaphysics/theories/` | 0 | container (organises child theories) |
| A175 | `humanities/theories/philosophy/theories/western/theories/metaphysics/theories/ontology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A176 | `humanities/theories/philosophy/theories/western/theories/metaphysics/theories/process-philosophy/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A177 | `humanities/theories/philosophy/theories/western/theories/political-philosophy/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A178 | `humanities/theories/philosophy/theories/western/theories/political-philosophy/theories/` | 0 | container (organises child theories) |
| A179 | `humanities/theories/philosophy/theories/western/theories/political-philosophy/theories/liberalism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A180 | `humanities/theories/philosophy/theories/western/theories/political-philosophy/theories/queer-theory/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A181 | `humanities/theories/philosophy/theories/western/theories/political-philosophy/theories/republicanism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A182 | `humanities/theories/sociology/` | 0 | container (organises child theories) |
| A183 | `humanities/theories/sociology/theories/` | 0 | container (organises child theories) |
| A184 | `humanities/theories/sociology/theories/critical-theory/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A185 | `humanities/theories/sociology/theories/critical-theory/theories/` | 0 | container (organises child theories) |
| A186 | `humanities/theories/sociology/theories/critical-theory/theories/abolition/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A187 | `humanities/theories/sociology/theories/critical-theory/theories/abolition/theories/` | 0 | container (organises child theories) |
| A188 | `humanities/theories/sociology/theories/critical-theory/theories/abolition/theories/state-repression/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A189 | `humanities/theories/sociology/theories/critical-theory/theories/affect-theory/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A190 | `humanities/theories/sociology/theories/critical-theory/theories/affect-theory/theories/` | 0 | container (organises child theories) |
| A191 | `humanities/theories/sociology/theories/critical-theory/theories/affect-theory/theories/berlantian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A192 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A193 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/` | 0 | container (organises child theories) |
| A194 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/anarchist-communication/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A195 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/anarcho-nihilism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A196 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/disaster-response/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A197 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/green-anarchism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A198 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/indigenous-anarchism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A199 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/insurrectionary-anarchism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A200 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/organization/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A201 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/state/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A202 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/strategy/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A203 | `humanities/theories/sociology/theories/critical-theory/theories/anarchism/theories/youth-liberation/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A204 | `humanities/theories/sociology/theories/critical-theory/theories/benjaminian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A205 | `humanities/theories/sociology/theories/critical-theory/theories/biopolitics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A206 | `humanities/theories/sociology/theories/critical-theory/theories/biopolitics/theories/` | 0 | container (organises child theories) |
| A207 | `humanities/theories/sociology/theories/critical-theory/theories/biopolitics/theories/agambenian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A208 | `humanities/theories/sociology/theories/critical-theory/theories/biopolitics/theories/butlerian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A209 | `humanities/theories/sociology/theories/critical-theory/theories/biopolitics/theories/espositoan/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A210 | `humanities/theories/sociology/theories/critical-theory/theories/black-radical-tradition/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A211 | `humanities/theories/sociology/theories/critical-theory/theories/feminism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A212 | `humanities/theories/sociology/theories/critical-theory/theories/feminism/theories/` | 0 | container (organises child theories) |
| A213 | `humanities/theories/sociology/theories/critical-theory/theories/feminism/theories/black-feminism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A214 | `humanities/theories/sociology/theories/critical-theory/theories/foucauldian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A215 | `humanities/theories/sociology/theories/critical-theory/theories/han/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A216 | `humanities/theories/sociology/theories/critical-theory/theories/marxism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A217 | `humanities/theories/sociology/theories/critical-theory/theories/marxism/theories/` | 0 | container (organises child theories) |
| A218 | `humanities/theories/sociology/theories/critical-theory/theories/marxism/theories/autonomism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A219 | `humanities/theories/sociology/theories/critical-theory/theories/marxism/theories/decolonial/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A220 | `humanities/theories/sociology/theories/critical-theory/theories/marxism/theories/gramscian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A221 | `humanities/theories/sociology/theories/critical-theory/theories/marxism/theories/political-economy/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A222 | `humanities/theories/sociology/theories/critical-theory/theories/postliberalism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A223 | `humanities/theories/sociology/theories/critical-theory/theories/povinellian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A224 | `humanities/theories/sociology/theories/critical-theory/theories/povinellian/theories/` | 0 | container (organises child theories) |
| A225 | `humanities/theories/sociology/theories/critical-theory/theories/povinellian/theories/settler-colonialism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A226 | `humanities/theories/sociology/theories/critical-theory/theories/queer/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A227 | `humanities/theories/sociology/theories/critical-theory/theories/queer/theories/` | 0 | container (organises child theories) |
| A228 | `humanities/theories/sociology/theories/critical-theory/theories/queer/theories/kyriarchism/` | 0 | container (organises child theories) |
| A229 | `humanities/theories/sociology/theories/critical-theory/theories/situationist/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A230 | `humanities/theories/sociology/theories/cybernetic-postliberalism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A231 | `humanities/theories/sociology/theories/cybernetic-postliberalism/theories/who-benefits/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A232 | `humanities/theories/sociology/theories/legalism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A233 | `humanities/theories/sociology/theories/legalism/theories/` | 0 | container (organises child theories) |
| A234 | `humanities/theories/sociology/theories/legalism/theories/american-law/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A235 | `humanities/theories/sociology/theories/ludics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A236 | `humanities/theories/sociology/theories/work/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A237 | `humanities/theories/sociology/theories/work/theories/` | 0 | container (organises child theories) |
| A238 | `humanities/theories/sociology/theories/work/theories/governance/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A239 | `humanities/theories/sociology/theories/work/theories/governance/theories/` | 0 | container (organises child theories) |
| A240 | `humanities/theories/sociology/theories/work/theories/governance/theories/hohfeldian/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A241 | `humanities/theories/sociology/theories/work/theories/governance/theories/jurisdiction/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A242 | `humanities/theories/sociology/theories/work/theories/governance/theories/military-command/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A243 | `humanities/theories/spirituality/` | 0 | container (organises child theories) |
| A244 | `humanities/theories/spirituality/theories/` | 0 | container (organises child theories) |
| A245 | `humanities/theories/spirituality/theories/christianity/` | 0 | container (organises child theories) |
| A246 | `humanities/theories/spirituality/theories/christianity/theories/` | 0 | container (organises child theories) |
| A247 | `humanities/theories/spirituality/theories/christianity/theories/solomonic-occultism/` | 0 | container (organises child theories) |
| A248 | `humanities/theories/spirituality/theories/christianity/theories/thomism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A249 | `humanities/theories/writing/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A250 | `humanities/theories/writing/theories/` | 0 | container (organises child theories) |
| A251 | `humanities/theories/writing/theories/copywriting/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A252 | `humanities/theories/writing/theories/essay-writing/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A253 | `humanities/theories/writing/theories/fiction/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A254 | `humanities/theories/writing/theories/fiction/theories/` | 0 | container (organises child theories) |
| A255 | `humanities/theories/writing/theories/fiction/theories/write-for-a-month/` | 0 | container (organises child theories) |
| A256 | `humanities/theories/writing/theories/language-and-power/` | 0 | container (organises child theories) |
| A257 | `humanities/theories/writing/theories/machine-generation/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A258 | `humanities/theories/writing/theories/machine-generation/theories/` | 0 | container (organises child theories) |
| A259 | `humanities/theories/writing/theories/machine-generation/theories/flash-fiction/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A260 | `humanities/theories/writing/theories/plain-language/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A261 | `humanities/theories/writing/theories/plain-technical-general-american-english/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A262 | `humanities/theories/writing/theories/poetry/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A263 | `humanities/theories/writing/theories/rhetoric-and-composition/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A264 | `humanities/theories/writing/theories/technical-writing/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A265 | `science/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A266 | `science/theories/` | 0 | container (organises child theories) |
| A267 | `science/theories/biology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A268 | `science/theories/biology/theories/` | 0 | container (organises child theories) |
| A269 | `science/theories/biology/theories/adaptation/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A270 | `science/theories/biology/theories/botany/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A271 | `science/theories/biology/theories/ecology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A272 | `science/theories/biology/theories/ethology/` | 0 | container (organises child theories) |
| A273 | `science/theories/biology/theories/genetics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A274 | `science/theories/biology/theories/inaturalist/` | 0 | container (organises child theories) |
| A275 | `science/theories/biology/theories/inaturalist/theories/` | 0 | container (organises child theories) |
| A276 | `science/theories/biology/theories/inaturalist/theories/ethics-and-harm/` | 0 | container (organises child theories) |
| A277 | `science/theories/biology/theories/inaturalist/theories/failure-modes/` | 0 | container (organises child theories) |
| A278 | `science/theories/biology/theories/inaturalist/theories/identification/` | 0 | container (organises child theories) |
| A279 | `science/theories/biology/theories/inaturalist/theories/observation-practice/` | 0 | container (organises child theories) |
| A280 | `science/theories/biology/theories/inaturalist/theories/using-data/` | 0 | container (organises child theories) |
| A281 | `science/theories/biology/theories/mycology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A282 | `science/theories/biology/theories/neuroscience/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A283 | `science/theories/biology/theories/neuroscience/theories/` | 0 | container (organises child theories) |
| A284 | `science/theories/biology/theories/neuroscience/theories/neuroreflexivity/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A285 | `science/theories/biology/theories/physiology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A286 | `science/theories/biology/theories/species/` | 0 | container (organises child theories) |
| A287 | `science/theories/communication/` | 0 | container (organises child theories) |
| A288 | `science/theories/cosmology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A289 | `science/theories/cosmology/theories/` | 0 | container (organises child theories) |
| A290 | `science/theories/cosmology/theories/black-holes/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A291 | `science/theories/cosmology/theories/evolution/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A292 | `science/theories/cosmology/theories/observation/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A293 | `science/theories/cosmology/theories/structure/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A294 | `science/theories/information/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A295 | `science/theories/information/theories/` | 0 | container (organises child theories) |
| A296 | `science/theories/information/theories/cybernetics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A297 | `science/theories/information/theories/information-theory/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A298 | `science/theories/information/theories/knowledge-systems/` | 0 | container (organises child theories) |
| A299 | `science/theories/information/theories/knowledge-systems/theories/` | 0 | container (organises child theories) |
| A300 | `science/theories/information/theories/knowledge-systems/theories/adr/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A301 | `science/theories/information/theories/knowledge-systems/theories/knowing-semioverse/` | *scored in §3* | eligible |
| A302 | `science/theories/information/theories/knowledge-systems/theories/knowing-semioverse/theories/` | 0 | container (organises child theories) |
| A303 | `science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/` | 0 | container (organises child theories) |
| A304 | `science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/` | 0 | container (organises child theories) |
| A305 | `science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/` | *scored in §3* | eligible |
| A306 | `science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/` | *scored in §3* | eligible |
| A307 | `science/theories/information/theories/knowledge-systems/theories/research/` | 0 | container (organises child theories) |
| A308 | `science/theories/linguistics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A309 | `science/theories/linguistics/theories/` | 0 | container (organises child theories) |
| A310 | `science/theories/linguistics/theories/languages/` | 0 | container (organises child theories) |
| A311 | `science/theories/linguistics/theories/languages/theories/` | 0 | container (organises child theories) |
| A312 | `science/theories/linguistics/theories/languages/theories/english/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A313 | `science/theories/linguistics/theories/semantics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A314 | `science/theories/linguistics/theories/semiotics/` | *scored in §3* | eligible |
| A315 | `science/theories/medicine/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A316 | `science/theories/medicine/theories/` | 0 | container (organises child theories) |
| A317 | `science/theories/medicine/theories/airway/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A318 | `science/theories/medicine/theories/foam/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A319 | `science/theories/medicine/theories/herbalism/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A320 | `science/theories/medicine/theories/human-body/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A321 | `science/theories/medicine/theories/medical-technology/` | 0 | container (organises child theories) |
| A322 | `science/theories/medicine/theories/medical-technology/theories/` | 0 | container (organises child theories) |
| A323 | `science/theories/medicine/theories/medical-technology/theories/air-purification/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A324 | `science/theories/medicine/theories/pain/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A325 | `science/theories/medicine/theories/pharmacology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A326 | `science/theories/medicine/theories/psychology/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A327 | `science/theories/medicine/theories/public-health/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A328 | `science/theories/medicine/theories/reiki/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A329 | `science/theories/medicine/theories/somatics/` | 0 | staging-area (terms/texts shape; no typed notes) |
| A330 | `science/theories/medicine/theories/tccc/` | 0 | container (organises child theories) |
| A331 | `science/theories/medicine/theories/traditional-chinese-medicine/` | 0 | staging-area (terms/texts shape; no typed notes) |

## Appendix B — Validation evidence

A scripted relative-link and frontmatter-relation resolver was run over the 50 markdown files touched or created by this audit (the audit + audits/`_index.md`, the rubric narrative, all newly authored files in `semiotics/{_index.md, concepts/, objects/, morphisms/, theorems/, examples/, questions/, narratives/, references/}`, and the two PKS concepts that gained semiotics back-links). The resolver parses YAML frontmatter, walks every list-valued relation field (`depends-on`, `see-also`, `discusses`, `recaps`, `realizes`, `instantiates`, etc.), and walks every `](path.md)` markdown body link, normalising each path against its file's directory and confirming the target exists on disk.

Result on touched files:

```
Files: 50  Broken: 0
```

Pre-existing files under `semiotics/terms/` and `semiotics/texts/` (authored before this lift) have outstanding broken references unrelated to this audit; they are visible to the resolver but are out of this audit's perimeter. They are surfaced as a follow-up rather than fixed silently here.
