import Obsmetrologia.Closure.OrdinalCore
import Obsmetrologia.Calculus.Arithmetic.CoreFrontier

/-!
# Ordinal.Arithmetic — multiplication, and the arithmetic of our ℕ

`OrdinalCore` generates the ordinal at settling and identifies our ℕ as its finite
fragment, `Natural := {o : Ord // o.isFinite = true}`, proving `Natural ≃ Nat`. But it
gives `Natural` no arithmetic: `Ord` carries `add` and nothing else, so the corpus's own
ℕ has been a carrier without operations, which is why every numeric module reached past
it for core `Nat`.

This module closes that. It adds ordinal **multiplication** by the same recursion-on-the-
right that defines `add` (`a * 0 = 0`, `a * (b+1) = a*b + a`, `a * lim f = lim (a * f ·)`),
proves both operations preserve finiteness, and equips `Natural` with `add`, `mul`, and
`le` **as the restrictions of the ordinal operations** — not as core `Nat` in a costume.

The laws are then transported along `Natural ≃ Nat`. That transport is the honest shape
of the claim `OrdinalCore` §E already makes: the residual core `Nat` is a presentation
choice, so core `Nat`'s laws are admissible evidence *for facts about the finite fragment*
while the fragment itself remains the corpus's own object. Every law used across that
transport comes from `Arithmetic.CoreFrontier` or from the axiom-free part of core, so
nothing here costs `propext`.

Ordinal addition and multiplication are **not** commutative (`1 + ω = ω ≠ ω + 1`). On the
finite fragment they are, and that is exactly what the transport establishes — commutativity
is a theorem about finiteness here, not a structural assumption.
-/

namespace Obsmetrologia
namespace Ord

/-! ## (A) Ordinal multiplication -/

/-- Ordinal multiplication, by recursion on the right argument: `a * 0 = 0`,
`a * succ b = a * b + a`, `a * limit f = limit (fun n => a * f n)`. The same shape as
`Ord.add`, one rung up. -/
def mul (a : Ord) : Ord → Ord
  | zero => zero
  | succ b => mul a b + a
  | limit f => limit (fun n => mul a (f n))

instance : Mul Ord := ⟨mul⟩

/-- `a * 0 = 0` — the defining equation. -/
theorem mul_zero (a : Ord) : a * zero = zero := rfl

/-- `a * succ b = a * b + a` — the defining equation, named for rewriting. -/
theorem mul_succ (a b : Ord) : a * succ b = a * b + a := rfl

/-- `a * limit f = limit (fun n => a * f n)` — the defining equation, named for rewriting. -/
theorem mul_limit (a : Ord) (f : Nat → Ord) : a * limit f = limit (fun n => a * f n) := rfl

/-- **`Ord.mul` restricted to the finite fragment is `Nat.mul`.** With `ofNat_add_ofNat`
this makes `ofNat` a homomorphism of both operations, so the finite ordinals carry
`Nat`'s whole arithmetic on the nose. -/
theorem ofNat_mul_ofNat : ∀ m n : Nat, ofNat m * ofNat n = ofNat (m * n)
  | _, 0 => rfl
  | m, n + 1 => by
      show ofNat m * ofNat n + ofNat m = ofNat (m * (n + 1))
      rw [ofNat_mul_ofNat m n, ofNat_add_ofNat, Nat.mul_succ]

/-! ## (B) Finiteness is closed under both operations

Both proofs induct on the *right* argument — the one the operation recurses on — and both
dispatch the `limit` case by `Bool.noConfusion`: a limit ordinal is never finite, so the
hypothesis `isFinite (limit f) = true` is already `false = true`. -/

/-- **Finiteness is closed under addition.** -/
theorem add_isFinite : ∀ {a b : Ord}, isFinite a = true → isFinite b = true →
    isFinite (a + b) = true
  | _, zero, ha, _ => ha
  | a, succ o, ha, hb => add_isFinite (a := a) (b := o) ha hb
  | _, limit _, _, hb => Bool.noConfusion hb

