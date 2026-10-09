import Obsmetrologia.Calculus.Algebra.Magma

/-!
# Algebra.Hom

Monoid homomorphisms, identity, and composition.
-/

namespace Obsmetrologia
namespace Algebra

/-- A monoid homomorphism. -/
structure Homomorphism (M N : Monoid) where
  map : M.carrier -> N.carrier
  map_one : map M.one = N.one
  map_op : forall a b, map (M.op a b) = N.op (map a) (map b)

namespace Homomorphism

/-- The identity homomorphism. -/
def id (M : Monoid) : Homomorphism M M where
  map := fun a => a
  map_one := rfl
  map_op := fun _ _ => rfl

/-- The composite of two homomorphisms. -/
def comp {M N P : Monoid} (g : Homomorphism N P) (f : Homomorphism M N) :
    Homomorphism M P where
  map := fun a => g.map (f.map a)
  map_one := by rw [f.map_one, g.map_one]
  map_op := fun a b => by rw [f.map_op, g.map_op]

/-- Left identity for homomorphism composition, on maps. -/
theorem id_comp {M N : Monoid} (f : Homomorphism M N) :
    (comp (id N) f).map = f.map := rfl

/-- Right identity for homomorphism composition, on maps. -/
theorem comp_id {M N : Monoid} (f : Homomorphism M N) :
    (comp f (id M)).map = f.map := rfl

/-- Associativity of homomorphism composition, on maps. -/
theorem comp_assoc {M N P Q : Monoid}
    (h : Homomorphism P Q) (g : Homomorphism N P) (f : Homomorphism M N) :
    (comp (comp h g) f).map = (comp h (comp g f)).map := rfl

end Homomorphism

end Algebra
end Obsmetrologia
