---
title: "Computing/Games/Ludics fusion build menu (ranked 30 specs, top 8 delivered)"
description: "A verification-grounded, ranked build menu of the highest-value computing/games/ludics fusion constructions for @emsenn/computing and @emsenn/games, with the top 8 specs, dependency chains, and a parallel wave plan."
date: 2026-06-15
status: salvaged-from-tmp
source: "/tmp/claude-1001/-home-emsenn-561-group/bb290d44-ff2c-4080-9712-dedaf11fd682/tasks/wcikhda5u.output"
date-created: 2026-06-15
---

# BUILD MENU — Fusing Computing · Games · Ludics

**Verification done against live tree.** Confirmed present and reusable: `cut`/`normalize`/`cutElimination` (`games/logic/computational-ludics.mts`), `compose`/`copycat`/`morphismEqual`/`morphism`/`strategy` (`computing/category/morphism.mts`), `bang`/`bangMap`/`bangPreservesIdentity` (`computing/category/exponential.mts`), `GirardWitness`/`girardJudgment` (`computing/cartesian/exponential.mts`), `federationCohomology`/`BigradedH1`/`CoordinateClass`/`ProjectionFixedPoint` (`computing/computer/federation.mts`), `observe`/`observeReading`/`SettledMeme`/`Observation` (`computing/computer/observation.mts`), `run`/`RunJudgment` (`computing/computer/run.mts`), `arena`/`discreteArena` (`games/algebra/arena.mts`), `Design`/`designFromActs`/`designCharge` (`games/algebra/design.mts`).
Test convention: `node --test` over built `.test.mjs`.

## De-duplication (merges applied)

- **#3 Least/Greatest Fixed Points** is subsumed as the dependency core of **#1 Traced Monoidal**.
  Merged: #1 carries the trace axioms; #3's `fixedPoints.mts` (`Endofunctor`, `leastFixedPoint`, `lambek`) is its prerequisite module.
  Citations pooled (chl-apex-recursion journal + cartesian/exponential + category/exponential).
- **#6 Bigraded cohomology projection** + **#16 Bigraded Settling Cohomology** + **#31 Tick Fan-In Cohomology** all sit on `federationCohomology`'s `ProjectionFixedPoint`/`BigradedH1`. #6 (idempotent π_t/π_top witnesses) is the primitive; #31 applies it to intra-tick concurrency; #16 lifts it 2-categorically.
  Kept distinct by layer but flagged as a shared-file cluster (all touch `federation.mts` reads).
- **#11 Design-to-Morphism** + **#12 Cut-composition** + **#13 Sequential-design** form the **ludics-bridge** cluster (all need `morphismToDesign`/`designToMorphism` + `playToActions`). #11 builds the bridge; #12 and #13 consume it.
  Merged citations: ludics/design/cut + ludics/interaction journals.
- **#15 Predication Fibration**, **#17/#18 Beck-Chevalley/Settling-coalgebra**, **#19/#20 duality** form the **hyperdoctrine** cluster (all touch a new `predication-hyperdoctrine/`). #15 is the entry primitive.
- **#26–#31 (rooms/dialogue/commands/forks/tick)** form the **games-computer application** cluster on `observe`/`run`.

---

## RANKED TOP 8

