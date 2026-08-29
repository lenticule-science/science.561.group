import Obsmetrologia.Calculus.Algebra.Ring
import Obsmetrologia.Calculus.Algebra.Hom
import Obsmetrologia.Calculus.Order.OrderInfra
import Obsmetrologia.Calculus.Order.ResiduatedLatticeStandalone
import Obsmetrologia.Language.Positing.Gauge

/-!
# Algebra.Interfaces

Concrete algebraic interfaces from order, Boolean arithmetic, and the Klein-four gauge.
-/

namespace Obsmetrologia
namespace Algebra

/-- A bounded lattice is a commutative monoid under meet. -/
def meetMonoid (L : Order.BoundedLattice) : CommMonoid where
  carrier := L.carrier
  op := L.meet
  op_assoc := L.meet_assoc
  one := L.top
  one_mul a := by rw [L.meet_comm]; exact L.meet_top a
  mul_one := L.meet_top
  mul_comm := L.meet_comm

/-- A bounded lattice is a commutative monoid under join. -/
def joinMonoid (L : Order.BoundedLattice) : CommMonoid where
  carrier := L.carrier
  op := L.join
  op_assoc := L.join_assoc
  one := L.bot
  one_mul a := by rw [L.join_comm]; exact L.join_bot a
  mul_one := L.join_bot
  mul_comm := L.join_comm

/-- A residuated lattice is a commutative monoid under fusion. -/
def fuseMonoid (R : Order.ResiduatedLattice) : CommMonoid where
  carrier := R.carrier
  op := R.fuse
  op_assoc := R.fuse_assoc
  one := R.one
  one_mul a := by rw [R.fuse_comm]; exact R.fuse_one a
  mul_one := R.fuse_one
  mul_comm := R.fuse_comm

/-- The canonical two-element fusion monoid. -/
def twoFuseMonoid : CommMonoid := fuseMonoid Order.Two

/-- The two-element field on `Bool`. -/
def boolField : Field where
  carrier := Bool
  add := xor
  mul := (· && ·)
  zero := false
  one := true
  add_assoc := by decide
  add_comm := by decide
  add_zero := by decide
  zero_add := by decide
  mul_assoc := by decide
  one_mul := by decide
  mul_one := by decide
  left_distrib := by decide
  right_distrib := by decide
  zero_mul := by decide
  mul_zero := by decide
  neg := fun a => a
  add_left_neg := by decide
  mul_comm := by decide
  inv := fun a => a
  mul_inv_cancel := by decide
  inv_zero := rfl
  zero_ne_one := by decide

/-- The Klein-four group as an abelian group. -/
def kleinFourGroup : AbelianGroup where
  carrier := Positing.Gauge.K4
  op := Positing.Gauge.K4.mul
  op_assoc := Positing.Gauge.K4.mul_assoc
  one := Positing.Gauge.K4.id
  one_mul := Positing.Gauge.K4.id_mul
  mul_one := Positing.Gauge.K4.mul_id
  inv := fun g => g
  mul_left_inv := Positing.Gauge.K4.mul_self
  mul_comm := Positing.Gauge.K4.mul_comm

/-- The Klein-four group as a commutative monoid. -/
def kleinFourCommMonoid : CommMonoid := kleinFourGroup.toCommMonoid

/-- The abstract derived right-inverse law specializes to the Klein-four group. -/
theorem kleinFour_right_inv (g : Positing.Gauge.K4) :
    Positing.Gauge.K4.mul g g = Positing.Gauge.K4.id :=
  kleinFourGroup.toGroup.mul_right_inv g

/-- The additive identity of the Boolean field is unique. -/
theorem boolField_zero_unique (e : Bool)
    (hl : forall a, xor e a = a) (hr : forall a, xor a e = a) : e = false :=
  boolField.toRing.addAbelianGroup.toMonoid.one_unique e hl hr

end Algebra
end Obsmetrologia
