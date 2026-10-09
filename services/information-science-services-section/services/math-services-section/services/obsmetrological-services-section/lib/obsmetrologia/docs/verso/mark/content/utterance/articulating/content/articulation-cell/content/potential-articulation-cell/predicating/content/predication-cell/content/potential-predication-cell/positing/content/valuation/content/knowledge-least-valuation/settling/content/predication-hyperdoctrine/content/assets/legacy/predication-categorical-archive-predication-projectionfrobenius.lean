import PredicationCategories.Categorical.ProjectionAdjoints

/-!
# Frobenius reciprocity for the projection generators

Mechanizes the projection cases of the corpus theorem
`theorems/frobenius-for-knowledge-and-truth-meets.md`:

> ∃_f^k(f^*(α) ∧_k φ) ≅ α ∧_k ∃_f^k(φ),
> ∃_f^t(f^*(α) ∧_t φ) ≅ α ∧_t ∃_f^t(φ),
> for any predicate-category generator f.

Four theorems here, one per generator (subj / obj) × order (K / T).
The converse case is in `Categorical/ConverseQuantifierAdjoints.lean`
(no distributivity needed). The specialization case requires the
partial-pullback infrastructure not yet in the Categorical track.

The proof template, on cell `(s, o)`:

  - **Diagonal** (`s = o`): both sides reduce, via the corresponding
    `*_diag` lemma and pointwise infK/infT, to forms that differ only by
    distributivity of `⊓ₖ`/`⊓ₜ` over the indexed sup. Closed by
    `infK_kSup_eq` / `infT_tSup_eq`.

  - **Off-diagonal** (`s ≠ o`): the LHS is the off-diagonal default
    (`⊥` for K, `f` for T). The RHS is `α(s, o) ⊓_? <off-diag>`, which
    collapses to the same default by the absorber lemma `infK_bot` /
    `infT_f`.
-/

universe u v

open Categorical
open scoped Categorical.PreBilattice Categorical.Bilattice

namespace PredicateMap

variable {L : Type u} {E : Type v} [CompleteDistribLattice L] [DecidableEq E]

/-! ## Subject-projection -/

/-- **Subject-projection K-Frobenius**:
`∃_f^k(f^*α ⊓ₖ φ) = α ⊓ₖ ∃_f^k(φ)`. -/
theorem frobenius_subj_K (α φ : PredicationFiberAlgebra L E) :
    existsK_subj (fiberSubj L E α ⊓ₖ φ) = α ⊓ₖ existsK_subj φ := by
  funext p
  obtain ⟨s, o⟩ := p
  by_cases heq : s = o
  · subst heq
    rw [existsK_subj_diag]
    show TwistProduct.kSup (fun o' => α (s, s) ⊓ₖ φ (s, o')) =
         α (s, s) ⊓ₖ TwistProduct.kSup (fun o' => φ (s, o'))
    exact (TwistProduct.infK_kSup_eq _ _).symm
  · rw [existsK_subj_off_diag _ heq]
    show (⊥ : TwistProduct L) = α (s, o) ⊓ₖ existsK_subj φ (s, o)
    rw [existsK_subj_off_diag _ heq, TwistProduct.infK_bot]

/-- **Subject-projection T-Frobenius**:
`∃_f^t(f^*α ⊓ₜ φ) = α ⊓ₜ ∃_f^t(φ)`. -/
theorem frobenius_subj_T (α φ : PredicationFiberAlgebra L E) :
    existsT_subj (fiberSubj L E α ⊓ₜ φ) = α ⊓ₜ existsT_subj φ := by
  funext p
  obtain ⟨s, o⟩ := p
  by_cases heq : s = o
  · subst heq
    rw [existsT_subj_diag]
    show TwistProduct.tSup (fun o' => α (s, s) ⊓ₜ φ (s, o')) =
         α (s, s) ⊓ₜ TwistProduct.tSup (fun o' => φ (s, o'))
    exact (TwistProduct.infT_tSup_eq _ _).symm
  · rw [existsT_subj_off_diag _ heq]
    show (TwistProduct.f : TwistProduct L) = α (s, o) ⊓ₜ existsT_subj φ (s, o)
    rw [existsT_subj_off_diag _ heq, TwistProduct.infT_f]

/-! ## Object-projection -/

/-- **Object-projection K-Frobenius**:
`∃_f^k(f^*α ⊓ₖ φ) = α ⊓ₖ ∃_f^k(φ)`. -/
theorem frobenius_obj_K (α φ : PredicationFiberAlgebra L E) :
    existsK_obj (fiberObj L E α ⊓ₖ φ) = α ⊓ₖ existsK_obj φ := by
  funext p
  obtain ⟨s, o⟩ := p
  by_cases heq : s = o
  · subst heq
    rw [existsK_obj_diag]
    show TwistProduct.kSup (fun s' => α (s, s) ⊓ₖ φ (s', s)) =
         α (s, s) ⊓ₖ TwistProduct.kSup (fun s' => φ (s', s))
    exact (TwistProduct.infK_kSup_eq _ _).symm
  · rw [existsK_obj_off_diag _ heq]
    show (⊥ : TwistProduct L) = α (s, o) ⊓ₖ existsK_obj φ (s, o)
    rw [existsK_obj_off_diag _ heq, TwistProduct.infK_bot]

/-- **Object-projection T-Frobenius**:
`∃_f^t(f^*α ⊓ₜ φ) = α ⊓ₜ ∃_f^t(φ)`. -/
theorem frobenius_obj_T (α φ : PredicationFiberAlgebra L E) :
    existsT_obj (fiberObj L E α ⊓ₜ φ) = α ⊓ₜ existsT_obj φ := by
  funext p
  obtain ⟨s, o⟩ := p
  by_cases heq : s = o
  · subst heq
    rw [existsT_obj_diag]
    show TwistProduct.tSup (fun s' => α (s, s) ⊓ₜ φ (s', s)) =
         α (s, s) ⊓ₜ TwistProduct.tSup (fun s' => φ (s', s))
    exact (TwistProduct.infT_tSup_eq _ _).symm
  · rw [existsT_obj_off_diag _ heq]
    show (TwistProduct.f : TwistProduct L) = α (s, o) ⊓ₜ existsT_obj φ (s, o)
    rw [existsT_obj_off_diag _ heq, TwistProduct.infT_f]

end PredicateMap
