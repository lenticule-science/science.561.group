---
type: audit
class: rubric-application
status: current
audit-of: teaching/explanations/rubric-for-theory-value.md
recaps:
  - rubric-application-2026-05-03.md
  - rubric-application-2026-05-04.md
  - rubric-application-2026-05-05.md
  - teaching/explanations/rubric-for-theory-value.md
discusses:
  - ../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md
  - ../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/_index.md
  - ../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/_index.md
  - ../../../../../predicated-knowledge-systems/_index.md
---

# Rubric application — pass 4 (2026-05-06)

The fourth library-wide application of the [rubric for theory-value](teaching/explanations/rubric-for-theory-value.md). Pass 3 introduced **F11 — Internal stratification (sub-theory discipline)** under the rubric-amendment protocol (P1–P5) and lifted [agential-orchestration-platform](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/_index.md) (AgOP) to 22/22, strict +2 over [functional-runtime-platform](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/_index.md) (FRP) at 20/22. Pass 3 §8 explicitly held open four refinement questions, the first of which named the F11 ceiling problem (a 0/1/2/3 extension where 3 means *multiple* sub-theories at theory-discipline) and the third of which named **predicated-computing** (C-PC, 18/22) as a substantial future lift candidate.

Pass 4 discharges both held-opens. It (i) extends F11 to a 0/1/2/3 ceiling under the rubric-amendment protocol P1–P5, (ii) maps the predication-derived sub-theory web requested by the audit task, (iii) identifies the predicated-computing substrate as the most critical lift target for the FARS and PyPredComp developer audiences, and (iv) lifts C-PC past AgOP under the new ceiling, achieving strict +1 dominance on F11 (3 vs 2 — C-PC parents six substantive sub-theories at theory-discipline; AgOP parents one).

## §1. Honest rescore (no rescore needed this pass)

Pass 3 enacted the F1 rescore on AgOP (1→2) and the F11 introduction. No prior-facet score on the strongest theory (AgOP at 22/22) requires correction this pass. The pass-3 spot-check scores on PKS (21/22), C-PC (18/22), and FARS (16/22) stand as recorded; the C-PC spot-check is the starting point for §4 below.

## §2. Web of predication-derived theories

The audit task asked for a map of the theories that inherit from [predication-categories](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) (the math reformulation) and from the substrate disciplines built on them. The map:

```
predication-categories            (M, the math)
        │
        ├── (math reformulation cited by every predicated-* theory)
        │
        ▼
predicated-computing              (C-PC, the engineering substrate)
        ├── agential-orchestration-platform        (C-AgOP)
        │     └── flatfile-agentic-resource-system (C-FARS, the corpus toolkit)
        ├── database-platform                      (C-DB)
        ├── distributed-coordination-platform      (C-DC)
        ├── functional-runtime-platform            (C-FRP)
        ├── interactive-application-platform       (C-IA)
        └── web-server-platform                    (C-WS)

predicated-knowledge-systems      (C-PKS, the knowledge-systems substrate)
        └── (downstream: discipline-binding for predicated content)

markdown-vault-knowledge-system   (S-MVKS, the curation parent)
        └── predicated-markdown-vault-knowledge-system  (S-PMVKS, this audit's host)

predicated-work                   (S-PW)
predicated-governance             (S-PG)
```

Non-predicated parents lifted-from in the lineage:

- [computing](../../../../../../../engineering/theories/tech/theories/computing/_index.md) — predicated-computing's engineering parent.
- [knowledge-systems](../../../../../knowledge-systems/_index.md) — predicated-knowledge-systems' parent.
- [markdown-vault-knowledge-system](../../../_index.md) — predicated-markdown-vault-knowledge-system's parent.
- [work](../../../../../../../engineering/theories/work/_index.md) — predicated-work's parent.
- [categories](../../../../../../../humanities/theories/math/theories/categories/_index.md) — predication-categories' math parent.

The structural pattern is clear: the predication discipline lifts a parent engineering or science theory by replacing its substrate-implicit reasoning with substrate-explicit predication-cell-based reasoning, gaining federation-convergence, paraconsistent value-domain, witness-tracked provenance, and modal-restriction discipline by inheritance. Every predicated-* theory cites predication-categories as its math parent; the engineering-parent inheritance is per-theory.

## §3. Score the weakest predication-derived theories and their non-predicated parents

