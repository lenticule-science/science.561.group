---
title: "Bilattice Predication"
description: "The four-regime predication floor: an utterance settles to a fixed point through articulate → predicate → posit → settle, with the bilattice charge algebra over FOUR supplying the value-operations on a lossless evidence carrier."
date-created: 2026-06-11
status: draft
type: term-record
keywords: ["bilattice", "four-valued-logic", "knowledge-order", "truth-order", "evidence-carrier", "fixed-points", "modal-closure", "paraconsistency", "predication", "kz-monad", "void-cone"]
msc-id: [03B50, 03B53, 06D30, 06A15, 06B23, 18C15]
depends-on: [bilattice, twist-product, closure, fixpoint, lattice, residuated-lattice]
introduces: [charge, four-regime-descent, lossless-evidence-carrier, measured-not-seeded, knowledge-bracket, void-cone, klein-four-gauge, sigma-duality]
sources:
  - triage/2026/06/06/math-core/bilattice/README.md
  - triage/2026/06/06/math-core/bilattice/src/charge.mjs
  - triage/2026/06/06/math-core/bilattice/src/descent.mjs
  - triage/2026/06/06/math-core/bilattice/src/cone.mjs
  - triage/2026/06/06/math-core/bilattice/src/void.mjs
  - triage/2026/06/06/math-core/bilattice/test/charge.test.mjs
  - triage/2026/06/06/math-core/bilattice/test/descent.test.mjs
  - triage/2026/06/06/math-core/bilattice/docs/learning/references/the-charge.md
  - triage/2026/06/06/math-core/bilattice/docs/learning/references/the-four-states.md
  - triage/2026/06/06/math-core/bilattice/docs/learning/references/the-laws.md
  - triage/2026/06/06/math-core/bilattice/docs/learning/explanations/the-four-regimes.md
  - triage/2026/06/06/math-core/bilattice/docs/learning/explanations/measured-not-seeded.md
  - triage/2026/06/06/math-core/bilattice/docs/learning/explanations/one-adjunction-three-faces.md
  - triage/2026/06/06/math-core/bilattice/docs/learning/explanations/knowledge-and-truth-are-sigma-dual.md
  - triage/2026/06/01/voidmath-kernel/README.md
  - triage/2026/05/28/voidmath/articulating/library/category/predicating/library/category/positing/scripts/posit.mjs
  - triage/2026/06/04/voidmath-kernel-schema/articulating/library/category/predicating/library/category/positing/library/category/library/bilattice/library/charge/charge.schema.json
  - triage/2026/06/04/voidmath-kernel-schema/articulating/library/category/predicating/library/category/positing/library/category/library/bilattice/bilattice.schema.json
  - triage/2026/06/04/voidmath-constructs/four/scripts/four.mjs
  - topical-archive/science/mathematics/algebra/archive/algebra-code-structures-bilattice.md
  - topical-archive/science/mathematics/algebra/archive/algebra-prose-teaching-explanations-what-closure-does-to-the-bilattice.md
---

## Definition

**Bilattice predication** is the construct the owner's `@lenticule-science/metrologic/bilattice` package calls "the bilattice predication floor — the four-regime descent over a lossless evidence carrier" (`triage/2026/06/06/math-core/bilattice/README.md:3-4`). It has two layers.

**Layer 1 — the charge algebra over FOUR.** A *charge* is a plain pair-of-pairs:

```
{ value: [a₊, a₋], evidence: [pos-witnesses, neg-witnesses] }
```

The `value` is the bilattice pair `⟨a₊, a₋⟩ ∈ FOUR` — the four settings of the two boolean bits (`src/charge.mjs:3-10`):

| bits | state name (06/06) | classical Belnap name |
|---|---|---|
| `[F,F]` | absurd (no side) | ⊥ |
| `[T,F]` | potential (has-potential, not yet engaged) | t |
| `[F,T]` | active (engaged) | f |
| `[T,T]` | stable ("told both") | ⊤ |

Two σ-dual lattice orders run on the pair: **knowledge** ≤ₖ (`absurd ↕ stable`, "how determined") and **truth** ≤ₜ (`potential ↔ active`, "which way"). The `evidence` is a *lossless carrier*: every binary operation unions witnesses on both sides and never discards them (`src/charge.mjs:53-99`), which is what makes ⊤ ("told both") reachable and lets the system distinguish "absurd, told nothing" from "absurd, two conflicting tellings that cancelled" (`docs/learning/references/the-charge.md:46-48`).

