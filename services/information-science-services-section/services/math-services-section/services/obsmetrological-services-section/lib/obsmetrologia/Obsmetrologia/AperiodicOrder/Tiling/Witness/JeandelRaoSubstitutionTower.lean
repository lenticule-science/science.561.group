import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitution

/-!
# The Jeandel–Rao substitution tower — `b3` persists to a nonzero direct-limit class

`JeandelRaoSubstitution` transcribed the marker-domino rung as an explicit integer chain map
`subPull : C¹(markerRingComplex) → C¹(jrComplex)` with `subPull b3 = φ`. That is one rung between two
complexes. This module closes it into an **iterable endomorphism** and proves the persistence the
directed system demands: a nonzero **direct-limit** class.

The marker-domino rung has a **recognizability partner** `recPull : C¹(jrComplex) → C¹(markerRingComplex)`
— the pullback along the edge map sending the three `b3`-core edges `q1,q2,q5 ↦ e2` (the marked witness
edge) and the four others `↦ e0`. Because that map sends every marker-ring face boundary to a difference
of *equal* witness edges, `recPull` lands in cocycles **unconditionally** (`recPull_cocycle`), and it
carries the decorated witness back to the core: `recPull φ = b3` (`recPull_phi`).

Composing the two rungs gives a **substitution endomorphism** of `markerRingComplex`,
`σ ψ = recPull (subPull ψ)`. It is a substitution — not the identity (it collapses
`q2,q5,q3,q4,q6,q0` onto `{q1,q0}`) — yet it **fixes the core class**: `σ b3 = b3` (`sigma_b3`), since
`subPull b3 = φ` and `recPull φ = b3`. So `b3` is an eigenvector of `σ*` with eigenvalue `1`. Hence every
iterate fixes it (`sigmaIter_b3`: `σⁿ b3 = b3`), so no iterate is a coboundary, and `b3` is **nonzero in
the direct limit** of the constant directed system `H¹ --σ*--> H¹ --σ*--> ⋯` (`b3_nonzero_in_direct_limit`)
— the three requirements of the persistence frontier (a chain map per stage, compatibility across the
system, nonzero-ness in the colimit) all met.

## Main definitions

* `recEdge`, `recPull` — the recognizability return map `jrComplex → markerRingComplex` and its pullback.
* `sigma` — the composite substitution endomorphism `σ` of `markerRingComplex`.
* `sigmaIter` — the `n`-fold iterate `σⁿ`, the bonding map of the directed system at stage `n`.
* `NonzeroInDirectLimit` — the direct-limit zero criterion: no iterate becomes a coboundary (`= 0`).

## Main results

* `recPull_phi` — the return map carries `φ` back to the core `b3`.
* `sigma_b3` — the substitution fixes the core class: `σ b3 = b3`.
* `sigmaIter_b3` — every iterate fixes it: `σⁿ b3 = b3`.
* `b3_nonzero_in_direct_limit` — `b3` is a nonzero class in the colimit.
* `jr_substitution_tower` — the bundled headline: `σ` is a cocycle-preserving substitution endomorphism
  fixing `b3`, so `b3` persists to a nonzero direct-limit class.

## Implementation notes

On a one-vertex complex `δ⁰ = 0`, so the only coboundary is `0`; a class dies in the direct limit of the
constant system `H¹ --σ*--> H¹ --σ*--> ⋯` iff some finite iterate is a coboundary, i.e. `σᵏ c = 0`. Hence
`NonzeroInDirectLimit c := ∀ k, σᵏ c ≠ 0` is exactly the standard nonzero-in-colimit criterion for this
system. The composite `σ` is faithful to the transcribed marker-domino rung; identifying it with the
literal Labbé recognizable substitution matrix of the Jeandel–Rao shift is the residual scope of
`thm:jeandel-rao-persistence`.

## References

* S. Labbé, *Substitutive structure of Jeandel–Rao aperiodic tilings*, arXiv:1808.07768 (2018).
* J. Anderson, I. Putnam, *Topological invariants for substitution tilings* (1995).

## Tags

Jeandel–Rao, substitution, direct limit, persistence, Anderson–Putnam, cohomology, cl-inv, eigenvector
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Witness

/-! ## (1) The recognizability return map -/

/-- The recognizability return on `1`-cells: the edge map `markerRingComplex → jrComplex` sending the
three `b3`-core edges `q1,q2,q5` to the marked witness edge `e2` and the four others to the unmarked
`e0`. -/
def recEdge : QEdge → Edge
  | QEdge.q1 => Edge.e2
  | QEdge.q2 => Edge.e2
  | QEdge.q5 => Edge.e2
  | _        => Edge.e0

/-- The induced **pullback** of a `jrComplex` `1`-cochain to a `markerRingComplex` `1`-cochain. -/
def recPull (χ : Edge → Int) : QEdge → Int := fun q => χ (recEdge q)

