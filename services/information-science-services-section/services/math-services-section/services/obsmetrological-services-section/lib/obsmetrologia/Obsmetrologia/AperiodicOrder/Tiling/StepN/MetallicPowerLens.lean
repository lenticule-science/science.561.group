import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicReal
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicRoot

/-!
# The metallic power lens — `zᵏ = Pₖ·z + Qₖ`, the magnitude graded by the real power

`MetallicRoot` assembled the metallic mean's double `z = n + √(n²+4)` as a real with the
eigenvalue equation `z² = 2n·z + 4` (`metallic_root`). `MetallicReal` built its Cauchy convergents and
the **Cassini** unimodular witness `F_{k+2}F_k − F_{k+1}² = ±1` (`metallic_cassini`). This module
closes the loop those two left open: the **power expansion**

  `zᵏ = Pₖ · z + Qₖ`,

each real power `zᵏ` resolved into a coefficient pair `(Pₖ, Qₖ)` graded by `k` — the lens index. The
coefficients obey the metallic recurrence forced by `z² = 2n·z + 4` (`Pₖ₊₁ = Pₖ·2n + Qₖ`,
`Qₖ₊₁ = Pₖ·4`); the base `k = 2` is exactly `metallic_root`. So the real algebraic power is, at every
grade, an integer-coefficient combination of `z` and `1` — the **magnitude returns with the power**,
and `metallic_cassini`'s `±1` is its non-degeneracy (descent / `D ∤ C`) witness.

This is the algebraic-power face of the [Maslov power-mean deformation](../../../Probability/Dequantization.lean):
the metallic/Salem reals supply real powers without the full continuum of exponents, and the
power lens grades the recovered magnitude by `k`.

## Main definitions

* `metallicZ` — the metallic double `z = n + √(n²+4)`, a real.
* `coef` — the graded coefficient pair `(Pₖ, Qₖ)`.
* `zpow` — the real power `zᵏ` by structural recursion.

## Main results

* `metallic_power_expansion` — `zᵏ = Pₖ·z + Qₖ`: the real power is an integer-graded combination.

## References

`AperiodicOrder.Tiling.StepN.MetallicRoot` (`metallic_root`, `z² = 2nz+4`), `MetallicReal` (`metallic_cassini`,
the `±1` witness); the dequantization power-mean deformation of `Probability.Dequantization`.

## Tags

metallic mean, Salem, real power, power expansion, lens, Cassini, magnitude
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.StepN

open Real.Internal

/-- The metallic constant `2n` as a real. -/
def twoN (n : Nat) : RReal := RReal.ofRat (Rat.ofNat n) + RReal.ofRat (Rat.ofNat n)

/-- The metallic constant `4` as a real. -/
def four : RReal := RReal.ofRat (Rat.ofNat 4)

/-- The **metallic double** `z = n + √(n²+4) = 2μₙ`, a real with `z² = 2n·z + 4`. -/
def metallicZ (n : Nat) : RReal := RReal.ofRat (Rat.ofNat n) + sqrtNat (n ^ 2 + 4)

/-- The eigenvalue equation `z² = 2n·z + 4`, restated on `metallicZ`/`twoN`/`four` (`metallic_root`). -/
theorem metallicZ_sq (n : Nat) : metallicZ n * metallicZ n = twoN n * metallicZ n + four :=
  metallic_root n

/-- The **graded coefficient pair** `(Pₖ, Qₖ)` of the power expansion, forced by `z² = 2n·z + 4`:
`(P₀,Q₀) = (0,1)`, `Pₖ₊₁ = Pₖ·2n + Qₖ`, `Qₖ₊₁ = Pₖ·4`. -/
def coef (n : Nat) : Nat → RReal × RReal
  | 0 => (RReal.zero, RReal.one)
  | k + 1 => ((coef n k).1 * twoN n + (coef n k).2, (coef n k).1 * four)

/-- The real power `zᵏ` by structural recursion. -/
def zpow (z : RReal) : Nat → RReal
  | 0 => RReal.one
  | k + 1 => z * zpow z k

/-- **The metallic power expansion** `zᵏ = Pₖ·z + Qₖ`: every real power of the metallic double is an
integer-graded combination of `z` and `1`, the coefficients carrying the recovered magnitude. The
base `k = 0,1` is immediate; the step pushes `z²  = 2n·z + 4` (`metallicZ_sq`) through one more power.
-/
theorem metallic_power_expansion (n : Nat) (k : Nat) :
    zpow (metallicZ n) k = (coef n k).1 * metallicZ n + (coef n k).2 := by
  induction k with
  | zero =>
    show RReal.one = RReal.zero * metallicZ n + RReal.one
    rw [RReal.zero_mul, RReal.zero_add]
  | succ k ih =>
    have hsq : metallicZ n * metallicZ n = twoN n * metallicZ n + four := metallicZ_sq n
    show metallicZ n * zpow (metallicZ n) k
        = ((coef n k).1 * twoN n + (coef n k).2) * metallicZ n + (coef n k).1 * four
    rw [ih, RReal.left_distrib,
        ← RReal.mul_assoc (metallicZ n) ((coef n k).1) (metallicZ n),
        RReal.mul_comm (metallicZ n) ((coef n k).1),
        RReal.mul_assoc ((coef n k).1) (metallicZ n) (metallicZ n), hsq,
        RReal.left_distrib, ← RReal.mul_assoc ((coef n k).1) (twoN n) (metallicZ n),
        RReal.mul_comm (metallicZ n) ((coef n k).2), RReal.right_distrib,
        RReal.add_assoc, RReal.add_comm ((coef n k).1 * four) ((coef n k).2 * metallicZ n),
        ← RReal.add_assoc]

end AperiodicOrder.Tiling.StepN
end Obsmetrologia
