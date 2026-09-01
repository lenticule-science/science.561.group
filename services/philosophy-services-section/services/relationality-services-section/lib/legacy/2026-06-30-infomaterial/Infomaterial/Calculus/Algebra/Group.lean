import Infomaterial.Calculus.Algebra.Magma

/-!
# Algebra.Group

Groups and abelian groups in the bundled algebra tower.
-/

namespace Infomaterial
namespace Algebra

/-- A group, presented with a left inverse; the right inverse is derived. -/
structure Group extends Monoid where
  inv : carrier -> carrier
  mul_left_inv : forall a, op (inv a) a = one

namespace Group
variable (G : Group)

/-- A left inverse in a group is also a right inverse. -/
theorem mul_right_inv (a : G.carrier) : G.op a (G.inv a) = G.one := by
  have hb : G.op (G.inv a) a = G.one := G.mul_left_inv a
  have hc : G.op (G.inv (G.inv a)) (G.inv a) = G.one := G.mul_left_inv (G.inv a)
  calc G.op a (G.inv a)
      = G.op G.one (G.op a (G.inv a)) := (G.one_mul _).symm
    _ = G.op (G.op (G.inv (G.inv a)) (G.inv a)) (G.op a (G.inv a)) := by rw [hc]
    _ = G.op (G.inv (G.inv a)) (G.op (G.inv a) (G.op a (G.inv a))) := by
          rw [G.op_assoc]
    _ = G.op (G.inv (G.inv a)) (G.op (G.op (G.inv a) a) (G.inv a)) := by
          rw [G.op_assoc]
    _ = G.op (G.inv (G.inv a)) (G.op G.one (G.inv a)) := by rw [hb]
    _ = G.op (G.inv (G.inv a)) (G.inv a) := by rw [G.one_mul]
    _ = G.one := hc

/-- The inverse is two-sided. -/
theorem inv_two_sided (a : G.carrier) :
    G.op (G.inv a) a = G.one /\ G.op a (G.inv a) = G.one :=
  ⟨G.mul_left_inv a, G.mul_right_inv a⟩

/-- Left cancellation in a group. -/
theorem mul_left_cancel {a b c : G.carrier} (h : G.op a b = G.op a c) : b = c := by
  calc b = G.op G.one b := (G.one_mul b).symm
    _ = G.op (G.op (G.inv a) a) b := by rw [G.mul_left_inv]
    _ = G.op (G.inv a) (G.op a b) := G.op_assoc _ _ _
    _ = G.op (G.inv a) (G.op a c) := by rw [h]
    _ = G.op (G.op (G.inv a) a) c := (G.op_assoc _ _ _).symm
    _ = G.op G.one c := by rw [G.mul_left_inv]
    _ = c := G.one_mul c

/-- Inversion is involutive. -/
theorem inv_inv (a : G.carrier) : G.inv (G.inv a) = a := by
  apply G.mul_left_cancel (a := G.inv a)
  rw [G.mul_right_inv, G.mul_left_inv]

end Group

/-- An abelian group. -/
structure AbelianGroup extends Group where
  mul_comm : forall a b, op a b = op b a

namespace AbelianGroup
variable (A : AbelianGroup)

/-- The underlying commutative monoid of an abelian group. -/
def toCommMonoid : CommMonoid where
  toMonoid := A.toMonoid
  mul_comm := A.mul_comm

end AbelianGroup

end Algebra
end Infomaterial
