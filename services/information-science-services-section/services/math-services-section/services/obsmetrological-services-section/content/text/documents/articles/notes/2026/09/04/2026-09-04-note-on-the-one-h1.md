---
title: "Toward the One H¹"
description: "A dependency-ordered map of every cohomology-degree-one object Obsmetrologia defines (SettlingCohomologyH1's Čech H¹, CoordinationCohomology's CoverNerve.H1rank, BigradedTruthKnowledgeLES's quotient H1T/H1K/H1Top, the ℤ/2 context-graph Coboundary, the causal order-complex Cocycle/Coboundary, the Anderson–Putnam cl-inv model, its Verdier-dual H1Homology, and the Regime/CurvatureRegime summary tables), the relations already proved among them (including the live CurrencyCocone colimit), and a refactor plan toward one definition — labeled inference throughout, gated on make check, the axiom census, and every named weld theorem surviving by name."
date-created: 2026-09-04
type: notes
name: 2026-09-04-note-on-the-one-h1
keywords:
  - cohomology
  - settling-cohomology
  - coordination-cohomology
  - bigraded-cohomology
  - contextuality
  - causal-cohomology
  - classifying-invariant
  - currency-cocone
  - refactor-plan
tags:
  - draft
status: draft-for-owner-review
authors:
  - emsenn
  - claude-fable-5-1
---

# Toward the one H¹

Owner movement, 2026-09-04: "Fixing it so we only have one thing called H would probably be a good use of a Sonnet." This note answers that from the formal record, not from memory: the full map lives in
[`data/records/2026-09-04-h1-definitions-map.json`](../../../../../../../../data/records/2026-09-04-h1-definitions-map.json)
(`ObsmetrologiaH1DefinitionsMap`), every claim below cites it. All theorem names were checked
present by `grep -c` in their own module (report: zero misses), and the four weld theorems
named in section 2 were checked live with
`node scripts/audit-set-of-theorems.mjs --source <file> <name>` — exit 0, axiom profiles quoted
verbatim from that run.

## 1. The map — every object the corpus calls H¹, or H¹-shaped

The corpus does not have one `H¹`. It has at least nine things bearing the name, in at least
five distinct Lean *shapes* (`Prop`, `Nat`, `Bool`, `Option Nat`, and genuine `Quotient` types),
over at least four distinct coefficient systems. The record's `entries` array is the source for
every sentence below; each paragraph names its `id`.

**(a) `H1Vanishes`/`h1_vanishes`** (record id `a-settling-cech-h1`,
`Obsmetrologia/Cohomology/SettlingCohomologyH1.lean`) is the Čech gluing obstruction of the
settling-associated sheaf `F_U` over a `Cech1` datum — a cover of the settling site plus one
local `F_U`-cochain per patch, valued in `AssocSheaf.Cochain` (the site's own bilattice-charge
carrier, not `ℤ` or `ℤ/2`). It is a `Prop` (`H1Vanishes : Cech1 → Prop`), and the corpus's own
headline fact about it is unusual: `h1_vanishes` proves the gluing **unconditionally**, for
*every* Čech datum, with no regime hypothesis at all. The regime-gated
`settling_cohomology_h1_vanishes` only bundles that unconditional fact together with the separate
fact that a given regime is `strict`/`scott`; the module's own header calls this out explicitly.

**(b) `CoverNerve.H1rank`** (`b-cover-nerve-h1rank`,
`Obsmetrologia/Cohomology/CoordinationCohomology.lean`) is the cycle rank `|E| − |V| + |C|` of a
source–stance bipartite cover nerve, a plain `Nat`. It is the best-connected object in the whole
map: `Landauer.landauerBits` is a bare rename of it, `AntiLandauer.antiLandauerBits` is
`CoverNerve.H0rank` (its dual), `Glass.h1At` reads it per metastable basin, and
`CurrencyCocone.legs_order_into_rank` proves every other price in the map is bounded above by it.

**(c) `H1T`/`H1K`/`H1Top`** (`c-bigraded-truth-knowledge-h1`,
`Obsmetrologia/Cohomology/BigradedTruthKnowledgeLES.lean`) are the truth/knowledge/record
quotient cohomologies of a `GradedTwoTerm` finite integer cochain complex — `abbrev H1T :=
Quotient K.truthSetoid`, and likewise for `H1K`/`H1Top`. These are the **only** entries in the
map that are genuine algebraic quotient types (`ℤ`-cochains modulo `ℤ`-coboundaries) rather than
a `Nat` count, a `Bool` table, or a bare `Prop`. The six-term sequence
`0 → H⁰_t → H⁰_k → H⁰_⊤ → H¹_t → H¹_k → H¹_⊤ → 0` is proved exact at every node
(`six_term_les_objects`), and the connecting map `conn : H⁰_⊤ → H¹_t` is proved genuinely
nonzero on two concrete instances (`measurement_connecting_model`, `quench_connecting_model`).

