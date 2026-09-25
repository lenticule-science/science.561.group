import Obsmetrologia.AperiodicOrder.Tiling.SubstitutionPrimitivity
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicMean

/-!
# The hat monotile's metatile substitution as an integer witness

Smith, Myers, Kaplan, and Goodman-Strauss prove the hat polykite aperiodic by grouping hats into
four metatiles `H`, `T`, `P`, `F` — an `H` holds four hats (one reflected hat and its three
unreflected neighbours), a `T` one, a `P` two, an `F` two — and showing that every metatile lies in a
unique hierarchy of combinatorially equivalent supertiles. The substitution that drives the hierarchy
composes each level-1 supertile from metatiles:

  `H' = 3H + T + 3P + 3F`,  `T' = H`,  `P' = 2H + P + 2F`,  `F' = 2H + P + 3F`

(the face substitution `σ₂` of Baake–Gähler–Sadun, eq. (11), read at `r = 1`; the monotile paper
states the `H` row as "the arrangement of three `H` tiles and a `T` tile inside of an `H` supertile").
The paper's inflation factor is `φ²`; its square `φ⁴ = 6.854…` is the Perron root of this
abelianization, and `φ⁴ + φ⁻⁴ = 7` is the trace that names the Perron factor below.

This module transcribes that substitution into the dependency-free core exactly as
`StepN.SubstitutionMatrix` and `SubstitutionPrimitivity` transcribe Fibonacci and Padovan, and proves
what the integer matrix carries with no reals:

* `hatMetatileMatrix` is the abelianization of the metatile substitution and equals the paper's
  matrix cellwise (`hatMetatileMatrix_is_paper`);
* it is nonnegative and **primitive** at `k = 2` (`hatMetatileMatrix_primitive`) — the integer
  Perron–Frobenius precondition;
* it satisfies the monic quartic `x⁴ − 7x³ + 7x − 1` (`cayleyHamilton_hat`), which splits on the
  matrix as `(x² − 7x + 1)(x² − 1)` (`hat_charPoly_factors`);
* the Perron factor `x² − 7x + 1` is the minimal polynomial of `φ⁴`: the fourth power of the golden
  (Fibonacci) substitution matrix is annihilated by it (`golden_fourth_power_hat_factor`) — the
  hat's area inflation is the fourth rung of the metallic tower, not a new constant;
* the matrix is the `pos`-incidence projection of a FOUR-valued Chu relation (`hatMetatileChu`,
  `hatMetatileMatrix_chu_incidence`), as the Padovan and Fibonacci matrices are.

`hat_metatile_witness` bundles the headline. Every proof is a kernel `decide` over `Fin 4`; the
declarations depend on `propext` only (no `Quot.sound`, no `Classical.choice`, no `native_decide`),
the same profile as the Jeandel–Rao witnesses.

## scope

Finite integer witness theorems only: the metatile abelianization, its primitivity, its
annihilating polynomial, and the golden link. They do not prove the hat aperiodic, do not build the
metatile geometry or the edge matching rules. The reflected-hat frequency `1 : φ⁴` is stated in
`Witness.HatReflectionFrequency` as an exact identity in the golden integers `ℤ[φ]`, with no real
number. The Čech cohomology `Ȟ¹ = ℤ⁴` of the hat hull
(Baake–Gähler–Sadun, Theorem 4) is the next finite witness this module points at, on the pattern of
`Witness.JeandelRao`.

## References

* D. Smith, J. S. Myers, C. S. Kaplan, C. Goodman-Strauss, *An aperiodic monotile*,
  Combinatorial Theory 4(1) (2024) #6, arXiv:2303.10798 — §2 (metatiles, supertiles, inflation
  factor `φ²`).
* M. Baake, F. Gähler, L. Sadun, *Dynamics and topology of the Hat family of tilings*,
  arXiv:2305.05639 — §2 eq. (11) (face substitution), Theorem 4 (cohomology).
* Corpus: the 2026-06-26 memo on coloring aperiodic tiles and the quasicrystal frontier memo.

