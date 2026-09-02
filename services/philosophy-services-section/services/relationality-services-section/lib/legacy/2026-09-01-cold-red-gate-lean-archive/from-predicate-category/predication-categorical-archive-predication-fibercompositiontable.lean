import PredicationCategories.Categorical.FiberFunctor

/-!
# Fiber composition table

The 9 cellMap composition laws of `PredicateMap.{conv, subj, obj}` lift
contravariantly to identities on the named bilattice homomorphisms
`fiberConv`, `fiberSubj`, `fiberObj` defined in `FiberFunctor.lean`.

For a cellMap law `g₂ ∘ g₁ = g₃` (read: apply `g₁` first, then `g₂`),
the contravariance of `cellPullbackHom` produces

  cellPullbackHom (g₂ ∘ g₁) = (cellPullbackHom g₁).comp (cellPullbackHom g₂),

so each fiber identity has the form `fiber_{g₁}.comp fiber_{g₂} = fiber_{g₃}`
— in `BilatticeHom.comp`, the rightmost factor is applied first, matching
the cellMap reading order after the contravariance flip.

The file also confirms each named fiber morphism is, definitionally,
the image of the corresponding op-morphism under `fiberFunctor` —
binding the named-action presentation to the abstract functor.

All proofs reduce to pointwise equality of `E × E → TwistProduct L`
functions and close by `rfl` after destructuring the pair.
-/

universe u v

open CategoryTheory Opposite Categorical PredicateCategory

namespace PredicateMap

variable {L : Type u} {E : Type v} [Lattice L]

/-! ## Self-compositions: idempotents and the conv involution -/

/-- The converse generator is involutive on the fiber:
`fiberConv ∘ fiberConv = id`. -/
@[simp] theorem fiberConv_comp_fiberConv :
    (fiberConv L E).comp (fiberConv L E) = BilatticeHom.id := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-- The subject-projection generator is idempotent on the fiber. -/
@[simp] theorem fiberSubj_comp_fiberSubj :
    (fiberSubj L E).comp (fiberSubj L E) = fiberSubj L E := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-- The object-projection generator is idempotent on the fiber. -/
@[simp] theorem fiberObj_comp_fiberObj :
    (fiberObj L E).comp (fiberObj L E) = fiberObj L E := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-! ## Cross-compositions -/

/-- Lift of `subj ∘ conv = obj` (apply `conv` first; the swap moves to the
object diagonal, then `subj` collapses). -/
@[simp] theorem fiberConv_comp_fiberSubj :
    (fiberConv L E).comp (fiberSubj L E) = fiberObj L E := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-- Lift of `conv ∘ subj = subj` — converse on the subject diagonal is a
no-op. -/
@[simp] theorem fiberSubj_comp_fiberConv :
    (fiberSubj L E).comp (fiberConv L E) = fiberSubj L E := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-- Lift of `obj ∘ conv = subj`. -/
@[simp] theorem fiberConv_comp_fiberObj :
    (fiberConv L E).comp (fiberObj L E) = fiberSubj L E := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-- Lift of `conv ∘ obj = obj` — converse on the object diagonal is a
no-op. -/
@[simp] theorem fiberObj_comp_fiberConv :
    (fiberObj L E).comp (fiberConv L E) = fiberObj L E := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-- Lift of `subj ∘ obj = obj` — projection chain. -/
@[simp] theorem fiberObj_comp_fiberSubj :
    (fiberObj L E).comp (fiberSubj L E) = fiberObj L E := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-- Lift of `obj ∘ subj = subj` — projection chain. -/
@[simp] theorem fiberSubj_comp_fiberObj :
    (fiberSubj L E).comp (fiberObj L E) = fiberSubj L E := by
  apply BilatticeHom.ext
  intro v
  funext ⟨_, _⟩
  rfl

/-! ## Connection to the fiber functor

Each named fiber morphism is, by definition, the image of the
corresponding op-morphism under `fiberFunctor`. Both sides unfold to
`cellPullbackHom` of the same cellMap, so the proofs are `rfl`. -/

/-- `fiberFunctor` sends `(subj p q).op` to `fiberSubj`. -/
@[simp] theorem fiberFunctor_map_op_subj (p q : Predicate E) :
    (fiberFunctor L E).map (PredicateCategory.subj p q).op = fiberSubj L E := rfl

/-- `fiberFunctor` sends `(obj p q).op` to `fiberObj`. -/
@[simp] theorem fiberFunctor_map_op_obj (p q : Predicate E) :
    (fiberFunctor L E).map (PredicateCategory.obj p q).op = fiberObj L E := rfl

/-- `fiberFunctor` sends `(conv p q).op` to `fiberConv`. -/
@[simp] theorem fiberFunctor_map_op_conv (p q : Predicate E) :
    (fiberFunctor L E).map (PredicateCategory.conv p q).op = fiberConv L E := rfl

end PredicateMap
