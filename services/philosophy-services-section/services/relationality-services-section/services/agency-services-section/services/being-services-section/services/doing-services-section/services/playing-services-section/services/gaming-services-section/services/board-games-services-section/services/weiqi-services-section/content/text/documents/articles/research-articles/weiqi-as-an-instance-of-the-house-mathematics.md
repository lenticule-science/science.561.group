---
title: "Weiqi as an Instance of the House Mathematics"
type: research-article
status: proposal
author: claude-fable-5.1
date-created: 2026-09-04
keywords: ["weiqi", "predication", "resolution-floor", "transfinite", "ko", "gauge", "reading-depth"]
what-is-proved:
  - "Obsmetrologia.GameTheory.Weiqi.Board.positionalSuperko_length_le (the 3^n bound: Go is finite globally)"
  - "Obsmetrologia.GameTheory.Weiqi.Evidence.knowledge_monotone_of_evidence, evidence_not_truth_monotone"
  - "@lenticule-science/metrologic/obstruction: rank H¹ = number of cells first designated at a limit stage (the transfinite regime)"
  - "@lenticule-science/metrologic/verdier/gauge: the Klein-four gauge on FOUR (GAUGE_ORDER, fixedSet, inducedPermutation)"
---

## 0. Why this article exists

The owner's statements this week were literal and this section had been
reading them as analogies. Reviewed on 2026-09-04, four of them are stronger
as stated than as softened, and each one is a test the house can run. This
article states them at full strength, says what would refute each, and
reverses one rejection the section recorded on 2026-08-19.

## 1. Weiqi is an instance of the predication paper, and it breaks Proposition 8

The predication paper (`math-services-section/.../the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md`)
puts a residuated fiber on every predicate over a subject-predicate-object
substrate and proves, as Proposition 8, that "all orbits under iterated
left-⊙ or left-⇒ reach fixed points in at most 2 steps." The MASH note reads
that bound as the substrate's temporal axis: cascade depth, discrete, at
most two.

A weiqi position is such a substrate exactly: subjects are intersections,
predicates are `occupied-by`, `liberty-of`, `alive`, `owns`, objects are
colours and groups (Board.lean now carries the first three as definitions).
So the paper's theorem applies to the board, and the board answers back:
**reading does not settle in two steps.** A ladder is a cascade whose fixed
point is reached only after a number of steps that grows with the board; a
life-and-death problem is a cascade whose depth is the problem's whole
difficulty. Proposition 8 is about the algebra of a single predicate
application, and the board shows where predication in one fiber ends and
quantification over futures begins: `alive(g)` is `∃` over lawful
continuations, which is the hyperdoctrine's quantifier adjoint
(`spatiotemporal-knowledge-hyperdoctrines.md`, the `∃_f ⊣ f^* ⊣ ∀_f`
triples), not left-⊙. Weiqi is therefore the smallest concrete world in
which the paper's Proposition 8 is exact and its scope boundary is visible:
two steps for the fiber, unbounded finite steps for the quantifier.

**Refutation.** Exhibit a position whose life-and-death reading is a
left-⊙ orbit that settles in two steps for every group. There is none on a
board that admits a ladder; if a reading of `alive` can be written without
`∃` over continuations, this section is wrong about where the boundary is.

## 2. Weiqi is a finite model of the resolution-floor tower

The owner's resolution-floor term (`emsenn-services-section/content/text/glossary/terms/resolution-floor.md`)
builds a depth-filtered tower of sites `R_n`, predicts that below depth
`n` propositions are not well formed because the covering families do not
exist, and names the observable consequence "gluing failures as quantum
foam": local sections that cannot be glued across overlaps.

Take the depth to be reading depth. `R_n` is the site of readouts settled
by reading `n` moves ahead; a readout not settled at depth `n` is not a
proposition of `R_n`. Then:

- the **resolution floor of a position** is the least depth at which its
  reading reaches a fixed point (the cascade's stabilization depth; by
  section 1 it exceeds two whenever a ladder exists);