**Layer 2 — the four-regime descent.** An utterance `[token, claim]` settles to a finite fixed point through

```
articulate → predicate → (cohere) → posit → (commutate) → settle
```

(`src/descent.mjs:1-8`). The four verbs are four distinct *regimes* (`docs/learning/explanations/the-four-regimes.md`):

- **articulate** (aperiodic) — witness an utterance into a `{potential}` cell, no semantics;
- **predicate** (transfinite) — read left = entity dimension E, right = unsaturated concept Π; build the cell-set Φ = E × Π × E and the value-free fiber; `cohere` transitively closes the specialization (Beck–Chevalley, per the source comments);
- **posit** (scott-continuous) — *measure* each cell from its givens: a fresh cell gets `{ value: [true, false], evidence: [[subject], []] }` — potential, witnessed by the given token, never a stamped value (`src/descent.mjs:83-98`);
- **settle** (finite) — iterate the modal closure `possibilizeKnowledge ∘ necessitateKnowledge` to its knowledge-least fixed point, the *sheaf* (`src/descent.mjs:166-176`).

The package's governing slogan is **measured, not seeded**: "a cell's state is *measured* from what was given, never *seeded* onto it" — ⊥ (absurd) is only ever *reached* by the knowledge-meet under contradiction (`meetₖ(potential, active) = absurd`), never stamped, and the evidence carrier only ever grows (`README.md:7-10`, `docs/learning/explanations/measured-not-seeded.md`).

**The definition is NOT settled across snapshots.** Two earlier variants conflict with the 06/06 definition above:

