import Mathlib.Order.Heyting.Basic
import RelationalHyperverse.FixedFiber

-- Establishes: stable-envelope

/-!
# StableEnvelope: the interior operator and the observable envelope

Corresponds to `math/stable-envelope.md`.

The **j-interior** `i_j(a) = ¬j(¬a) = j(a ⇨ ⊥) ⇨ ⊥` is the dual of the nucleus j.
The **stable envelope** `Env(a) = i_σ(a) ∧ i_Δ(a)` is the "observable content" of
an element a: the largest element of H* lying below a (when the nuclei preserve ⊥
and H is finite).

## Main definitions
- `Nucleus.j_interior j a` : the j-interior i_j(a) = ¬j(¬a)
- `BiNucleus.stableEnvelope bn a` : Env(a) = i_σ(a) ∧ i_Δ(a)

## Main results
- `Nucleus.nucleus_neg_fixed` : j(a ⇨ ⊥) = a ⇨ ⊥ whenever j(⊥) = ⊥
- `Nucleus.j_interior_mem_fixedPoints` : i_j(a) ∈ Fix(j) when j(⊥) = ⊥
- `BiNucleus.stableEnvelope_mem_fixedFiber` : Env(a) ∈ H* when both nuclei preserve ⊥

## Open items
- `stableEnvelope_le` : Env(a) ≤ a — requires Boolean structure.
  In a general Heyting algebra `j(neg a) ⇨ ⊥ ≤ a` does NOT hold without extra axioms.
- `stableEnvelope_greatest` : universal property, largest H* element ≤ a (requires finiteness)
-/

namespace Nucleus

variable {H : Type*} [HeytingAlgebra H]

/-- The j-interior: i_j(a) = ¬j(¬a) = j(a ⇨ ⊥) ⇨ ⊥.

    In locale theory (complete frames) this is the largest j-fixed point ≤ a.
    Here we define it by the formula; deflationarity is OPEN (requires Boolean
    structure, as `j(neg a) ⇨ ⊥ ≤ a` fails in general Heyting algebras). -/
def j_interior (j : Nucleus H) (a : H) : H :=
  j.toFun (a ⇨ ⊥) ⇨ ⊥

/-- A nucleus preserving ⊥ fixes all Heyting negations: j(a ⇨ ⊥) = a ⇨ ⊥.

    Proof: j(a) ∧ j(a ⇨ ⊥) = j(a ∧ (a ⇨ ⊥)) = j(⊥) = ⊥ by meet-preservation.
    Since j(a) ≥ a (extensivity): a ∧ j(a ⇨ ⊥) ≤ j(a) ∧ j(a ⇨ ⊥) = ⊥.
    So j(a ⇨ ⊥) ≤ a ⇨ ⊥; combined with extensivity: equality. -/
theorem nucleus_neg_fixed (j : Nucleus H) (hj_bot : j.toFun ⊥ = ⊥) (a : H) :
    j.toFun (a ⇨ ⊥) = a ⇨ ⊥ := by
  apply le_antisymm _ (j.extensive _)
  rw [le_himp_iff]
  calc j.toFun (a ⇨ ⊥) ⊓ a
      ≤ j.toFun (a ⇨ ⊥) ⊓ j.toFun a := inf_le_inf_left _ (j.extensive a)
    _ = j.toFun ((a ⇨ ⊥) ⊓ a)       := (j.meet_pres _ _).symm
    _ ≤ j.toFun ⊥                    := j.monotone (le_himp_iff.mp le_rfl)
    _ = ⊥                            := hj_bot

/-- The j-interior is a j-fixed point, given j(⊥) = ⊥.

    Proof: j fixes a ⇨ ⊥ (by nucleus_neg_fixed), so j(a⇨⊥) ∈ Fix(j) by idempotence;
    ⊥ ∈ Fix(j) by hypothesis; so j(a⇨⊥) ⇨ ⊥ ∈ Fix(j) by `himp_fixed_of_fixed`. -/
theorem j_interior_mem_fixedPoints (j : Nucleus H) (hj_bot : j.toFun ⊥ = ⊥) (a : H) :
    j.j_interior a ∈ j.fixedPoints := by
  change j.toFun (j.j_interior a) = j.j_interior a
  exact j.himp_fixed_of_fixed (j.idempotent (a ⇨ ⊥)) hj_bot

