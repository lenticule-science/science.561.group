import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRao

/-!
# The Jeandel–Rao marker-domino substitution as a transcribed integer chain map

`JeandelRao` exhibited two finite nonzero `H¹` witnesses — the marker-ring quotient class `b3`
(`markerRingComplex`, `7` edges, rank-`5` `H¹`) and the decorated witness `φ` (`jrComplex`, `6` edges)
— and recorded that `φ` is the *decorated pullback* of `b3` along a marker-domino step, but deferred
that pullback as "geometric rather than a transcribable integer chain map" — the open
`thm:jeandel-rao-persistence`.

It is in fact transcribable. This module supplies the explicit integer **cellular chain map**
`jrComplex → markerRingComplex` realizing the marker-domino step and proves it carries `b3` to `φ`:

* on `1`-cells, `subEdge` sends the two marked edges `e2 ↦ q1`, `e3 ↦ q5` and the four unmarked edges
  `e0,e1,e4,e5 ↦ q0` (the unmarked quotient edge);
* on `2`-cells, every witness face maps to the single quotient face chain `−g3` (`subFace`), because
  `∂(−g3) = q1 − q5` equals the `subEdge`-image of each witness-face boundary.

The induced **pullback on cochains** `subPull ψ e := ψ (subEdge e)` then satisfies `subPull b3 = φ`
(`subPull_b3`) and carries cocycles to cocycles (`subPull_cocycle`) — the chain-map property, proved
from the single closedness equation `δ¹ψ(g3) = 0`. So `φ = subPull b3` is a pullback of a
nonzero class along a transcribed integer chain map, not merely a geometric coincidence: the
marker-domino persistence step, one rung, formalized.

## Main definitions

* `subEdge`, `subFace` — the cellular substitution `jrComplex → markerRingComplex` on `1`- and
  `2`-cells.
* `subPull` — the induced pullback of `markerRingComplex` cochains to `jrComplex` cochains.

## Main results

* `subPull_b3` — the pullback of `b3` is exactly the decorated witness `φ`.
* `subFace_chain` — the chain-map square: `δ¹_{jr}(subPull ψ)` on every face equals `−δ¹_{mr}ψ(g3)`.
* `subPull_cocycle` — `subPull` carries cocycles to cocycles (the chain-map property).
* `jr_substitution_pullback` — the bundled headline: `subPull b3 = φ`, `φ` is a nonzero cocycle
  realized as the pullback of the nonzero class `b3`.

## Implementation notes

This formalizes **one** marker-domino rung (`jrComplex → markerRingComplex`), not the full directed
system: promoting `[φ]` to a nonzero *direct-limit* class still requires the substitution **tower** and
nonzero-preservation at every stage. So `thm:jeandel-rao-persistence` is advanced — its chain-map core
is no longer geometric-only — but not discharged.

## References

* S. Labbé, *Substitutive structure of Jeandel–Rao aperiodic tilings*, arXiv:1808.07768 (2018).
* J. Anderson, I. Putnam, *Topological invariants for substitution tilings* (1995).

## Tags

Jeandel–Rao, Anderson–Putnam, substitution, chain map, pullback, cohomology, cl-inv, persistence
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Witness

/-! ## (1) The cellular substitution on cells -/

/-- The marker-domino substitution on `1`-cells: the cellular edge map `jrComplex → markerRingComplex`.
The two marked witness edges go to the two `b3`-core edges `e2 ↦ q1`, `e3 ↦ q5`; the four unmarked
edges collapse to the unmarked quotient edge `q0`. -/
def subEdge : Edge → QEdge
  | Edge.e0 => QEdge.q0
  | Edge.e1 => QEdge.q0
  | Edge.e2 => QEdge.q1
  | Edge.e3 => QEdge.q5
  | Edge.e4 => QEdge.q0
  | Edge.e5 => QEdge.q0

/-- The marker-domino substitution on `2`-cells, as an integer `2`-chain: every witness face maps to
`−g3`. This is forced by the chain-map square — `∂(−g3) = q1 − q5` is exactly the `subEdge`-image of
each witness-face boundary (`∂f0 = e0−e1+e2−e3`, `∂f1 = ∂f2 = e2−e3+e4−e5`, all sent to `q1 − q5`). -/
def subFace : Face → QFace → Int := fun _ g => if g = QFace.g3 then -1 else 0

/-! ## (2) The induced pullback on cochains -/

/-- The **pullback** of a `markerRingComplex` `1`-cochain to a `jrComplex` `1`-cochain along the
substitution edge map: `(subPull ψ) e = ψ (subEdge e)`. -/
def subPull (ψ : QEdge → Int) : Edge → Int := fun e => ψ (subEdge e)

/-- **The pullback of the marker-ring core `b3` is the decorated witness `φ`.** `subPull b3 = φ`:
the marked edges pick up `b3 q1 = b3 q5 = 1 = φ e2 = φ e3`, the unmarked edges pick up `b3 q0 = 0`. -/
theorem subPull_b3 : subPull b3 = phi := by
  funext e; cases e <;> rfl

/-! ## (3) The chain-map property -/

/-- **The chain-map square, per face.** For every witness face `fc`, the `jr`-coboundary of a pulled-back
cochain equals minus the `markerRing`-coboundary of `ψ` at `g3`:
`δ¹_{jr}(subPull ψ) fc = −δ¹_{mr} ψ g3`. Both sides reduce to `ψ q1 − ψ q5` — the content of
`∂(subFace fc) = subEdge(∂fc)`. -/
theorem subFace_chain (ψ : QEdge → Int) (fc : Face) :
    jrComplex.delta1 (subPull ψ) fc = - markerRingComplex.delta1 ψ QFace.g3 := by
  cases fc <;>
    simp only [jrComplex, markerRingComplex, OneVertexComplex.delta1, subPull, subEdge, d2, qd2,
      List.map_cons, List.map_nil, List.sum_cons, List.sum_nil] <;>
    omega

/-- **The pullback carries cocycles to cocycles** — the chain-map property. If `ψ` is closed on
`markerRingComplex`, then `subPull ψ` is closed on `jrComplex`: every face coboundary equals
`−δ¹ψ(g3) = 0`. The whole chain-map content rests on the single closedness equation `δ¹ψ(g3) = 0`. -/
theorem subPull_cocycle (ψ : QEdge → Int) (h : markerRingComplex.IsCocycle ψ) :
    jrComplex.IsCocycle (subPull ψ) := by
  intro fc
  rw [subFace_chain ψ fc, h QFace.g3]; omega

/-! ## (4) The headline -/

/-- **The marker-domino substitution carries `b3` to `φ` along a transcribed integer chain map.** The
cellular map `subEdge`/`subFace : jrComplex → markerRingComplex` induces the cochain pullback `subPull`,
which (i) sends the marker-ring core class `b3` to the decorated witness `φ` exactly, and (ii) carries
cocycles to cocycles; since `b3` is a nonzero cocycle, `φ = subPull b3` is realized as the pullback of a
nonzero `H¹` class — the marker-domino persistence step, one rung, no longer "geometric only" but a
transcribed integer chain map. (One rung — not yet the full direct-limit tower of
`thm:jeandel-rao-persistence`.) -/
theorem jr_substitution_pullback :
    subPull b3 = phi
    ∧ jrComplex.IsCocycle (subPull b3)
    ∧ (subPull b3) Edge.e2 ≠ 0 :=
  ⟨subPull_b3,
   subPull_cocycle b3 b3_closed,
   by rw [subPull_b3]; exact phi_nonzero⟩

end AperiodicOrder.Tiling.Witness
end Obsmetrologia
