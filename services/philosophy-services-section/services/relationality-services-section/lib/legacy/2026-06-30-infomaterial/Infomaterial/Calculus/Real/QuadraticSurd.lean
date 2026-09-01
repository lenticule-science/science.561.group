import Infomaterial.Calculus.Real.IVT
import Infomaterial.Calculus.Real.MultiplicationOrder

/-!
# Quadratic-surd roots in the internal reals

This module owns the generic arithmetic engine for values of the form `a - sqrt d`.
Applications such as chromatic tile spectral gaps import this module and state their
domain-specific roots in their own namespaces.
-/

namespace Infomaterial
namespace Real.Internal

/-- The additive reassociation `A + (B + B) + A = (A + B) + (A + B)`. -/
theorem rreal_add_pair_rearrange (A B : RReal) :
    A + (B + B) + A = (A + B) + (A + B) := by
  rw [← RReal.add_assoc A B B, RReal.add_assoc (A + B) B A, RReal.add_comm B A]

/-- `d + (a*a - d) = a*a` transported to the internal reals. -/
theorem ofRat_nat_complement_mul_self (a d : Nat) (h : d ≤ a * a) :
    RReal.ofRat (Rat.ofNat d) + RReal.ofRat (Rat.ofNat (a * a - d))
      = RReal.ofRat (Rat.ofNat a) * RReal.ofRat (Rat.ofNat a) := by
  rw [← RReal.ofRat_mul, ← RReal.ofRat_add]
  congr 1
  show Rat.mk (PreRat.add (PreRat.ofNat d) (PreRat.ofNat (a * a - d)))
      = Rat.mk (PreRat.mul (PreRat.ofNat a) (PreRat.ofNat a))
  rw [Rat.mk_eq]
  simp only [PreRat.equiv, PreRat.add, PreRat.mul, PreRat.ofNat, Int.mul_one]
  rw [← Int.natCast_mul]
  omega

/-- For `1 ≤ d ≤ a*a`, the value `a - sqrt d` is a root of
`x^2 - 2*a*x + (a^2-d)`. -/
theorem quadratic_surd_sub_root (a d : Nat) (hd : 1 ≤ d) (hda : d ≤ a * a) :
    (RReal.ofRat (Rat.ofNat a) + (- sqrtNat d)) * (RReal.ofRat (Rat.ofNat a) + (- sqrtNat d))
        + RReal.ofRat (Rat.ofNat (a * a - d))
      = (RReal.ofRat (Rat.ofNat a) + RReal.ofRat (Rat.ofNat a))
          * (RReal.ofRat (Rat.ofNat a) + (- sqrtNat d)) := by
  have hss : sqrtNat d * sqrtNat d = RReal.ofRat (Rat.ofNat d) := sq_sqrtNat hd
  rw [RReal.sq_add (RReal.ofRat (Rat.ofNat a)) (- sqrtNat d),
    RReal.mul_neg (RReal.ofRat (Rat.ofNat a)) (sqrtNat d),
    RReal.neg_mul (sqrtNat d) (RReal.ofRat (Rat.ofNat a)),
    RReal.mul_comm (sqrtNat d) (RReal.ofRat (Rat.ofNat a)),
    RReal.neg_mul_neg (sqrtNat d) (sqrtNat d), hss,
    RReal.right_distrib (RReal.ofRat (Rat.ofNat a)) (RReal.ofRat (Rat.ofNat a))
      (RReal.ofRat (Rat.ofNat a) + - sqrtNat d),
    RReal.left_distrib (RReal.ofRat (Rat.ofNat a)) (RReal.ofRat (Rat.ofNat a)) (- sqrtNat d),
    RReal.mul_neg (RReal.ofRat (Rat.ofNat a)) (sqrtNat d),
    RReal.add_assoc (RReal.ofRat (Rat.ofNat a) * RReal.ofRat (Rat.ofNat a)
      + (-(RReal.ofRat (Rat.ofNat a) * sqrtNat d) + -(RReal.ofRat (Rat.ofNat a) * sqrtNat d)))
      (RReal.ofRat (Rat.ofNat d)) (RReal.ofRat (Rat.ofNat (a * a - d))),
    ofRat_nat_complement_mul_self a d hda,
    rreal_add_pair_rearrange (RReal.ofRat (Rat.ofNat a) * RReal.ofRat (Rat.ofNat a))
      (-(RReal.ofRat (Rat.ofNat a) * sqrtNat d))]

end Real.Internal
end Infomaterial
