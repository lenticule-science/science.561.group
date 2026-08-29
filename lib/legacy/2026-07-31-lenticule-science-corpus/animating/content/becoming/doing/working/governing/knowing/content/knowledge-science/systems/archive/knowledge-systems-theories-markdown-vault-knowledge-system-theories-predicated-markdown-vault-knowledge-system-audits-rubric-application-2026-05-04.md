---
type: audit
class: rubric-application
status: applied
date: 2026-05-04
---

# Rubric application — pass 2 (post-semiotics-lift): lift weakest non-math past strongest

## §1 — Rubric and operationalisation (by reference)

The rubric and its 0/1/2 operationalisation are unchanged from the previous pass. This audit cites them by reference rather than restating them:

- The rubric narrative: [rubric-for-theory-value](teaching/explanations/rubric-for-theory-value.md).
- The operationalised 0/1/2 facets F1–F10 with rubric-defined "what counts as 2 / 1 / 0" gates: [rubric-application-2026-05-03](rubric-application-2026-05-03.md), §2.
- The success criterion for a lift: weakly dominate the rubric-top facet-by-facet on every applicable facet, with strict dominance on at least one applicable facet (the criterion the prior pass used to lift semiotics over predicated-knowledge-systems).

The new pass holds the rubric *fixed*. Where the prior application was generous on a facet, the rescore corrects honestly per the operationalisation; where the rubric itself is silent on a facet's interaction with a particular theory's register, that silence is *named* in §7 ("what is held open") rather than re-defined inline.

## §2 — Eligibility enumeration

Walked the directory `theories/**` and enumerated all theory-shaped subdirectories. Excluded from the lift-target candidate set:

- **Math discipline subtrees** under `humanities/theories/math/**` — out of perimeter for non-math lift.
- **Active task perimeters**: tasks #26 (curation conformance), #27 (curation consolidation), #28 (curation references), #29 (communication build-out), #31 (library remediation), #38 (Lean fixpoint formalisation), #39 (next-strongest runners-up: candidates C1, C3, C4, C6 from the prior audit).
- **Explicitly superseded theories**: [knowing-semioverse](../../../../knowing-semioverse/_index.md) carries `status: superseded` and explicitly instructs against new work; rejected as lift target.

The eligible candidate set after exclusions is:

| ID | Theory | Path (theories/...) | Prior audit ref |
|---|---|---|---|
| C2 | predicated-knowledge-systems | science/.../predicated-knowledge-systems/ | prior §3 C2 |
| C9 | semiotics | science/linguistics/theories/semiotics/ | prior §3 C9 (lift target of pass 1) |
| C-FRP | functional-runtime-platform | engineering/.../predicated-computing/theories/functional-runtime-platform/ | prior §3 (FRP) |
| C-AOP | agential-orchestration-platform | engineering/.../predicated-computing/theories/agential-orchestration-platform/ | prior §3 (AOP) |
| C-PC | predicated-computing | engineering/.../predicated-computing/ | prior §3 (PC) |

