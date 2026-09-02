import PredicationCategories.Categorical.TwistProduct

/-!
# Predication fiber algebra (mathlib-stack)

The **predication fiber algebra** at a predicate is the pointwise twist
product on entity pairs:
$$A_p := L^{\bowtie\, E \times E}.$$

Parallel to `Predication/FiberAlgebra.lean` but built on
`Categorical.TwistProduct` (which sits over Mathlib's `Lattice`). This
file knows nothing about the homebrew `Order.Basic` tower.

Fusion `⊙` and right-residual `⇒` (the residuated structure) are
deferred until needed.
-/

universe u v

namespace Categorical

/-- Functions from entity-pairs to twist-product values: the predication
fiber algebra at one predicate. -/
abbrev PredicationFiberAlgebra (L : Type u) (E : Type v) : Type (max u v) :=
  E × E → TwistProduct L

namespace PredicationFiberAlgebra
variable {L : Type u} {E : Type v}

section LatticeOps
variable [Lattice L]

/-- Pointwise truth meet. -/
def infT (v w : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.infT (v p) (w p)

/-- Pointwise truth join. -/
def supT (v w : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.supT (v p) (w p)

/-- Pointwise knowledge meet. -/
def infK (v w : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.infK (v p) (w p)

/-- Pointwise knowledge join — the per-fiber CRDT merge operation. -/
def supK (v w : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.supK (v p) (w p)

/-- Pointwise bilattice negation. -/
def negation (v : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.negation (v p)

end LatticeOps

instance instPreBilattice [Lattice L] : PreBilattice (PredicationFiberAlgebra L E) where
  infT := infT
  supT := supT
  infK := infK
  supK := supK
  infT_comm v w := funext fun p => PreBilattice.infT_comm (v p) (w p)
  infT_assoc u v w := funext fun p => PreBilattice.infT_assoc (u p) (v p) (w p)
  supT_comm v w := funext fun p => PreBilattice.supT_comm (v p) (w p)
  supT_assoc u v w := funext fun p => PreBilattice.supT_assoc (u p) (v p) (w p)
  infT_supT_absorb v w := funext fun p => PreBilattice.infT_supT_absorb (v p) (w p)
  supT_infT_absorb v w := funext fun p => PreBilattice.supT_infT_absorb (v p) (w p)
  infK_comm v w := funext fun p => PreBilattice.infK_comm (v p) (w p)
  infK_assoc u v w := funext fun p => PreBilattice.infK_assoc (u p) (v p) (w p)
  supK_comm v w := funext fun p => PreBilattice.supK_comm (v p) (w p)
  supK_assoc u v w := funext fun p => PreBilattice.supK_assoc (u p) (v p) (w p)
  infK_supK_absorb v w := funext fun p => PreBilattice.infK_supK_absorb (v p) (w p)
  supK_infK_absorb v w := funext fun p => PreBilattice.supK_infK_absorb (v p) (w p)

instance instBilattice [Lattice L] : Bilattice (PredicationFiberAlgebra L E) where
  negation := negation
  negation_negation v := funext fun p => Bilattice.negation_negation (v p)
  negation_antitone_T {a b} h := by
    funext p
    exact Bilattice.negation_antitone_T (congrFun h p)
  negation_monotone_K {a b} h := by
    funext p
    exact Bilattice.negation_monotone_K (congrFun h p)

end PredicationFiberAlgebra

end Categorical
