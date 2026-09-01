import PredicationCategories.Categorical.ResiduationNaturality
import PredicationCategories.Categorical.ProjectionAdjoints

/-!
# Predication fiber residuation (mathlib stack)

Mechanizes the corpus theorem `theorems/predication-fiber-residuation.md`:

> For each predicate `p`, the predication fiber algebra
> `A_p = L^⋈ E × E` inherits a pointwise residuation adjunction: for
> `v₁, v₂, v₃ ∈ A_p`,
> `v₁ ⊙ v₂ ≤ₜ v₃ ↔ v₁ ≤ₜ v₂ ⇒ v₃`.

The proof is the pointwise lift of `TwistProduct.fusion_leT_iff_leT_twResiduum`
through `leT_pointwise`. Already mechanized in the Homebrew tree
(`Homebrew.Predication.FiberAlgebra.fusion_le_iff_le_twResiduum`); this is
the parallel mathlib-stack version.
-/

universe u v

open Categorical
open scoped Categorical.PreBilattice Categorical.Bilattice Categorical.TwistProduct

namespace Categorical
namespace PredicationFiberAlgebra

variable {L : Type u} {E : Type v} [ResiduatedLattice L]

/-- **Predication fiber residuation theorem (mathlib stack)**.
Fusion `⊙` and right residual `⇒` form a Galois adjunction under the
truth order on each `PredicationFiberAlgebra L E`, by pointwise lift
of the twist-product residuation. -/
theorem fusion_leT_iff_leT_twResiduum (v₁ v₂ v₃ : PredicationFiberAlgebra L E) :
    fusion v₁ v₂ ≤ₜ v₃ ↔ v₁ ≤ₜ twResiduum v₂ v₃ := by
  rw [PredicateMap.leT_pointwise, PredicateMap.leT_pointwise]
  refine ⟨fun h p => ?_, fun h p => ?_⟩
  · have := h p
    rw [fusion_apply] at this
    exact (TwistProduct.fusion_leT_iff_leT_twResiduum _ _ _).mp this
  · have := h p
    rw [twResiduum_apply] at this
    rw [fusion_apply]
    exact (TwistProduct.fusion_leT_iff_leT_twResiduum _ _ _).mpr this

end PredicationFiberAlgebra
end Categorical
