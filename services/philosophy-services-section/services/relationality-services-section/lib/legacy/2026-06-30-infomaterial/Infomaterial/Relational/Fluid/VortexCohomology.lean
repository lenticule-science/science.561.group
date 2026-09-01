/-!
# VortexCohomology — fluids: vortex circulation as a discrete de Rham `H¹` (DERIVED)

The topological-fluid frontier (`…/infomaterial_gases_liquids_plasmas_proof_frontier.md`, Batch E) asks for
fluid/plasma **defects** — vortices, circulation — as a vanishing-vs-nonvanishing cohomological
obstruction. A vortex is a point where the velocity field fails to be a gradient: its **circulation**
`∮ v · dl` (the winding of the phase) is a nonzero de Rham `H¹` class, the topological vortex charge.

This is the **finite circulation cohomology** on a discrete loop, built from `Int`-valued cochains — a
self-contained discrete de Rham `H¹`, distinct from the regime-curvature defect of `Cohomology.Defect`.
A `VortexLoop` carries a velocity 1-cochain `velocity : ℕ → ℤ` on the edges of an oriented cycle of
`size` nodes. Its **circulation** is the loop sum `∮ v = Σ_{k<size} v k`. A velocity field is a
**gradient** (irrotational / potential flow) when it is the discrete coboundary of a single-valued node
potential `φ` (closing up around the loop, `φ size = φ 0` — no monodromy).

The two structural facts: an irrotational flow has **zero circulation** (`gradient_circulation_zero`,
`∮ ∇φ = φ(size) − φ(0) = 0` by telescoping + loop closure — the exact `1`-cochains have trivial class),
and therefore **nonzero circulation forces a genuine `H¹` obstruction** (`vortex_obstruction_implies_H1_nonzero`:
the velocity is not a coboundary). Circulation is the integration functional on cochains, additive over
superposed flows (`circulation_superpose`). The unit vortex realizes circulation `1`, so the obstruction
has teeth.

The continuum — the `1/r` velocity profile, Kelvin's circulation theorem under the Euler flow, Biot–Savart
vorticity transport — is the analytic layer above (PDE on `ℝᵈ`), not visible here; the circulation
invariant and its exactness obstruction are exact.

## Main definitions
* `VortexLoop`, `circulation` — a velocity 1-cochain on an oriented cycle and its loop sum `∮ v`.
* `IsGradient` — the flow is the coboundary of a single-valued loop potential (irrotational).

## Main results
* `gradient_circulation_zero` — an irrotational (gradient) flow has zero circulation.
* `vortex_obstruction_implies_H1_nonzero` — nonzero circulation ⟹ the flow is not exact (a genuine
  `H¹` vortex class).
* `circulation_superpose` — circulation is additive (the integration functional on cochains).
* `unitVortex_circulation`, `unitVortex_not_gradient` — the unit vortex genuinely obstructs.

## References
`content/.../infomaterial_gases_liquids_plasmas_proof_frontier.md` Batch E (defect/vortex `H¹`). The
regime-curvature defect companion is `Cohomology.Defect`; the plasma curvature events are
`Plasma.ReconnectionCurvature` / `Plasma.TopologicalWaveSheaf`.

## Tags
vortex, circulation, winding number, discrete de Rham, H¹, coboundary, irrotational flow
-/

namespace Infomaterial
namespace Relational.Fluid

/-- The **loop sum** of a velocity field over the first `m` edges: `Σ_{k<m} v k`, the discrete `∮`. -/
def loopSum (v : Nat → Int) : Nat → Int
  | 0 => 0
  | (m + 1) => v m + loopSum v m

/-- An **oriented vortex loop**: a velocity `1`-cochain `velocity k` on edge `k ↦ k+1` of a cycle of
`size` nodes (node `size` identified with node `0`). -/
structure VortexLoop where
  /-- The number of nodes/edges around the loop. -/
  size : Nat
  /-- The velocity `1`-cochain: the velocity on edge `k ↦ k+1`. -/
  velocity : Nat → Int

/-- The **circulation** `∮ v · dl = Σ_{k<size} v k` — the discrete loop integral of the velocity, the
topological vortex charge (winding number). -/
def circulation (L : VortexLoop) : Int := loopSum L.velocity L.size

