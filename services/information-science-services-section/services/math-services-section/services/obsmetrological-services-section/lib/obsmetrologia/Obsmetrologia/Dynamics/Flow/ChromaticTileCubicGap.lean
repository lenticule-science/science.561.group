import Obsmetrologia.Dynamics.Flow.ChromaticTileGap

/-!
# The 7-site tile's cubic spectral gap — the first gap that escapes the square roots

`ChromaticTileGap` realized every **quadratic-surd** tile gap: `2−√d` for `N ∈ {3,4,6}` and the golden
`(3−√5)/2` for `N = 5`, all as roots of an explicit integer quadratic via `quadratic_surd_sub_root`.
The path
`N = 7` is the first tile whose gap `λ₁ = 2(1−cos(π/7))` is **not** a quadratic surd: `2cos(π/7)` is a
root of the irreducible cubic `x³ − x² − 2x + 1` (`cos7MinPoly`), so the gap satisfies the cubic
`x³ − 5x² + 6x − 1` (`tile7GapCubic`). Classically this cubic is *casus irreducibilis* — three real
roots, none expressible by **real** radicals — so unlike `N ≤ 6` there is no nested-`√` closed form;
the constructive realization is no longer "a formula satisfies a polynomial" but the
intermediate-value bracket, exactly the idiom `Salem` uses (`salemTraceResolvent_real_root`).

Two things are proved here, division-free and over the integers (the polynomials `A`, `B` *are* integer
polynomials):

* **The characteristic reduction** `tile7_gap_reduction`: `B(2−x) = −A(x)` as a ring identity, so the
  gap `g = 2 − 2cos(π/7)` is a root of `B` exactly because `2cos(π/7)` is a root of `A`
  (`tile7_gap_root_of_cos7`). This ties the tile gap to the *classical* minimal polynomial of
  `2cos(π/7)`.
* **The IVT brackets** `tile7_gap_bracket` (`B(0) < 0 < B(1)`: the unique gap root in `(0,1) ≈ 0.198`)
  and `cos7_bracket` (`A(1) < 0 < A(2)`: `2cos(π/7) ≈ 1.802 ∈ (1,2)`), both `by decide`.

The actual constructive `RReal` root of `B` — the gap as a Bishop real, produced by rational bisection
of this bracket (the bracket-is-Cauchy + continuity construction flagged in `SalemRoot`) — is the named
frontier; `sqrtNat` cannot reach it (no real radical), so this needs the general bisection-IVT.

## Main results
* `tile7_gap_reduction` — `B(2−x) = −A(x)`: the substitution `g = 2−c` carrying `A`'s roots to `B`'s.
* `tile7_gap_root_of_cos7` — hence the gap `2 − 2cos(π/7)` is a root of `B = x³−5x²+6x−1`.
* `tile7_gap_bracket` / `cos7_bracket` — the IVT sign-changes isolating the gap and `2cos(π/7)`.

## References
`content/.../lorentzian-causal-settling`; the `AperiodicOrder.Tiling.StepN.Salem` sign-change idiom; mirrors the
quadratic engine `Obsmetrologia.Real.Internal.quadratic_surd_sub_root`.

## Tags
spectral gap, cubic irrational, casus irreducibilis, path Laplacian, intermediate value theorem,
characteristic polynomial, chromatic tile, 2cos(pi/7)
-/

namespace Obsmetrologia
namespace Flow

/-- **Horner evaluation** of an ascending-degree integer coefficient list at an integer point — the
same evaluation `AperiodicOrder.Tiling.StepN.evalIntPoly` uses to record Salem sign-changes, inlined here to keep
the cubic-gap module free of the Salem matrix chain. -/
def evalIntPoly : List Int → Int → Int
  | [], _ => 0
  | (c :: cs), x => c + x * evalIntPoly cs x

/-- The **minimal polynomial of `2cos(π/7)`**, `x³ − x² − 2x + 1` (ascending coefficients). Its three
real roots are `2cos(π/7), 2cos(3π/7), 2cos(5π/7)` — the doubled cosines of the odd seventh-turns. -/
def cos7MinPoly : List Int := [1, -2, -1, 1]

/-- The **7-site tile gap cubic**, `x³ − 5x² + 6x − 1` (ascending coefficients). Its roots are the three
gaps `2(1−cos(kπ/7))` for `k = 1,3,5`; the smallest, `2(1−cos(π/7)) ≈ 0.198`, is the spectral gap. -/
def tile7GapCubic : List Int := [-1, 6, -5, 1]

/-- **The characteristic reduction `B(2−x) = −A(x)`.** Substituting the gap `g = 2 − c` for the doubled
cosine `c = 2cos(kπ/7)` carries every root of the `2cos`-minimal-polynomial `A = cos7MinPoly` to a root
of the gap cubic `B = tile7GapCubic`. A symbolic ring identity (any commutative ring); proved by `iring`
after unfolding the Horner evaluation. -/
theorem tile7_gap_reduction (x : Int) :
    evalIntPoly tile7GapCubic (2 - x) = - evalIntPoly cos7MinPoly x := by
  simp only [tile7GapCubic, cos7MinPoly, evalIntPoly]
  iring
  simp only [show x * (x * 2) = (2 : Int) * (x * x) from by iring,
    show x * (x * 5) = (5 : Int) * (x * x) from by iring]
  omega

/-- **The 7-site spectral gap is a root of `x³ − 5x² + 6x − 1`.** Whenever `c` is a root of the
`2cos(π/7)` minimal polynomial `A`, the gap `2 − c` is a root of the gap cubic `B` — the cubic analogue
of `quadratic_surd_sub_root`, now via the reduction `B(2−c) = −A(c) = 0` rather than a `√` formula. -/
theorem tile7_gap_root_of_cos7 (x : Int) (h : evalIntPoly cos7MinPoly x = 0) :
    evalIntPoly tile7GapCubic (2 - x) = 0 := by
  rw [tile7_gap_reduction, h, Int.neg_zero]

/-- **The IVT bracket for the gap.** `B(0) = −1 < 0` and `B(1) = 1 > 0`, so the gap cubic has a root in
`(0,1)` — the spectral gap `2(1−cos(π/7)) ≈ 0.198`, the unique root of `B` in the unit interval. The constructive root is the rational bisection of this bracket (frontier; `sqrtNat` cannot reach a
*casus irreducibilis* cubic). -/
theorem tile7_gap_bracket :
    evalIntPoly tile7GapCubic 0 < 0 ∧ 0 < evalIntPoly tile7GapCubic 1 := by decide

/-- **The IVT bracket for `2cos(π/7)`.** `A(1) = −1 < 0` and `A(2) = 1 > 0`, so the `2cos`-minimal
polynomial has a root in `(1,2)` — `2cos(π/7) ≈ 1.802`. With `tile7_gap_reduction` this is the same
sign-change as `tile7_gap_bracket`, reflected through `x ↦ 2 − x`. -/
theorem cos7_bracket :
    evalIntPoly cos7MinPoly 1 < 0 ∧ 0 < evalIntPoly cos7MinPoly 2 := by decide

end Flow
end Obsmetrologia
