import Obsmetrologia.Calculus.Probability.Stochastic
import Obsmetrologia.CausalSets.Dimension.OrderingFraction

/-!
# Maslov dequantization — the two faces of one settling semiring

The settling spine runs over an abstract value semiring `Probability.Stochastic.StochSemiring`. Two
instances of it are the two ends of the `L^p` / Maslov family:

* **`p = 1` — the magnitude face.** `natStoch` (counting weights `(ℕ, +, ×)`): the *measure* side,
  where the action, the curvature, the apex count, the Poisson expectation live. Its `+` is a sum (`natStoch_not_idempotent`).
* **`p = ∞` — the shape face.** `boolStoch` (the Boolean semiring `(Bool, ∨, ∧)`): the *existence /
  order* side, where settling-as-join lives. Its `+` is **idempotent** (`boolStoch_idempotent`), so it
  *is* the lattice join — which is why the colimit, the time section, and the curvature *structure*
  settled green and reals-free.

The bridge is the **support map** `supp n = (n > 0)`. It is an *exact* semiring homomorphism
`natStoch → boolStoch` (`countingDequantization`): it sends `+ ↦ ∨` and `× ↦ ∧`, the discrete heart of
Maslov dequantization, with **no `ℏ`-limit and no real powers**. It forgets magnitude and keeps
support — exactly the split the curvature arc exhibits: the dequantized (`p = ∞`) projection is the green
order/shape; the `ℕ`-preimage data `supp` discards is the magnitude (the Ricci scalar's `−¼∫R√g`).

So the green/open boundary of the whole arc is the `p = ∞` / `p = 1` boundary of this one homomorphism.
What stays roadmap is the **continuous** interpolation — the `ℏ`-graded power-mean family that
deforms `boolStoch` back to `natStoch` through real `p`, recovering the magnitude — which needs real
powers (`a^p`), the analytic frontier. The two *endpoints* and the *exact* dequantization
between them are here, green.

## Main definitions

* `boolStoch` — the Boolean (idempotent, `p = ∞`) stochastic semiring.
* `Idempotent` — the idempotent-addition predicate marking the `p = ∞` face.
* `StochHom` / `countingDequantization` — the exact dequantization homomorphism `supp : natStoch →
  boolStoch`.

## Main results

* `boolStoch_idempotent` / `natStoch_not_idempotent` — the `p = ∞` face is idempotent, `p = 1` is not.
* `countingDequantization` — `supp` is an exact, monotone semiring homomorphism (`+ ↦ ∨`, `× ↦ ∧`).
* `supp_apexCount_diamond` — the magnitude `|Apex| = 5` dequantizes to the existence projection `true`.

## References

`content/.../causal-dalembertian/content/sprinkling-average`; the value semiring of
`Probability.Stochastic`, the apex count of `CausalSets.Dimension.OrderingFraction`.

## Tags

Maslov dequantization, tropical, Boolean semiring, support, idempotent, settling
-/

namespace Obsmetrologia
namespace Probability.Dequantization

open Obsmetrologia.Probability.Stochastic

/-! ## (A) The `p = ∞` face — the Boolean (idempotent) semiring -/

/-- **The Boolean stochastic semiring** `(Bool, ∨, ∧)` — the `p = ∞` / idempotent face of the value
family: the existence/order semiring whose addition `∨` is the lattice join. -/
def boolStoch : StochSemiring where
  carrier := Bool
  zero := false
  one := true
  add := (· || ·)
  mul := (· && ·)
  add_assoc := by decide
  add_comm := by decide
  add_zero := by decide
  mul_assoc := by decide
  mul_one := by decide
  one_mul := by decide
  mul_zero := by decide
  zero_mul := by decide
  left_distrib := by decide
  right_distrib := by decide
  le := fun a b => (a || b) = b
  le_refl := by decide
  le_trans := by decide
  le_antisymm := by decide

/-! ## (B) Idempotency — the marker of the `p = ∞` face -/

/-- A value semiring is **idempotent** when its addition collapses `a ⊕ a = a` — the tropical /
`p = ∞` condition under which addition *is* the order-join. -/
def Idempotent (V : StochSemiring) : Prop := ∀ a, V.add a a = a

/-- **The Boolean face is idempotent** (`b ∨ b = b`): the `p = ∞` end, where addition is the join. -/
theorem boolStoch_idempotent : Idempotent boolStoch := by
  unfold Idempotent; intro a; cases a <;> rfl

/-- **The counting face is not idempotent** (`1 + 1 ≠ 1`): the `p = 1` end, a magnitude sum. -/
theorem natStoch_not_idempotent : ¬ Idempotent natStoch := by
  unfold Idempotent natStoch
  intro h
  have := h 1
  simp at this

/-! ## (C) The dequantization homomorphism -/

/-- A **homomorphism of value semirings**: a carrier map preserving `0`, `1`, `+`, `×`, and the
order. -/
structure StochHom (V W : StochSemiring) where
  /-- The underlying carrier map. -/
  map : V.carrier → W.carrier
  map_zero : map V.zero = W.zero
  map_one : map V.one = W.one
  map_add : ∀ a b, map (V.add a b) = W.add (map a) (map b)
  map_mul : ∀ a b, map (V.mul a b) = W.mul (map a) (map b)
  map_mono : ∀ a b, V.le a b → W.le (map a) (map b)

/-- The **support map** `supp n = (n > 0)` — the discrete Maslov dequantization: magnitude to
existence. -/
def supp (n : Nat) : Bool := decide (0 < n)

/-- `supp 0 = false`. -/
theorem supp_zero : supp 0 = false := rfl

/-- A positive count has support `true`. -/
theorem supp_eq_true {n : Nat} (h : 0 < n) : supp n = true := by
  simp only [supp, decide_eq_true_eq]; exact h

/-- **`supp` sends the counting sum to the Boolean join.** `supp (a + b) = supp a ∨ supp b`. -/
theorem supp_add (a b : Nat) : supp (a + b) = (supp a || supp b) := by
  rcases Nat.eq_zero_or_pos a with rfl | ha
  · rw [Nat.zero_add, supp_zero, Bool.false_or]
  · rw [supp_eq_true ha, supp_eq_true (Nat.lt_of_lt_of_le ha (Nat.le_add_right a b)), Bool.true_or]

/-- **`supp` sends the product to the Boolean meet.** `supp (a · b) = supp a ∧ supp b`. -/
theorem supp_mul (a b : Nat) : supp (a * b) = (supp a && supp b) := by
  rcases Nat.eq_zero_or_pos a with rfl | ha
  · rw [Nat.zero_mul, supp_zero, Bool.false_and]
  · rcases Nat.eq_zero_or_pos b with rfl | hb
    · rw [Nat.mul_zero, supp_zero, supp_eq_true ha, Bool.and_false]
    · rw [supp_eq_true ha, supp_eq_true hb, supp_eq_true (Nat.mul_pos ha hb), Bool.and_self]

/-- **`supp` is monotone**: `a ≤ b ⟹ supp a ∨ supp b = supp b` (the Boolean join order). -/
theorem supp_mono (a b : Nat) (h : a ≤ b) : (supp a || supp b) = supp b := by
  rcases Nat.eq_zero_or_pos a with rfl | ha
  · rw [supp_zero, Bool.false_or]
  · rw [supp_eq_true ha, supp_eq_true (Nat.lt_of_lt_of_le ha h), Bool.true_or]

/-- **The exact dequantization homomorphism** `supp : natStoch → boolStoch`. It sends the counting
sum to the Boolean join (`supp (a + b) = supp a ∨ supp b`) and the product to the meet
(`supp (a · b) = supp a ∧ supp b`), preserves `0`/`1`, and is monotone. This is Maslov dequantization
made exact and discrete — `p = 1 ↦ p = ∞`, magnitude to support — with no `ℏ`-limit, lattice/support-valued. -/
def countingDequantization : StochHom natStoch boolStoch where
  map := supp
  map_zero := rfl
  map_one := rfl
  map_add := supp_add
  map_mul := supp_mul
  map_mono := fun a b h => supp_mono a b h

/-! ## (D) The arc tie — magnitude dequantizes to shape

The curvature arc lives on the `p = 1` (counting) face — the action, the curvature, the apex count are
`ℕ`/`ℤ` magnitudes. Dequantizing sends each to its `p = ∞` existence projection: the green order/shape the
settling machinery computes. -/

open Obsmetrologia.CausalSets.Dimension.OrderingFraction

/-- **The diamond's apex magnitude dequantizes to its existence projection.** `|Apex| = 5` (a `p = 1`
magnitude) maps under `supp` to `true` (the `p = ∞` projection: the diamond *has* causal order). The
magnitude `5` is the data the dequantization discards; `true` is the order-shape it keeps. -/
theorem supp_apexCount_diamond :
    supp (apexCount fourEvents diamondPrec) = true := by decide

end Probability.Dequantization
end Obsmetrologia
