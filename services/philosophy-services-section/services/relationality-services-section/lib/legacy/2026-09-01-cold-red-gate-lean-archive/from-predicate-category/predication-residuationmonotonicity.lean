import PredicationCategories.Categorical.TwistProductResiduated

/-!
# Residuation orbit monotonicity

Mechanizes the corpus theorem `theorems/residuation-orbit-monotonicity.md`:

> The left multiplication operator `L_a := (a ⊙ ·)` is monotone in the
> truth order: `x ≤ₜ x' → a ⊙ x ≤ₜ a ⊙ x'`.
> The right residuation operator `R_a := (a ⇒ ·)` is antitone in its
> first argument and monotone in its second.

The proofs go through the componentwise characterization of `≤ₜ`
(`leT_iff`) plus the residuated-lattice monotonicity lemmas
(`mul_le_mul_left'`, `mul_le_mul_right'`, `residuum_le_residuum_left`,
`residuum_le_residuum_right`) on the underlying lattice `L`.

Includes commutativity of fusion as a corollary, and the symmetric
left-arg monotonicity of fusion (which follows from commutativity).
-/

universe u

namespace Categorical
namespace TwistProduct

open scoped Categorical.PreBilattice Categorical.Bilattice
open ResiduatedLattice (residuum)

variable {L : Type u} [ResiduatedLattice L]

/-- **Fusion is commutative** on `TwistProduct L`. -/
theorem fusion_comm (x y : TwistProduct L) : x ⊙ y = y ⊙ x := by
  apply ext
  · show x.pos * y.pos = y.pos * x.pos
    exact mul_comm _ _
  · show residuum x.pos y.neg ⊓ residuum y.pos x.neg =
         residuum y.pos x.neg ⊓ residuum x.pos y.neg
    exact inf_comm _ _

/-- **Fusion is monotone in the right argument (T-order)**:
`x ≤ₜ x' → a ⊙ x ≤ₜ a ⊙ x'`. -/
theorem fusion_leT_right (a : TwistProduct L) {x x' : TwistProduct L}
    (h : x ≤ₜ x') : a ⊙ x ≤ₜ a ⊙ x' := by
  rw [leT_iff] at h
  obtain ⟨hp, hn⟩ := h
  rw [leT_iff]
  refine ⟨?_, ?_⟩
  · show a.pos * x.pos ≤ a.pos * x'.pos
    exact ResiduatedLattice.mul_le_mul_right' a.pos hp
  · show residuum a.pos x'.neg ⊓ residuum x'.pos a.neg ≤
         residuum a.pos x.neg ⊓ residuum x.pos a.neg
    apply inf_le_inf
    · exact ResiduatedLattice.residuum_le_residuum_right a.pos hn
    · exact ResiduatedLattice.residuum_le_residuum_left hp a.neg

/-- **Fusion is monotone in the left argument (T-order)**, by commutativity. -/
theorem fusion_leT_left {a a' : TwistProduct L} (h : a ≤ₜ a') (x : TwistProduct L) :
    a ⊙ x ≤ₜ a' ⊙ x := by
  rw [fusion_comm a x, fusion_comm a' x]
  exact fusion_leT_right x h

/-- **Right residual is antitone in the first argument (T-order)**:
`x ≤ₜ x' → x' ⇒ y ≤ₜ x ⇒ y`. -/
theorem twResiduum_leT_antitone_left {x x' : TwistProduct L}
    (h : x ≤ₜ x') (y : TwistProduct L) : x' ⇒ y ≤ₜ x ⇒ y := by
  rw [leT_iff] at h
  obtain ⟨hp, hn⟩ := h
  rw [leT_iff]
  refine ⟨?_, ?_⟩
  · show residuum x'.pos y.pos ⊓ residuum y.neg x'.neg ≤
         residuum x.pos y.pos ⊓ residuum y.neg x.neg
    apply inf_le_inf
    · exact ResiduatedLattice.residuum_le_residuum_left hp y.pos
    · exact ResiduatedLattice.residuum_le_residuum_right y.neg hn
  · show x.pos * y.neg ≤ x'.pos * y.neg
    exact ResiduatedLattice.mul_le_mul_left' hp y.neg

/-- **Right residual is monotone in the second argument (T-order)**:
`y ≤ₜ y' → x ⇒ y ≤ₜ x ⇒ y'`. -/
theorem twResiduum_leT_monotone_right (x : TwistProduct L) {y y' : TwistProduct L}
    (h : y ≤ₜ y') : x ⇒ y ≤ₜ x ⇒ y' := by
  rw [leT_iff] at h
  obtain ⟨hp, hn⟩ := h
  rw [leT_iff]
  refine ⟨?_, ?_⟩
  · show residuum x.pos y.pos ⊓ residuum y.neg x.neg ≤
         residuum x.pos y'.pos ⊓ residuum y'.neg x.neg
    apply inf_le_inf
    · exact ResiduatedLattice.residuum_le_residuum_right x.pos hp
    · exact ResiduatedLattice.residuum_le_residuum_left hn x.neg
  · show x.pos * y'.neg ≤ x.pos * y.neg
    exact ResiduatedLattice.mul_le_mul_right' x.pos hn

end TwistProduct
end Categorical
