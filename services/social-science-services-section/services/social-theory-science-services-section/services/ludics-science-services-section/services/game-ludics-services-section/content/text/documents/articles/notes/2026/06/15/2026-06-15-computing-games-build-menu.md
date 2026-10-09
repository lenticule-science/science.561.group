---
title: "Computing · Games · Ludics — the buildable discovery menu"
description: "A ranked, citation-backed menu of buildable constructions fusing the computing, games, and ludics layers, plus the deeper math-discovery menu (Seely, μ/ν recursion, traced/Y, the ludics↔CGS bridge, the bigraded-H¹ projection, the predication hyperdoctrine, Verdier, MLD moduli). Salvaged and curated from the 2026-06-15 enrichment session."
date: 2026-06-15
status: salvaged-research-note
keywords: ["computing-games-ludics-fusion", "build-menu", "seely-axioms", "mu-nu-recursion", "traced-monoidal", "design-morphism-bridge", "bigraded-cohomology", "predication-hyperdoctrine", "verdier-duality", "mld-moduli"]
date-created: 2026-06-15
---


This note curates the **enrichment discovery menu** produced during the 2026-06-15 session: a de-duplicated, citation-backed, build-confidence-ranked list of constructions that fuse the `@emsenn/computing`, `@emsenn/games`, and ludics layers, together with the deeper *math-discovery* menu of frontier playground pieces (twisted Beck–Chevalley, Verdier duality, MLD moduli, the hyperdoctrine, etc.).
It is meant to be read as a build backlog: each item has a one-line description, a first concrete deliverable, the law it would machine-check, the carriers it reuses, and corpus citations.

Two facts grounded the whole menu and should ground any pickup:

- **Everything was verified against the live tree.** Confirmed present and reusable: `cut` / `normalize` / `cutElimination` (`lib/games/src/logic/computational-ludics.mts`); `compose` / `copycat` / `morphismEqual` / `morphism` / `strategy` (`lib/computing/src/category/morphism.mts`); `bang` / `bangMap` / `bangPreservesIdentity` (`lib/computing/src/category/exponential.mts`); `GirardWitness` / `girardJudgment` (`lib/computing/src/cartesian/exponential.mts`); `federationCohomology` / `BigradedH1` / `CoordinateClass` / `ProjectionFixedPoint` (`lib/computing/src/computer/federation.mts`); `observe` / `observeReading` / `SettledMeme` / `Observation` (`lib/computing/src/computer/observation.mts`); `run` / `RunJudgment` (`lib/computing/src/computer/run.mts`); `arena` / `discreteArena` (`lib/games/src/algebra/arena.mts`); `Design` / `designFromActs` / `designCharge` (`lib/games/src/algebra/design.mts`).
- **Test convention is `node --test`** over built `.test.mjs`.
  The deliverables are mostly small law/test modules against carriers that already build, which is why so many rank "high confidence."

---

## Part A — the fusion build menu (ranked top 8, computing × games × ludics)

### De-duplication (merges applied)

- **Least/Greatest Fixed Points** is the dependency core of **Traced Monoidal**.
  The trace item carries the trace axioms; the `fixedPoints.mts` module (`Endofunctor`, `leastFixedPoint`, `lambek`) is its prerequisite.
- **Bigraded cohomology projection** + **Bigraded Settling Cohomology** + **Tick Fan-In Cohomology** all sit on `federationCohomology`'s `ProjectionFixedPoint` / `BigradedH1`.
  The projection is the primitive; tick arbitration applies it to intra-tick concurrency; the 2-categorical lift generalizes it.
  Shared-file cluster: all touch `federation.mts` reads.
- **Design-to-Morphism** + **Cut-composition** + **Sequential-design** form the **ludics-bridge** cluster (all need `morphismToDesign` / `designToMorphism` + `playToActions`).
  The bridge is built first; the others consume it.