/-- **The return map carries the decorated witness `φ` back to the marker-ring core `b3`.** -/
theorem recPull_phi : recPull phi = b3 := by
  funext q; cases q <;> rfl

/-- **The return pullback lands in cocycles unconditionally.** Every marker-ring face boundary is a
difference of `b3`-core edges all mapped to the single edge `e2`, so each coboundary telescopes to `0`
regardless of `χ`. -/
theorem recPull_cocycle (χ : Edge → Int) : markerRingComplex.IsCocycle (recPull χ) := by
  intro g
  cases g <;>
    simp only [markerRingComplex, OneVertexComplex.delta1, recPull, recEdge, qd2,
      List.map_cons, List.map_nil, List.sum_cons, List.sum_nil] <;>
    omega

/-! ## (2) The substitution endomorphism -/

/-- The **substitution endomorphism** `σ` of `markerRingComplex`: the marker-domino rung followed by the
recognizability return, `σ ψ = recPull (subPull ψ)`. A substitution (not the identity), yet it
fixes the core class. -/
def sigma (ψ : QEdge → Int) : QEdge → Int := recPull (subPull ψ)

/-- **`σ` preserves cocycles** — it factors through `recPull`, which lands in cocycles unconditionally.
So it induces a well-defined endomorphism of `H¹(markerRingComplex)`. -/
theorem sigma_cocycle (ψ : QEdge → Int) : markerRingComplex.IsCocycle (sigma ψ) :=
  recPull_cocycle (subPull ψ)

/-- **The substitution fixes the core class: `σ b3 = b3`.** `σ b3 = recPull (subPull b3) = recPull φ =
b3` (`subPull_b3`, `recPull_phi`). The class is an eigenvector of `σ*` with eigenvalue `1`. -/
theorem sigma_b3 : sigma b3 = b3 := by
  simp only [sigma, subPull_b3, recPull_phi]

/-! ## (3) The directed system and persistence -/

/-- The **`n`-fold iterate** `σⁿ` — the bonding map of the constant directed system at stage `n`. -/
def sigmaIter : Nat → (QEdge → Int) → (QEdge → Int)
  | 0, ψ => ψ
  | n + 1, ψ => sigma (sigmaIter n ψ)

/-- **Every iterate fixes the core class: `σⁿ b3 = b3`.** By induction, base `rfl`, step `sigma_b3`. -/
theorem sigmaIter_b3 : ∀ n, sigmaIter n b3 = b3
  | 0 => rfl
  | n + 1 => by
    show sigma (sigmaIter n b3) = b3
    rw [sigmaIter_b3 n, sigma_b3]

/-- **The direct-limit zero criterion.** A stage-`0` class is nonzero in the colimit of the constant
directed system `H¹ --σ*--> H¹ --σ*--> ⋯` exactly when no finite iterate becomes a coboundary; on a
one-vertex complex the only coboundary is `0`, so this is `∀ k, σᵏ c ≠ 0`. -/
def NonzeroInDirectLimit (c : QEdge → Int) : Prop := ∀ k, sigmaIter k c ≠ (fun _ => (0 : Int))

/-- **`b3` is a nonzero class in the direct limit.** Every iterate equals `b3` (`sigmaIter_b3`), and `b3`
is not the zero cochain (`b3 q1 = 1`), so no iterate vanishes — the core class survives the whole tower.
This is persistence to a nonzero direct-limit class. -/
theorem b3_nonzero_in_direct_limit : NonzeroInDirectLimit b3 := by
  intro k h
  rw [sigmaIter_b3 k] at h
  exact b3_nonzero (congrFun h QEdge.q1)

/-! ## (4) The headline -/

/-- **The Jeandel–Rao substitution tower carries `b3` to a nonzero direct-limit class.** The marker-domino
rung and its recognizability return compose to a substitution endomorphism `σ` of `markerRingComplex`
which (i) preserves cocycles, hence acts on `H¹`; (ii) fixes the core class, `σ b3 = b3`; (iii) so every
iterate fixes it, `σⁿ b3 = b3`; and (iv) therefore `b3` is nonzero in the direct limit of the constant
directed system — no iterate is a coboundary. The three requirements of the persistence frontier (a chain
map per stage, compatibility of the class across the system, nonzero-ness in the colimit) are met. The
residual scope is identifying `σ` with the literal Labbé recognizable substitution matrix. -/
theorem jr_substitution_tower :
    (∀ ψ : QEdge → Int, markerRingComplex.IsCocycle (sigma ψ))
    ∧ sigma b3 = b3
    ∧ (∀ n : Nat, sigmaIter n b3 = b3)
    ∧ NonzeroInDirectLimit b3 :=
  ⟨sigma_cocycle, sigma_b3, sigmaIter_b3, b3_nonzero_in_direct_limit⟩

end AperiodicOrder.Tiling.Witness
end Obsmetrologia
