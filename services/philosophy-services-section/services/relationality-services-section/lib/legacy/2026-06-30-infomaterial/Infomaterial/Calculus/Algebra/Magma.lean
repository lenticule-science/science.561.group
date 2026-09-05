/-!
# Algebra.Magma

The multiplicative algebra tower through commutative monoids.
-/

namespace Infomaterial
namespace Algebra

/-- A magma: a carrier with a binary operation. -/
structure Magma where
  carrier : Type
  op : carrier -> carrier -> carrier

/-- A semigroup: a magma whose operation is associative. -/
structure Semigroup extends Magma where
  op_assoc : forall a b c, op (op a b) c = op a (op b c)

/-- A monoid: a semigroup with a two-sided identity. -/
structure Monoid extends Semigroup where
  one : carrier
  one_mul : forall a, op one a = a
  mul_one : forall a, op a one = a

namespace Monoid
variable (M : Monoid)

/-- The identity element of a monoid is unique. -/
theorem one_unique (e : M.carrier)
    (hl : forall a, M.op e a = a) (_hr : forall a, M.op a e = a) : e = M.one := by
  calc e = M.op e M.one := (M.mul_one e).symm
    _ = M.one := hl M.one

end Monoid

/-- A commutative monoid. -/
structure CommMonoid extends Monoid where
  mul_comm : forall a b, op a b = op b a

end Algebra
end Infomaterial