## Tags
hat monotile, aperiodic monotile, metatile, substitution matrix, primitive matrix, Cayley–Hamilton,
golden ratio, einstein problem
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Witness

open AperiodicOrder.Tiling.Universality
open AperiodicOrder.Tiling.StepN

/-- The **hat metatile substitution** on the alphabet `H = 0`, `T = 1`, `P = 2`, `F = 3`: each
level-1 supertile listed as the multiset of metatiles it contains (`H' = 3H + T + 3P + 3F`,
`T' = H`, `P' = 2H + P + 2F`, `F' = 2H + P + 3F`). -/
def hatMetatileSubst : Fin 4 → List (Fin 4)
  | 0 => [0, 0, 0, 1, 2, 2, 2, 3, 3, 3]
  | 1 => [0]
  | 2 => [0, 0, 2, 3, 3]
  | 3 => [0, 0, 2, 3, 3, 3]

/-- The **hat metatile substitution matrix**: the abelianization of `hatMetatileSubst`
(entry `i j` = count of metatile `j` in supertile `i`). -/
def hatMetatileMatrix : Mat 4 := substMatrix hatMetatileSubst

/-- The paper's matrix, rows `H, T, P, F`, columns `H, T, P, F`:
`[[3,1,3,3],[1,0,0,0],[2,0,1,2],[2,0,1,3]]`. -/
def hatMetatilePaper : Mat 4 := fun i j =>
  match i, j with
  | 0, 0 => 3 | 0, 1 => 1 | 0, 2 => 3 | 0, 3 => 3
  | 1, 0 => 1 | 1, 1 => 0 | 1, 2 => 0 | 1, 3 => 0
  | 2, 0 => 2 | 2, 1 => 0 | 2, 2 => 1 | 2, 3 => 2
  | 3, 0 => 2 | 3, 1 => 0 | 3, 2 => 1 | 3, 3 => 3

/-- **The abelianization is the paper's matrix**, cellwise. -/
theorem hatMetatileMatrix_is_paper : ∀ i j, hatMetatileMatrix i j = hatMetatilePaper i j := by
  decide

/-- **The hat metatile matrix is nonnegative** (it counts tiles). -/
theorem hatMetatileMatrix_nonnegative : NonnegativeMatrix hatMetatileMatrix := by
  show ∀ i j, 0 ≤ hatMetatileMatrix i j
  decide

/-- `hatMetatileMatrix² = [[22,3,15,24],[3,1,3,3],[12,2,9,14],[14,2,10,17]]` is strictly positive:
every metatile appears inside every level-2 supertile. -/
theorem hatMetatileMatrix_pow2_positive : PositiveMatrix (matPow hatMetatileMatrix 2) := by
  show ∀ i j, 0 < matPow hatMetatileMatrix 2 i j
  decide

/-- **The hat metatile matrix is primitive**, witnessed by `k = 2` — the integer Perron–Frobenius
precondition for a simple dominant eigenvalue and positive frequency vector. -/
theorem hatMetatileMatrix_primitive : Primitive hatMetatileMatrix :=
  ⟨2, hatMetatileMatrix_pow2_positive⟩

/-- **The hat characteristic polynomial** `x⁴ − 7x³ + 0x² + 7x − 1` as an ascending-degree
coefficient list `[-1, 7, 0, -7, 1]`. Its roots are `φ⁴`, `φ⁻⁴`, `1`, `−1`. -/
def charPolyHat : List Int := [-1, 7, 0, -7, 1]

/-- **The Perron factor** `x² − 7x + 1` as `[1, -7, 1]`: the minimal polynomial of `φ⁴`
(`φ⁴ + φ⁻⁴ = L₄ = 7`, the fourth Lucas number). -/
def hatGoldenFactor : List Int := [1, -7, 1]

/-- **The unit factor** `x² − 1` as `[-1, 0, 1]`: the eigenvalues `±1` the substitution carries on
the non-Perron part. -/
def hatUnitFactor : List Int := [-1, 0, 1]