/-- **Finiteness is closed under multiplication.** -/
theorem mul_isFinite : ∀ {a b : Ord}, isFinite a = true → isFinite b = true →
    isFinite (a * b) = true
  | _, zero, _, _ => rfl
  | a, succ o, ha, hb => add_isFinite (mul_isFinite (a := a) (b := o) ha hb) ha
  | _, limit _, _, hb => Bool.noConfusion hb

namespace Natural

/-! ## (C) Our ℕ, with operations

`add`, `mul` and `le` are the ordinal operations restricted along the finiteness witness
— `Natural` inherits its arithmetic rather than being handed a separate one. -/

/-- Addition on our ℕ: ordinal addition, carrying its finiteness witness. -/
def add (m n : Natural) : Natural := ⟨m.1 + n.1, add_isFinite m.2 n.2⟩

/-- Multiplication on our ℕ: ordinal multiplication, carrying its finiteness witness. -/
def mul (m n : Natural) : Natural := ⟨m.1 * n.1, mul_isFinite m.2 n.2⟩

/-- The order on our ℕ: the ordinal order restricted. -/
def le (m n : Natural) : Prop := Le m.1 n.1

instance : Add Natural := ⟨add⟩
instance : Mul Natural := ⟨mul⟩
instance : LE Natural := ⟨le⟩

/-- One — the successor of zero. -/
def one : Natural := succ zero

/-! ## (D) Transport along `Natural ≃ Nat`

`toNatCore` is a homomorphism for both operations and reflects the order. Each law of our
ℕ is then the corresponding core law read across the equivalence — using only `CoreFrontier`
or the axiom-free part of core, never `propext`. -/

/-- The height of a finite ordinal is pinned by any `ofNat` presentation of it. -/
theorem height_eq_of_ofNat {o : Ord} (h : o.isFinite = true) {k : Nat} (ho : o = ofNat k) :
    heightOfFinite o h = k :=
  ofNat_injective ((ofNat_heightOfFinite o h).symm.trans ho)

/-- **Two `Natural`s with the same height are equal** — the equivalence, used as an
extensionality principle. -/
theorem ext {m n : Natural} (h : toNatCore m = toNatCore n) : m = n := by
  rw [← ofNatCore_toNatCore m, ← ofNatCore_toNatCore n, h]

/-- **`toNatCore` carries addition.** -/
theorem toNatCore_add (m n : Natural) : toNatCore (m + n) = toNatCore m + toNatCore n :=
  height_eq_of_ofNat _ (by
    show m.1 + n.1 = ofNat (toNatCore m + toNatCore n)
    rw [← ofNat_add_ofNat, ← toNatCore_spec, ← toNatCore_spec])

/-- **`toNatCore` carries multiplication.** -/
theorem toNatCore_mul (m n : Natural) : toNatCore (m * n) = toNatCore m * toNatCore n :=
  height_eq_of_ofNat _ (by
    show m.1 * n.1 = ofNat (toNatCore m * toNatCore n)
    rw [← ofNat_mul_ofNat, ← toNatCore_spec, ← toNatCore_spec])

/-- **`toNatCore` reflects and preserves the order.** -/
theorem le_iff_toNatCore_le {m n : Natural} : m ≤ n ↔ toNatCore m ≤ toNatCore n := by
  constructor
  · intro h
    exact ofNat_le_ofNat_iff.mp (by
      rw [← toNatCore_spec, ← toNatCore_spec]; exact h)
  · intro h
    show Le m.1 n.1
    rw [toNatCore_spec m, toNatCore_spec n]
    exact ofNat_mono h

/-! ## (E) The laws -/

theorem add_comm (m n : Natural) : m + n = n + m :=
  ext (by rw [toNatCore_add, toNatCore_add, Nat.add_comm])

theorem add_assoc (m n k : Natural) : m + n + k = m + (n + k) :=
  ext (by rw [toNatCore_add, toNatCore_add, toNatCore_add, toNatCore_add, Nat.add_assoc])

theorem add_zero (m : Natural) : m + zero = m := ext (by rw [toNatCore_add]; rfl)

theorem zero_add (m : Natural) : zero + m = m := by rw [add_comm]; exact add_zero m

