import Infomaterial.Calculus.Algebra.Group

/-!
# Algebra.Ring

The bundled semiring, ring, commutative-ring, and field tower, with generic
derived arithmetic for rings.
-/

namespace Infomaterial
namespace Algebra

/-- A semiring with bundled operations and laws. -/
structure Semiring where
  carrier : Type
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  add_assoc : forall a b c, add (add a b) c = add a (add b c)
  add_comm : forall a b, add a b = add b a
  add_zero : forall a, add a zero = a
  zero_add : forall a, add zero a = a
  mul_assoc : forall a b c, mul (mul a b) c = mul a (mul b c)
  one_mul : forall a, mul one a = a
  mul_one : forall a, mul a one = a
  left_distrib : forall a b c, mul a (add b c) = add (mul a b) (mul a c)
  right_distrib : forall a b c, mul (add a b) c = add (mul a c) (mul b c)
  zero_mul : forall a, mul zero a = zero
  mul_zero : forall a, mul a zero = zero

/-- A ring is a semiring with additive inverses. -/
structure Ring extends Semiring where
  neg : carrier -> carrier
  add_left_neg : forall a, add (neg a) a = zero

/-- A commutative ring. -/
structure CommRing extends Ring where
  mul_comm : forall a b, mul a b = mul b a

/-- A field, with inverse zero fixed by convention. -/
structure Field extends CommRing where
  inv : carrier -> carrier
  mul_inv_cancel : forall a, a ≠ zero -> mul a (inv a) = one
  inv_zero : inv zero = zero
  zero_ne_one : zero ≠ one

namespace Ring
variable (R : Ring)

/-- The additive part of a ring is an abelian group. -/
def addAbelianGroup : AbelianGroup where
  carrier := R.carrier
  op := R.add
  op_assoc := R.add_assoc
  one := R.zero
  one_mul := R.zero_add
  mul_one := R.add_zero
  inv := R.neg
  mul_left_inv := R.add_left_neg
  mul_comm := R.add_comm

/-- Left cancellation for addition in a ring. -/
theorem add_left_cancel {a b c : R.carrier} (h : R.add a b = R.add a c) : b = c :=
  R.addAbelianGroup.toGroup.mul_left_cancel h

/-- Right additive inverse in a ring. -/
theorem add_right_neg (a : R.carrier) : R.add a (R.neg a) = R.zero :=
  R.addAbelianGroup.toGroup.mul_right_inv a

/-- The negative of zero is zero. -/
theorem neg_zero : R.neg R.zero = R.zero := by
  calc R.neg R.zero
      = R.add R.zero (R.neg R.zero) := (R.zero_add _).symm
    _ = R.zero := R.add_right_neg R.zero

/-- Negation is involutive. -/
theorem neg_neg (a : R.carrier) : R.neg (R.neg a) = a :=
  R.addAbelianGroup.toGroup.inv_inv a

/-- Multiplication by a negative on the right. -/
theorem mul_neg (a b : R.carrier) : R.mul a (R.neg b) = R.neg (R.mul a b) := by
  apply R.add_left_cancel (a := R.mul a b)
  have hsum : R.add (R.mul a b) (R.mul a (R.neg b)) = R.zero := by
    calc R.add (R.mul a b) (R.mul a (R.neg b))
        = R.mul a (R.add b (R.neg b)) := (R.left_distrib a b (R.neg b)).symm
      _ = R.mul a R.zero := by rw [R.add_right_neg]
      _ = R.zero := R.mul_zero a
  rw [hsum, R.add_right_neg]

/-- Multiplication by a negative on the left. -/
theorem neg_mul (a b : R.carrier) : R.mul (R.neg a) b = R.neg (R.mul a b) := by
  apply R.add_left_cancel (a := R.mul a b)
  have hsum : R.add (R.mul a b) (R.mul (R.neg a) b) = R.zero := by
    calc R.add (R.mul a b) (R.mul (R.neg a) b)
        = R.add (R.mul a b) (R.mul (R.neg a) b) := rfl
      _ = R.add (R.mul a b) (R.mul (R.neg a) b) := rfl
      _ = R.add (R.mul a b) (R.mul (R.neg a) b) := rfl
      _ = R.mul (R.add a (R.neg a)) b := (R.right_distrib a (R.neg a) b).symm
      _ = R.mul R.zero b := by rw [R.add_right_neg]
      _ = R.zero := R.zero_mul b
  rw [hsum, R.add_right_neg]

/-- The product of two negatives. -/
theorem neg_mul_neg (a b : R.carrier) : R.mul (R.neg a) (R.neg b) = R.mul a b := by
  calc R.mul (R.neg a) (R.neg b)
      = R.neg (R.mul a (R.neg b)) := R.neg_mul a (R.neg b)
    _ = R.neg (R.neg (R.mul a b)) := by rw [R.mul_neg]
    _ = R.mul a b := R.neg_neg (R.mul a b)

/-- Ring subtraction. -/
def sub (a b : R.carrier) : R.carrier := R.add a (R.neg b)

/-- Subtracting an element from itself gives zero. -/
theorem sub_self (a : R.carrier) : R.sub a a = R.zero :=
  R.add_right_neg a

end Ring

namespace CommRing
variable (R : CommRing)

/-- The binomial square identity in a commutative ring. -/
theorem sq_add (a b : R.carrier) :
    R.mul (R.add a b) (R.add a b)
      = R.add (R.add (R.mul a a) (R.add (R.mul a b) (R.mul a b))) (R.mul b b) := by
  calc R.mul (R.add a b) (R.add a b)
      = R.add (R.mul a (R.add a b)) (R.mul b (R.add a b)) :=
          R.right_distrib a b (R.add a b)
    _ = R.add (R.add (R.mul a a) (R.mul a b))
        (R.add (R.mul b a) (R.mul b b)) := by
          rw [R.left_distrib, R.left_distrib]
    _ = R.add (R.add (R.mul a a) (R.mul a b))
        (R.add (R.mul a b) (R.mul b b)) := by
          rw [R.mul_comm b a]
    _ = R.add (R.add (R.mul a a) (R.add (R.mul a b) (R.mul a b))) (R.mul b b) := by
          rw [← R.add_assoc (R.add (R.mul a a) (R.mul a b)) (R.mul a b) (R.mul b b),
            R.add_assoc (R.mul a a) (R.mul a b) (R.mul a b)]

/-- The special square `(1 + a)^2`. -/
theorem sq_one_add (a : R.carrier) :
    R.mul (R.add R.one a) (R.add R.one a)
      = R.add (R.add (R.mul a a) (R.add a a)) R.one := by
  calc R.mul (R.add R.one a) (R.add R.one a)
      = R.add (R.add (R.mul R.one R.one) (R.add (R.mul R.one a) (R.mul R.one a)))
          (R.mul a a) := R.sq_add R.one a
    _ = R.add (R.add R.one (R.add a a)) (R.mul a a) := by
          rw [R.one_mul R.one, R.one_mul a]
    _ = R.add (R.mul a a) (R.add R.one (R.add a a)) := by
          rw [R.add_comm]
    _ = R.add (R.mul a a) (R.add (R.add a a) R.one) := by
          rw [R.add_comm R.one (R.add a a)]
    _ = R.add (R.add (R.mul a a) (R.add a a)) R.one := by
          rw [← R.add_assoc]

end CommRing

end Algebra
end Infomaterial
