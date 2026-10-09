import Obsmetrologia.Calculus.Real.IVT
import Obsmetrologia.Calculus.Real.MultiplicationOrder

/-!
# The metallic means as reals: `(n + √(n²+4))² = 2n·(n + √(n²+4)) + 4`

`SalemRoot` cashed the `n = 1` golden case (`golden_root`) by reusing `RReal.sq_one_add`. This module
does the **whole metallic family**: for every `n`, the metallic mean `μₙ = (n + √(n²+4))/2` (root of
`x² − nx − 1`) is a real number, division-free via `z = 2μₙ = n + √(n²+4)`, which satisfies
`z² = (n+n)·z + 4` (the recurrence `μ² = nμ + 1` pushed through `2μ`).

General `n` needs three pieces the golden case sidestepped: `ofRat_mul` (the constant `n²` is a product;
clean because `ofRat` sequences are constant, so `Real.mul`'s modulus shifts are inert), `RReal.sq_add`
(the general binomial `(a+s)²`, not just `(1+s)²`), and the `ℚ` constant identity `n²+4 = n·n + 4`. The
only non-pointwise fact is `s² = n²+4` (`sq_sqrtNat`); the rest is the commutative-ring structure.

## Main results
* `ofRat_mul` — `ofRat` is multiplicative.
* `RReal.sq_add` — the `ℝ` binomial square `(a+s)² = a² + (a·s + s·a) + s²`.
* `metallic_root` — the metallic recurrence `z² = (n+n)·z + 4` for `z = n + √(n²+4)`, all `n`.

## References
Corpus `substitution-universality-class` (metallic Pisot family); the coloring-aperiodic-tiles memo §5.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.StepN

open Real.Internal

/-- The constant identity `ofRat(n²+4) = ofNat n · ofNat n + ofNat 4` in `ℝ`. -/
theorem ofRat_nsq_add_four (n : Nat) :
    RReal.ofRat (Rat.ofNat (n ^ 2 + 4))
      = RReal.ofRat (Rat.ofNat n) * RReal.ofRat (Rat.ofNat n) + RReal.ofRat (Rat.ofNat 4) := by
  rw [← RReal.ofRat_mul, ← RReal.ofRat_add]
  congr 1
  rw [Nat.pow_two]
  show Rat.mk (PreRat.ofNat (n * n + 4))
      = Rat.mk (PreRat.ofNat n) * Rat.mk (PreRat.ofNat n) + Rat.mk (PreRat.ofNat 4)
  rw [Rat.mk_mul, Rat.mk_add]
  apply Rat.mk_eq.mpr
  have hc : ((n * n + 4 : Nat) : Int) = (n : Int) * (n : Int) + ((4 : Nat) : Int) := by
    rw [Int.natCast_add, Int.natCast_mul]
  simp only [PreRat.equiv, PreRat.mul, PreRat.add, PreRat.ofNat]
  rw [hc]
  iring

/-- `x + (y + y) + (x + z) = (x + y) + (x + y) + z` — the commutative-monoid reassociation the metallic
expansion needs (no `ring`/`ac_rfl` for `ℝ`, so it is hand-built from `add_assoc`/`add_comm`). -/
theorem rreal_rearrange_metallic (X Y Z : RReal) :
    X + (Y + Y) + (X + Z) = (X + Y) + (X + Y) + Z := by
  rw [← RReal.add_assoc X Y Y, ← RReal.add_assoc (X + Y + Y) X Z,
      RReal.add_assoc (X + Y) Y X, RReal.add_comm Y X]

/-- **The metallic mean `μₙ = (n + √(n²+4))/2` as a real, all `n`.** Division-free via `z = 2μₙ =
n + √(n²+4)`: it satisfies `z² = (n+n)·z + 4` (the recurrence `μ² = nμ + 1` pushed through `2μ`). The
`n = 1` case is `golden_root`; `n = 2` the silver mean, and so on through the whole Pisot family. Built
on `(√(n²+4))² = n²+4` (`sq_sqrtNat`) and the `ℝ` binomial `RReal.sq_add`. -/
theorem metallic_root (n : Nat) :
    (RReal.ofRat (Rat.ofNat n) + sqrtNat (n ^ 2 + 4))
        * (RReal.ofRat (Rat.ofNat n) + sqrtNat (n ^ 2 + 4))
      = (RReal.ofRat (Rat.ofNat n) + RReal.ofRat (Rat.ofNat n))
          * (RReal.ofRat (Rat.ofNat n) + sqrtNat (n ^ 2 + 4))
        + RReal.ofRat (Rat.ofNat 4) := by
  have hss : sqrtNat (n ^ 2 + 4) * sqrtNat (n ^ 2 + 4) = RReal.ofRat (Rat.ofNat (n ^ 2 + 4)) :=
    sq_sqrtNat (by omega)
  have hconst : RReal.ofRat (Rat.ofNat (n ^ 2 + 4))
      = RReal.ofRat (Rat.ofNat n) * RReal.ofRat (Rat.ofNat n) + RReal.ofRat (Rat.ofNat 4) :=
    ofRat_nsq_add_four n
  rw [RReal.sq_add (RReal.ofRat (Rat.ofNat n)) (sqrtNat (n ^ 2 + 4)), hss, hconst,
      RReal.mul_comm (sqrtNat (n ^ 2 + 4)) (RReal.ofRat (Rat.ofNat n)),
      RReal.right_distrib (RReal.ofRat (Rat.ofNat n)) (RReal.ofRat (Rat.ofNat n))
        (RReal.ofRat (Rat.ofNat n) + sqrtNat (n ^ 2 + 4)),
      RReal.left_distrib (RReal.ofRat (Rat.ofNat n)) (RReal.ofRat (Rat.ofNat n)) (sqrtNat (n ^ 2 + 4)),
      rreal_rearrange_metallic (RReal.ofRat (Rat.ofNat n) * RReal.ofRat (Rat.ofNat n))
        (RReal.ofRat (Rat.ofNat n) * sqrtNat (n ^ 2 + 4)) (RReal.ofRat (Rat.ofNat 4))]

end AperiodicOrder.Tiling.StepN
end Obsmetrologia
