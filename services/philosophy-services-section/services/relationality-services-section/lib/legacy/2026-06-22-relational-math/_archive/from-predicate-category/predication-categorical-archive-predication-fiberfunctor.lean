import Mathlib.CategoryTheory.Opposites
import PredicationCategories.Categorical.PredicateCategory
import PredicationCategories.Categorical.BilatticeCat

/-!
# The predication fiber functor

The headline categorical theorem of [predication-fiber-functor.md](
../../theorems/predication-fiber-functor.md):

$$F : \mathcal{C}^{\mathrm{op}} \longrightarrow \mathbf{BiLat}$$

sending each predicate to its [predication fiber algebra](
../../objects/predication-fiber-algebra.md) and each generator
morphism `f : q → p` to its cellwise pullback `f^* : A_p → A_q`.

In our one-object collapse of the predicate category (with cellular
reindexings as morphisms), the fiber algebra at every predicate is the
same type `PredicationFiberAlgebra L E`, and the four generator classes
all give cellwise reindexings. The functoriality content reduces to:

- `cellPullbackHom (id) = BilatticeHom.id` — preservation of identity;
- `cellPullbackHom (g₂ ∘ g₁) = BilatticeHom.comp g₁* g₂*` — preservation
  of composition (with the contravariance flip given by the `op`).

Both are already `cellPullbackHom_id` and `cellPullbackHom_comp` in
`PredicateMap.lean`. This file packages them as a mathlib `Functor`.
-/

universe u v

open CategoryTheory Opposite PredicateCategory Categorical

namespace PredicateMap

variable (L : Type u) (E : Type v) [Lattice L]

/-- **The predication fiber functor** `F : 𝒞ᵒᵖ ⥤ BilatticeCat`.

Object map: every predicate goes to the same bilattice
`PredicationFiberAlgebra L E`.

Morphism map: a morphism `f.unop : Predicate.q ⟶ Predicate.p` in `𝒞`
(a cellular reindexing) goes to its cellwise pullback bilattice
homomorphism `f.unop^* : A_p → A_q`. -/
def fiberFunctor : (Predicate E)ᵒᵖ ⥤ BilatticeCat.{max u v} where
  obj _      := BilatticeCat.of (PredicationFiberAlgebra L E)
  map f      := cellPullbackHom f.unop
  map_id _   := cellPullbackHom_id
  map_comp _ _ := by
    apply BilatticeHom.ext
    intro _
    rfl

/-! ## The fiber action of the four total generators

These spell out the action of the fiber functor on each generator class
as a `BilatticeHom`, matching the corpus:

- converse: `f^*(v)(s, o) = v(o, s)`
- subject-projection: `f^*(v)(s, o) = v(s, s)`
- object-projection: `f^*(v)(s, o) = v(o, o)`. -/

/-- The fiber action of the converse generator. -/
def fiberConv :
    BilatticeHom (PredicationFiberAlgebra L E) (PredicationFiberAlgebra L E) :=
  cellPullbackHom (PredicateMap.conv (E := E))

/-- The fiber action of the subject-projection generator. -/
def fiberSubj :
    BilatticeHom (PredicationFiberAlgebra L E) (PredicationFiberAlgebra L E) :=
  cellPullbackHom (PredicateMap.subj (E := E))

/-- The fiber action of the object-projection generator. -/
def fiberObj :
    BilatticeHom (PredicationFiberAlgebra L E) (PredicationFiberAlgebra L E) :=
  cellPullbackHom (PredicateMap.obj (E := E))

@[simp] theorem fiberConv_apply (v : PredicationFiberAlgebra L E) (s o : E) :
    fiberConv L E v (s, o) = v (o, s) := rfl

@[simp] theorem fiberSubj_apply (v : PredicationFiberAlgebra L E) (s o : E) :
    fiberSubj L E v (s, o) = v (s, s) := rfl

@[simp] theorem fiberObj_apply (v : PredicationFiberAlgebra L E) (s o : E) :
    fiberObj L E v (s, o) = v (o, o) := rfl

end PredicateMap