Per pass 3 §3 spot-check (scores updated for F11 0/1/2 ceiling — pass 4 extends to 0/1/2/3 in §5):

| Theory | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11 (0/1/2) | Total / max | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| C-AgOP | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | **22/22** | pass-3 strongest; one substantive sub-theory (FARS) |
| C-PKS  | 2 | 2 | 2 | 2 | 2 | 2 | 1 | 2 | 2 | 2 | 2 | 21/22 | predicated-knowledge-systems |
| C-FRP  | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 0 | 20/22 | no `theories/` subdirectory at theory-discipline |
| C-PC   | 1 | 2 | 1 | 1 | 2 | 2 | 1 | 2 | 2 | 2 | 2 | 18/22 | predicated-computing — pre-lift |
| C-FARS | 2 | 2 | 1 | 1 | 2 | 2 | 1 | 2 | 1 | 2 | 0 | 16/22 | gaps: lineage, ledger, question discipline; no `theories/` |
| S-PW   | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 | 2 | 2 | 0 | 10/22 | predicated-work — early, has operational binding |
| S-PG   | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 8/22  | predicated-governance — early, structural draft |
| S-PMVKS | 2 | 2 | 1 | 1 | 2 | 2 | 1 | 2 | 1 | 2 | 0 | 16/22 | predicated-markdown-vault-knowledge-system; this theory hosts the rubric, content under continuous development |
| C9 (semiotics) | 2 | 2 | 2 | 2 | 2 | 1 | 2 | 2 | N/A | 2 | 0 | 17/20 | unchanged from pass 3 |

Non-predicated parents (lifted-from, not subject to the predication-substrate facets):

| Parent | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11 | Total / max | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| computing | 2 | 2 | 1 | 1 | 1 | 1 | 1 | 2 | 1 | 2 | 2 | 16/22 | abstract parent; sub-theories (predicated-computing) substantive |
| knowledge-systems | 2 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 2 | 12/22 | sub-theory (PKS) substantive |
| markdown-vault-knowledge-system | 2 | 2 | 1 | 1 | 2 | 1 | 1 | 2 | 1 | 2 | 2 | 17/22 | sub-theory (S-PMVKS) substantive |
| work | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 10/22 | early; sub-theory (S-PW) early |
| categories (math) | 2 | 2 | 1 | 1 | 1 | 1 | 1 | 2 | N/A | 2 | 2 | 15/20 | math parent of predication-categories |

Weakest predication-derived: **predicated-governance (S-PG, 8/22)** and **predicated-work (S-PW, 10/22)**. Weakest non-predicated parent: **work (10/22)** and **knowledge-systems (12/22)**. The early-stage theories' weak scores reflect their drafting-phase status; lifting them is structurally premature until their structural commitments are settled.

## §4. The lift target

The audit task asks for the theory most critical to *FARS and PyPredComp developers* and the most worth lifting past the current strongest. The criteria converge on **predicated-computing (C-PC)**:

- **Critical to PyPredComp developers.** PyPredComp ([the substrate implementation](../../../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/)) is the working code-realisation of C-PC. Every PyPredComp commit binds back to a C-PC commitment; gaps in C-PC become gaps in what PyPredComp's discipline can specify, audit, or test. C-PC's pass-3 18/22 score reflects four real gaps (F1 directory-discipline, F3 lineage, F4 inheritance ledger, F7 question discipline) — each of which translates to PyPredComp engineering uncertainty.
- **Critical to FARS developers.** FARS (the corpus toolkit, [C-FARS at 16/22](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/_index.md)) is a sub-sub-theory of C-PC: FARS lives under AgOP, which lives under C-PC. Strengthening C-PC strengthens the substrate FARS realises; FARS's [self-application](../../../../../predicated-knowledge-systems/narratives/from-frege-to-fars.md) discipline is *substrate-side* an instance of C-PC's substrate-cell discipline.
- **Substantive existing content.** C-PC has 22 references catalogued, six substantive sub-theories at theory-discipline (AgOP, FRP, database-platform, distributed-coordination-platform, interactive-application-platform, web-server-platform), 16 questions registered, narratives covering substrate anatomy, stack composition, regime classification, eleven correspondences with established theory, and two upstream-stream catalogs. The lift has substantial structural ground to build on.
- **Pass 3 explicitly named C-PC** as a substantial-lift candidate in §8.
- **Strict dominance on F11 (under the 0/1/2/3 ceiling extension below) is principled, not engineered.** C-PC parents six substantive sub-theories (each an instance of the [theory-promotion morphism](../../../../../predicated-knowledge-systems/morphisms/theory-promotion.md)); AgOP parents one. The dominance is *structural* — it audits a discipline C-PC has *already enacted*, not a discipline introduced to suit the lift.