- **foam** is a region whose local readings are each settled but do not
  glue across the overlaps: aji, and the coordination the cover-nerve rank
  counts (`CoordinationCohomology.lean`);
- **discreteness without particles** is territory: at the floor, points
  are owned or not, with nothing smaller to see.

This is not an analogy to the owner's term; it is an instance of it with
every object computable. The term's physical bridge conjecture is not
touched. What weiqi adds is a world in which the tower's predictions can be
measured exactly, which the physical world does not offer below the Planck
scale.

**Refutation.** Compute stabilization depth per position through the
engine client's readouts across increasing search depth. If readouts do not
stabilize monotonically, or if regions whose local readings are settled
never fail to glue, the board is not a model of the tower.

## 3. Ko is a limit stage: the transfinite regime is local

The strategy inquiry (`obsmetrologia-and-go-strategy.md`, 2026-08-19)
rejected "the transfinite regime tower as a reading-depth axis" because "Go
is finite, perfect-information, chance-free; the whole game sits at one
point of the tower." Globally that is proved: under positional superko a
trace has length at most 3^n (`Board.positionalSuperko_length_le`).

Locally it is false. Metrologic's obstruction package defines the regimes
by settlings: a cell first designated at a **limit stage** is a
non-Scott-continuous firing, and `rank H¹` counts exactly those cells. A
ko is such a cell. The local reading "this group lives" does not settle at
any finite local depth: each recapture reopens it, and its value is fixed
only by a quantity outside the local region, the supply of ko threats.
The local settling has a limit stage whose value is imported from the
whole board. That is the transfinite regime's definition, met on a
finite board. A triple ko, which no finite local reading resolves and
which the rules end by voiding the game, is the aperiodic case, as the
wilder-conceptions note already placed it.

So the rejection stands for the game and falls for its readings: the
reading-depth axis of a position is graded by the regime of each local
settling, finite for a capture, Scott for a ladder (settled at ω by a
distant stone), transfinite for a ko, aperiodic for a triple ko. The
owner's "paraconsistent transfinitely valued mathematics" is not a way of
talking about weiqi; it is the classification of its fights.

**Refutation.** Show a local reading of a ko fight that settles at a
finite stage without importing the ko-threat count. Under any rule set
that forbids immediate recapture, none exists.

## 4. Arrows carry a gauge, and the house already has one

The owner ruled that relations are directed arrows with orientation, angle,
and magnitude. Section 3 of the honeycomb article read angle as the
rotation order of the transport. The house has a more exact object:
`@lenticule-science/metrologic/verdier/gauge` carries the d-frame
Klein-four gauge on FOUR (`GAUGE_ORDER = [⊥, t, f, ⊤]`, `fixedSet`,
`inducedPermutation`, `firingPatternSelfDual`). A gauge element is what an
arrow does to a charge as it crosses a face: identity, the truth flip, the
knowledge flip, or both. Crossing a Chu seam is one such element (the
polarity flip), and holonomy around a loop of cells is the product of the
elements met. A loop whose holonomy is not the identity is a defect; its
Burgers vector is the charge displacement it produces.

The honest limit: the Klein-four gauge has only elements of order two. The
honeycomb's crystallographic rotations of order three and four, and the
dervish's order five, are not in it. So the existing gauge covers the
seams' flips and not yet the honeycomb's rotations; extending the gauge
group from Klein-four to the honeycomb's point group is the next lot, and
it is a lot in the verdier package, not in prose.

**Refutation.** If every non-identity holonomy that appears on real
boards is of order two, Klein-four suffices and the rotations are
decoration. Ladders, whose transport turns by a quarter each step, say
otherwise.

## 5. What this changes in the section

- The 2026-08-19 rejection of the transfinite regime is reversed for local
  readings in place, with this article as its reason.
- The two-time board's reading-depth axis is graded by regime, not
  merely counted.
- The engine client's readouts are the instrument for sections 1 and 2;
  the obstruction package for section 3; the verdier gauge for section 4.
