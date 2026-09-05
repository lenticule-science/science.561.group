import Infomaterial.Persistence.Aperiodic.StepN.Salem
import Infomaterial.Calculus.Real.IVT
import Infomaterial.Calculus.Real.MultiplicationOrder

/-!
# The Salem trace root as a real number

`Salem` recorded the unit-circle / real Salem-root *sign changes* of the trace resolvent `y²−y−3`;
`Real.IVT` built `√` for the Bishop reals with `sq_sqrtNat : (√c)² = c`. Here those meet: the real
Salem trace root is cashed in. The trace root is `y = (1+√13)/2`; division-free, set `z = 2y = 1+√13`,
so `z² = 2z + 12`, equivalently `z² = z + z + 14`. This upgrades the Salem sign-change to an *actual*
real root, built on `(√13)² = 13`.

The `RReal` ring identity `(1+s)² = s·s + (s+s) + 1` is proved **pointwise** (each index a `Rat`
identity), since `RReal` carries no `ring` tactic; the irrational fact `s·s = 13` is `sq_sqrtNat`.
-/

namespace Infomaterial
namespace Persistence.Aperiodic.StepN

open Real.Internal

/-- **The Salem trace root, as a real.** The trace resolvent's real root is `y = (1+√13)/2`;
division-free with `z = 2y = 1 + √13`, it satisfies `z² = z + z + 14` (i.e. `z² − 2z − 12 = 0`, the
trace root pushed through `2y`). Built on `(√13)² = 13` (`sq_sqrtNat`) and the pointwise ring identity
`RReal.sq_one_add`. The Salem sign-change of `salemTrace` is now an actual real root. -/
theorem salem_trace_root :
    (RReal.one + Real.Internal.sqrtNat 13) * (RReal.one + Real.Internal.sqrtNat 13)
      = (Real.Internal.sqrtNat 13 + Real.Internal.sqrtNat 13)
          + RReal.ofRat (Real.Internal.Rat.ofNat 14) := by
  rw [Real.Internal.RReal.sq_one_add, Real.Internal.sq_sqrtNat (by decide : 1 ≤ 13)]
  have hnum : RReal.ofRat (Real.Internal.Rat.ofNat 13) + RReal.one
      = RReal.ofRat (Real.Internal.Rat.ofNat 14) := by
    show RReal.mk (Real.ofRat (Real.Internal.Rat.ofNat 13)) + RReal.mk Real.one
        = RReal.mk (Real.ofRat (Real.Internal.Rat.ofNat 14))
    rw [RReal.mk_add]
    apply RReal.mk_eq_of_seq_eq
    intro n
    show Real.Internal.Rat.ofNat 13 + (1 : Real.Internal.Rat) = Real.Internal.Rat.ofNat 14
    decide
  rw [RReal.add_comm (RReal.ofRat (Real.Internal.Rat.ofNat 13))
        (Real.Internal.sqrtNat 13 + Real.Internal.sqrtNat 13),
      RReal.add_assoc, hnum]

/-- **The golden ratio as a real** — the metallic mean's `n = 1` member, the Pisot counterpart of the
Salem root. `φ = (1+√5)/2`; division-free with `z = 2φ = 1 + √5`, it satisfies `z² = z + z + 6`
(i.e. `z² − 2z − 4 = 0`, the golden equation `φ² = φ + 1` pushed through `2φ`). Same shape as
`salem_trace_root`, built on `(√5)² = 5`. Closes the parked Pisot thread to match the Salem one. -/
theorem golden_root :
    (RReal.one + Real.Internal.sqrtNat 5) * (RReal.one + Real.Internal.sqrtNat 5)
      = (Real.Internal.sqrtNat 5 + Real.Internal.sqrtNat 5)
          + RReal.ofRat (Real.Internal.Rat.ofNat 6) := by
  rw [Real.Internal.RReal.sq_one_add, Real.Internal.sq_sqrtNat (by decide : 1 ≤ 5)]
  have hnum : RReal.ofRat (Real.Internal.Rat.ofNat 5) + RReal.one
      = RReal.ofRat (Real.Internal.Rat.ofNat 6) := by
    show RReal.mk (Real.ofRat (Real.Internal.Rat.ofNat 5)) + RReal.mk Real.one
        = RReal.mk (Real.ofRat (Real.Internal.Rat.ofNat 6))
    rw [RReal.mk_add]
    apply RReal.mk_eq_of_seq_eq
    intro n
    show Real.Internal.Rat.ofNat 5 + (1 : Real.Internal.Rat) = Real.Internal.Rat.ofNat 6
    decide
  rw [RReal.add_comm (RReal.ofRat (Real.Internal.Rat.ofNat 5))
        (Real.Internal.sqrtNat 5 + Real.Internal.sqrtNat 5),
      RReal.add_assoc, hnum]

end Persistence.Aperiodic.StepN
end Infomaterial
