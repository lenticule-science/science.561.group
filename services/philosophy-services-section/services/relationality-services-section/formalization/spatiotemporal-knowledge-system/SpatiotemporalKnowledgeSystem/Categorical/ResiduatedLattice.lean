import Mathlib.Order.Lattice
import Mathlib.Algebra.Group.Defs
import Mathlib.Algebra.GroupPower.Basic

/-!
# Residuated lattices (mathlib stack)

A **commutative residuated lattice** is a `Lattice` equipped with a
commutative-monoid operation (the *fusion product*, multiplicative) and
a binary `residuum` operation satisfying the Galois adjunction

  x * y ≤ z ↔ x ≤ y ⇨ z.

Parallel to `Homebrew/Algebra/ResiduatedLattice.lean` but built on
Mathlib's `Lattice` and `CommMonoid`. The `*` notation comes from
`CommMonoid`'s underlying `Mul`; `1` from its `One`. The Galois
biconditional is the single defining axiom; basic monotonicity follows.

An **integral** residuated lattice has `1 = ⊤`.
-/

universe u

namespace Categorical

/-- A commutative residuated lattice on a Mathlib `Lattice`. -/
class ResiduatedLattice (α : Type u) extends Lattice α, CommMonoid α where
  /-- The *residual* (right adjoint) of fusion. -/
  residuum : α → α → α
  /-- The Galois adjunction `x * y ≤ z ↔ x ≤ residuum y z`. -/
  mul_le_residuum : ∀ {x y z : α}, x * y ≤ z ↔ x ≤ residuum y z

/-- An integral residuated lattice: the monoidal unit is the order top. -/
class IntegralResiduatedLattice (α : Type u)
    extends ResiduatedLattice α, OrderTop α where
  one_eq_top : (1 : α) = (⊤ : α)

namespace ResiduatedLattice

@[inherit_doc] infixr:60 " ⇨ " => residuum

variable {α : Type u} [ResiduatedLattice α]

/-! ## Consequences of the Galois adjunction -/

/-- Counit: `(y ⇨ z) * y ≤ z`. -/
theorem residuum_mul_le (y z : α) : (y ⇨ z) * y ≤ z :=
  mul_le_residuum.mpr le_rfl

/-- Unit: `x ≤ y ⇨ (x * y)`. -/
theorem le_residuum_mul (x y : α) : x ≤ y ⇨ (x * y) :=
  mul_le_residuum.mp le_rfl

/-- Fusion is monotone in the left argument. -/
theorem mul_le_mul_left' {a b : α} (h : a ≤ b) (c : α) : a * c ≤ b * c :=
  mul_le_residuum.mpr (h.trans (le_residuum_mul b c))

/-- Fusion is monotone in the right argument. -/
theorem mul_le_mul_right' (c : α) {a b : α} (h : a ≤ b) : c * a ≤ c * b := by
  rw [mul_comm c a, mul_comm c b]; exact mul_le_mul_left' h c

/-- Residuum is antitone in the first argument. -/
theorem residuum_le_residuum_left {y₁ y₂ : α} (h : y₁ ≤ y₂) (z : α) :
    y₂ ⇨ z ≤ y₁ ⇨ z :=
  mul_le_residuum.mp ((mul_le_mul_right' _ h).trans (residuum_mul_le y₂ z))

/-- Residuum is monotone in the second argument. -/
theorem residuum_le_residuum_right (y : α) {z₁ z₂ : α} (h : z₁ ≤ z₂) :
    y ⇨ z₁ ≤ y ⇨ z₂ :=
  mul_le_residuum.mp ((residuum_mul_le y z₁).trans h)

end ResiduatedLattice

end Categorical
