---
title: "Atari as One Local Future"
description: "Owner-stated 2026-09-03: atari is one local future left, forced only when necessary. Read in the house's own objects: the stalk of the board sheaf, the Heyting algebra of its truth values, the residuated fiber algebras of the predication paper, and the order Laplacian whose harmonic kernel is the settled global section. States what forces a move, why territory is harmonic, why aji is Laplacian energy, and what would refute it."
date-created: 2026-09-03
date-updated: 2026-09-03
type: text
status: proposal
authors:
  - emsenn
  - claude-fable-5.1
keywords: ["weiqi", "atari", "heyting-algebra", "fiber-algebra", "sheaf-laplacian", "settlement", "honeycomb"]
what-is-proved:
  - "Obsmetrologia/GameTheory/Weiqi/Board.lean: Board.Group and Board.Liberties give §2's 'group' and 'liberty count' a checked definition (a group is a Discrete.Graph.Reach-component of same-colour occupied points; a liberty is an empty point adjacent to some stone of the group), and Board.liberties_disjoint_from_stones proves a group's liberties are never its own stones — the fact that makes 'the stalk's admitted continuations' and 'the liberty count' the same number in §2. This proves the board-static object atari is a condition on; it proves nothing about §3's stacked-board time-direction reading of a liberty, §4's Heyting-algebra truth values, or §5-6's fiber-algebra/sheaf-Laplacian claims, which remain proposal."
---

## 1. The statement

Owner, 2026-09-03, correcting a session that had read atari as "one
neighbour left": atari is "one *local* future left, that is forced only
when necessary. This is why it relates to heyting algebras, fiber algebras,
and sheaf laplacians, weirdly."

Three words carry the whole thing: *local*, *future*, *necessary*. Each is
already a named object in Obsmetrologia and metrologic. This note reads
them off, then explores what follows.

## 2. Local: the stalk of the board sheaf

The board is a site: a cover by regions with overlaps and restrictions
(`Obsmetrologia/Site/Sheaf.lean`, `Site/Section.lean`; the arena paper's
"site supplies observable local supports, covers, overlaps, and
restrictions"). A reading of the board is a section over a region. The
stalk at a group is what every region containing the group agrees on once
restricted to it.

A group's *continuations* live in that stalk: the moves that keep the group
admitted, computed locally. The kernel computes exactly this when
`findGroup` floods a group and collects its liberties
(`weiqi-kernel/src/board.mts`); `Obsmetrologia/GameTheory/Weiqi/Board.lean`
now states the same object formally — `Board.Group` (a
`Discrete.Graph.Reach`-component of same-colour occupied points) and
`Board.Liberties` (the empty points adjacent to some stone of the group),
with `Board.liberties_disjoint_from_stones` proving a liberty is never
itself a stone of the group it liberates. In the honeycomb reading each
continuation is a future-facing face of the genet. Atari is the condition
that the stalk's set of admitted continuations is a singleton. Its size is
the liberty count. Nothing global has been consulted yet, and that is the
point: atari is a local section, not a global judgment.

## 3. Future: liberties point into time

The honeycomb ruling (persisted 2026-09-03 in the semiotic-language-model
skill) keeps time as a direction: a cell's faces toward earlier cells are
what its precondition consumed; its faces toward later cells are its
liberties. A liberty is therefore not an adjacent empty point, which is the
projection ordinary weiqi shows; it is an arrow into the next layer of the
stacked board (glass-sponge note §17.4). One local future left means: in
this stalk, exactly one arrow into the future remains admitted.

## 4. Necessary: the Heyting algebra of where a claim holds

In a sheaf topos the truth values are not two. They are the Heyting algebra
of open sets of the site: the value of "this group lives" is *the region
over which it lives*, an open, and the value of a contested claim is a pair
of opens for and against, which is the FOUR charge read topologically. This
is why the grey interior of a cell (the Huidu reading persisted 2026-09-03)
is not a fudge: it is the subobject classifier doing its job.

Necessity is the interior modality on that algebra. Obsmetrologia carries
it as the order Laplacian's own components: `L = □∘◇` in
`Obsmetrologia/Dynamics/Flow/LawvereLaplacianSpectralGap.lean`, with the
harmonic kernel `IsHarmonic M v ↔ L v = v`. A claim is necessary at a
position when it holds on every cover, that is, when its open is the whole
interior.

A move is *forced* when the Heyting implication

    (not answering) ⇒ (loss)

holds necessarily: the largest open on which not answering is consistent
with no loss is empty. That is the pseudo-complement, and it is computed in
the fiber, not on the board. Two things follow immediately and both match
play:

- An atari whose capture costs nothing is not forced. `loss` is then **f**
  in the payoff readout, witnessed: nothing is lost. The implication
  `(not answering) ⇒ loss` reduces to the interior of `answering`, which
  is not the whole space, so the move is not necessary. (⊥ is a different
  case: `loss` unwitnessed means the atari has not been read yet, and
  reading is the duty before any forcing judgment; ⊤ means the loss is
  itself contested.)
- A move can be forced without any group being in atari. The residual is
  about loss, and loss can be territorial. Sente is the same object one
  level up: a move whose pullback makes the opponent's residual empty.

So "forced only when necessary" is literal. Necessity is □, forcing is a
residual, and atari is the local precondition that makes the residual
cheap to compute.

## 5. Fiber algebras: where the residual is computed

The predication paper (`math-services-section/.../research-articles/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md`,
author emsenn) puts a residuated structure on every predicate fiber: the
Lambek residuation on the twist product `2 ⊗ 2`, lifting to "a decidable
modal calculus over any system of subject-predicate-object triples." The
board's readouts are exactly such fibers: `alive(group)`, `owns(colour,
point)`, `liberty-of(point, group)`. Each carries its own FOUR value per
position, its own residual `⇒`, and the fiber functor moves them along
moves.

The forced-move computation of §4 is the residual in the `loss` fiber
applied to the `answer` fiber. Decidability is the paper's theorem, not a
hope, which is why the kernel can eventually refuse or admit a move as
forced without a search. The Chu space of positions × readouts (the weiqi
section's research article on readouts) is the matrix of these fibers; a
column is a fiber, a row is a position's costate.

## 6. Sheaf Laplacian: forced moves are nonzero gradient, territory is harmonic

Put a cellular sheaf on the honeycomb: a stalk per cell (the interior
valuation), a restriction map per face (the contract that carries a claim
across an arrow with its orientation and angle). The sheaf Laplacian
measures, at each cell, the disagreement between what the cell holds and
what its neighbours' restrictions expect of it. Then:

- **Territory is harmonic.** A point whose readout every neighbouring
  region agrees on is in the Laplacian's kernel. Obsmetrologia proves the
  kernel is the settled global section:
  `Obsmetrologia/Cohomology/LawvereHarmonicCohomology.lean`, "the
  Lawvere-harmonic section is the cohomologically-trivial global section",
  `M.settle seed` is harmonic and its classifying invariant vanishes in the
  strict and Scott regimes. That is the two-time board's "fixed under both
  nuclei" said spectrally.
- **Aji is Laplacian energy.** A cell whose stalk disagrees with its
  neighbours' expectations, with no move yet resolving it, carries nonzero
  energy and stays out of the kernel. This is the inconsistency-sheaf
  reading of aji in `obsmetrologia-and-go-strategy.md`, now with a number:
  the energy at the cell.
- **A forced move is nonzero gradient at the group.** The Laplacian flow
  `x' = −L x` is the market of the territory audit driving the Burgers
  vector to zero. A forced move is one the flow takes regardless of who is
  to move; an unforced atari is a cell where the gradient is zero because
  the loss fiber is **f**, witnessed as nothing lost.
