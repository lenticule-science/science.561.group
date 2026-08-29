import PredicationCategories.Categorical.Specialization

/-!
# Frobenius reciprocity for the specialization generator

Mechanizes the specialization case of the corpus theorem
`theorems/frobenius-for-knowledge-and-truth-meets.md`:

> ∃_f^k(f^*(α) ∧_k φ) ≅ α ∧_k ∃_f^k(φ),
> ∃_f^t(f^*(α) ∧_t φ) ≅ α ∧_t ∃_f^t(φ),
> for the specialization generator f.

Stated against the typed-restriction form `specRestrict` so that
`α : A_p`, `φ : A_q`, `f^*α : A_q`, and the meet on the LHS is the
small-fiber meet on `A_q`. Both proofs case-split on `p ∈ D`. On `D`
both sides collapse to `α p ⊓_? φ ⟨p, _⟩` (by `rfl`); off `D`, the LHS
is the boundary default of the existential extension (`⊥` / `f`), and
the RHS reduces to `α p ⊓_? <default>`, which collapses to the same
default by the absorbers `infK_bot` / `infT_f`.

No distributivity is required — the specialization case sidesteps the
indexed-join distributivity that the projection cases need.
-/

universe u v

open Categorical
open scoped Categorical.PreBilattice Categorical.Bilattice

namespace PredicateMap

variable {L : Type u} {E : Type v} [CompleteLattice L]
  (D : Set (E × E)) [DecidablePred (· ∈ D)]

/-- **Specialization K-Frobenius**:
`∃_f^k(f^*α ⊓ₖ φ) = α ⊓ₖ ∃_f^k(φ)`. -/
theorem frobenius_spec_K (α : PredicationFiberAlgebra L E)
    (φ : RestrictedFiberAlgebra L D) :
    existsK_spec D (specRestrict D α ⊓ₖ φ) = α ⊓ₖ existsK_spec D φ := by
  funext p
  by_cases hp : p ∈ D
  · rw [existsK_spec_mem hp]
    show TwistProduct.infK (specRestrict D α ⟨p, hp⟩) (φ ⟨p, hp⟩) =
         TwistProduct.infK (α p) (existsK_spec D φ p)
    rw [existsK_spec_mem hp]; rfl
  · rw [existsK_spec_not_mem hp]
    show (⊥ : TwistProduct L) = TwistProduct.infK (α p) (existsK_spec D φ p)
    rw [existsK_spec_not_mem hp]
    exact (TwistProduct.infK_bot _).symm

/-- **Specialization T-Frobenius**:
`∃_f^t(f^*α ⊓ₜ φ) = α ⊓ₜ ∃_f^t(φ)`. -/
theorem frobenius_spec_T (α : PredicationFiberAlgebra L E)
    (φ : RestrictedFiberAlgebra L D) :
    existsT_spec D (specRestrict D α ⊓ₜ φ) = α ⊓ₜ existsT_spec D φ := by
  funext p
  by_cases hp : p ∈ D
  · rw [existsT_spec_mem hp]
    show TwistProduct.infT (specRestrict D α ⟨p, hp⟩) (φ ⟨p, hp⟩) =
         TwistProduct.infT (α p) (existsT_spec D φ p)
    rw [existsT_spec_mem hp]; rfl
  · rw [existsT_spec_not_mem hp]
    show (TwistProduct.f : TwistProduct L) = TwistProduct.infT (α p) (existsT_spec D φ p)
    rw [existsT_spec_not_mem hp]
    exact (TwistProduct.infT_f _).symm

end PredicateMap