/-- A velocity field is a **gradient** (irrotational / potential flow) when it is the discrete coboundary
`v k = φ(k+1) − φ(k)` of a **single-valued** node potential `φ` that closes around the loop
(`φ size = φ 0` — no monodromy). The exact `1`-cochains. -/
def IsGradient (L : VortexLoop) : Prop :=
  ∃ φ : Nat → Int, φ L.size = φ 0 ∧ ∀ k, k < L.size → L.velocity k = φ (k + 1) - φ k

/-- **Telescoping**: the loop sum of a coboundary `v k = φ(k+1) − φ(k)` over the first `m` edges is
`φ m − φ 0`. The discrete fundamental theorem of calculus. -/
theorem loopSum_gradient (v φ : Nat → Int) :
    ∀ m, (∀ k, k < m → v k = φ (k + 1) - φ k) → loopSum v m = φ m - φ 0
  | 0, _ => by show (0 : Int) = φ 0 - φ 0; omega
  | (m + 1), h => by
      have ih := loopSum_gradient v φ m (fun k hk => h k (Nat.lt_succ_of_lt hk))
      have hm := h m (Nat.lt_succ_self m)
      show v m + loopSum v m = φ (m + 1) - φ 0
      rw [hm, ih]; omega

/-- **An irrotational flow has zero circulation.** `∮ ∇φ = φ(size) − φ(0) = 0`: a gradient velocity
field is an exact `1`-cochain, and exact cochains have vanishing loop integral (telescoping closes up
because the potential is single-valued around the loop). The `H¹ = 0` direction. -/
theorem gradient_circulation_zero (L : VortexLoop) (h : IsGradient L) : circulation L = 0 := by
  obtain ⟨φ, hclose, hgrad⟩ := h
  show loopSum L.velocity L.size = 0
  rw [loopSum_gradient L.velocity φ L.size hgrad, hclose]; omega

/-- **A vortex obstructs exactness: nonzero circulation forces `H¹ ≠ 0`.** If the circulation is nonzero
the velocity field cannot be a gradient — it is not a coboundary, so it carries a genuine degree-`1`
cohomology class (the topological vortex charge / winding number). The defect-obstruction projection. -/
theorem vortex_obstruction_implies_H1_nonzero (L : VortexLoop) (h : circulation L ≠ 0) :
    ¬ IsGradient L :=
  fun hg => h (gradient_circulation_zero L hg)

/-- **Circulation is additive** — the integration functional on `1`-cochains: the circulation of a
superposition of two flows on the same loop is the sum of their circulations. -/
theorem loopSum_add (v w : Nat → Int) :
    ∀ m, loopSum (fun k => v k + w k) m = loopSum v m + loopSum w m
  | 0 => by show (0 : Int) = 0 + 0; omega
  | (m + 1) => by
      show (v m + w m) + loopSum (fun k => v k + w k) m = (v m + loopSum v m) + (w m + loopSum w m)
      rw [loopSum_add v w m]; omega

/-- Circulation of a superposed flow is the sum of circulations (on a shared loop). -/
theorem circulation_superpose (size : Nat) (v w : Nat → Int) :
    circulation ⟨size, fun k => v k + w k⟩
      = circulation ⟨size, v⟩ + circulation ⟨size, w⟩ :=
  loopSum_add v w size

/-! ## The obstruction has teeth: the unit vortex -/

/-- The **unit vortex**: a single-edge oriented loop with velocity `1` — circulation `1`. -/
def unitVortex : VortexLoop where
  size := 1
  velocity := fun _ => 1

/-- Its circulation is `1` — a genuine nonzero winding. -/
theorem unitVortex_circulation : circulation unitVortex = 1 := by decide

/-- **The unit vortex is not a gradient.** A flow with circulation `1` carries a nontrivial `H¹` class —
no single-valued potential generates it (it has monodromy). -/
theorem unitVortex_not_gradient : ¬ IsGradient unitVortex :=
  vortex_obstruction_implies_H1_nonzero unitVortex (by rw [unitVortex_circulation]; decide)

end Relational.Fluid
end Infomaterial
