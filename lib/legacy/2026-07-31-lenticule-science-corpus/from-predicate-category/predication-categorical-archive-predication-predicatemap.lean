import PredicationCategories.Categorical.BilatticeHom
import PredicationCategories.Categorical.FiberAlgebra

/-!
# Cellular reindexing maps and the predication fiber pullback

The four generator classes of the [predicate category](../../objects/predicate-category.md)
— specialization, converse, subject-projection, object-projection — all act
on the predication fiber algebra `A = L^⋈ E×E` by **cellwise reindexing**:
each is determined by an index map `g : E × E → E × E` (partial in the
specialization case), and the induced fiber-algebra map is

$$f^*(v)(s, o) = v(g(s, o)).$$

This file gives the **total** cellular reindexing infrastructure: any
function `g : E × E → E × E` induces a `BilatticeHom` on
`PredicationFiberAlgebra L E`. The three total generators (converse,
subject-projection, object-projection) are special cases. Specialization
requires partial reindexing (off-domain cells go to `⊥`) and is treated
in a separate file.

Built on the mathlib-stack bilattice typeclass; no homebrew dependency.
-/

universe u v

open Categorical
open scoped Categorical.PreBilattice Categorical.Bilattice

namespace PredicateMap

/-! ## Total cellular reindexing -/

variable {L : Type u} {E : Type v}

/-- The pullback of a fiber-algebra valuation along a cellular reindexing
`g : E × E → E × E`: precomposition. Contravariant by construction. -/
def cellPullback (g : E × E → E × E) (v : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => v (g p)

@[simp] theorem cellPullback_apply (g : E × E → E × E)
    (v : PredicationFiberAlgebra L E) (p : E × E) :
    cellPullback g v p = v (g p) := rfl

/-- Pullback along the identity is the identity. -/
@[simp] theorem cellPullback_id (v : PredicationFiberAlgebra L E) :
    cellPullback (fun p => p) v = v := rfl

/-- Pullback is contravariant on cellular reindexings:
`(g₂ ∘ g₁)* = g₁* ∘ g₂*`. -/
theorem cellPullback_comp (g₁ g₂ : E × E → E × E)
    (v : PredicationFiberAlgebra L E) :
    cellPullback (g₂ ∘ g₁) v = cellPullback g₁ (cellPullback g₂ v) := rfl

section LatticeOps
variable [Lattice L]

/-! ## Pullback preserves bilattice operations -/

theorem cellPullback_infT (g : E × E → E × E) (v w : PredicationFiberAlgebra L E) :
    cellPullback g (v ⊓ₜ w) = cellPullback g v ⊓ₜ cellPullback g w := rfl

theorem cellPullback_supT (g : E × E → E × E) (v w : PredicationFiberAlgebra L E) :
    cellPullback g (v ⊔ₜ w) = cellPullback g v ⊔ₜ cellPullback g w := rfl

theorem cellPullback_infK (g : E × E → E × E) (v w : PredicationFiberAlgebra L E) :
    cellPullback g (v ⊓ₖ w) = cellPullback g v ⊓ₖ cellPullback g w := rfl

theorem cellPullback_supK (g : E × E → E × E) (v w : PredicationFiberAlgebra L E) :
    cellPullback g (v ⊔ₖ w) = cellPullback g v ⊔ₖ cellPullback g w := rfl

theorem cellPullback_negation (g : E × E → E × E) (v : PredicationFiberAlgebra L E) :
    cellPullback g (~ v) = ~ cellPullback g v := rfl

/-- **The cellular pullback is a bilattice homomorphism.** -/
def cellPullbackHom (g : E × E → E × E) :
    BilatticeHom (PredicationFiberAlgebra L E) (PredicationFiberAlgebra L E) where
  toFun        := cellPullback g
  map_infT     := cellPullback_infT g
  map_supT     := cellPullback_supT g
  map_infK     := cellPullback_infK g
  map_supK     := cellPullback_supK g
  map_negation := cellPullback_negation g

@[simp] theorem cellPullbackHom_apply (g : E × E → E × E)
    (v : PredicationFiberAlgebra L E) :
    (cellPullbackHom g : BilatticeHom _ _) v = cellPullback g v := rfl

/-- Identity pullback as a bilattice homomorphism is `BilatticeHom.id`. -/
theorem cellPullbackHom_id :
    (cellPullbackHom (L := L) (E := E) (fun p => p)) = BilatticeHom.id := by
  apply BilatticeHom.ext
  intro v
  rfl

/-- Composition of cellular pullbacks as bilattice homomorphisms. -/
theorem cellPullbackHom_comp (g₁ g₂ : E × E → E × E) :
    cellPullbackHom (L := L) (E := E) (g₂ ∘ g₁) =
      BilatticeHom.comp (cellPullbackHom g₁) (cellPullbackHom g₂) := by
  apply BilatticeHom.ext
  intro v
  rfl

end LatticeOps

/-! ## The three total generators -/

/-- **Converse** index map: swap subject and object. -/
def conv : E × E → E × E := fun p => (p.2, p.1)

/-- **Subject-projection** index map: collapse to the subject diagonal. -/
def subj : E × E → E × E := fun p => (p.1, p.1)

/-- **Object-projection** index map: collapse to the object diagonal. -/
def obj : E × E → E × E := fun p => (p.2, p.2)

/-! ## Composition table for the total generators -/

/-- `conv ∘ conv = id` — the double swap is the identity. -/
@[simp] theorem conv_comp_conv : (conv (E := E)) ∘ conv = fun p => p := by
  funext ⟨_, _⟩
  rfl

/-- `subj ∘ subj = subj`. -/
@[simp] theorem subj_comp_subj : (subj (E := E)) ∘ subj = subj := by
  funext ⟨_, _⟩
  rfl

/-- `obj ∘ obj = obj`. -/
@[simp] theorem obj_comp_obj : (obj (E := E)) ∘ obj = obj := by
  funext ⟨_, _⟩
  rfl

/-- `conv ∘ subj = subj` — applying conv to (s, s) gives (s, s). -/
@[simp] theorem conv_comp_subj : (conv (E := E)) ∘ subj = subj := by
  funext ⟨_, _⟩
  rfl

/-- `subj ∘ conv = obj` — `(s, o) ↦ (o, s) ↦ (o, o)`. -/
@[simp] theorem subj_comp_conv : (subj (E := E)) ∘ conv = obj := by
  funext ⟨_, _⟩
  rfl

/-- `conv ∘ obj = obj` — applying conv to (o, o) gives (o, o). -/
@[simp] theorem conv_comp_obj : (conv (E := E)) ∘ obj = obj := by
  funext ⟨_, _⟩
  rfl

/-- `obj ∘ conv = subj` — `(s, o) ↦ (o, s) ↦ (s, s)`. -/
@[simp] theorem obj_comp_conv : (obj (E := E)) ∘ conv = subj := by
  funext ⟨_, _⟩
  rfl

/-- `subj ∘ obj = obj`. -/
@[simp] theorem subj_comp_obj : (subj (E := E)) ∘ obj = obj := by
  funext ⟨_, _⟩
  rfl

/-- `obj ∘ subj = subj`. -/
@[simp] theorem obj_comp_subj : (obj (E := E)) ∘ subj = subj := by
  funext ⟨_, _⟩
  rfl

end PredicateMap
