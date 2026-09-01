import Obsmetrologia.Calculus.Algebra.Ring
import Obsmetrologia.Calculus.Arithmetic.CoreFrontier
import Obsmetrologia.Calculus.Real.Multiplication

/-!
# Algebra.Instances

The bundled semiring of `Nat` (the one built-in numeric type with no `neg`, hence a
`Semiring` rather than a `Ring`), and commutative-ring instances for the built-in
integers, internal rationals, and internal Bishop reals.
-/

namespace Obsmetrologia
namespace Algebra

/-! ## `Nat` — the prototypical semiring

`Nat` is the one built-in numeric carrier with no additive inverse (`nat_no_neg` in
`SetNumberGraphTheory`: "you cannot always subtract"), so it inhabits `Semiring` rather
than the `Ring` family below. Two of its laws are taken from `Arithmetic.CoreFrontier`
rather than from core: `Nat.mul_assoc` and `Nat.right_distrib` both depend on `propext`,
which this corpus is retiring, and the frontier module re-derives both axiom-free. -/

/-- The bundled **semiring of natural numbers** — the prototypical semiring, carrying no
`neg`. Recovered from the ancestor corpus (`Infomaterial`'s `Discrete.natSemiring`), where
it was stated over a separate bundled `CommSemiring`; here it is seated in the current
algebra tower instead, since `Semiring` already provides every law that structure had. -/
def natSemiring : Semiring where
  carrier := Nat
  add := fun a b => a + b
  mul := fun a b => a * b
  zero := 0
  one := 1
  add_assoc := Nat.add_assoc
  add_comm := Nat.add_comm
  add_zero := Nat.add_zero
  zero_add := Nat.zero_add
  mul_assoc := Arithmetic.nat_mul_assoc
  one_mul := Nat.one_mul
  mul_one := Nat.mul_one
  left_distrib := Nat.left_distrib
  right_distrib := Arithmetic.nat_right_distrib
  zero_mul := Nat.zero_mul
  mul_zero := Nat.mul_zero

/-- The bundled commutative ring of integers. -/
def intCommRing : CommRing where
  carrier := Int
  add := fun a b => a + b
  mul := fun a b => a * b
  zero := 0
  one := 1
  add_assoc := Int.add_assoc
  add_comm := Int.add_comm
  add_zero := Int.add_zero
  zero_add := Int.zero_add
  mul_assoc := Int.mul_assoc
  one_mul := Int.one_mul
  mul_one := Int.mul_one
  left_distrib := Int.mul_add
  right_distrib := Int.add_mul
  zero_mul := Int.zero_mul
  mul_zero := Int.mul_zero
  neg := fun a => -a
  add_left_neg := Int.add_left_neg
  mul_comm := Int.mul_comm

/-- The bundled commutative ring of internal rationals. -/
def ratCommRing : CommRing where
  carrier := Real.Internal.Rat
  add := fun a b => a + b
  mul := fun a b => a * b
  zero := (0 : Real.Internal.Rat)
  one := (1 : Real.Internal.Rat)
  add_assoc := Real.Internal.Rat.add_assoc
  add_comm := Real.Internal.Rat.add_comm
  add_zero := Real.Internal.Rat.add_zero
  zero_add := Real.Internal.Rat.zero_add
  mul_assoc := Real.Internal.Rat.mul_assoc
  one_mul := Real.Internal.Rat.one_mul
  mul_one := Real.Internal.Rat.mul_one
  left_distrib := Real.Internal.Rat.left_distrib
  right_distrib := Real.Internal.Rat.right_distrib
  zero_mul := Real.Internal.Rat.zero_mul
  mul_zero := Real.Internal.Rat.mul_zero
  neg := fun a => -a
  add_left_neg := Real.Internal.Rat.add_left_neg
  mul_comm := Real.Internal.Rat.mul_comm

namespace RatField

/-- Representative-level rational inverse, with `0⁻¹ = 0`. -/
def invPre (a : Real.Internal.PreRat) : Real.Internal.Rat :=
  if h : a.num = 0 then 0 else Real.Internal.Rat.mk (Real.Internal.Rat.preInv a h)

private theorem num_eq_zero_of_equiv_left_zero {a b : Real.Internal.PreRat}
    (h : Real.Internal.PreRat.equiv a b) (ha : a.num = 0) : b.num = 0 := by
  unfold Real.Internal.PreRat.equiv at h
  have key : b.num * a.den = 0 * a.den := by
    rw [Int.zero_mul]
    rw [ha, Int.zero_mul] at h
    exact h.symm
  exact Int.eq_of_mul_eq_mul_right (Int.ne_of_gt a.den_pos) key

private theorem inv_unique {q x y : Real.Internal.Rat}
    (hx : q * x = 1) (hy : q * y = 1) : x = y := by
  calc x = x * 1 := (Real.Internal.Rat.mul_one x).symm
    _ = x * (q * y) := by rw [hy]
    _ = (x * q) * y := (Real.Internal.Rat.mul_assoc x q y).symm
    _ = (q * x) * y := by rw [Real.Internal.Rat.mul_comm x q]
    _ = 1 * y := by rw [hx]
    _ = y := Real.Internal.Rat.one_mul y

/-- `invPre` respects rational equivalence. -/
theorem invPre_respects {a b : Real.Internal.PreRat} (h : Real.Internal.PreRat.equiv a b) :
    invPre a = invPre b := by
  by_cases ha : a.num = 0
  · have hb : b.num = 0 := num_eq_zero_of_equiv_left_zero h ha
    unfold invPre
    rw [dif_pos ha, dif_pos hb]
  · have hb : b.num ≠ 0 := by
      intro hb
      have ha' : a.num = 0 := num_eq_zero_of_equiv_left_zero h.symm hb
      exact ha ha'
    unfold invPre
    rw [dif_neg ha, dif_neg hb]
    apply inv_unique (q := Real.Internal.Rat.mk a)
    · exact Real.Internal.Rat.mul_inv a ha
    · have hy : Real.Internal.Rat.mk b * Real.Internal.Rat.mk (Real.Internal.Rat.preInv b hb) = 1 :=
        Real.Internal.Rat.mul_inv b hb
      have qab : Real.Internal.Rat.mk a = Real.Internal.Rat.mk b := Quotient.sound h
      rwa [← qab] at hy

/-- Quotient-level rational inverse, with `0⁻¹ = 0`. -/
def inv : Real.Internal.Rat -> Real.Internal.Rat :=
  Quotient.lift invPre
    (fun _ _ h => invPre_respects (show Real.Internal.PreRat.equiv _ _ from h))

end RatField

/-- The bundled field of internal rationals. -/
def ratField : Field where
  toCommRing := ratCommRing
  inv := RatField.inv
  mul_inv_cancel := by
    intro q hq
    refine Quotient.inductionOn q (fun a hq => ?_) hq
    have hnum : a.num ≠ 0 := (Real.Internal.Rat.ne_zero_iff a).mp hq
    change Real.Internal.Rat.mk a * RatField.invPre a = (1 : Real.Internal.Rat)
    unfold RatField.invPre
    rw [dif_neg hnum]
    exact Real.Internal.Rat.mul_inv a hnum
  inv_zero := by
    change RatField.invPre Real.Internal.PreRat.zero = (0 : Real.Internal.Rat)
    unfold RatField.invPre
    have hzero : Real.Internal.PreRat.zero.num = 0 := rfl
    rw [dif_pos hzero]
  zero_ne_one := by
    intro h
    have he : Real.Internal.PreRat.equiv Real.Internal.PreRat.zero Real.Internal.PreRat.one :=
      Quotient.exact h
    unfold Real.Internal.PreRat.equiv Real.Internal.PreRat.zero Real.Internal.PreRat.one at he
    simp only [Int.zero_mul, Int.one_mul] at he
    omega

/-- The bundled commutative ring of internal Bishop reals. -/
def rrealCommRing : CommRing where
  carrier := Real.Internal.RReal
  add := fun a b => a + b
  mul := fun a b => a * b
  zero := Real.Internal.RReal.zero
  one := Real.Internal.RReal.one
  add_assoc := Real.Internal.RReal.add_assoc
  add_comm := Real.Internal.RReal.add_comm
  add_zero := Real.Internal.RReal.add_zero
  zero_add := Real.Internal.RReal.zero_add
  mul_assoc := Real.Internal.RReal.mul_assoc
  one_mul := Real.Internal.RReal.one_mul
  mul_one := Real.Internal.RReal.mul_one
  left_distrib := Real.Internal.RReal.left_distrib
  right_distrib := Real.Internal.RReal.right_distrib
  zero_mul := Real.Internal.RReal.zero_mul
  mul_zero := Real.Internal.RReal.mul_zero
  neg := fun a => -a
  add_left_neg := Real.Internal.RReal.add_left_neg
  mul_comm := Real.Internal.RReal.mul_comm

end Algebra
end Obsmetrologia