### Rank 1 — Seely's Axioms as Machine-Checked Laws - **front:** enrich-computing · **confidence:** high · **size:** small - **one-line:** Operational verification that the `!
`-comonad satisfies Seely's distributivity (`!
A⊗!
B ≅ !
(A⊗B)`, `!𝟙 ≅ I`) as bounded-copy-stage morphism equalities. - **first deliverable:** `lib/computing/src/category/seelys-axioms.test.mts` — tests `distributivityTensor(A,B,copies)`, `distributivityUnit(copies)`, `seelyStrongMonoidal(A,B,C,copies)`, and quadrilateral coherence. **Law machine-checked:** play-set isomorphism `plays(bang(tensor(A,B),n)) ≅ plays(tensor(bang(A,n),bang(B,n)))` via `strategyPlaysEqual`/`arenaEqual`. - **citations:** `lib/computing/src/category/exponential.mts`, `lib/computing/src/category/exponential-comonad.test.mts`, `.../star-autonomous-category/hacking/library/exponential-bang/docs/dev/journal/2026-05-26.md` - **reuses:** `bang`, `bangMap`, `bangPreservesComposition` (category/exponential), `tensor`/`unit` (category/object), `strategyPlaysEqual`/`arenaEqual` (category/morphism), `GirardWitness` (cartesian/exponential). - **why ranked #1:** Pure test module against fully-built carriers — lowest risk to ship green, and it certifies the `!
`-comonad that #2/#3/#4 all depend on.
Capability-unlocking with near-zero new surface.

### Rank 2 — Least/Greatest Fixed Points (μ/ν) + Recursion Operators *(merged #3, prereq of #1-trace)* - **front:** realize-nascent · **confidence:** high · **size:** medium - **one-line:** Recursive types as initial-algebra/terminal-coalgebra fixed points of endofunctors in the Kleisli CCC, via Lambek's lemma over `!
`-comonad stages. - **first deliverable:** `lib/computing/src/cartesian/fixedPoints.mts` — `Endofunctor` (arena→arena + morphism action), `iteratedApplication(F,n,base)`, `leastFixedPoint(F,stages)`, `greatestFixedPoint(F,stages)`, `lambek(F,μF): LambekWitness`, plus `listType`/`treeType`/`streamType`. **Law machine-checked:** Lambek isomorphism — structure map `μF → F(μF)` is invertible (`morphismEqual(compose(in, inInverse), copycat(μF))`). - **citations:** `.../chl-apex-recursion/docs/dev/journal/2026-05-26.md`, `lib/computing/src/cartesian/exponential.mts`, `lib/computing/src/category/exponential.mts`, `lib/games/src/logic/computational-ludics.mts` - **reuses:** `bang`/bounded-copy stages, Kleisli CCC (`cartesian/`), `compose`/`copycat`/`morphismEqual`, cut-elimination normalization (ludics). - **why ranked #2:** Unlocks recursion — the single most capability-bearing missing primitive — and is the hard dependency under the trace structure (#5).
Builds on #1's now-certified `!
`.

### Rank 3 — Design-to-Morphism Bridge *(ludics-bridge entry; merges into #12/#13)* - **front:** enrich-computing · **confidence:** high · **size:** medium - **one-line:** A witness functor proving Girard designs (under cut) correspond exactly to computing morphisms (under interaction-plus-hiding) — the literal computing↔ludics fusion. - **first deliverable:** `lib/computing/src/category/ludics-bridge/design-morphism.mts` — `designToMorphism(d,arena)`, `morphismToDesign(m)`, `playToActions`/`chronicleToPlays`, `compositionPreserved(d1,d2): CompositionWitness`. **Law machine-checked:** `cut(d1,d2)` normal-form maps to `compose(designToMorphism d1, designToMorphism d2)` with equal play sets (`strategyPlaysEqual`). - **citations:** `.../ludics/library/design/cut/docs/dev/journal/2026-05-24.md`, `.../ludics/library/design/docs/dev/journal/2026-05-24.md`, `lib/computing/src/category/morphism.mts`, `lib/games/src/algebra/design.mts`, `lib/games/src/logic/computational-ludics.mts` - **reuses:** `Design`/`Chronicle` (games/algebra), `cut`/`normalize` (games/logic), `Morphism`/`compose`/`strategy` (computing/category). - **why ranked #3:** This is the headline "not-in-training-data" fusion — it makes the Faggian–Hyland correspondence executable on the repo's own carriers.
High confidence because both sides (`cut`, `compose`) are already built and tested; the work is the translation layer.

### Rank 4 — Bigraded Cohomology Projection Morphism *(merges #6 core, feeds #31)* - **front:** enrich-computing · **confidence:** high · **size:** small - **one-line:** Machine-checked idempotent projection witnesses splitting `H¹ = H¹_t ⊕ H¹_top`, reusing federation cohomology's coordinate split. - **first deliverable:** `lib/computing/src/computer/bilattice-projection.mts` — `ProjectionWitness<C>`, `ProjectionFixedPoint` decomposition, `projectH1(cohom, coordinate)`. **Law machine-checked:** `π∘π = π` per coordinate, and total partition (every `H¹` generator lands in exactly one of `H¹_t`/`H¹_top`). - **citations:** `.../chl-apex-recursion/hacking/library/bigraded-h1-projection-fixed-point/docs/dev/journal/2026-05-26.md`, `lib/computing/src/computer/federation.mts` - **reuses:** `federationCohomology`, `BigradedH1`, `CoordinateClass`, `ProjectionFixedPoint`, `cohomologyOfCells` (relationality/topology). - **why ranked #4:** Tiny, high-confidence, and it is the primitive that #31 (tick arbitration) and #16 (settling cohomology) both consume.
The federation machinery already computes the bigraded class; this names and certifies the projections.

### Rank 5 — Traced Monoidal Structure on CGS (Feedback / Y-combinator) *(merges #3 as dependency)* - **front:** realize-nascent · **confidence:** high · **size:** medium - **one-line:** Joyal trace on CGS enabling feedback loops, the Y fixed-point combinator, and recursive type solutions. - **first deliverable:** `lib/computing/src/category/traced.mts` — `TraceWitness`, `trace(σ: Morphism<A⊗X,B⊗X>): Morphism<A,B>` (synchronize X-moves across copies, hide X-interface), `fixedPoint(F)` via #2's colimit staging. **Law machine-checked:** the five trace axioms (yanking, superposing, tightening, naturality) as play-set equalities, plus `trace` of the codiagonal = Y combinator on a recursive PCF type. - **citations:** `lib/computing/src/category/{index,morphism,object}.mts`, `.../chl-apex-recursion/docs/dev/journal/2026-05-26.md` - **reuses:** star-autonomous `tensor`/`par`/`dual`/`lollipop` (category/object), `compose`/`copycat` (morphism), and **#2's `fixedPoints.mts`**. - **why ranked #5:** Maximally capability-unlocking (feedback + recursion = Turing-complete fusion of computing/games), but depends on #2, so it serializes after it.
Confidence high once #2 lands.

### Rank 6 — Sequential-Membership Lift: Hyland-Ong from Ludic Designs *(ludics-bridge consumer)* - **front:** enrich-computing · **confidence:** high · **size:** small - **one-line:** Make Hyland-Ong sequential/innocent strategies machine-checkable as focused designs satisfying coherence + alternation. - **first deliverable:** `lib/computing/src/paradigm/sequential-design.mts` — `isSequentialDesign(d): boolean` (coherence + per-chronicle innocence), `hoStrategyToDesign(s): Design | null`. **Law machine-checked:** an innocent strategy maps to a coherent design and back to the same play set (round-trip via the #3 bridge). - **citations:** `.../ludics/library/design/docs/dev/journal/2026-05-24.md`, `lib/computing/src/paradigm/sequential.mts`, `lib/games/src/algebra/chronicle.mts`, `lib/games/src/algebra/strategy.mts` - **reuses:** `designCoherenceJudgment`/`innocenceJudgment` (games/algebra), `Polarity`/`actionPolarity`, `computing/paradigm/sequential`, **#3's `playToActions`/`designFromActionSet`**. - **why ranked #6:** Small, high-confidence, directly advances the fusion goal (connects an existing paradigm embedding to ludics).
Depends on #3's bridge helpers.

### Rank 7 — Cut Composition on Morphisms *(ludics-bridge consumer)* - **front:** realize-nascent · **confidence:** high · **size:** medium - **one-line:** Girard cut-elimination as an executable composition law on the category of strategies (alternative to interaction-plus-hiding). - **first deliverable:** `lib/computing/src/category/ludics-bridge/cut-composition.mts` — `cutCompose(m1,m2): Morphism` (via `morphismToDesign → cut → designToMorphism`), `cutAssociativityWitness(m1,m2,m3)`. **Law machine-checked:** `cutCompose` and `compose` generate equal play sets (`morphismEqual`), and `cutCompose` is associative (Girard cut-associativity) with `copycat` as identity (Fax design). - **citations:** `.../ludics/library/design/cut/docs/dev/journal/2026-05-24.md`, `.../ludics/interaction/docs/dev/journal/2026-05-24.md`, `lib/computing/src/category/morphism.mts`, `lib/games/src/logic/computational-ludics.mts` - **reuses:** `cut`/`convergence` (games/logic), `compose`/`copycat`/`morphismEqual`, **#3's bridge**. - **why ranked #7:** Proves two composition disciplines coincide — a genuinely novel, load-bearing equivalence.
Confidence high but strictly downstream of #3.

### Rank 8 — Tick Fan-In Cohomology for Concurrent Action Arbitration *(#31, consumes #4)* - **front:** enrich-computing · **confidence:** high · **size:** small - **one-line:** Tick-boundary concurrency arbitration as `H¹_t ⊕ H¹_top` over concurrent session inputs — truth-disagreements arbitrated by sub-tick order, inconsistencies witnessed (not hidden) as `⊤`. - **first deliverable:** `lib/computing/src/computer/tick-cohomology/tick-cohomology.mts` — `tickObservation(inputs, worldReading): FederationCohomology` (each session = federation site), `arbitrateConflict(cohomology, cell): ChargeValue`, `TickSettlement`. **Law machine-checked:** `H¹_top` cells are immutable under coordinate-wise join (paraconsistent containment), and tick is deterministic (same order ⇒ same settlement). - **citations:** `.../tab/docs/dev/notes/concurrency-and-the-tick.md`, `lib/computing/src/computer/federation.mts`, `services/fizzos/docs/dev/tick-runtime.md`, `.../theories/agency/library/agent/running/tick/tick.md` - **reuses:** `federationCohomology`/`BigradedH1`/`CoordinateClass`, **#4's `projectH1`**, `observe`. - **why ranked #8:** High-confidence application that makes the cohomology concrete in a runtime concern (multiplayer tick arbitration), advancing the games side.
Best after #4 names the projections.

---

### Just below the cut (rank 9–12, build-ready, lower leverage or higher risk) - **Room Arena Derivation** (`lib/games/src/computer/rooms/`, high conf) — independent, no deps; good parallel filler.
Reuses `observe`/`discreteArena`. - **Command Resolution as Strategy Application** (`lib/computing/src/computer/commands/`, high conf) — depends on rooms + `run`. - **Dialogue Design as Interaction Morphism** (`lib/games/src/computer/dialogue/`, high conf) — depends on rooms. - **Predication Fibration with Quantifier Adjoints** (`lib/computing/src/category/predication-hyperdoctrine/`, high conf, large) — entry to the hyperdoctrine cluster; large surface, defer. - *Medium-confidence / defer:* GoI Token Machine (#2-large), Full-Abstraction (#4-large), Behaviour-as-closed-design, Verdier duality, MLD-quotient. *Speculative:* Aperiodic arithmetic.

---

## BUILD ORDER & PARALLELISM

**Dependency chains (must serialize):** 1.
`#1 Seely (test-only)` → `#2 fixedPoints.mts` → `#5 traced.mts` *(recursion spine; each depends on prior)* 2.
`#3 design-morphism.mts` → { `#6 sequential-design.mts`, `#7 cut-composition.mts` } *(ludics-bridge; #6/#7 are independent of each other but both need #3)* 3.
`#4 bilattice-projection.mts` → `#8 tick-cohomology.mts` *(cohomology projection spine)*

**Shared-file contention (must serialize within group):** - **`computing/computer/federation.mts` readers:** #4 and #8 both import from it but write to *new* files — safe to parallelize the writes; only serialize if #4 ends up editing `federation.mts` exports (prefer a new module to keep them parallel). - **`computing/category/ludics-bridge/` directory:** #3, #7 share the dir but distinct files — parallel-safe once #3's exports are committed. - **`computing/cartesian/index.mts`** and **`computing/category/index.mts`**: #2 and #5 each append a barrel export — serialize the index edits (or batch them at the end of each chain).

**Recommended wave plan (3 independent lanes, parallel across lanes):**

| Wave | Lane A (recursion) | Lane B (ludics-bridge) | Lane C (cohomology + games-app) |
|------|--------------------|-----------------------|--------------------------------|
| 1 | **#1 Seely** (test) | **#3 design-morphism** | **#4 bilattice-projection** + **Room Arena** (independent) |
| 2 | **#2 fixedPoints** | **#6 sequential-design** ∥ **#7 cut-composition** | **#8 tick-cohomology** + **Command Resolution** |
| 3 | **#5 traced** | — | **Dialogue Design** |

Lanes A/B/C touch disjoint directories and can run as fully separate worktrees-of-files on `main` (no branch changes).
Within Lane A and Lane B the items strictly serialize; Lane C's items are mutually independent except Command/Dialogue depending on Room.

**Single highest-leverage first prompt:** ship **#1 Seely** (smallest, certifies the `!
`-comonad everything else leans on) and **#3 design-morphism** (the headline computing↔ludics fusion) in parallel — both are high-confidence, touch disjoint files, and unblock the two most valuable chains.