**(d) the `ℤ/2` context-graph `Coboundary`** (`d-context-graph-h1`,
`Obsmetrologia/QuantumContextuality/CohomologicalContextuality.lean`) is the Čech `H¹` of a
parity measurement scenario's context graph, coefficients `(Bool, xor) ≅ ℤ/2ℤ`. There is no
named quotient type here — the obstruction is stated as the negated `Prop` `¬ Coboundary S φ`,
witnessed by a nonvanishing 4-cycle or 3-cycle sum (the PR box). This module's own header states
plainly that (a)'s model is **vacuous** for this purpose: "the single-section Čech H¹ of
`Cohomology.SettlingCohomologyH1` is vacuous for measurement scenarios (`Cohomology.h1_vanishes`
makes every single-valued sheaf flasque)" — quoting `QuantumContextuality.SupportContextuality`'s
own header.

**(e) causal order-complex `Cocycle`/`Coboundary`** (`e-causal-order-complex-h1`,
`Obsmetrologia/CausalSets/Causal/Cohomology.lean`) is the same shape as (d) — `Prop`, no named
quotient type — but over `ℤ`, on the order complex (nerve) of the causal poset. Its own header
states `H¹ = ` cocycles / coboundaries "is the obstruction — it **can** be nonzero (that is the
`cl-inv` class; finite causal sets are not order-complex-acyclic in general)."

**The Anderson–Putnam classifying-invariant model** (`unlettered-anderson-putnam-clinv`,
`Obsmetrologia/AperiodicOrder/Tiling/Witness/JeandelRao.lean` for the base complex,
`Classification.lean` for `H1Class`/`H1Carrier`, `Cohomology/FiringGenerators.lean` for the
concrete witness) is a **sixth** shape: a finite one-vertex Anderson–Putnam complex where `δ⁰ = 0`
identically (one vertex), so every nonzero cocycle already is a nonzero class
(`OneVertexComplex.NonzeroH1Class`). `H1Class` models the class abstractly as a single `Int`
coordinate. Its own docstring calls it a model of the *same* corpus object as (a)
(`H¹(T*_{≤κ}, F_U)`), read specifically in the aperiodic/transfinite-bounded regime where (a)'s
`Cech1` model never itself constructs a nonzero witness — `FiringGenerators.lean`'s
`firingGen_nonzero_h1_class` is the first genuinely-constructed nonzero class in that regime.

