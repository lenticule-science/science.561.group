import SpatiotemporalKnowledgeSystem.Categorical.FiberFunctor
import SpatiotemporalKnowledgeSystem.Categorical.TwistProductResiduated

/-!
# Predicate-morphism residuation naturality

Mechanizes the corpus theorem
`theorems/predicate-morphism-residuation-naturality.md`:

> For every morphism `f : q → p` in the predicate category 𝒞, the induced
> fiber-algebra map `f^* : A_p → A_q` is a residuated-lattice
> homomorphism: `f^*(v₁ ⊙ v₂) = f^*(v₁) ⊙ f^*(v₂)` and similarly for `⇒`.

In our one-object collapse of 𝒞, every morphism is a cellMap
`g : E × E → E × E`, and `f^*` is `cellPullback g`. Since fusion `⊙` and
right-residual `⇒` on `PredicationFiberAlgebra L E` are pointwise on the
entity-pair index, and `cellPullback g` is precomposition with `g`, the
naturality follows by `rfl`.

The total-generator special cases (converse, subject-projection,
object-projection) are immediate consequences via the existing
`fiberConv`, `fiberSubj`, `fiberObj` named morphisms.
-/

universe u v

open Categorical
open scoped Categorical.PreBilattice Categorical.Bilattice Categorical.TwistProduct

namespace Categorical
namespace PredicationFiberAlgebra

variable {L : Type u} {E : Type v} [ResiduatedLattice L]

/-- Pointwise fusion on the predication fiber algebra. -/
def fusion (v w : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.fusion (v p) (w p)

/-- Pointwise right residual on the predication fiber algebra. -/
def twResiduum (v w : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.twResiduum (v p) (w p)

@[simp] theorem fusion_apply (v w : PredicationFiberAlgebra L E) (p : E × E) :
    fusion v w p = TwistProduct.fusion (v p) (w p) := rfl

@[simp] theorem twResiduum_apply (v w : PredicationFiberAlgebra L E) (p : E × E) :
    twResiduum v w p = TwistProduct.twResiduum (v p) (w p) := rfl

end PredicationFiberAlgebra
end Categorical

namespace PredicateMap

open Categorical

variable {L : Type u} {E : Type v} [ResiduatedLattice L]

/-! ## Naturality of `cellPullback` for the residuated structure -/

/-- **Cellular pullback preserves fusion**: `f^*(v₁ ⊙ v₂) = f^*(v₁) ⊙ f^*(v₂)`.

The proof is `rfl` because `cellPullback g` is precomposition with `g`
and `fusion` is pointwise on the entity-pair index. -/
theorem cellPullback_fusion (g : E × E → E × E)
    (v w : PredicationFiberAlgebra L E) :
    cellPullback g (PredicationFiberAlgebra.fusion v w) =
      PredicationFiberAlgebra.fusion (cellPullback g v) (cellPullback g w) := rfl

/-- **Cellular pullback preserves the right residual**:
`f^*(v₁ ⇒ v₂) = f^*(v₁) ⇒ f^*(v₂)`. -/
theorem cellPullback_twResiduum (g : E × E → E × E)
    (v w : PredicationFiberAlgebra L E) :
    cellPullback g (PredicationFiberAlgebra.twResiduum v w) =
      PredicationFiberAlgebra.twResiduum (cellPullback g v) (cellPullback g w) := rfl

/-! ## Specialisations to the three total generators -/

/-- Converse preserves fusion. -/
theorem fiberConv_fusion (v w : PredicationFiberAlgebra L E) :
    cellPullback PredicateMap.conv (PredicationFiberAlgebra.fusion v w) =
      PredicationFiberAlgebra.fusion
        (cellPullback PredicateMap.conv v) (cellPullback PredicateMap.conv w) :=
  cellPullback_fusion _ v w

/-- Converse preserves the right residual. -/
theorem fiberConv_twResiduum (v w : PredicationFiberAlgebra L E) :
    cellPullback PredicateMap.conv (PredicationFiberAlgebra.twResiduum v w) =
      PredicationFiberAlgebra.twResiduum
        (cellPullback PredicateMap.conv v) (cellPullback PredicateMap.conv w) :=
  cellPullback_twResiduum _ v w

/-- Subject-projection preserves fusion. -/
theorem fiberSubj_fusion (v w : PredicationFiberAlgebra L E) :
    cellPullback PredicateMap.subj (PredicationFiberAlgebra.fusion v w) =
      PredicationFiberAlgebra.fusion
        (cellPullback PredicateMap.subj v) (cellPullback PredicateMap.subj w) :=
  cellPullback_fusion _ v w

/-- Subject-projection preserves the right residual. -/
theorem fiberSubj_twResiduum (v w : PredicationFiberAlgebra L E) :
    cellPullback PredicateMap.subj (PredicationFiberAlgebra.twResiduum v w) =
      PredicationFiberAlgebra.twResiduum
        (cellPullback PredicateMap.subj v) (cellPullback PredicateMap.subj w) :=
  cellPullback_twResiduum _ v w

/-- Object-projection preserves fusion. -/
theorem fiberObj_fusion (v w : PredicationFiberAlgebra L E) :
    cellPullback PredicateMap.obj (PredicationFiberAlgebra.fusion v w) =
      PredicationFiberAlgebra.fusion
        (cellPullback PredicateMap.obj v) (cellPullback PredicateMap.obj w) :=
  cellPullback_fusion _ v w

/-- Object-projection preserves the right residual. -/
theorem fiberObj_twResiduum (v w : PredicationFiberAlgebra L E) :
    cellPullback PredicateMap.obj (PredicationFiberAlgebra.twResiduum v w) =
      PredicationFiberAlgebra.twResiduum
        (cellPullback PredicateMap.obj v) (cellPullback PredicateMap.obj w) :=
  cellPullback_twResiduum _ v w

end PredicateMap