theorem mul_comm (m n : Natural) : m * n = n * m :=
  ext (by rw [toNatCore_mul, toNatCore_mul, Nat.mul_comm])

theorem mul_assoc (m n k : Natural) : m * n * k = m * (n * k) :=
  ext (by
    rw [toNatCore_mul, toNatCore_mul, toNatCore_mul, toNatCore_mul,
      Arithmetic.nat_mul_assoc])

/-- Our zero has height `0`. -/
theorem toNatCore_zero : toNatCore zero = 0 := rfl

/-- Our one has height `1`. -/
theorem toNatCore_one : toNatCore one = 1 := rfl

theorem mul_one (m : Natural) : m * one = m :=
  ext (by rw [toNatCore_mul, toNatCore_one, Nat.mul_one])

theorem one_mul (m : Natural) : one * m = m := by rw [mul_comm]; exact mul_one m

theorem mul_zero (m : Natural) : m * zero = zero := ext (by rw [toNatCore_mul]; rfl)

theorem zero_mul (m : Natural) : zero * m = zero := by rw [mul_comm]; exact mul_zero m

theorem left_distrib (m n k : Natural) : m * (n + k) = m * n + m * k :=
  ext (by
    rw [toNatCore_mul, toNatCore_add, toNatCore_add, toNatCore_mul, toNatCore_mul,
      Nat.left_distrib])

theorem right_distrib (m n k : Natural) : (m + n) * k = m * k + n * k :=
  ext (by
    rw [toNatCore_mul, toNatCore_add, toNatCore_add, toNatCore_mul, toNatCore_mul,
      Arithmetic.nat_right_distrib])

/-- **Addition on our ℕ cancels.** The property the ordinal as a whole lacks and the
finite fragment has — and the one a difference quotient needs. -/
theorem add_left_cancel {m n k : Natural} (h : m + n = m + k) : n = k :=
  ext (Arithmetic.nat_add_left_cancel (toNatCore m) _ _
    (by rw [← toNatCore_add, ← toNatCore_add, h]))

theorem le_refl (m : Natural) : m ≤ m := le_iff_toNatCore_le.mpr (Nat.le_refl _)

theorem le_trans {m n k : Natural} (h₁ : m ≤ n) (h₂ : n ≤ k) : m ≤ k :=
  le_iff_toNatCore_le.mpr
    (Nat.le_trans (le_iff_toNatCore_le.mp h₁) (le_iff_toNatCore_le.mp h₂))

theorem le_antisymm {m n : Natural} (h₁ : m ≤ n) (h₂ : n ≤ m) : m = n :=
  ext (Nat.le_antisymm (le_iff_toNatCore_le.mp h₁) (le_iff_toNatCore_le.mp h₂))

theorem le_total (m n : Natural) : m ≤ n ∨ n ≤ m := by
  rcases Nat.le_total (toNatCore m) (toNatCore n) with h | h
  · exact Or.inl (le_iff_toNatCore_le.mpr h)
  · exact Or.inr (le_iff_toNatCore_le.mpr h)

/-- **Addition is monotone**, and cancels in the order — the two facts the signed
completion's order needs. -/
theorem add_le_add_right {m n : Natural} (h : m ≤ n) (k : Natural) : m + k ≤ n + k :=
  le_iff_toNatCore_le.mpr (by
    rw [toNatCore_add, toNatCore_add]
    exact Nat.add_le_add_right (le_iff_toNatCore_le.mp h) _)

theorem le_of_add_le_add_left {m n k : Natural} (h : m + n ≤ m + k) : n ≤ k :=
  le_iff_toNatCore_le.mpr
    (Arithmetic.nat_le_of_add_le_add_left (toNatCore m) _ _ (by
      rw [← toNatCore_add, ← toNatCore_add]
      exact le_iff_toNatCore_le.mp h))

instance decidableLe (m n : Natural) : Decidable (m ≤ n) :=
  decidable_of_iff (toNatCore m ≤ toNatCore n)
    ⟨fun h => le_iff_toNatCore_le.mpr h, fun h => le_iff_toNatCore_le.mp h⟩

end Natural
end Ord
end Obsmetrologia