1. *Seeded vs measured.* The 2026-05-28 `voidmath` (and the 2026-06-01 `voidmath-kernel`, which keeps a `seeding-knowledge` node) seeds the knowledge-LEAST charge `[[],[]]` onto every cell of Φ — "the bottom valuation DEFINED ON EVERY CELL... This is where value enters the descent (as BOTTOM; assertion raises it later)" (`triage/2026/05/28/voidmath/.../positing/scripts/posit.mjs:6-10,29-31`). The 06/06 package explicitly repudiates this: "The old kernel stamped every cell absurd (`[F,F]`) as a starting value... That's exactly the seeding error" (`docs/learning/explanations/measured-not-seeded.md:33-36`).
2. *Charge representation and state names.* In the 05/28–06/04 lineage a charge is a slot-presence pair of token arrays, and the names sit at *different corners*: "`[[],[]]` knowledge-bottom (potential), `[[m],[]]` positive (active), `[[],[m]]` negative (stable), `[[m],[m]]` knowledge-top (absurd/overdetermined)" (`triage/2026/06/04/.../charge.schema.json`, description field). In 06/06 the names have rotated: the bottom is *absurd*, the top is *stable*, and *potential*/*active* are the t/f corners. Same FOUR, same two orders — but "absurd" names the top in 06/04 and the bottom in 06/06. The 06/04 `voidmath-constructs/four` snapshot uses the classical names ⊥/t/f/⊤ directly and declares "FOUR is PRIMARY... Boolean is its finite projection" (`triage/2026/06/04/voidmath-constructs/four/scripts/four.mjs:1-15`).

The classical backdrop (from the owner's own 2026-03-30 term note): a bilattice is a set with two bounded lattice structures (truth and knowledge), plus negation (reverses truth, preserves knowledge) and conflation (preserves truth, reverses knowledge); FOUR is Belnap's four-valued bilattice, the free bounded distributive bilattice on one generator (Fitting 2002), isomorphic to the twist product **2** ⊗ **2** (`topical-archive/science/mathematics/algebra/archive/algebra-code-structures-bilattice.md`). The 06/06 reference docs explicitly map `charge.value` to "the `L = 2` case" of a point of the twist product `L^⋈`, with `evidence` the richer degree where L is a lattice of witness-sets (`docs/learning/references/the-charge.md:17-27`).

## Motivation

The construct is the **math floor of the voidmath program**: the minimal algebra on which predication (an entity being claimed under a concept) can be computed honestly, with all epistemic outcomes — undetermined, affirmed, denied, contradicted — first-class. The design pressures visible in the sources:

- **Honest brackets, not stamped answers.** Because cell states are measured, the least fixed point (`settle`) and greatest fixed point (`brim`) bracket each cell between "the least its givens force" and "the most they allow"; the gap between them is *real* undetermination rather than an artifact of seeding — "Seed the cell and that bracket collapses to whatever you seeded; measure it and the bracket tells you something" (`docs/learning/explanations/measured-not-seeded.md:57-62`).
- **Paraconsistency via the lossless carrier.** Contradiction (⊤) must be representable and recoverable: `meetKnowledge` can lower a value to ⊥ while retaining the witnesses that drove the disagreement (`src/charge.mjs:66-69`), and `compare` splits any settled section into its consistent and paraconsistent parts (`src/descent.mjs:191-196`).
- **One adjoint object, not three features.** The two orders (Galois face), the modal pairs ◇ ⊣ □ (monad/comonad face), and the (planned) implication (residual face) are presented as three faces of one `*`-autonomous object, with `FOUR ≅ Chu(2,0)` cited to "(Jakl 2025)" (`docs/learning/explanations/one-adjunction-three-faces.md`) (uncertain — citation not verified).
- **A floor, not the building.** Downstream "projections" (cohomology, the hyperdoctrine, the aperiodic spectrum) and the disk half (`voidmath-posix-holography`) are deliberately excluded; "the kernel provides the object, not the projections" (`one-adjunction-three-faces.md:44-47`).

## Formal content

All claims below are checked by the package's property/law test suite (`test/charge.test.mjs`, `test/descent.test.mjs`) and tabulated in `docs/learning/references/the-laws.md`; named exports are from `src/charge.mjs`, `src/descent.mjs`, `src/cone.mjs`, `src/void.mjs`.

**Charge value-algebra** (`src/charge.mjs`): `present`, `isTop`, `negate`, `conflate`, `joinKnowledge` ⊕, `meetKnowledge` ⊗, `joinTruth` ∨, `meetTruth` ∧, `leqKnowledge`, `compareKnowledge` (the ≤ₖ witness, throws if absent), `aggregate` (= `joinKnowledge` on the lossless carrier, kept as a named morphism). Operationally: knowledge join/meet OR/AND both value bits componentwise; truth join/meet OR/AND the positive bit and AND/OR the negative bit (truth reverses the negative axis); *all four* union evidence on both sides.

**Verified laws** (`docs/learning/references/the-laws.md`, `test/charge.test.mjs`):
- each of the four binary ops is commutative, associative, idempotent on the value, with identities ⊥ (⊕), ⊤ (⊗), f/active (∨), t/potential (∧), and absorption per order;
- characteristic table: `t ⊕ f = ⊤`, `t ⊗ f = ⊥`, `t ∨ f = t`, `t ∧ f = f` (`test/charge.test.mjs:48-53`);
- **Klein-four gauge**: `negate` (bits `[b,a]`, swaps potential↔active, value AND evidence swap together) and `conflate` (bits `[¬b,¬a]`, swaps absurd↔stable, evidence stays) are commuting involutions; `conflate` is the only op that can raise a value above its evidence (`conflate(⊥) = ⊤` with no witnesses) — the deliberate breach of the value ≤ presence(evidence) invariant that seeds the GFP ceilings (`src/charge.mjs:43-51`, `the-charge.md:29-37`);
- **σ-duality**: with σ the order-swap `⟨a,b⟩ ↦ ⟨a,¬b⟩`, `joinT = σ∘joinK∘σ` and `meetT = σ∘meetK∘σ` — the truth ops are the knowledge ops read through σ (`knowledge-and-truth-are-sigma-dual.md`); σ together with `negate`, `conflate` is said to generate an 8-element group "G₈" (uncertain — asserted in the explanation doc, not tested);
- **losslessness**: every op's output evidence ⊇ both inputs' on each side.

**Descent and modal closure** (`src/descent.mjs`): `articulate` (polymorphic: bare `[left,right]`, or `{apex}` re-entry from a void cone; throws TypeError on a missing side), `predicate` (Φ = E×Π×E and the value-free fiber), `cohere` (transitive closure of the specialization; comments call it the Beck–Chevalley coherence), `posit` (measures, as above), `commutate` ("◇□ = □◇, invertible"), the four modal generators `possibilize/necessitate × Knowledge/Truth` (each appends a join/meet-folded valuation to the trace; they "differ ONLY in the binary op they fold with", `src/descent.mjs:109-111`), and `settle` — a do/while iterating `possibilizeKnowledge ∘ necessitateKnowledge` to value-stability, with uniqueness/termination glossed as "unique by confluence; terminates by Knaster–Tarski over the bounded knowledge lattice" (`src/descent.mjs:160-165`) (the gloss is a code comment; the tests check convergence on examples, not confluence in general).

**Cones — unit/counit per order** (`src/cone.mjs:1-8`): each order carries an LFP/GFP pair over the one measured carrier. Knowledge: `settle` (unit, LFP → sheaf) and `brim` (counit, GFP → cone; raises every evidence-free bit to ⊤ then runs settle's exact closure). Truth: `adjudicate` (unit, LFP → verdict) and `presume` (counit, GFP → presumption; free bits rise toward the truth-top `[T,F]`). Verified brackets: `settle ≤ₖ brim` and `adjudicate ≤ₜ presume` on every cell (`the-laws.md:56-58`).

**Void reads and non-finite duals** (`src/void.mjs`): `gap` (keep the cells where an LFP and GFP disagree by value, retaining the full `[least, greatest]` interval with witnesses); `vanish = gap(settle, brim)` — the knowledge void cone, "the cells the closure pins from NEITHER side" (a single section cannot tell a genuinely-void cell from a reconciled-conflict ⊥, because it cannot see the GFP — `src/void.mjs:115-118`); `estrange` — the transfinite complement-dual of `cohere`, the never-related pairs (verified: apex ⊎ closure = all pairs); and the **aperiodic predication monad**: `saturate` (μ, path composition over the void cone read as a graph, `(a,p,b)·(b,q,c) ↦ (a,[p,q],c)`), `transfer` (η, keep atomic edges; non-injective, "the KZ unit's non-invertibility"), `twistor` (the KZ comparison 2-cell; residue = the accumulated concept-sequences), `precipitate` (one unfold step: what μ cannot saturate, re-articulated one fold deeper; the comment glosses this as "the aperiodic void, H¹≠0" — uncertain, no cohomology is computed in this package). The four regimes are tied to an "ordinal classification of the closure" (strict/finite, scott-continuous ω, transfinite-bounded, aperiodic), with `settle` the initial algebra and the void cone the terminal coalgebra (`the-four-regimes.md:29-41`) — presented as a reading, not proved here.

**Verification posture**: the package CHANGELOG records 145 deep-strict-equal parity checks against the predecessor `@561/development.active.math-kernel` ("a recreation, not a move", `CHANGELOG.md:23-26`); the 06/01 `voidmath-kernel` in turn claims byte-identical settled output against the Ajv-validated `potential/voidmath` (`triage/2026/06/01/voidmath-kernel/README.md`).

## Relations

- **bilattice (classical term record)** — the scholarly backdrop: Ginsberg 1988, Fitting 1991/2002, Belnap 1977, twist product (Kalman 1958), Klein four-group symmetry, residuated structure via Busaniche–Cignoli (`topical-archive/.../algebra-code-structures-bilattice.md`). Bilattice-predication instantiates FOUR as the `L = 2` twist product and adds the evidence carrier and the descent on top.
- **closure / fixpoint (archive note, 2026-03-31)** — "What Closure Does to the Bilattice" analyzes the post-closure algebra {t, f, ⊤} (⊥ disappears within scope; truth order collapses to the chain f <ₜ ⊤ <ₜ t; the residuated adjunction survives). That note belongs to the *seeded/inference-rule* reading; under the 06/06 measured semantics, `settle` deliberately leaves free bits low (a settled fresh cell stays at potential), so the two treatments answer different questions — closure-of-assertions vs LFP-of-the-measured-carrier. They have not been reconciled in the sources.
- **voidmath descent (2026-05-25/28 snapshots)** — the same articulate/predicate/posit/settle pipeline with JSON-Schema validation; the deep path-as-coordinate tree (e.g. `bilattice-apex-d-val-fixed-point`, one of "six generated CHL fixed points" with Belnap/Fitting/Ginsberg/Lambek citations in its dev journal) is the exploratory ancestor of this floor.
- **FOUR / boolean (voidmath-constructs, 06/04)** — FOUR reified as a first-class object; Boolean is proved its "finite projection" (`proof-boolean-is-the-finite-projection-of-four.mjs`); `tabulating` gives the Chu(2,0) matrix presentation.
- **relationlessness grounds / mystery (voidmath-kernel, 06/01)** — the empty utterance as the ground that "incites" the descent, and `mystery` (the lfp of vanishing, `V_∞ = ⋂_τ V_τ`). The 06/06 package *drops* both: `articulate([])` throws ("There is no foundational empty case", `measured-not-seeded.md:46-55`), and no `mystery` morphism is exported.
- **downstream projections** — cohomology, the hyperdoctrine, the aperiodic spectrum (`voidmath-cohomology` etc.), and `voidmath-posix-holography` (the disk half, `schema = settle(fold(log))`), all explicitly outside this floor.

## Settledness

**Evolving overall; the charge value-algebra is the settled core.** Evidence across snapshots:

- *Settled:* the underlying object — FOUR with the two orders, the four join/meet ops, the two involutions, σ-duality, and losslessness of evidence — is stable from 05/28 through 06/06 and matches the classical literature the owner's own term notes cite. The 06/06 laws are machine-checked, and the package is parity-checked (145 checks) against its predecessor.
- *Evolving (reversed direction within ~10 days):* the **posit semantics** flipped from seeded-bottom (05/28, 06/01: `seeding-knowledge`, BOTTOM on every cell) to measured-potential (06/06), with the new docs explicitly calling the old behavior an error. The **foundational empty utterance** flipped from a celebrated ground with its own proof file (06/01: `proof-relationlessness-cannot-not-relate.mjs`) to malformed input that throws (06/06).
- *Evolving:* the **state names** rotated corners between the 06/04 schema (potential = true, absurd = none) and the 06/06 package (absurd = bottom, stable = ⊤op, potential/active = f/f). Anyone merging notes across snapshots must translate names per snapshot.
- *Exploratory:* the aperiodic monad / fold-tower ("the full fold-tower is downstream", `the-four-regimes.md:49`), the ordinal regime classification, the H¹≠0 gloss, the G₈ gauge group, and the Chu(2,0)/Jakl framing — all asserted in prose or comments, only partially tested (precipitate's residue and estrange's complement are tested; the cohomological and 2-categorical readings are not).

## Open questions

1. **The residual face is missing.** "an actual `⊸` implication on charges — is the one piece the kernel doesn't yet realize" (`one-adjunction-three-faces.md:28-32`). The archive's residuated-lattice/Busaniche–Cignoli material has not been ported to charges.
2. **Are the relationlessness grounds abandoned or relocated?** 06/01 proves "relationlessness cannot-not relate" and derives `mystery`; 06/06 rejects the empty utterance outright. Whether this is a doctrinal reversal or the grounds are meant to live elsewhere is unstated.
3. **Confluence/uniqueness of `settle`** is a comment ("unique by confluence; terminates by Knaster–Tarski"), not a proof artifact in this package. Is the modal step actually monotone/inflationary on the trace in general, beyond the tested examples? (uncertain)
4. **Reconciliation with the closure note.** Does the 2026-03-31 result (⊥ vanishes within scope; truth order becomes a chain; adjunction survives) have a measured-semantics analogue — e.g. on `brim`'s cone or on `compare`'s consistent part?
5. **Final state names.** Given the 06/04→06/06 rotation, which dynamical naming is canonical? The 06/06 docs acknowledge the classical ⊥/t/f/⊤ as alternates (`the-four-states.md:12-13`).
6. **The fold-tower.** The spiral (void cone re-entering `articulate` one fold down) is carried but the iterated tower and its claimed infinitude live downstream and are unformalized here.
7. **The "Jakl 2025" Chu(2,0) citation and the "(uncertain)" attributions above** need source verification before the record is promoted.

## Proposed home

`topical-archive/science/mathematics/mathematical-logic/many-valued-logic/bilattice-theory/` (term record alongside the existing `archive/` there, which already holds the predication-bilattice Lean artifacts, twist-product and truth-order notes) — this subtopic is the corpus's established home for the FOUR/predication cluster, and the construct is logic-first (epistemic states, paraconsistency, modal closure) with the algebra notes in `algebra/archive` cross-referenced as the structural backdrop.