end Nucleus


namespace BiNucleus

variable {H : Type*} [HeytingAlgebra H]

/-- The stable envelope of a (`math/stable-envelope.md` §def-stable-envelope).
    Env(a) = i_σ(a) ∧ i_Δ(a) = ¬σ(¬a) ∧ ¬Δ(¬a).

    The "observable content" of a: the element of H* that records what
    doubly-stable propositions a entails. The universal property (greatest H*
    element ≤ a) is OPEN — requires nuclei to preserve ⊥ or finiteness of H. -/
def stableEnvelope (bn : BiNucleus H) (a : H) : H :=
  bn.σ.j_interior a ⊓ bn.Δ.j_interior a

/-- When both nuclei preserve ⊥, the stable envelope is in the fixed fiber H*.

    The cross-nucleus conditions (each nucleus fixes negations of the other's fixed
    points) are NOT assumed — they follow from ⊥-preservation alone via
    `nucleus_neg_fixed`: if j(⊥) = ⊥ then j(a ⇨ ⊥) = a ⇨ ⊥ for all a.

    **Proof** (diagonal components):
    - i_σ(a) = σ(a⇨⊥)⇨⊥ ∈ Fix(σ): by `j_interior_mem_fixedPoints hσ_bot`.
    - i_Δ(a) = Δ(a⇨⊥)⇨⊥ ∈ Fix(Δ): by `j_interior_mem_fixedPoints hΔ_bot`.

    **Proof** (cross components):
    - i_σ(a) = σ(a⇨⊥)⇨⊥ ∈ Fix(Δ): `nucleus_neg_fixed hΔ_bot` applied to σ(a⇨⊥)
      gives Δ(σ(a⇨⊥)⇨⊥) = σ(a⇨⊥)⇨⊥.
    - i_Δ(a) = Δ(a⇨⊥)⇨⊥ ∈ Fix(σ): `nucleus_neg_fixed hσ_bot` applied to Δ(a⇨⊥)
      gives σ(Δ(a⇨⊥)⇨⊥) = Δ(a⇨⊥)⇨⊥. -/
theorem stableEnvelope_mem_fixedFiber (bn : BiNucleus H)
    (hσ_bot : bn.σ.toFun ⊥ = ⊥) (hΔ_bot : bn.Δ.toFun ⊥ = ⊥)
    (a : H) : bn.stableEnvelope a ∈ bn.fixedFiber :=
  fixedFiber_inf_closed bn
    ⟨-- i_σ(a) ∈ Fix(σ): diagonal, from j_interior_mem_fixedPoints.
     bn.σ.j_interior_mem_fixedPoints hσ_bot a,
     -- i_σ(a) = σ(a⇨⊥)⇨⊥ ∈ Fix(Δ): nucleus_neg_fixed hΔ_bot at σ(a⇨⊥).
     bn.Δ.mem_fixedPoints.mpr (bn.Δ.nucleus_neg_fixed hΔ_bot (bn.σ.toFun (a ⇨ ⊥)))⟩
    ⟨-- i_Δ(a) = Δ(a⇨⊥)⇨⊥ ∈ Fix(σ): nucleus_neg_fixed hσ_bot at Δ(a⇨⊥).
     bn.σ.mem_fixedPoints.mpr (bn.σ.nucleus_neg_fixed hσ_bot (bn.Δ.toFun (a ⇨ ⊥))),
     -- i_Δ(a) ∈ Fix(Δ): diagonal, from j_interior_mem_fixedPoints.
     bn.Δ.j_interior_mem_fixedPoints hΔ_bot a⟩

-- OPEN: stableEnvelope_le (Env(a) ≤ a) — requires Boolean structure.
--   In a general Heyting algebra, `j(a ⇨ ⊥) ⇨ ⊥ ≤ a` is double-negation elimination
--   and fails; it requires a Boolean algebra or frame-completeness.
-- OPEN: stableEnvelope_greatest — universal property, requires finiteness of H.
-- See math/stable-envelope.md §stable-envelope-universal.

end BiNucleus
