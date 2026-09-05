import PredicationCategories.Categorical.FiberFunctor

/-!
# Converse quantifier adjoints

Mechanizes the corpus theorem
`theorems/predicate-converse-quantifier-adjoints.md`:

> For a predicate-converse generator `f : pᶜ → p`, the induced fiber map
> `f^* : A_p → A_{pᶜ}` is its own adjoint in both bilattice orders.

Self-adjointness of an order-preserving involution is general: a monotone
`f` with `f ∘ f = id` satisfies `f w ≤ v ↔ w ≤ f v` because applying `f`
to either side of the inequality, then using `f ∘ f = id`, swaps which
side `f` lands on. The two conditions
`f^* ⊣ f^* (knowledge order)` and `f^* ⊣ f^* (truth order)` collapse to
this single biconditional in each order — covering both adjoint claims
of the corpus theorem (`∃_f^k = f^* = ∀_f^k`,
`∃_f^t = f^* = ∀_f^t`) at once.

The pointwise involution `fiberConv ∘ fiberConv = id` is `rfl` after
destructuring the entity pair; monotonicity is `BilatticeHom.le{K,T}_monotone`.
-/

universe u v

open Categorical
open scoped Categorical.PreBilattice Categorical.Bilattice

namespace PredicateMap

variable {L : Type u} {E : Type v} [Lattice L]

/-- The converse fiber action is involutive: `fiberConv (fiberConv x) = x`.
This is the pointwise restatement of `fiberConv_comp_fiberConv`, useful
for rewriting under values. -/
theorem fiberConv_involutive (x : PredicationFiberAlgebra L E) :
    fiberConv L E (fiberConv L E x) = x := by
  funext ⟨_, _⟩
  rfl

/-- **Self-adjointness of the converse generator (knowledge order).**
For all valuations `w v : A_p`, `fiberConv w ≤ₖ v ↔ w ≤ₖ fiberConv v`.
Both directions are the same Galois biconditional, since `fiberConv` is
its own two-sided inverse. -/
theorem fiberConv_galois_K (w v : PredicationFiberAlgebra L E) :
    fiberConv L E w ≤ₖ v ↔ w ≤ₖ fiberConv L E v := by
  refine ⟨fun h => ?_, fun h => ?_⟩
  · have h2 := (fiberConv L E).leK_monotone h
    rwa [fiberConv_involutive] at h2
  · have h2 := (fiberConv L E).leK_monotone h
    rwa [fiberConv_involutive] at h2

/-- **Self-adjointness of the converse generator (truth order).** -/
theorem fiberConv_galois_T (w v : PredicationFiberAlgebra L E) :
    fiberConv L E w ≤ₜ v ↔ w ≤ₜ fiberConv L E v := by
  refine ⟨fun h => ?_, fun h => ?_⟩
  · have h2 := (fiberConv L E).leT_monotone h
    rwa [fiberConv_involutive] at h2
  · have h2 := (fiberConv L E).leT_monotone h
    rwa [fiberConv_involutive] at h2

/-! ## Frobenius reciprocity for the converse generator

For a self-inverse bilattice-hom acting as both `∃_f` and `∀_f` (which is
the case for the converse generator), Frobenius reciprocity reduces to
the bilattice-hom map-meet law plus involution — no distributivity
required. This is the converse case of the corpus theorem
`theorems/frobenius-for-knowledge-and-truth-meets.md`. -/

/-- **Frobenius reciprocity (knowledge order)** for the converse generator:
`∃_conv^k(f^*α ∧_k φ) = α ∧_k ∃_conv^k(φ)`, with
`∃_conv^k = f^* = fiberConv` since converse is self-adjoint. -/
theorem fiberConv_frobenius_K (α φ : PredicationFiberAlgebra L E) :
    fiberConv L E (fiberConv L E α ⊓ₖ φ) = α ⊓ₖ fiberConv L E φ := by
  rw [(fiberConv L E).map_infK, fiberConv_involutive]

/-- **Frobenius reciprocity (truth order)** for the converse generator:
`∃_conv^t(f^*α ∧_t φ) = α ∧_t ∃_conv^t(φ)`. -/
theorem fiberConv_frobenius_T (α φ : PredicationFiberAlgebra L E) :
    fiberConv L E (fiberConv L E α ⊓ₜ φ) = α ⊓ₜ fiberConv L E φ := by
  rw [(fiberConv L E).map_infT, fiberConv_involutive]

end PredicateMap