/-- `charPolyHat` has degree `4` (length `5`). -/
theorem charPolyHat_degree : degreeN charPolyHat 4 := rfl

/-- `charPolyHat` is monic. -/
theorem charPolyHat_monic : monic charPolyHat := rfl

/-- **Cayley–Hamilton for the hat.** The hat metatile matrix is annihilated by `charPolyHat`:
`M⁴ − 7M³ + 7M − I = 0`. -/
theorem cayleyHamilton_hat : ∀ i j, evalMatPoly charPolyHat hatMetatileMatrix i j = matZero i j := by
  decide

/-- **The quartic splits on the matrix**: `evalMatPoly charPolyHat M = (M² − 7M + I)(M² − I)`,
the Perron factor times the unit factor. -/
theorem hat_charPoly_factors :
    ∀ i j, evalMatPoly charPolyHat hatMetatileMatrix i j
      = matMul (evalMatPoly hatGoldenFactor hatMetatileMatrix)
               (evalMatPoly hatUnitFactor hatMetatileMatrix) i j := by
  decide

/-- **The Perron factor is golden.** The fourth power of the Fibonacci substitution matrix
`[[1,1],[1,0]]⁴ = [[5,3],[3,2]]` is annihilated by `x² − 7x + 1`: the hat's area inflation `φ⁴`
is the fourth rung of the metallic tower (`StepN.MetallicMean`), not a new constant. -/
theorem golden_fourth_power_hat_factor :
    ∀ i j, evalMatPoly hatGoldenFactor (matPow fibonacciMatrix 4) i j = matZero i j := by
  decide

/-- The hat metatile matrix is not annihilated by its Perron factor alone (`M² − 7M + I ≠ 0` at
entry `(1,1)`): the unit factor is genuinely present. -/
theorem hat_not_golden_quadratic :
    ¬ (∀ i j, evalMatPoly hatGoldenFactor hatMetatileMatrix i j = matZero i j) := by
  decide

/-- **The hat metatile Chu space over FOUR**: points and states are the metatile alphabet `Fin 4`;
`r i j` is `t` when metatile `j` occurs in supertile `i`, `⊥` otherwise. -/
def hatMetatileChu : ChuSpace where
  pts := Fin 4
  sts := Fin 4
  r := fun i j => Charge.ofSlots ((hatMetatileSubst i).count j != 0) false

/-- **The hat metatile matrix is the `pos`-incidence of its Chu `r`**: the entry is nonzero exactly
where the FOUR relation carries positive charge (unlike Fibonacci and Padovan, the counts exceed
`1`, so the incidence is the support of the matrix, not the matrix itself). -/
theorem hatMetatileMatrix_chu_incidence :
    ∀ (i j : Fin 4), (if (hatMetatileChu.r i j).pos then (1 : Int) else 0)
      = (if hatMetatileMatrix i j = 0 then 0 else 1) := by
  decide

/-- **The hat metatile witness, bundled**: the abelianization is the paper's matrix, it is
nonnegative and primitive, it satisfies `x⁴ − 7x³ + 7x − 1`, and its Perron factor `x² − 7x + 1`
annihilates the fourth power of the golden matrix. -/
theorem hat_metatile_witness :
    (∀ i j, hatMetatileMatrix i j = hatMetatilePaper i j)
    ∧ NonnegativeMatrix hatMetatileMatrix
    ∧ Primitive hatMetatileMatrix
    ∧ (∀ i j, evalMatPoly charPolyHat hatMetatileMatrix i j = matZero i j)
    ∧ (∀ i j, evalMatPoly hatGoldenFactor (matPow fibonacciMatrix 4) i j = matZero i j) :=
  ⟨hatMetatileMatrix_is_paper, hatMetatileMatrix_nonnegative, hatMetatileMatrix_primitive,
    cayleyHamilton_hat, golden_fourth_power_hat_factor⟩

end AperiodicOrder.Tiling.Witness
end Obsmetrologia
