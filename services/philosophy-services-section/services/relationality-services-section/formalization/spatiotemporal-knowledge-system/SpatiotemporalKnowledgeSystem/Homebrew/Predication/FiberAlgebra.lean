import SpatiotemporalKnowledgeSystem.Homebrew.Algebra.Bilattice

/-!
# Predication fiber algebra

The **predication fiber algebra** $A_p$ at a predicate `p` is the pointwise
twist product on entity pairs:
$$A_p := L^{\bowtie\, E \times E}.$$

As an abstract algebra `A_p` does not depend on the predicate `p`; the
subscript merely records which predicate's values are held. The bilattice
operations on `L^⋈` lift pointwise:
$(v \wedge_k v')(s, o) := v(s, o) \wedge_k v'(s, o)$.

This file defines `PredicationFiberAlgebra L E` as the carrier type, gives
the pointwise bilattice operations, and provides `PreBilattice` and
`Bilattice` instances. The user-facing `⊓ₜ`, `⊔ₜ`, `⊓ₖ`, `⊔ₖ`, `~`
operations are then available on valuations, with `⊔ₖ` being the per-fiber
CRDT merge operation.

Per the corpus, when `L` is distributive, so is `A_p`; that property is
left for a later file.
-/

universe u v

/-- Functions from entity-pairs to twist-product values: the predication
fiber algebra at one predicate. -/
abbrev PredicationFiberAlgebra (L : Type u) (E : Type v) : Type (max u v) :=
  E × E → TwistProduct L

namespace PredicationFiberAlgebra
variable {L : Type u} {E : Type v}

/-! ## Pointwise operations (require `Lattice L`) -/

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

/-! ## PreBilattice and Bilattice instances

Both lift pointwise from `TwistProduct L`. Each axiom on the function
type is `funext` followed by the corresponding axiom on `TwistProduct L`
applied at each entity pair. -/

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

/-! ## Pointwise fusion `⊙` and right residual `⇒` (require `ResiduatedLattice L`)

Per `objects/predication-fiber-algebra.md`, the residuated structure on
`L⋈` lifts pointwise to `A_p` along with the bilattice operations. -/

section ResiduatedOps
variable [ResiduatedLattice L]

/-- Pointwise twist-product fusion: `(v ⊙ w)(s, o) := v(s, o) ⊙ w(s, o)`. -/
def fusion (v w : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.fusion (v p) (w p)

/-- Pointwise twist-product right residual: `(v ⇒ w)(s, o) := v(s, o) ⇒ w(s, o)`. -/
def twResiduum (v w : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => TwistProduct.twResiduum (v p) (w p)

/-- **Pointwise residuation theorem on fibers.**
The TwistProduct residuation `x ⊙ y ≤ₜ z ↔ x ≤ₜ y ⇒ z` lifts cellwise:
two valuations satisfy the inequality at *every* entity-pair iff the
residuated form holds at every entity-pair. Direct corollary of
`TwistProduct.fusion_le_iff_le_twResiduum`. -/
theorem fusion_le_iff_le_twResiduum (v w z : PredicationFiberAlgebra L E) :
    (∀ p, TwistProduct.leT (fusion v w p) (z p)) ↔
    (∀ p, TwistProduct.leT (v p) (twResiduum w z p)) := by
  refine ⟨fun h p => ?_, fun h p => ?_⟩
  · exact (TwistProduct.fusion_le_iff_le_twResiduum _ _ _).mp (h p)
  · exact (TwistProduct.fusion_le_iff_le_twResiduum _ _ _).mpr (h p)

end ResiduatedOps

end PredicationFiberAlgebra