**`H1Homology`** (`unlettered-h1-homology-verdier-dual`,
`Obsmetrologia/AperiodicOrder/Tiling/CoClassifying.lean`) is, by its own module header, "a
coordinate-isomorphic copy of `H1Class`" — the spatial Verdier dual `dSpatial : H1Class →
H1Homology` is a bijection proved by `rfl` in both directions, in the strict-Boolean case only.
It is not an independently-computed cohomology; the general Verdier duality is recorded open
(`thm:aperiodic-verdier-duality`).

**The regime-indexed summary table** (`unlettered-regime-cohomology-table`,
`Closure/Regime.lean`'s `cohomologyVanishes : ClosureRegime → Bool` and
`Dynamics/Flow/CurvatureRegime.lean`'s `curvatureRank : ClosureRegime → Option Nat`) is not a
cohomology object at all — it is a four-row stipulated table, decidable by `cases r <;> decide`.
Its docstring claims to summarize (a)'s vanishing; `settling_cohomology_h1_vanishes` is the one
theorem in the tree that actually ties the table to a real `Cech1` gluing fact, and even that
theorem's gluing half is unconditional (see (a) above and section 3(ii) below).

## 2. What is already welded

Four theorems cross the boundaries between (a)–(e), all checked live this session
(`node scripts/audit-set-of-theorems.mjs --source <file> <name>`, exit 0):

| weld | theorem | module | axiom profile |
|---|---|---|---|
| `topCount ≤ massSum ≤ H1rank` (chains (d) into (b)) | `two_spread_ledger` | `QuantumContextuality/CohomologicalContextuality.lean` | `propext`, `Quot.sound` |
| `(c)↔(d)`: `topCount(target) = mints + jumps` on a ⊤-free step | `topSupport_eq_mints_add_jumps` | `Dynamics/Flow/FreeEnergyLyapunov.lean` | `propext`, `Quot.sound` |
| every price bounded by `(b)`'s rank | `legs_order_into_rank` | `Cohomology/CurrencyCocone.lean` | **none** (zero axioms) |
| `(e)≥(d)`: causal wavefront dominates the merge's frustrated support under mod-2 reduction | `reduced_coboundary_is_parity_gradient` | `CausalSets/Causal/Cohomology.lean` | `propext`, `Quot.sound` |

Two more facts complete the "already welded" picture, both `rfl`/definitional rather than
theorems needing an axiom check: `Landauer.landauerBits N := N.H1rank` — (b) renamed, not a new
computation — and `AntiLandauer.index_balance` — `antiLandauerBits N − landauerBits N = eulerChar
N`, i.e. `H⁰ − H¹ = χ`, over `Int`, a discrete index theorem tying (b)'s `H1rank` to its own dual
`H0rank` and to the nerve's Euler characteristic. `Glass.h1At_eq_landauerBitsAt` is the same
rename read per basin (`rfl`).

The strongest single fact in this section is not a weld between two objects but a **completed
colimit** already sitting in the tree: `Cohomology/CurrencyCocone.lean`'s `PricedNerve` bundles
`Nat`-valued prices read off (a) (`cechPrice = 0`), (b) (`base.H1rank`), (c) (`mintPrice` +
`jumpPrice`), (d) (`topPrice`, `massPrice`), and (e) (`causalPrice`), constrained by exactly the
three edges above as structure fields, and `colimitPrice := max(massPrice, causalPrice)` is
*proved* to be their least upper bound in `(ℕ, ≤)` (`colimit_universal`, `legs_le_colimitPrice`,
`colimitPrice_unique` — the module's own blueprint node `thm:currency-colimit`, green). This is a
real, already-built, machine-checked unification — of the five objects' **Nat-valued price
shadows**, not of the five cohomology objects themselves. Section 5 returns to why that
distinction is load-bearing.

## 3. The candidate single definition (inference)

**Everything in this section is inference — a proposal, not a corpus claim.** No module in the
tree states "H¹ is defined once as X and every other name is an instance of it." The candidate,
argued from what is actually proved:

> **H¹ of a presheaf of abelian groups on a finite cover** — a cover nerve (vertices = base
> objects, edges = overlaps) carrying a presheaf valued in some fixed abelian group `A`, with the
> usual Čech `δ⁰`/`δ¹` and `H¹ := ker δ¹ / im δ⁰`.

Sorted against that candidate:

**(i) Genuine instances** (the candidate specializes to them by choosing the cover and `A`):
- **(b) `CoverNerve.H1rank`** is the **rank** of this `H¹` with constant coefficients `A = ℤ`
  over the source–stance nerve — `Ȟ¹` as a cycle-rank count rather than the group itself. This is
  the cleanest instance: `CoverNerve` already carries exactly `(entities, cells, components)`,
  the Euler data the candidate's `ker δ¹ / im δ⁰` rank would compute.
- **(d) the context-graph `Coboundary`** is this candidate with `A = ℤ/2ℤ` on the measurement
  cover (contexts as edges) — the module's own header already states this almost verbatim
  ("computed by a coboundary map `δ⁰` exactly as `Causal.Cohomology.delta0` computes the causal
  order complex's, generalized here from a poset's order complex to an arbitrary graph").
- **(e) the causal order-complex `Cocycle`/`Coboundary`** is the same candidate with `A = ℤ` on
  the causal poset's order-complex nerve — structurally the twin of (d), differing only in
  coefficients and which nerve.
- **(c) `H1T`/`H1K`/`H1Top`** are the candidate applied to `A = ℤ` on **three different masks**
  of one `GradedTwoTerm` complex (truth-only edges, all edges, record-only edges) — the one place
  in the map where the candidate's presheaf is genuinely non-constant (truth cells are
  incident only to truth edges by the `truth_closed` law), and the only place `H¹` is built as an
  actual `Quotient`, matching the candidate's `ker δ¹ / im δ⁰` literally rather than as a count.
- **the Anderson–Putnam `NonzeroH1Class`/`H1Class`** is the candidate on a **one-vertex** nerve
  with `A = ℤ` — the degenerate case where `δ⁰ = 0` for free, so the quotient collapses to the
  cocycle group itself. `H1Class`'s single-`Int`-coordinate model is exactly what the candidate
  would produce for a rank-1 free abelian group of cocycles.
- **`H1Homology`** is the candidate's dual (cosheaf homology) on the same cover as (a), in the
  strict-Boolean case — an instance of the *dual* functor, not of `H¹` itself, and the module says
  so ("not a proof that the cosheaf homology of the dual cosheaf `F̌_v` computes to `H₁` in
  general").

**(ii) Theorems *about* an instance, not new definitions:**
- `h1_vanishes` (a) is the theorem that the candidate's `H¹` is **trivially zero** for the
  particular presheaf `F_U` on the particular cover `Cech1` — because `F_U`'s sections are total
  (every cell has a value in a bilattice with `⊤`), gluing never obstructs. This is a genuine,
  useful, *proved* fact — but it is a vanishing theorem about one instance, not a second
  definition of `H¹`.
- `cohomologyVanishes`/`curvatureRank` (the regime table) should become a **theorem**, not stay a
  stipulated `Bool`/`Option Nat` table, once each regime's cover is named explicitly. Concretely:
  for `strict`/`scott` it would repeat `settling_cohomology_h1_vanishes`'s already-unconditional
  `h1_vanishes`; for `transfiniteBounded`/`aperiodic` it would repeat
  `FiringGenerators.transfiniteBounded_h1_generators`'s constructed nonzero class. Today it is a
  four-row `cases r <;> decide` that happens to agree with those two theorems' conclusions on the
  regimes where both exist — agreement, not derivation. Section 4 makes this the first refactor
  step.

**(iii) Not an `H¹` at all — rename:**
- **`H1Homology`**'s own scope statement already concedes this: it is the corpus's name for
  *cosheaf homology* `H₁`, not cohomology `H¹`, identified with `H1Class` only by an assumed
  strict-Boolean bijection. It should be renamed to something naming the Verdier-dual relationship
  explicitly (e.g. `VerdierDualClass`) rather than sharing the `H1` prefix with eight unrelated
  objects, and its `dSpatial` bijection should carry a name that says "assumed strict-Boolean
  identification," not "H¹ equals H₁."
- **`Glass.h1At`** is not an independent definition; it is `(β.nerveAt b).H1rank` read per basin,
  already proved equal to `Landauer.landauerBitsAt` by `rfl`. It should simply be deleted and its
  two call sites should read `.H1rank`/`landauerBitsAt` directly, or (better) kept only as a
  basin-indexing convenience with a name that does not repeat "H1" (e.g. `basinCycleRank`).
- **`cohomologyVanishes`/`curvatureRank`**, until converted to theorems per (ii), name a summary
  table, not a cohomology object — see section 4.

## 4. Dependency-ordered refactor plan (inference; the gate a Lean lot would run)

The order below is chosen so nothing forward-references a definition that has not yet been given
its instance reading, and so every step is independently checkable by `make check`.

1. **`Regime.lean` / `CurvatureRegime.lean` — replace the stipulated table with theorems.**
   Delete `cohomologyVanishes`'s body as a bare `cases` table; redefine it (or a successor)
   in terms of `settling_cohomology_h1_vanishes`'s regime-dichotomy conjunct for
   `strict`/`scott`, and `FiringGenerators.tbWitness_classifies` /
   `AperiodicOrder.Tiling.Classification.aperiodicWitness`'s classification for
   `transfiniteBounded`/`aperiodic`. `curvatureRank` follows the same move via
   `rank_nonzero_has_nsc_firing`. This is the one step that turns "regimeTableRefersTo" in the
   record from a documented caveat into a closed loop.
2. **`SettlingCohomologyH1.lean` — no change to `h1_vanishes` itself** (it is already
   unconditional and correctly scoped to `F_U`); add one theorem stating explicitly that
   `Cech1`/`H1Vanishes` is the `A = AssocSheaf.Cochain`, non-abelian-in-general instance of the
   candidate, so downstream readers stop expecting it to specialize the `ℤ`/`ℤ/2` instances.
3. **`CoordinationCohomology.lean`, `CohomologicalContextuality.lean`,
   `CausalSets/Causal/Cohomology.lean` — state each as an explicit instance.** Add, in each
   module, one `def`/`theorem` naming its cover and coefficient group against the shared
   candidate signature (a cover-nerve type, a coefficient `AddCommGroup`, `δ⁰`/`δ¹`). No proof
   content changes; this is packaging that makes the existing `two_spread_ledger`,
   `topSupport_eq_mints_add_jumps`, and `reduced_coboundary_is_parity_gradient` welds read as
   maps **between named instances of one functor** rather than three unrelated bridge theorems.
   Every one of these three theorems must still exist, by name, after this step —they are the
   gate's own regression check (see below).
4. **`BigradedTruthKnowledgeLES.lean` — no structural change**, since `H1T`/`H1K`/`H1Top` already
   are literal `ker δ¹ / im δ⁰` quotients; only re-point step 3's shared candidate signature at
   this module's `GradedTwoTerm` as the reference instance (it is the only one already built the
   "right" way).
5. **`Witness/JeandelRao.lean` + `Classification.lean` + `FiringGenerators.lean` — reuse, don't
   duplicate.** `OneVertexComplex` should itself become the one-vertex degenerate case of step
   3's shared cover-nerve type, rather than a separately-declared `structure`. `H1Class`'s
   single-`Int`-coordinate carrier stays (it is the useful abstraction over "some rank-1 free
   abelian group of cocycles"), but its docstring should point at the shared candidate instead of
   describing itself standalone.
6. **`CoClassifying.lean` — rename, don't refactor.** `H1Homology` → a name that does not start
   with `H1` (see section 3(iii)); `dSpatial` stays exactly as proved (a strict-Boolean-only
   bijection), only the surrounding names change. Zero proof-content risk.
7. **`AperiodicOrder/Crystal/Glass.lean` — delete `h1At` as a def, keep the accessor.** Lowest
   risk, do last; touches only two call sites per the record's `unlettered-regime-cohomology-table`
   sibling note on `h1At_eq_landauerBitsAt`.

**Gate**, quoted from the lot brief and unchanged: `make check` green; the axiom census
(`scripts/census-set-of-theorem-axioms.mjs`) not worse in any profile than this session's
baseline; the identification-site census not worse; and every theorem named in section 2's table
— `two_spread_ledger`, `topSupport_eq_mints_add_jumps`, `legs_order_into_rank`,
`reduced_coboundary_is_parity_gradient` — still present **by name**, with an axiom profile no
worse than quoted above (`propext`/`Quot.sound` or better, never a new `Classical.choice` or
`sorry`). Step 3 is explicitly a repackaging step with a no-regression clause built in for that
reason.

## 5. What cannot be unified, honestly

- **Coefficients genuinely differ and the candidate cannot erase that.** (a) is valued in
  `AssocSheaf.Cochain` (a bilattice-charge carrier with a `⊤`, not a group in the sense the other
  five use — that is *why* `h1_vanishes` is unconditional: totality of sections, not smallness of
  a coefficient group). (d) is `ℤ/2`. (b), (c), (e), and the Anderson–Putnam model are `ℤ` or
  `Nat`. A single Lean `structure` parameterized by an `AddCommGroup` coefficient can express the
  candidate abstractly, but it cannot make (a)'s flasqueness theorem a special case of, say, (e)'s
  nonvanishing theorem — they are facts about *different presheaves on different covers*, and no
  amount of renaming changes that the corpus proves opposite things about them for good reason.
- **The colimit (section 2) unifies prices, not objects, and that gap is real, not cosmetic.**
  `PricedNerve.colimitPrice` is a genuine colimit in `(ℕ, ≤)` of five `Nat`s. It says nothing
  about (c)'s `H1T`/`H1K`/`H1Top` as *quotient types* — those are erased to their `Nat` size before
  the cocone ever sees them. A "one definition" that satisfies the owner's request without
  quietly downgrading (c) back to a count has to be a colimit (or at least a natural
  transformation) in the category of the objects, not their sizes — that is not built, and
  building it is bigger than a refactor: it is new category-theoretic infrastructure the tree
  does not currently have (no `Functor`/`NatTrans` machinery over these five presheaf categories
  exists in Obsmetrologia today).
- **`h1_vanishes`'s unconditionality is a fact about (a) specifically, not a defect to fix.**
  It would be tempting, in a refactor, to try to make (a) "agree" with (d)/(e)'s nonvanishing
  behavior by weakening it. That would falsify a proved theorem. The map's honest shape is: one
  object trivially vanishes by construction (a), four others can genuinely obstruct (b)–(e) and
  the Anderson–Putnam model, and no renaming changes which is which.
- **`H1Homology`'s general (non-strict-Boolean) case is open, not merely unrefactored.** The
  corpus itself records the general Verdier duality as an open blueprint node
  (`thm:aperiodic-verdier-duality`); a refactor session cannot close it, only rename around it.

## 6. The ruling on step 7

Step 7 renames `Glass.h1At`. Outside the Lean library, the name is cited only by the
blueprint chapter `docs/blueprint/src/chapters/relational-physics/material-states/02-topology-and-glass.tex`,
which belongs to the same Lean project and moves with it, and by this note and its record.
No physics-facing document, dashboard, or package reads the name, so the rename is a
Lean-internal change with no external reader to break. Ruled by the executive session under
the decision law, 2026-09-04: the Lean lot that executes this plan renames `h1At` to the
`CoverNerve.H1rank` accessor it is, updates the blueprint chapter in the same change, and
runs the gate stated in section 4.