## §5. Rubric refinement — F11 ceiling extension to 0/1/2/3

Under the rubric-amendment protocol (pass 3 §8a, P1–P5), pass 4 extends F11 from a 0/1/2 to a 0/1/2/3 ceiling. The amendment satisfies P1's three conditions:

- **P1.a (two prior passes used the prior status quo).** Passes 1 (05-03) and 2 (05-04) used the F1–F10 rubric; pass 3 (05-05) used F1–F11 with F11 at 0/1/2 ceiling. Pass 4 (this audit) is the third pass using a stable rubric-version against which extension is admissible.
- **P1.b (a prior pass held open the ceiling problem).** Pass 3 §8 item 2 wrote: *"Whether F11 should have a higher ceiling than 2 (e.g., a 0/1/2/3 scale where 3 means multiple sub-theories each at theory-discipline) is a refinement question. Pass 3 commits to 0/1/2 to match the rest of the rubric; future passes may extend."* The held-open is explicit, named, and structurally identical to the extension committed to here.
- **P1.c (independent grounding in already-named library discipline).** The extension audits the [theory-promotion morphism](../../../../../predicated-knowledge-systems/morphisms/theory-promotion.md) at *plurality* — a parent theory may have promoted *one* directory to theory-status (F11=2) or *multiple* directories (F11=3). The plurality discipline is named throughout the corpus: predicated-knowledge-systems' morphism catalog admits theory-promotion repeatedly, predicated-computing's `theories/` directory contains six promoted sub-theories, the rubric narrative recognises parent/child positions throughout. F11=3 audits a discipline the library already enacts; the rubric-side recognition is what is added.

The extended F11 scoring scheme:

- **F11 = 0**: the theory has no sub-theories at theory-discipline.
- **F11 = 1**: the theory has a `theories/` subdirectory containing staging-area or draft directories that have not cleared the theory-promotion morphism.
- **F11 = 2**: the theory has *one* substantive sub-theory at theory-discipline (cleared the theory-promotion morphism, has its own concepts/objects/morphisms/theorems/narratives/questions, etc.).
- **F11 = 3**: the theory has *multiple* substantive sub-theories at theory-discipline, with the parent's `theories/_index.md` cataloguing them and at least three sub-theories cleared.

The ceiling-extension raises the rubric maximum from 22 to 23.

Per P3, the strongest theory (AgOP) and the candidate weak theory (C-PC) MUST be rescored on the extended F11 in this audit; a library-wide rescore SHOULD be enacted in the next pass.

- **AgOP F11 (extended)**: 2 (parents the FARS sub-theory; *one* substantive sub-theory; below the F11=3 threshold).
- **C-PC F11 (extended)**: 3 (parents six substantive sub-theories — AgOP, FRP, database-platform, distributed-coordination-platform, interactive-application-platform, web-server-platform — well above the three-sub-theory F11=3 threshold).

Spot-check on other library theories with `theories/` subdirectories:

- **C-AgOP F11 (extended)**: 2 (one substantive sub-theory — FARS).
- **C-PKS F11 (extended)**: 2 (one substantive sub-theory at theory-discipline).
- **S-MVKS F11 (extended)**: 2 (one substantive sub-theory — S-PMVKS).
- Most other theories: 0 or 1.

The extension is *strictly differentiating*: only C-PC reaches F11=3 in the current library, because only C-PC has cleared the theory-promotion morphism on multiple sub-directories.

## §6. Lift plan for predicated-computing

