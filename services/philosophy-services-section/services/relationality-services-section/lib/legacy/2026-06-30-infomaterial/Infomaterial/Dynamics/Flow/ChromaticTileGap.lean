import Infomaterial.Calculus.Real.QuadraticSurd
import Infomaterial.Dynamics.Flow.ChromaticTileRayleigh

/-!
# The 4-site tile's irrational spectral gap `λ₁ = 2 − √2`, over the reals

`ChromaticTileRayleigh` computed the exact *rational* gaps of the 2- and 3-site tiles, and proved the
gap is positive for every tile (`harmonic_iff_constant`). The first **irrational** gap is the 4-site
path tile: its Laplacian has eigenvalues `2(1−cos(kπ/4)) = {0, 2−√2, 2, 2+√2}`, so the spectral gap is
`λ₁ = 2 − √2`. The two nonzero non-trivial eigenvalues `2 ± √2` are the roots of the characteristic
factor `x² − 4x + 2`.

This module realizes that irrational gap value **in our constructive reals**: with `√2 = sqrtNat 2`
(`(√2)² = 2`, `Real.IVT.sq_sqrtNat`), the gap `g = 2 − √2 : RReal` satisfies `g² + 2 = 4g`, i.e. it is
a genuine root of the 4-site characteristic factor. The proof mirrors `Aperiodic.StepN.metallic_root`
(the metallic mean as a real root of `x² − nx − 1`): the binomial `RReal.sq_add`, then `(√2)² = 2` and
the commutative-ring structure. The eigenvector `[1+√2, 1, −1, −(1+√2)]` realizing this gap (Rayleigh
quotient exactly `2−√2`, verified by hand: `dirichlet = 8`, `normSq = 8+4√2`, `(2−√2)(8+4√2) = 8`) is
noted but its `List RReal` Rayleigh computation is left for the real-tile-form layer.

## Main results

* `RReal.mul_neg` / `RReal.neg_mul` / `RReal.neg_neg` / `RReal.neg_mul_neg` — `RReal` sign arithmetic.
* `tile4_gap_char_root` — `g² + 2 = 4g` for `g = 2 − √2`: the 4-site gap is a real root of `x²−4x+2`.

## References

`content/.../lorentzian-causal-settling`; mirrors `Infomaterial.Persistence.Aperiodic.StepN.metallic_root`.

## Tags

spectral gap, irrational eigenvalue, square root, path Laplacian, characteristic root, chromatic tile
-/

namespace Infomaterial
namespace Flow

open Real.Internal

/-- **The crystallographic gap family.** For `1 ≤ d ≤ 4`, `2 − √d` is a root of `x² − 4x + (4−d)`. The
path tiles whose spectral gap is `2 − √d` are exactly the **crystallographically-allowed orders**
`N ∈ {3,4,6}` (`d = 1,2,3`: `cos(π/3)=½`, `cos(π/4)=√2/2`, `cos(π/6)=√3/2`), plus the degenerate
`N=2` (`d=0`, `λ₁=2`). The `a = 2` case of `quadratic_surd_sub_root`. -/
theorem tile_gap_char_root (d : Nat) (hd : 1 ≤ d) (hd4 : d ≤ 4) :
    (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat d)) * (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat d))
        + RReal.ofRat (Rat.ofNat (4 - d))
      = (RReal.ofRat (Rat.ofNat 2) + RReal.ofRat (Rat.ofNat 2))
          * (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat d)) :=
  Real.Internal.quadratic_surd_sub_root 2 d hd hd4

/-- **The 4-site tile gap `2 − √2`** is a root of `x² − 4x + 2` (`d = 2`). The first irrational tile
gap, realized over the reals; the eigenvector `[1+√2,1,−1,−(1+√2)]` has Rayleigh quotient `2−√2`. -/
theorem tile4_gap_char_root :
    (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat 2)) * (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat 2))
        + RReal.ofRat (Rat.ofNat 2)
      = (RReal.ofRat (Rat.ofNat 2) + RReal.ofRat (Rat.ofNat 2))
          * (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat 2)) :=
  tile_gap_char_root 2 (by omega) (by omega)

/-- **The 5-site tile gap is the golden quadratic irrational `(3 − √5)/2`** — the first
**non-crystallographic** tile gap. Division-free: the doubled gap `2λ₁ = 3 − √5` is a root of
`x² − 6x + 4` (`g² + 4 = 6·g`), the `a = 3, d = 5` case (`λ₁(5) = 2(1−cos(π/5))`,
`cos(π/5) = (1+√5)/4`). It is quadratic (the golden field `ℚ(√5)`) even though `N = 5` is not
crystallographic — the gap stays a `√`-constructible number for `N ∈ {3,4,5,6}` (degree ≤ 2), the
cubic `N = 7` being the first that escapes. -/
theorem tile5_gap_char_root :
    (RReal.ofRat (Rat.ofNat 3) + (- sqrtNat 5)) * (RReal.ofRat (Rat.ofNat 3) + (- sqrtNat 5))
        + RReal.ofRat (Rat.ofNat 4)
      = (RReal.ofRat (Rat.ofNat 3) + RReal.ofRat (Rat.ofNat 3))
          * (RReal.ofRat (Rat.ofNat 3) + (- sqrtNat 5)) :=
  Real.Internal.quadratic_surd_sub_root 3 5 (by omega) (by omega)

/-- **The 6-site tile gap `2 − √3`** is a root of `x² − 4x + 1` (the `d = 3` crystallographic case,
`N = 6`). The second quadratic-irrational tile gap, realized over the reals. -/
theorem tile6_gap_char_root :
    (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat 3)) * (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat 3))
        + RReal.ofRat (Rat.ofNat 1)
      = (RReal.ofRat (Rat.ofNat 2) + RReal.ofRat (Rat.ofNat 2))
          * (RReal.ofRat (Rat.ofNat 2) + (- sqrtNat 3)) :=
  tile_gap_char_root 3 (by omega) (by omega)

end Flow
end Infomaterial