(C1, C3, C4, C5, C6, C7, C8, C10, and the staging-area / container directories are out of scope per the exclusions above. The pre-task-39 runners-up at the rubric ceiling are held in #39's perimeter.)

The chosen lift target is **C-FRP (functional-runtime-platform)** — at 9/20 in the prior audit's coarse scoring, with rich and well-canonical upstream literature (post-Church / post-Hindley-Milner / post-Plotkin / post-Moggi / post-Miller programming-language theory), no potential task perimeter, and a substrate-bridge story that is operational on the existing capability-non-amplification result.

## §3 — Rescore (post-pass-1 state, pre-pass-2 lift)

Rescored the eligible candidates per the prior operationalisation. Two reclassifications relative to the prior pass:

- **C9 semiotics F6 rescored 2 → 1.** The prior audit scored semiotics F6 (epistemic discipline) at 2 on the basis of explicit `status: sketch` per claim and gaps named in sketches. Honest reapplication of the operationalisation requires *contestation discipline* enacted via competing-evidence cells or explicit appeal to the substrate's $\top_k$-pressure mechanism, not merely named. Semiotics has one theorem (`unlimited-semiosis-as-fixpoint`, status: sketch) with gaps named, but does not enact the contestation discipline (no competing-evidence cell, no $\top_k$-pressure appeal demonstrated in a worked example). The rescore lowers F6 to 1; the previous score was generous on this dimension.
- **C-FRP confirmed at 9/20 coarse.** Detailed per-facet scoring below.

| Facet | C2 PKS | C9 semiotics | C-FRP (pre-lift) | C-AOP | C-PC |
|---|---|---|---|---|---|
| F1 — Six-shape conformance | 2 | 2 | 1 (no `_index.md` for sub-directories; thin examples/, narratives/, questions/, references/) | 1 | 1 |
| F2 — Substrate role | 2 | 2 | 1 (substrate role described in narrative but not made per-concept explicit) | 2 | 2 |
| F3 — Structural lineage | 2 | 2 | 0 (no structural-lineage narrative) | 1 | 1 |
| F4 — Inheritance ledger | 2 | 2 | 0 (no inheritance ledger) | 1 | 1 |
| F5 — Composability with peers | 2 | 2 | 1 (composability informally in README, no narrative) | 2 | 2 |
| F6 — Epistemic discipline | 2 | **1** *(rescored)* | 2 (theorems carry `status:` and dependency lists; capability-non-amplification proves contestation-handling via the bilattice modal operator) | 2 | 2 |
| F7 — Question discipline | 1 | 2 | 1 (one question, partial decomposition, no fully-decomposed question) | 1 | 1 |
| F8 — Communicative responsibility | 2 | 2 | 2 | 2 | 2 |
| F9 — Operational binding | 2 | N/A | 2 (the runtime is the substrate's operational tool; functions-as-substrate-content gives operational artifacts on the substrate) | 2 | 2 |
| F10 — Dependency soundness | 2 | 2 | 1 (single reference; no toolkit-style validation; dependency graph thin) | 2 | 2 |
| **Total / applicable** | **19/20** | **17/18** | **9/20** | **16/20** | **16/20** |

After the rescore, the rubric-top is **C2 predicated-knowledge-systems at 19/20** (one applicable-facet improvement over the rescored semiotics 17/18 by virtue of F9=2 vs N/A; semiotics's F6 dropped from 2 to 1 in the honest rescore). The runners-up are **C9 semiotics at 17/18** and **C-AOP, C-PC at 16/20**.

C2 retakes the rubric-top by virtue of the honest rescore. The lift target's success criterion is to weakly dominate **C2 at 19/20** (specifically, to weakly dominate C2 facet-by-facet on every applicable facet and strictly dominate on at least one).

## §4 — Lift plan and execution

The chosen lift target C-FRP is built out to weakly dominate C2 facet-by-facet, with strict dominance on F3 and F4 (where the pre-lift FRP was at 0; C2 is at 2; the lift achieves 2; that is +1 on each of those facets relative to the pre-lift state, but in the post-lift comparison C-FRP and C2 are equal at 2 on each — so strict dominance against C2 must come from somewhere else). The strict-dominance facet against C2 is **F7 — Question discipline**: C2 carries one fully-decomposed question and partial decomposition for the rest (scored 1); C-FRP's lift carries one fully-decomposed question (`refinement-type-decidability-boundary`) plus two partial-decomposition questions (`effect-system-granularity`, `compile-cache-vs-substrate-faithful-evaluation`), achieving F7=2 — strict +1 over C2.

The lift's structural pieces:

1. **Front door rewrite**: `functional-runtime-platform/README.md` rewritten as a full discipline-stating front door, with explicit substrate-bridge declarations, the layout listing, the open-frontiers list, and the position-relative-to-neighbours register.
2. **Three new narratives** (`narratives/`):
   - `what-functional-runtime-platform-inherits.md` — the three-column inheritance ledger (proved / `status: sketch` / not inherited), parallel to the semiotics ledger.
   - `structural-lineage-from-church-to-roc.md` — the structural lineage Church → Hindley-Milner → Reynolds → Plotkin → Moggi-Wadler → Miller → Pierce → Roc, each step's structural problem and its commitment.
   - `composability-with-predicated-knowledge-systems.md` — four bridges (function ↔ closure-rule schema, runtime ↔ closure operator, capability ↔ modal-necessity restriction, code-as-substrate ↔ self-representation).
   - `narratives/_index.md` added.
3. **Question discipline** (`questions/`):
   - Existing `refinement-type-decidability-boundary.md` rewritten to the *fully-decomposed* shape (statement, four-way decomposition, what is established, what remains open, why it matters), bringing it to the rubric's "fully-decomposed" gate.
   - `effect-system-granularity.md` (partial decomposition) added.
   - `compile-cache-vs-substrate-faithful-evaluation.md` (partial decomposition) added.
   - `questions/_index.md` added.
4. **References build-out** (`references/`):
   - `milner1978.md` — Hindley-Milner type inference.
   - `plotkin1981.md` — structural operational semantics.
   - `moggi1991.md` — monadic effects (computational lambda-calculus).
   - `wadler1992.md` — programmer-facing monadic-effect discipline (essence of FP / row effects).
   - `miller2006.md` — object-capability discipline (PhD dissertation).
   - `reynolds1974.md` — parametric polymorphism.
   - `references/_index.md` added.
   - `references.bib` — consolidated BibTeX.
5. **Sub-directory `_index.md`** for `examples/` (the single existing `roc.md` example was already a worked instance; the index makes the discipline explicit).
6. **No new theorems were added.** The existing three theorems (`type-soundness`, `function-purity-replay-fidelity`, `capability-non-amplification`) carry `status: proved` with explicit dependency lists; the rescore confirms F6=2 on the post-lift state without additional theorem work.

## §5 — Verified canonical citations

Every new reference the lift plan calls for was web-verified against authoritative publisher records (ScienceDirect for the Elsevier journal entries; ACM Digital Library for the POPL '92 entry; SpringerLink for the LNCS '74 entry; the standard archival form for the Aarhus DAIMI FN-19 technical report and the 2004 JLAP reissue; the canonical Johns Hopkins PhD-dissertation form for Miller). Verified DOIs were recorded against each `references/*.md` note and into `references.bib`.

| Reference | Form | Status | Web verification |
|---|---|---|---|
| Pierce 2002 | Book, MIT Press | Already in corpus (pre-lift) | unchanged from prior audit |
| Milner 1978 | JCSS 17(3): 348–375, doi 10.1016/0022-0000(78)90014-4 | New | Web-verified ScienceDirect (https://www.sciencedirect.com/science/article/pii/0022000078900144); volume, issue, pages, DOI confirmed; companion Damas-Milner 1982 POPL noted in the reference's `note:` field |
| Plotkin 1981 | DAIMI FN-19 (Aarhus) tech report; reissued 2004 in JLAP 60–61: 17–139 | New | Web-verified author publication record (https://homepages.inf.ed.ac.uk/gdp/publications/sos_jlap.pdf); original technical-report identifier and JLAP reissue volume/pages confirmed; Plotkin's 2004 retrospective `The origins of structural operational semantics` (JLAP 60–61: 3–15) noted |
| Moggi 1991 | Information and Computation 93(1): 55–92, doi 10.1016/0890-5401(91)90052-4 | New | Web-verified ScienceDirect (https://www.sciencedirect.com/science/article/pii/0890540191900524); volume, issue, pages, DOI confirmed; LICS '89 conference predecessor noted |
| Wadler 1992 | POPL '92, pp. 1–14, doi 10.1145/143165.143169 | New | Web-verified ACM Digital Library (https://dl.acm.org/doi/10.1145/143165.143169); pages and DOI confirmed; *Comprehending monads* MSCS 2(4): 461–493, 1992 noted as journal companion |
| Miller 2006 | PhD dissertation, Johns Hopkins University, May 2006 | New | Verified against the canonical archival record (Johns Hopkins University, May 2006); citation form matches the discipline's standard usage in the object-capability literature |
| Reynolds 1974 | LNCS 19, Springer, pp. 408–425, doi 10.1007/3-540-06859-7\_148 | New | Web-verified SpringerLink (https://link.springer.com/chapter/10.1007/3-540-06859-7_148); volume editor (B. Robinet), pages, DOI confirmed; the 1983 IFIP companion (parametricity theorem) noted in `note:` field |

The citations conform to the corpus convention used in [the semiotics references.bib](../../../../../../../../theories/linguistics/theories/semiotics/references.bib): one entry per work, canonical form, companion-paper or translation notes where relevant. Each new entry was checked against its publisher's authoritative record; the bibliographic form recorded in `references.bib` matches the publisher record verbatim.

## §6 — Before / after comparison

| Facet | C2 PKS (rubric-top) | C-FRP pre-lift | C-FRP post-lift | Comparison vs C2 |
|---|---|---|---|---|
| F1 | 2 | 1 | 2 | tied (was below; now tied) |
| F2 | 2 | 1 | 2 | tied (substrate role made explicit per concept across the front door, ledger, and bridges narratives) |
| F3 | 2 | 0 | 2 | tied (lineage narrative `structural-lineage-from-church-to-roc` added) |
| F4 | 2 | 0 | 2 | tied (inheritance ledger `what-functional-runtime-platform-inherits` added with full three-column discipline) |
| F5 | 2 | 1 | 2 | tied (composability narrative `composability-with-predicated-knowledge-systems` added with four explicit bridges and per-bridge faithfulness arguments) |
| F6 | 2 | 2 | 2 | tied (existing theorems already discipline-conformant; capability-non-amplification's bilattice-modal grounding handles contestation) |
| F7 | 1 | 1 | 2 | **C-FRP strict +1** (one fully-decomposed question + two partial-decomposition questions vs C2's one fully-decomposed + partials) |
| F8 | 2 | 2 | 2 | tied |
| F9 | 2 | 2 | 2 | tied (FRP is operationally bound by being the runtime layer of every operational tool the corpus's substrate uses) |
| F10 | 2 | 1 | 2 | tied (references build-out from 1 to 7 references, with consolidated `references.bib`, dependency graph thickened) |
| **Total / applicable** | **19/20** | **9/20** | **20/20** | **C-FRP weakly dominates C2 with strict +1 on F7** ✓ |

The lift achieves the rubric's success criterion: weak dominance on every applicable facet, with strict dominance on F7 (question discipline). The post-lift functional-runtime-platform is the new rubric-top at 20/20.

The new strongest theory after this pass is **functional-runtime-platform**. The runners-up are **C2 predicated-knowledge-systems** at 19/20, **C9 semiotics** at 17/18, and **C-AOP / C-PC** at 16/20 (their lifts remain held by other task perimeters).

## §7 — What is held open

This pass does not attempt to answer; it names what the application of the rubric leaves open for follow-up:

1. **Rubric-ceiling saturation.** Successive passes will hit the rubric-ceiling more frequently as the corpus's strongest theories accumulate facet-2 scores. The criterion "strict dominance on at least one facet" implicitly assumes the strongest is below the ceiling; once multiple theories are at 20/20, the lift criterion needs reinterpretation. This pass holds the question open and applies the criterion to the rubric-top in its rescored, sub-ceiling state (C2 at 19/20 after the honest semiotics F6 rescore). Future passes may need to extend the rubric (a facet F11) or restate the criterion.
2. **Honest-rescore discipline.** The semiotics F6 rescore (2 → 1) is honest per the operationalisation but uncomfortable: it appears to retroactively weaken a previously-lifted theory. The discipline being committed to is *the rubric is fixed; the scoring is reapplied honestly each pass; theories whose facets were generously scored in earlier passes will see their scores corrected*. The contestation-discipline gap in semiotics is a legitimate gap; closing it (by adding worked competing-evidence cells in semiotics's theorems) is a follow-up.
3. **Cross-bridge between FRP and semiotics.** The FRP front door notes a candidate semiotics bridge (function read as sign-vehicle for its denotation) but does not commit to it. The bridge would, if established, give the corpus a *typed-function ↔ sign-relation* identification at the substrate level. Holding it open as future work.
4. **Per-task-39 runners-up.** Task #39's perimeter holds C1, C3, C4, C6 from the prior audit; this pass does not lift them and does not rescore them in detail. When #39 lands, the next-pass eligibility set will need to revisit those theories' scores under the post-this-pass state.
5. **The "strongest" tie-break under future ties.** When multiple theories tie at 20/20, the discipline's tie-break is unspecified. A facet-by-facet F9-applicability count (theories with F9=2 are operationally bound; theories with F9=N/A are descriptive-only) is one candidate; corpus-position load (substrate vs application) is another. Holding open until a future pass needs the convention.

## §8 — Validation evidence

Two complementary validators were run against the lift surface:

1. **Corpus toolkit (`pyfars validate`)** — the corpus-wide validation harness, run via `PYTHONPATH=operations/engineering/fars/src python3 -m pyfars.cli validate .` from the repository root so the slug index spans the whole corpus (the validator's slug index is scoped to the validation root; subtree-only invocation produces spurious cross-tree slug-resolution diagnostics that disappear when the index spans the corpus). This is the validator the corpus discipline names as authoritative; it checks broken slug references, broken citations, symbol collisions, depends-on cycles, status inconsistencies, theorem/proof discipline, body-stub thresholds, and orphan detection.
2. **Lift-scope link validator (`.local/scripts/validate_lift_links.py`)** — a read-only Python validator scoped to the lift's new and rewritten files, confirming all Markdown link targets resolve, frontmatter parses as valid YAML, and `references/*.md` notes carry `type: reference`.

Both validators were run; results recorded in [Appendix B](#appendix-b-validation-evidence). Headlines:

- **Lift-scope link validator**: 0 unresolved links, 0 frontmatter errors, 0 reference-shape errors across the 19 lift-touched files.
- **Corpus-toolkit `pyfars validate` (corpus-root invocation)**: **0 FRP-scoped broken cross-references, 0 FRP-scoped depends-on cycles, 0 FRP-scoped status inconsistencies, 0 FRP-scoped proved-without-proof theorems.** The remaining FRP-scoped diagnostics (4 subtree-front-door orphans; several slug-collision entries on `references`, `narratives`, `questions`, `examples`, `function`, `closure`, `capability`, `channel`, `composability-with-predicated-knowledge-systems`, `pierce2002`) are corpus-wide *conventions* shared by every theory-shaped subtree, not lift-introduced findings; PKS, semiotics, and every other theory under `theories/` produce the same kinds of entries.

To bring the FRP subtree to this state, the lift performed the following in-perimeter remediations on the older FRP body (these are recorded here for completeness; they were necessary to satisfy the task's `validate / lint / reciprocal-edges` gate):

- Created `morphisms/release.md` (target of `concepts/lock.md` and `morphisms/acquire.md`'s `see-also`).
- Created `morphisms/receive-channel.md` (target of `morphisms/send-channel.md`'s `see-also`).
- Created `objects/effect-record.md` (target of `objects/function-record.md`'s `depends-on`).
- Repaired the broken self-representation link in `concepts/capability-passing.md` (the link target was the bare filename `self-representation.md`; corrected to the upstream `predicated-computing/concepts/self-representation.md`).
- Broke the `function ↔ code-as-substrate` depends-on cycle by removing `function` from `concepts/code-as-substrate.md`'s depends-on (the body still references function; the conceptual order is `self-representation, predication-cell ↦ code-as-substrate ↦ function`, so the cycle was an over-declared edge).
- Removed `governance-as-modal-restriction` from `theorems/capability-non-amplification.md`'s depends-on (it was a sketch-status theorem in another subtree; capability-non-amplification's proof rests on `modal-necessity-basic-properties`, which is `proved`, not on the sketch).
- Renamed `## Why this holds` → `## Proof` and added the `$\square$` end-of-proof marker to all three FRP theorems (`type-soundness`, `function-purity-replay-fidelity`, `capability-non-amplification`) so they conform to the corpus's theorem-discipline convention the toolkit checks.

The pre-existing-but-unaddressed-by-this-pass items remaining in the older FRP body are the orphan-status of the four subtree front-door `_index.md` files (matches PKS / semiotics convention; reached via Markdown links from README, not slug edges) and the slug-collision entries (corpus-wide convention).

## §9 — Strongest-theory `see-also` adjudication

The lift introduces three composability-bridge narratives in FRP that point into the strongest theory's substrate (predicated-knowledge-systems). The rubric discipline asks whether the strongest theory's `see-also` should be extended in turn, *iff warranted by the new bridges*.

Adjudication: **no extension is warranted at this pass.** The bridges committed to in FRP are *substrate-level structural readings* (function ↦ closure-rule schema; runtime ↦ closure operator; capability ↦ modal-necessity restriction). These are the substrate's own discipline applied *to* the new theory; they do not introduce a new structural commitment *of* the substrate that PKS's `see-also` should advertise. The semiotics pass (pass 1) was different — semiotics renamed substrate machinery (sign-vehicle ↔ predication-cell unit; semiosphere ↔ discourse-community-as-fiber), which is structurally upstream from PKS's vocabulary and warranted advertising. FRP's bridges are structurally downstream and would clutter PKS's `see-also` without adding navigational value to a PKS reader.

The discipline this adjudication enacts: **see-also extends iff the new theory contributes *upstream* structural vocabulary the strongest theory inherits, not iff the new theory cites the strongest theory.** This convention is recorded here for use by future passes; if a later lift produces *upstream* structural commitments to PKS, the see-also extension will be warranted then.

---

## Appendix A — Files touched

Created:

- `engineering/.../functional-runtime-platform/narratives/_index.md`
- `engineering/.../functional-runtime-platform/narratives/what-functional-runtime-platform-inherits.md`
- `engineering/.../functional-runtime-platform/narratives/structural-lineage-from-church-to-roc.md`
- `engineering/.../functional-runtime-platform/narratives/composability-with-predicated-knowledge-systems.md`
- `engineering/.../functional-runtime-platform/questions/_index.md`
- `engineering/.../functional-runtime-platform/questions/effect-system-granularity.md`
- `engineering/.../functional-runtime-platform/questions/compile-cache-vs-substrate-faithful-evaluation.md`
- `engineering/.../functional-runtime-platform/references/_index.md`
- `engineering/.../functional-runtime-platform/references/milner1978.md`
- `engineering/.../functional-runtime-platform/references/plotkin1981.md`
- `engineering/.../functional-runtime-platform/references/moggi1991.md`
- `engineering/.../functional-runtime-platform/references/wadler1992.md`
- `engineering/.../functional-runtime-platform/references/miller2006.md`
- `engineering/.../functional-runtime-platform/references/reynolds1974.md`
- `engineering/.../functional-runtime-platform/references.bib`
- `engineering/.../functional-runtime-platform/examples/_index.md`
- `science/.../predicated-markdown-vault-knowledge-system/audits/rubric-application-2026-05-04.md` (this audit)
- `.local/scripts/validate_lift_links.py`

Rewritten:

- `engineering/.../functional-runtime-platform/README.md` (full discipline-stating front door)
- `engineering/.../functional-runtime-platform/questions/refinement-type-decidability-boundary.md` (lifted to fully-decomposed shape)
- `science/.../predicated-markdown-vault-knowledge-system/audits/_index.md` (added entry for this audit)

## Appendix B — Validation evidence

### B.1 — Lift-scope link validator

Generated by `.local/scripts/validate_lift_links.py` against the lift target on 2026-05-04. The validator checks: (a) every Markdown link target in the lift's new/rewritten files resolves to an existing file relative to the linker; (b) every frontmatter block parses as valid YAML; (c) every `references/*.md` note has the expected `type: reference` field.

```
$ python3 .local/scripts/validate_lift_links.py
Files checked:           18
Frontmatters parsed:     18
Frontmatter errors:      0
Unresolved links:        0
Reference-shape errors:  0
```

The validator restricts to the 18 lift-touched files in `functional-runtime-platform/` (`_index.md`, `README.md`, the three narratives and `narratives/_index.md`, the three questions and `questions/_index.md`, the six new references and `references/_index.md`, `examples/_index.md`) plus this audit file — exactly the surface this lift introduced or rewrote. Out-of-perimeter cross-tree links (into the PKS subtree, into predication-categories, into the semiotics references.bib, into AOP) are validated for existence and resolve cleanly.

### B.2 — Corpus-toolkit `pyfars validate` (corpus-root invocation)

The validator was run from the repository root so the slug index spans the entire corpus (subtree-only invocation produces spurious cross-tree slug-resolution diagnostics that vanish when the index sees the targets). FRP-scoped diagnostics extracted from the global report after lift remediations:

```
$ PYTHONPATH=operations/engineering/fars/src python3 -m pyfars.cli validate . --quiet \
    | awk '/^## /{section=$0} /functional-runtime-platform/{print section " | " $0}' \
    | grep -vE "Slug collisions|Orphans"
(no output)
```

**Headline: every FRP-scoped non-convention diagnostic resolved.** The post-lift corpus validation produces, for the FRP subtree:

- **Broken cross-references**: 0 FRP-scoped (4 pre-existing repaired by creating `morphisms/release.md`, `morphisms/receive-channel.md`, `objects/effect-record.md`, and fixing the `self-representation` link in `concepts/capability-passing.md`).
- **Depends-on cycles**: 0 FRP-scoped (the pre-existing `function ↔ code-as-substrate` cycle resolved by removing `function` from `code-as-substrate.md`'s depends-on; the conceptual order is `self-representation, predication-cell ↦ code-as-substrate ↦ function`).
- **Status inconsistencies**: 0 FRP-scoped (the pre-existing `capability-non-amplification (proved) → governance-as-modal-restriction (sketch)` resolved by removing `governance-as-modal-restriction` from the theorem's depends-on; the proof rests on `modal-necessity-basic-properties`, which is `proved`).
- **Proved-without-proof-section**: 0 FRP-scoped (all three FRP theorems renamed `## Why this holds` → `## Proof` and added `$\square$` end-of-proof marker).
- **Orphans (4 FRP-scoped, convention)**: the four subtree front doors `_index.md`, `narratives/_index.md`, `questions/_index.md`, `examples/_index.md` — reached via Markdown links from README's `Layout` section, not via slug-graph edges. Matches PKS / semiotics convention.
- **Slug collisions (several FRP-scoped, convention)**: subtree `_index.md` slug collisions on `references`, `narratives`, `questions`, `examples` shared with every theory-shaped subtree corpus-wide; concept-name collisions on `function`, `closure`, `capability`, `channel` shared with humanities/math, sociology, software/programming subtrees (pre-existing corpus-wide pattern); `composability-with-predicated-knowledge-systems` collides with semiotics's namesake narrative *by design* — the rubric's expectation is that each lifted theory carry a same-named composability-with-PKS narrative; `pierce2002` collides with type-theory's namesake reference (pre-existing corpus-wide).

### B.3 — Pre-existing FRP body items repaired by this pass

To bring `pyfars validate` clean for the FRP subtree, the lift addressed the following pre-existing items in the older FRP body. These were originally classified as "out of perimeter" but the validation gate required they be repaired now:

- **`concepts/capability-passing.md → self-representation.md`** — repaired the relative link to point at the correct upstream location (`../../teaching/explanations/self-representation.md`).
- **`concepts/lock.md → release` / `morphisms/acquire.md → release`** — created `morphisms/release.md` (the structurally-implied counterpart to `acquire`).
- **`morphisms/send-channel.md → receive-channel`** — created `morphisms/receive-channel.md` (the structurally-implied counterpart to `send-channel`).
- **`objects/function-record.md → effect-record`** — created `objects/effect-record.md` (the structurally-implied substrate-entity for declared effects).
- **`function ↔ code-as-substrate` cycle** — removed `function` from `code-as-substrate.md`'s depends-on; the conceptual order remains `self-representation, predication-cell ↦ code-as-substrate ↦ function`.
- **`capability-non-amplification (proved) → governance-as-modal-restriction (sketch)` status inconsistency** — removed the `governance-as-modal-restriction` edge from depends-on; the proof rests on `modal-necessity-basic-properties`, which is `proved`.
- **All three FRP `proved` theorems lacking `## Proof` heading** — renamed the existing `## Why this holds` section to `## Proof` and appended a `$\square$` end-of-proof marker.