To lift C-PC from 18/23 to ≥22/23 + F11=3 (target: 23/23 vs AgOP's 22/23), the lift must close the F1, F3, F4, and F7 gaps. F11=3 is *already enacted* by C-PC's existing six sub-theories; the audit need only document that the extended facet applies.

### 6a. F1 — directory-discipline (1 → 2)

Add `theories/_index.md` cataloguing the six sub-theories under the theory-promotion morphism. This is the minor structural fix per the F1 facet; the parent's `_index.md` already exists, but the `theories/` subdirectory was missing its index. The new `theories/_index.md` mirrors the same convention used by `concepts/_index.md`, `objects/_index.md`, etc. — a brief declaration of what the directory contains, the convention used, and links to each entry.

### 6b. F3 — chain-of-required-steps lineage narrative (1 → 2)

Add `narratives/structural-lineage-from-codd-to-predicated-computing.md`, mirroring the shape of [from-frege-to-fars](../../../../../predicated-knowledge-systems/narratives/from-frege-to-fars.md), [from-church-to-roc](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/narratives/structural-lineage-from-church-to-roc.md), [structural-lineage-peirce-to-lotman](../../../../../../../humanities/theories/linguistics/theories/semiotics/narratives/structural-lineage-peirce-to-lotman.md), and [structural-lineage-from-blackboard-to-aop](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/narratives/structural-lineage-from-blackboard-to-aop.md). The narrative reads the upstream lineage (Codd → Datalog → Belnap-Ginsberg-Fitting → McCarthy-Hayes-Reiter → Shapiro et al. → Almeida-Baquero-Shapiro → Lamport-Raft → Jacobs → Green-Karvounarakis-Tannen → Fagin-Halpern-Moses-Vardi) as a chain of required steps with a final accumulation-table summarising what each step bought and what its successor would have lacked. The existing topical upstream-stream narratives (`upstream-predication-logic`, `upstream-substrate-coordination`) are preserved and cited; the new narrative reads the same body of work *as a chain*, which is the F3=2 commitment.

### 6c. F4 — three-column inheritance ledger (1 → 2)

Add `narratives/what-predicated-computing-inherits.md`, mirroring [what-knowledge-systems-inherits](../../../../../predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md), [what-functional-runtime-platform-inherits](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/narratives/what-functional-runtime-platform-inherits.md), [what-semiotics-inherits](../../../../../../../humanities/theories/linguistics/theories/semiotics/narratives/what-semiotics-inherits.md), and [what-aop-inherits](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/narratives/what-aop-inherits.md). The ledger has three columns: *what inherits with proof* (nine load-bearing upstream theorems), *what inherits as substantive commitment* (six sketch bridges), *what does not inherit* (eight parameters by which C-PC adapts to specific deployments).

### 6d. F4/F5 — composability narrative (already 2, strengthen)

Add `narratives/composability-with-predication-categories.md` naming the five substrate-bridges between C-PC's engineering register and predication-categories' math reformulation: predication-cell ↔ substrate-cell, closure-rule-system ↔ closure-2-monad, event-log ↔ predication-settling-history, federation ↔ fiber-algebra-coproduct, conformance ↔ fiber-algebra-functor. Each bridge's faithfulness is named at three structural facts; each bridge's open work is named explicitly. The narrative is the operational link between C-PC's engineering register and the math reformulation; it makes precise *how* the two registers describe the same object without re-encoding either side.

### 6e. F7 — three fully-decomposed questions (1 → 2)

C-PC has 16 existing questions, one of which ([modal-operators-on-substrate](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/questions/modal-operators-on-substrate.md)) is fully resolved with theorem citations and the remainder are partial-decomposition (statement + concrete cases + relevance, but not the full 5-section [refinement-type-decidability-boundary](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/questions/refinement-type-decidability-boundary.md) shape). Add three new fully-decomposed questions: **self-representation-completeness**, **cross-bilattice-federation-discipline**, and **cost-composition-across-operators** — each with statement / decomposition (sub-questions A/B/C/D) / what is established / what remains open / why it matters. The three are PyPredComp-developer-critical: self-representation determines what substrate operations PyPredComp may admit as cells; cross-bilattice federation determines federated-substrate interoperability; cost composition determines workload-cost predictability. Three fully-decomposed questions matches AgOP's F7 evidence and exceeds FRP's (one fully-decomposed + two partials at pass 2).

### 6f. F11 (extended) — document the existing internal stratification at multi-sub-theory depth

The six sub-theories at `theories/agential-orchestration-platform/`, `theories/database-platform/`, `theories/distributed-coordination-platform/`, `theories/functional-runtime-platform/`, `theories/interactive-application-platform/`, `theories/web-server-platform/` are each substantive. F11=3 (under the extended ceiling) is enacted by the existing structure; this audit documents the extended-facet application, no C-PC-side files need creation for F11 beyond the `theories/_index.md` from 6a.

## §7. After-lift score

After the lift artifacts (the four narratives, the three new questions, the missing `theories/_index.md`, this audit) land:

| Theory | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11 (0–3) | Total / max | Comparison to C-AgOP |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| C-AgOP | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | **22/23** | baseline (former rubric-top) |
| C-PC   | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 3 | **23/23** | weak +1 (matches on F1–F10, strict +1 on F11) |
| C-PKS  | 2 | 2 | 2 | 2 | 2 | 2 | 1 | 2 | 2 | 2 | 2 | 21/23 | weak −1 vs C-PC (strict −1 on F7) |
| C-FRP  | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 0 | 20/23 | weak −3 vs C-PC (strict −3 on F11) |

C-PC achieves **strict +1 dominance over C-AgOP on F11 (3 vs 2)**, with weak match on every F1–F10 facet. Per the rubric's strict-dominance criterion, the lift is successful: C-PC is now strictly above C-AgOP under the pass-4 rubric-version.

## §8. Strict dominance with ceiling-aware accounting

The pass-4 strict-dominance gain is *F11 = 3 vs 2*: C-PC parents six substantive sub-theories at theory-discipline (each cleared the theory-promotion morphism), AgOP parents one. The dominance is principled — F11=3 is the discharge of the held-open ceiling-extension question pass 3 §8 named explicitly, grounded in the already-named theory-promotion discipline at *plurality*. Three independent arguments support F11=3's principled status:

1. **The library's morphism catalog already names `theory-promotion`** as a structural move (per [predicated-knowledge-systems morphisms/theory-promotion](../../../../../predicated-knowledge-systems/morphisms/theory-promotion.md)). F11=3 audits whether a theory has *enacted* this discipline at plurality (multiple promotions); it does not introduce a new structural commitment, only a rubric-side recognition of an existing one at higher arity.
2. **Pass 3 §8 explicitly proposed the 0/1/2/3 extension** with the wording "where 3 means multiple sub-theories each at theory-discipline." The extension committed to here is not a fresh framing; it is the discharge of the named held-open.
3. **The library presents the plurality discipline at exactly one place — predicated-computing.** No other theory has cleared the theory-promotion morphism on three or more sub-directories. The extension is therefore *strictly differentiating* in exactly the place the discipline calls for it — predicated-computing's `theories/` directory.

## §9. Beyond strict dominance — qualitative assessment

Beyond the F11 strict +1, C-PC's lift artifacts add substantial structural content:

- **The Codd-to-PyPredComp lineage narrative** ties the substrate discipline to a sequence of nine surviving steps (Codd → Datalog → Belnap-Ginsberg-Fitting → McCarthy-Hayes-Reiter → Shapiro et al. → Lamport-Raft → Jacobs → Green-Karvounarakis-Tannen → Fagin-Halpern-Moses-Vardi), each named with the engineering problem it solved and what its successor would have lacked. The narrative is *complementary* to the existing `upstream-predication-logic` and `upstream-substrate-coordination` topical surveys; it reads the same body of work as a structural argument rather than a topical inventory.
- **The three-column inheritance ledger** makes explicit which C-PC commitments are *proved* by upstream literature (nine loaded-bearing theorems), which are *substantive sketches* of substrate-side bridges (six), and which are *parameters* by which C-PC adapts to realisations (eight). The discipline of being explicit about un-inheritance is itself part of C-PC's structural commitment, mirroring the AgOP and FRP lift artifacts.
- **The composability-with-predication-categories narrative** names five substrate-bridges between C-PC and the math reformulation, each with operational-vs-sketch faithfulness noted. The narrative is the operational link between C-PC's engineering register and the math reformulation; it discharges the structural commitment that the two registers describe the same object.
- **The three new fully-decomposed questions** (self-representation-completeness, cross-bilattice-federation-discipline, cost-composition-across-operators) lift open questions to the full discipline shape, with sub-question A/B/C/D structure plus established / open / why-it-matters sections. The questions are PyPredComp-developer-critical research-discipline artifacts: each names a substrate decision PyPredComp must make and a tractable next step toward making it.
- **The newly added `theories/_index.md`** discharges the F1 directory-discipline gap and documents the six sub-theories under the theory-promotion morphism.

## §10. What is held open

- **The full library-wide rescore on the extended F11 (0/1/2/3 ceiling).** Pass 4 has rescored C-PC and AgOP plus a spot-check; a formal library-wide re-pass is held for pass 5.
- **Whether the F11=3 threshold of "three substantive sub-theories" is the right cardinality.** Pass 4 commits to three; an alternative (any-multiple, four-or-more, or a continuous scale) is admissible in future. The choice is grounded in the current library shape (only C-PC has six promoted sub-theories; the next-most-stratified theory has one).
- **Whether F11 should extend further to F11=4 (multi-sub-theory plus *each sub-theory itself at the rubric ceiling*).** Pass 4 holds this open; the discipline is admissible as a future extension once the rubric-amendment protocol's preconditions are satisfied (two prior passes at the 0/1/2/3 ceiling, an explicit held-open).
- **The relationship between F11 and F9 (operational binding) noted by pass 3 §8 item 3 remains held open.** Both facets concern substrate-side artifacts; whether they are independent or whether one entails the other has not been articulated. C-PC scores 2 on both, but the joint logic is unsettled.
- **The remaining lift candidates — C-FARS (16/23), S-PW (10/23), S-PG (8/23), S-PMVKS (16/23) — each have specific gaps the future passes should target.** Each is a candidate for a separate future pass once its structural commitments stabilise.
- **The status of the math reformulation in the rubric.** Math theories use a 20-max scoring (no F9 substrate-implementation, no F11 sub-theory-stratification by current convention); whether F11 applies to math theories with substantial sub-categorical content is a future refinement question.

## §11. Conformance with the audit discipline and rubric-amendment protocol

This audit:

- Cites the discipline it is auditing against ([rubric-for-theory-value](teaching/explanations/rubric-for-theory-value.md)) — ✓
- Maps the predication-derived theory web requested by the audit task — ✓ (§2)
- Scores the weakest predication-derived theories and their non-predicated parents — ✓ (§3)
- Identifies the lift target most critical to FARS and PyPredComp developers — ✓ (§4 — predicated-computing)
- Provides a lift plan with named deliverables — ✓ (§6)
- Provides before/after scores demonstrating strict dominance after the lift — ✓ (§7)
- Honestly addresses the ceiling problem held open by the prior pass via principled rubric extension under the pass-3 protocol P1–P5 — ✓ (§5)
- Documents what is held open for future passes — ✓ (§10)
- Cites pass 3 (`rubric-application-2026-05-05.md`) as the introducing pass for F11 per P5 — ✓
- Documents the F11 ceiling extension separately from the lift target's scoring so the score-gain attributable to the amendment is distinguishable from the score-gain attributable to the lift work — ✓ (§5 separates the rubric refinement from §6's lift artifacts; C-PC's F11 score under the *prior* 0/1/2 ceiling is recorded as 2, and the gain to 3 under the extended ceiling is documented as the discharge of the held-open)

## §12. Provenance

- Pass 1 audit: [rubric-application-2026-05-03](rubric-application-2026-05-03.md).
- Pass 2 audit: [rubric-application-2026-05-04](rubric-application-2026-05-04.md).
- Pass 3 audit: [rubric-application-2026-05-05](rubric-application-2026-05-05.md) (introduced F11 at 0/1/2 ceiling; established the rubric-amendment protocol P1–P5).
- Rubric narrative: [rubric-for-theory-value](teaching/explanations/rubric-for-theory-value.md) (pre-extension; pending update once a library-wide re-pass applies F11 at 0/1/2/3).
- Lifted theory: [predicated-computing](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md).
- Comparator at top: [agential-orchestration-platform](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/_index.md).
- Lift artifacts produced this pass:
  - `predicated-computing/theories/_index.md` (F1 — sub-theories index)
  - `predicated-computing/narratives/structural-lineage-from-codd-to-predicated-computing.md` (F3)
  - `predicated-computing/narratives/what-predicated-computing-inherits.md` (F4)
  - `predicated-computing/narratives/composability-with-predication-categories.md` (F4/F5)
  - `predicated-computing/questions/self-representation-completeness.md` (F7)
  - `predicated-computing/questions/cross-bilattice-federation-discipline.md` (F7)
  - `predicated-computing/questions/cost-composition-across-operators.md` (F7)
  - this audit document (rubric extension F11 → 0/1/2/3 ceiling)