- **Predication Fibration**, **Beck-Chevalley / Settling-coalgebra**, **duality** form the **hyperdoctrine** cluster (all touch a new `predication-hyperdoctrine/`).
- **Rooms / dialogue / commands / forks / tick** form the **games-computer application** cluster on `observe` / `run`.

### Rank 1 — Seely's axioms as machine-checked laws - **front:** enrich-computing · **confidence:** high · **size:** small - Operational verification that the `!
`-comonad satisfies Seely's distributivity (`!
A⊗!
B ≅ !
(A⊗B)`, `!𝟙 ≅ I`) as bounded-copy-stage morphism equalities. - **deliverable:** `lib/computing/src/category/seelys-axioms.test.mts` — `distributivityTensor(A,B,copies)`, `distributivityUnit(copies)`, `seelyStrongMonoidal(A,B,C,copies)`, quadrilateral coherence. **Law:** the play-set isomorphism `plays(bang(tensor(A,B),n)) ≅ plays(tensor(bang(A,n),bang(B,n)))` via `strategyPlaysEqual` / `arenaEqual`. - **citations:** `lib/computing/src/category/exponential.mts`, `.../exponential-comonad.test.mts`, `.../star-autonomous-category/hacking/library/exponential-bang/docs/dev/journal/2026-05-26.md` - **why #1:** Pure test module against fully-built carriers — lowest risk to ship green, and it certifies the `!
`-comonad that #2/#3/#5 all depend on.

### Rank 2 — Least/Greatest fixed points (μ/ν) + recursion operators - **front:** realize-nascent · **confidence:** high · **size:** medium - Recursive types as initial-algebra / terminal-coalgebra fixed points of endofunctors in the Kleisli CCC, via Lambek's lemma over `!
`-comonad stages. - **deliverable:** `lib/computing/src/cartesian/fixedPoints.mts` — `Endofunctor`, `iteratedApplication(F,n,base)`, `leastFixedPoint(F,stages)`, `greatestFixedPoint(F,stages)`, `lambek(F,μF): LambekWitness`, plus `listType` / `treeType` / `streamType`. **Law:** Lambek isomorphism — the structure map `μF → F(μF)` is invertible (`morphismEqual(compose(in, inInverse), copycat(μF))`). - **citations:** `.../chl-apex-recursion/docs/dev/journal/2026-05-26.md`, `lib/computing/src/cartesian/exponential.mts`, `lib/computing/src/category/exponential.mts`, `lib/games/src/logic/computational-ludics.mts` - **why #2:** Unlocks recursion — the single most capability-bearing missing primitive — and is the hard dependency under the trace structure (#5).

### Rank 3 — Design-to-Morphism bridge (the headline ludics↔computing fusion) - **front:** enrich-computing · **confidence:** high · **size:** medium - A witness functor proving Girard designs (under cut) correspond exactly to computing morphisms (under interaction-plus-hiding) — the literal computing↔ludics fusion (the executable Faggian–Hyland correspondence). - **deliverable:** `lib/computing/src/category/ludics-bridge/design-morphism.mts` — `designToMorphism(d,arena)`, `morphismToDesign(m)`, `playToActions` / `chronicleToPlays`, `compositionPreserved(d1,d2): CompositionWitness`. **Law:** `cut(d1,d2)` normal form maps to `compose(designToMorphism d1, designToMorphism d2)` with equal play sets (`strategyPlaysEqual`). - **citations:** `.../ludics/library/design/cut/docs/dev/journal/2026-05-24.md`, `.../ludics/library/design/docs/dev/journal/2026-05-24.md`, `lib/computing/src/category/morphism.mts`, `lib/games/src/algebra/design.mts`, `lib/games/src/logic/computational-ludics.mts` - **why #3:** The headline "not-in-training-data" fusion — makes the Faggian–Hyland correspondence executable on the repo's own carriers.
Both sides (`cut`, `compose`) are already built and tested; the work is the translation layer.

### Rank 4 — Bigraded cohomology projection morphism - **front:** enrich-computing · **confidence:** high · **size:** small - Machine-checked idempotent projection witnesses splitting `H¹ = H¹_t ⊕ H¹_top`, reusing federation cohomology's coordinate split. - **deliverable:** `lib/computing/src/computer/bilattice-projection.mts` — `ProjectionWitness<C>`, `ProjectionFixedPoint` decomposition, `projectH1(cohom, coordinate)`. **Law:** `π∘π = π` per coordinate, and total partition (every `H¹` generator lands in exactly one of `H¹_t` / `H¹_top`). - **citations:** `.../chl-apex-recursion/hacking/library/bigraded-h1-projection-fixed-point/docs/dev/journal/2026-05-26.md`, `lib/computing/src/computer/federation.mts` - **why #4:** Tiny, high-confidence, and it is the primitive that #8 (tick arbitration) and the settling-cohomology lift both consume.

### Rank 5 — Traced monoidal structure on CGS (feedback / Y-combinator) - **front:** realize-nascent · **confidence:** high · **size:** medium - Joyal trace on CGS enabling feedback loops, the Y fixed-point combinator, and recursive type solutions. - **deliverable:** `lib/computing/src/category/traced.mts` — `TraceWitness`, `trace(σ: Morphism<A⊗X,B⊗X>): Morphism<A,B>` (synchronize X-moves across copies, hide X-interface), `fixedPoint(F)` via #2's colimit staging. **Law:** the five trace axioms (yanking, superposing, tightening, naturality) as play-set equalities, plus `trace` of the codiagonal = the Y combinator on a recursive PCF type. - **citations:** `lib/computing/src/category/{index,morphism,object}.mts`, `.../chl-apex-recursion/docs/dev/journal/2026-05-26.md` - **why #5:** Maximally capability-unlocking (feedback + recursion = a Turing-complete fusion of computing and games), but depends on #2.

### Rank 6 — Sequential-membership lift: Hyland-Ong from ludic designs - **front:** enrich-computing · **confidence:** high · **size:** small - Make Hyland-Ong sequential/innocent strategies machine-checkable as focused designs satisfying coherence + alternation. - **deliverable:** `lib/computing/src/paradigm/sequential-design.mts` — `isSequentialDesign(d): boolean` (coherence + per-chronicle innocence), `hoStrategyToDesign(s): Design | null`. **Law:** an innocent strategy maps to a coherent design and back to the same play set (round-trip via the #3 bridge). - **citations:** `.../ludics/library/design/docs/dev/journal/2026-05-24.md`, `lib/computing/src/paradigm/sequential.mts`, `lib/games/src/algebra/chronicle.mts`, `lib/games/src/algebra/strategy.mts`

### Rank 7 — Cut composition on morphisms - **front:** realize-nascent · **confidence:** high · **size:** medium - Girard cut-elimination as an executable composition law on the category of strategies (an alternative to interaction-plus-hiding). - **deliverable:** `lib/computing/src/category/ludics-bridge/cut-composition.mts` — `cutCompose(m1,m2): Morphism` (via `morphismToDesign → cut → designToMorphism`), `cutAssociativityWitness(m1,m2,m3)`. **Law:** `cutCompose` and `compose` generate equal play sets (`morphismEqual`); `cutCompose` is associative (Girard cut-associativity) with `copycat` as identity (the Fax design). - **citations:** `.../ludics/library/design/cut/docs/dev/journal/2026-05-24.md`, `.../ludics/interaction/docs/dev/journal/2026-05-24.md`, `lib/computing/src/category/morphism.mts`, `lib/games/src/logic/computational-ludics.mts` - **why #7:** Proves two composition disciplines coincide — a genuinely novel, load-bearing equivalence.
Strictly downstream of #3.

### Rank 8 — Tick fan-in cohomology for concurrent action arbitration - **front:** enrich-computing · **confidence:** high · **size:** small - Tick-boundary concurrency arbitration as `H¹_t ⊕ H¹_top` over concurrent session inputs — truth-disagreements arbitrated by sub-tick order, inconsistencies witnessed (not hidden) as `⊤`. - **deliverable:** `lib/computing/src/computer/tick-cohomology/tick-cohomology.mts` — `tickObservation(inputs, worldReading): FederationCohomology` (each session = a federation site), `arbitrateConflict(cohomology, cell): ChargeValue`, `TickSettlement`. **Law:** `H¹_top` cells are immutable under coordinate-wise join (paraconsistent containment), and the tick is deterministic (same order ⇒ same settlement). - **citations:** `.../tab/docs/dev/notes/concurrency-and-the-tick.md`, `lib/computing/src/computer/federation.mts`, `services/fizzos/docs/dev/tick-runtime.md`, `.../theories/agency/library/agent/running/tick/tick.md`

### Just below the cut (build-ready, lower leverage or higher risk) - **Room arena derivation** (`lib/games/src/computer/rooms/`, high conf) — independent, no deps; good parallel filler.
Reuses `observe` / `discreteArena`. - **Command resolution as strategy application** (`lib/computing/src/computer/commands/`, high conf) — depends on rooms + `run`. - **Dialogue design as interaction morphism** (`lib/games/src/computer/dialogue/`, high conf) — depends on rooms. - **Predication fibration with quantifier adjoints** (`lib/computing/src/category/predication-hyperdoctrine/`, high conf, large) — entry to the hyperdoctrine cluster; large surface, defer. - *Medium-confidence / defer:* GoI token machine, full-abstraction, behaviour-as-closed-design, Verdier duality, MLD-quotient. *Speculative:* aperiodic arithmetic.

### Build order, parallelism

**Dependency chains (serialize):** 1.
`#1 Seely (test-only)` → `#2 fixedPoints.mts` → `#5 traced.mts` (recursion spine).
2.
`#3 design-morphism.mts` → { `#6 sequential-design.mts`, `#7 cut-composition.mts` } (ludics-bridge; #6/#7 independent of each other but both need #3).
3.
`#4 bilattice-projection.mts` → `#8 tick-cohomology.mts` (cohomology projection spine).

**Three independent lanes (parallel across lanes, all on `main`, no branches):**

| Wave | Lane A (recursion) | Lane B (ludics-bridge) | Lane C (cohomology + games-app) |
|------|--------------------|-----------------------|--------------------------------|
| 1 | **#1 Seely** (test) | **#3 design-morphism** | **#4 bilattice-projection** + **Room Arena** |
| 2 | **#2 fixedPoints** | **#6 sequential-design** ∥ **#7 cut-composition** | **#8 tick-cohomology** + **Command Resolution** |
| 3 | **#5 traced** | — | **Dialogue Design** |

Shared-file contention to watch: `computing/computer/federation.mts` readers (#4, #8) write to *new* files (safe to parallelize); `computing/category/ludics-bridge/` is shared by #3/#7 but distinct files; `computing/{cartesian,category}/index.mts` barrel edits by #2/#5 must be serialized (or batched at the end of each chain).

**Highest-leverage first prompt:** ship **#1 Seely** (smallest, certifies the `!
`-comonad everything leans on) and **#3 design-morphism** (the headline fusion) in parallel — high-confidence, disjoint files, unblock the two most valuable chains.

---

## Part B — the deeper math-discovery menu (frontier playground pieces)

This is the strange-math layer the fusion menu sits on.
These are the buildable-but-harder constructions, with corpus citations into the predication-categories archive.
All paths below are under `content/...predication-categories/` (buckets 1–4) and the `voidmath` triage.

### B1 — Full-K₄ twisted Beck–Chevalley *(highest math priority)* The `≤_k`-axis twisted Beck–Chevalley is **proved but partial**: `∃ᵏ_{p_A,A}((p_B)*_A φ) ≅ f*_A(∃ᵏ_{g,A} φ)` for gauge connections valued in `K₄ᵏ = {e, ∼}`.
The naive `≤_t`-axis **fails** because `−(⊥) = ⊤` breaks commutativity with cellwise reindexing.
The open work: gauge the cleavage extension convention (specialization extends by `⊥`; under `−`-twist this becomes `⊤`), gauge the quantifier polarities (order-reversing elements swap `∃ ↔ ∀`), and establish the `≤_t`-axis sub-result with extension-by-`f`. - **citation:** `.../predication-categories/bucket-1/prose/learning/claims/twisted-beck-chevalley.md` - **payoff:** completes the gauge structure to all four quadrants; opens full-K₄ twisted equivariant cohomology (currently open).

### B2 — Twisted equivariant cohomology decomposition (all axes) The `≤_k`-axis decomposition is **fully proved**: `Hⁿ(𝒞, 𝒢_v ⊗ᴬ_{K₄}) ≅ ⊕_{χ ∈ K̂₄} Hⁿ(𝒞, 𝒢_v^χ ⊗ ℒ_{χ,A})`, with a character-sector survival table — non-trivial `∼`-holonomy kills the `χ_∼` and `χ_{∼∘−}` sectors, thinning the 4-sector strong-MLD invariant to a 2-sector connection-dependent invariant.
Open: the `≤_t`-axis and full-K₄ decompositions (both depend on B1), and a possible pseudo-functorial `H²` curvature. - **citation:** `.../bucket-1/prose/learning/claims/twisted-equivariant-cohomology-decomposition.md`

### B3 — Predicate-generator exhaustiveness and composition For `|E| ≥ 3`, every natural bottom-preserving bilattice homomorphism between predication fiber algebras `A = L^{⋈ E×E}` **factors through compositions of the four predicate generators** (identity, converse, subject-collapse, object-collapse), with `Sym(E)`-naturality forcing the equivariant map.
There is a composition table giving the fundamental group of the generators on single binary predicates. - **citations:** `/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md`, `.../bucket-3/theorems/predicate-generator-composition-table.md`, `.../bucket-1/prose/learning/claims/predicate-morphism-residuation-naturality.md`

### B4 — Flat gauge connections classified by H¹ The moduli of gauge connections on a predication hyperdoctrine modulo gauge equivalence is canonically `H¹(N𝒞, K₄)` ≅ `Hom(π₁(𝒞), K₄)/conj` (trivial conjugation since `K₄` is abelian).
Tree-shaped predicate categories have `π₁ = 1`, so `H¹ = 0`; converse-loops give non-trivial gauge content; single binary predicates give a finite moduli. - **citation:** `.../bucket-1/prose/learning/claims/flat-connections-classified-by-h1.md`

### B5 — Verdier duality on the bitopological settling site (firm the spatial side) The spatial Verdier duality `Sh_Q(T*,J) ≃ coSh_Q(T*,J)` (Q-enriched sheaf↔cosheaf derived equivalence, generalizing Curry 2014 to non-abelian d-frame data on Grothendieck sites) is **sketch-status** and **q-fuzzy** (a quantale-graded error parameter measuring distance from strict equivalence; Boolean ⇒ `q=1`, strict).
Layers 1–2 are draft (per-fiber Curry assembles globally); Layer 3 (transfinite/`ω₁`-cofinal) is open.
The composed duality `D = D_sp ∘ D_val` (spatial Verdier ∘ bilattice negation) commutes; a settling is **self-dual iff every firing is a ⊤- or ⊥-firing** (the paraconsistent strata, size-1 orbits; truth-only ↔ falsity-only are exchange-paired size-2 orbits). - **citations:** `.../bucket-3/theorems/verdier-duality-bitopological-site.md`, `.../bucket-1/prose/learning/claims/d-frame-verdier-composition.md`

### B6 — Lawvere Laplacian on arbitrary Grothendieck sites The **locality-preserves-sheafhood lemma**: `L` is a Q-functor, Q-functors preserve weighted limits (including the sheaf-condition equalizer, via Kelly / Stubbe machinery), so `L(F)` is a sheaf whenever `F` is.
Extends Ghrist–López– North–Riess 2025 (graph-indexed) to arbitrary sites; the Tarski–Lawvere fixed-point theorem then runs uniformly across all four regimes.
Layer 1 abstractly proved; Layers 2–3 open. - **citation:** `.../bucket-3/theorems/lawvere-laplacian-grothendieck-sites.md`

### B7 — Void-cone cohomology and the apex–void match The void cone carries the associated graded of the void filtration `⊕_{μ ∈ L_ns} ℤ` (one generator per non-Scott-continuous firing), isomorphic via Verdier duality to the dual cosheaf homology `H₁(F̌_v)` and matching the apex `H¹(F_v)` with firing-ordinal indexing on both sides.
The chain-level identity `rank H¹(apex) = rank gr(Void)` holds independently of the categorical Verdier gap.
(This is what the live `@red-cup-engineering/metrologic/obstruction` `apexVoidMatch` checks.)
An alternative route is the void-filtration spectral sequence. - **citations:** `.../bucket-1/prose/learning/claims/void-cone-cohomology.md`, `.../bucket-1/prose/learning/claims/void-cone-via-filtration-ss.md`

### B8 — Dihedral D₄ symmetry on twist products For any de Morgan algebra `L`, the order-swap `σ⟨a,b⟩ = ⟨a, ¬b⟩` intertwines the two orders (`≤_k` ↔ `≤_t`); with the Klein-four `K₄ = ⟨∼,−⟩` it generates the dihedral group `G₈ ≅ D₄`.
The five order-4 subgroups give five distinct refinement equivalences on settlings; the full `D₄`-orbit stratification is strictly finer.
Open: non-symmetric `L₁ ⊗ L₂` extensions. - **citation:** `.../bucket-1/prose/learning/claims/dihedral-symmetry-on-twist-products.md`

### B9 — Chu(2,0) ≅ FOUR and the linear-logic model (substructural refinement) Jakl 2025 Lemma 3.1: `Chu(H,0)` over a Heyting algebra is exactly the consistent sub-algebra `{(a₊,a₋) : a₊∧a₋ = 0}` of `H^⋈`, with Chu tensor = fusion `⊙` and Chu `⊸` = twist implication `⇒`; specializing `H = 2` gives **FOUR ≅ Chu(2,0)**, a `*`-autonomous object.
The *full* (inconsistent) twist product **extends** the Chu model past consistency: `⊤ = (1,1)` has no Chu counterpart yet does not trivialize the multiplicative laws — the literal content of "paraconsistent many-valued linear logic."
Open: weakening/contraction (require a modality or non-residuated ops), a Dialectica embedding of settlings, and the proof-theoretic completeness of settling-as-linear-logic.
(Caveat: naive contraposition fails; use the Nelson implication, Chajda–Langer 2021.) - **citations:** `.../bucket-1/prose/learning/claims/twist-product-chu-correspondence.md`, `.../bucket-4/.../math/logic/chu-space/chu-space.md`, `.../2026/06/01/voidmath-kernel/docs/dev/notes/2026-06-01-evidence-the-carrier-and-the-chu-root.md`

### B10 — Frobenius reciprocity (the failure that is informative) Frobenius `∃_f(f*α ⊙ φ) = α ⊙ ∃_f(φ)` **fails** for specialization, subject-projection, and object-projection (the fusion absorber `f` does not match the `≤_k`-extension default `⊥`); it **holds for converse only** (coordinate swap, no `⊥`-extension).
Structurally: Beck–Chevalley is pullback-coherence; Frobenius additionally needs absorber-alignment. - **citation:** `.../bucket-1/prose/learning/claims/frobenius-for-fusion-fails.md`

### B11 — TQFT structure of settling cohomology The settling-cohomology functor `Z = H•(F_{(-)}) : Cob_settling → Mod_ℤ` is a symmetric monoidal functor satisfying Atiyah's TQFT axioms: empty boundary → `ℤ`, disjoint union → tensor, Verdier duality → linear dual, closed cobordisms → integer (partition function = Euler characteristic), each boundary a commutative Frobenius algebra `K₄`-graded by the equivariant decomposition.
Settlings are cobordisms; closure dynamics are compositions; FOUR-with-Klein-gauge is the coefficient system. - **citation:** `.../bucket-1/prose/learning/claims/tqft-structure.md`

### B12 — Four-regime dichotomy and the MLD moduli stack The regime of a settling is **completely determined by the syntactic fragment** of its closure-rule language: propositional → strict/finite (`H¹ = 0`); `Σ⁰` → Scott-continuous (`H¹ = 0`); `Π₁` → transfinite-bounded (`H¹ = ⊕_{μ ∈ L_ns} ℤ`); higher `Πₙ`/`Σₙ` → aperiodic (`H¹` of dimension `ω₁`).
Two aperiodic settlings are **MLD-equivalent iff their H¹ classes agree** (a uniform cohomological criterion, vs. case-by-case topological-dynamics conjugacy).
The **settling moduli stack `M^SKH`** is unobstructed (every first-order deformation extends, `Ext² = 0`); the tangent space is stratified by regime (rigid / `|L_ns|`-dim / `ω₁`-dim) and the stratification is **upper-semicontinuous** (deformations move complexity up, never down).
The **CHL apex recursion** (settling → moduli → meta-moduli) **stabilizes in the Boolean d-frame case** with `Π₁` rules; non-Boolean enrichments (Lawvere quantales, MV algebras) may make it genuinely unbounded. - **citations:** `.../bucket-3/theorems/four-regime-dichotomy.md`, `.../bucket-3/theorems/biequivalence-cohomological-collapse.md`, `.../bucket-3/theorems/settling-moduli-stack-theorem.md`, `.../bucket-3/theorems/skh-deformation-ext-classification.md`, `.../bucket-3/theorems/chl-recursion-stabilization-check.md`

### B13 — Closure-ordinal realization and Pisot accumulation Every finite ordinal is realized as a closure ordinal (proved); a systematic `Π_n`-recursion sketches every countable ordinal (open at `ω₁`), suggesting closure ordinals are precisely the countable ordinals (with an open relationship to the Church–Kleene `ω₁^CK`).
Along the `n`-bonacci substitution family the Perron eigenvalue `λ_n` is Pisot, monotone increasing, **converging to 2** (`λ₂ = φ`, `λ₃ ≈ 1.839` tribonacci, `λ₄ ≈ 1.928` …), a candidate renormalization-group critical exponent (conditional on the canonical-step-shift question). - **citations:** `.../bucket-3/theorems/closure-ordinal-realization-finite.md`, `.../bucket-3/theorems/critical-exponents-at-step-n-fixed-point.md`

---

## Literature anchors (cited across the menu)

Belnap 1977 (four-valued logic); Ginsberg 1988, Fitting (bilattices); Kalman 1958 / Avron 1996 (twist-product representation theorem — forces the pair shape); Busaniche–Cignoli 2014 (fusion ⊙ and strong implication ⇒ on twist products); Jakl 2025 *Four Imprints of Belnap's Four-Valued Logic* (Lemma 3.1, Chu(H,0) ≅ bilattice); Jung–Moshier 2006 / Jakl 2018 (d-frames as duals of bitopological spaces); Curry 2014 (cellular sheaf-cosheaf Verdier, abelian); Hansen–Ghrist 2019, Ghrist–Riess 2022 (Tarski Laplacian), Ghrist–López–North–Riess 2025 (Lawvere Laplacian on quantale-enriched lattices), López 2024 (fuzzy adjoints); Anderson–Putnam (substitution-tiling direct-limit cohomology); Knaster–Tarski (closure fixed points); Girard 2001 *Locus Solum* (ludics); Faggian–Hyland 2002 (designs ↔ HO sequential strategies); Rideau–Winskel, Castellan–Clairambault– Winskel (concurrent game systems).
