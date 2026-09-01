import SpatiotemporalKnowledgeSystem.Homebrew.Order.Basic

/-!
# Residuated lattices

A **commutative residuated lattice** is a lattice equipped with a
commutative-monoid operation `·` (the *fusion product*) and a binary
operation `⇨` (the *residual*) satisfying the Galois adjunction
$$x \cdot y \leq z \iff x \leq y \to z.$$

Both operations are present as fields of the typeclass; the Galois
adjunction is stated as `mul_le_residuum`. From this single biconditional
the entire monotonicity theory follows.

A residuated lattice is **integral** when the monoidal unit `1` is the top
element of the lattice.
-/

universe u

class ResiduatedLattice (α : Type u) extends Lattice α, Mul α, One α where
  mul_assoc      : ∀ a b c : α, a * b * c = a * (b * c)
  one_mul        : ∀ a : α, 1 * a = a
  mul_comm       : ∀ a b : α, a * b = b * a
  /-- The *residual* (right-adjoint) of fusion. -/
  residuum       : α → α → α
  /-- The Galois adjunction `x · y ≤ z ↔ x ≤ y ⇨ z`. -/
  mul_le_residuum : ∀ {x y z : α}, x * y ≤ z ↔ x ≤ residuum y z

/-- An integral residuated lattice has `1` as its `≤`-top. -/
class IntegralResiduatedLattice (α : Type u)
    extends ResiduatedLattice α, OrderTop α where
  one_eq_top : (1 : α) = (⊤ : α)

namespace ResiduatedLattice

@[inherit_doc] infixr:60 " ⇨ " => residuum

variable {α : Type u} [ResiduatedLattice α]

/-! ## Consequences of the Galois adjunction -/

theorem mul_one (a : α) : a * 1 = a := by
  rw [mul_comm]; exact one_mul a

/-- Counit: `(y ⇨ z) · y ≤ z`. -/
theorem residuum_mul_le (y z : α) : (y ⇨ z) * y ≤ z :=
  mul_le_residuum.mpr (Preorder.le_refl _)

/-- Unit: `x ≤ y ⇨ (x · y)`. -/
theorem le_residuum_mul (x y : α) : x ≤ y ⇨ (x * y) :=
  mul_le_residuum.mp (Preorder.le_refl _)

/-- Fusion is monotone in each argument. -/
theorem mul_le_mul_left {a b : α} (h : a ≤ b) (c : α) : a * c ≤ b * c :=
  mul_le_residuum.mpr (Preorder.le_trans h (le_residuum_mul b c))

theorem mul_le_mul_right {a b : α} (h : a ≤ b) (c : α) : c * a ≤ c * b := by
  rw [mul_comm c a, mul_comm c b]; exact mul_le_mul_left h c

/-- Residuum is antitone in the first argument. -/
theorem residuum_le_residuum_left {y₁ y₂ : α} (h : y₁ ≤ y₂) (z : α) :
    y₂ ⇨ z ≤ y₁ ⇨ z :=
  mul_le_residuum.mp (Preorder.le_trans (mul_le_mul_right h _) (residuum_mul_le y₂ z))

/-- Residuum is monotone in the second argument. -/
theorem residuum_le_residuum_right (y : α) {z₁ z₂ : α} (h : z₁ ≤ z₂) :
    y ⇨ z₁ ≤ y ⇨ z₂ :=
  mul_le_residuum.mp (Preorder.le_trans (residuum_mul_le y z₁) h)

end ResiduatedLattice