- **The spectral gap is the temperature.** How fast a local fight settles
  under the flow is the smallest nonzero eigenvalue on that region
  (`LawvereLaplacianSpectralGap.lean`; the chromatic tile gaps in
  `Dynamics/Flow/ChromaticTileGap.lean`). Combinatorial game theory calls
  the analogous quantity temperature. This is a correspondence, and unlike
  occupation entropy (rejected in the strategy note) it is not a
  restatement of an engine statistic: engines do not compute a gap.

## 7. What it means for the org's atari list

The 561-group board note (in progress this session) derives sections with
one live consumer as the org's atari list. This note says how to price it:
a section in atari is *forced* only when its loss would change a harmonic
section, a global readout the org relies on. The price of the forced move
is the Laplacian energy released, and Obsmetrologia already carries the
cost side (`Cohomology/AntiLandauerEntropy.lean`, `LandauerEntropy.lean`).
An atari nobody should answer is a section whose loss fiber is **f**,
witnessed as nothing lost: capture it into legacy and spend nothing. A
section whose loss fiber is ⊥ has not been read, and reading it is the
whole-board reader's duty before anyone decides.

## 8. Open, and what refutes it

- Is the order Laplacian `□∘◇` the cellular sheaf Laplacian `δᵀδ` of the
  board sheaf, or a projection of it? `Dynamics/Flow/Laplacianizability.lean`
  and its concept note state the projection; the identification on the
  honeycomb is the next Lean lot, and it is the same lot as the honeycomb
  patch filed on the rail tonight.
- Refutation path: compute per-group Laplacian energy on real positions
  through the engine client's readout envelope and compare with the
  engine's policy mass on the atari-saving move. If energy does not
  separate forced from unforced ataris better than liberty count alone,
  §4 is wrong as stated.
- Two eyes, in this language: two independent harmonic holes in the
  group's stalk. Independence is still the missing definition.
