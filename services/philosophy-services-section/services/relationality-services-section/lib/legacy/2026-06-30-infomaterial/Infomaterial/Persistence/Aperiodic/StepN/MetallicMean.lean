import Infomaterial.Persistence.Aperiodic.StepN.SubstitutionMatrix

/-!
# The metallic-mean substitution family

The Fibonacci substitution `a ↦ ab, b ↦ a` is the `n = 1` member of the **metallic-mean family**
`a ↦ aⁿb, b ↦ a`, whose substitution matrix is `[[n,1],[1,0]]` and whose characteristic polynomial is
`xⁿ⁻¹`… no: `x² − n·x − 1`, with Perron eigenvalue the n-th metallic mean `(n + √(n²+4))/2` — golden
(`n=1`, = Fibonacci), silver (`n=2`, Pell, `1+√2`), bronze (`n=3`). This module lifts the corpus's
golden/plastic Cayley–Hamilton instances (`SubstitutionMatrix`) to the silver and bronze means: the
substitution matrices are annihilated by `x² − 2x − 1` and `x² − 3x − 1` respectively, the metallic
ratios' defining equations `M² = nM + I`.

## Main results

* `cayleyHamilton_silver` — the silver-mean matrix `[[2,1],[1,0]]` satisfies `x² − 2x − 1`.
* `cayleyHamilton_bronze` — the bronze-mean matrix `[[3,1],[1,0]]` satisfies `x² − 3x − 1`.

## References

* `…/aperiodic-settling/.../step-n-substitution-rule/` and the metallic-mean Wang-tile literature
  (Labbé, "Metallic mean Wang tiles I/II"; Kari–Labbé–Mostert).
-/

namespace Infomaterial
namespace Persistence.Aperiodic.StepN
open Persistence.Aperiodic.Universality

/-- The **silver-mean substitution** `a ↦ aab, b ↦ a` on `{a,b} = {0,1}` — the `n = 2` metallic mean
(the Pell substitution). -/
def silverSubst : Fin 2 → List (Fin 2)
  | 0 => [0, 0, 1]
  | 1 => [0]

/-- The **silver-mean substitution matrix** `[[2,1],[1,0]]`, the abelianization of `silverSubst`. -/
def silverMatrix : Mat 2 := substMatrix silverSubst

/-- The silver mean's characteristic polynomial `x² − 2x − 1`, ascending coefficients `[-1, -2, 1]`;
its larger root is the silver ratio `1 + √2`. -/
def charPolySilver : List Int := [-1, -2, 1]

/-- **Cayley–Hamilton for the silver mean.** The silver substitution matrix is annihilated by
`charPolySilver = x² − 2x − 1`: `evalMatPoly charPolySilver M = 0`, i.e. `M² = 2M + I` — the silver
ratio's defining equation, lifted to `Mat 2`. -/
theorem cayleyHamilton_silver :
    evalMatPoly charPolySilver silverMatrix = matZero :=
  funext fun i => funext fun j =>
    match i, j with
    | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl
    | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl

/-- The silver mean's Cayley–Hamilton as the **inflation recurrence** `M² = 2M + I` — the integer
matrix recurrence that drives the silver-mean tile growth (the dependency-free form of "the inflation
factor is the larger root of `x² − 2x − 1`"; the explicit real eigenvalue `1 + √2` is a reals-layer
statement). Each cell is `rfl`. -/
theorem silver_quadratic :
    ∀ i j, matPow silverMatrix 2 i j = 2 * silverMatrix i j + matId i j
  | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl
  | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl

/-- The **bronze-mean substitution** `a ↦ aaab, b ↦ a` on `{a,b} = {0,1}` — the `n = 3` metallic mean. -/
def bronzeSubst : Fin 2 → List (Fin 2)
  | 0 => [0, 0, 0, 1]
  | 1 => [0]

/-- The **bronze-mean substitution matrix** `[[3,1],[1,0]]`, the abelianization of `bronzeSubst`. -/
def bronzeMatrix : Mat 2 := substMatrix bronzeSubst

/-- The bronze mean's characteristic polynomial `x² − 3x − 1`, ascending coefficients `[-1, -3, 1]`;
its larger root is the bronze ratio `(3 + √13)/2`. -/
def charPolyBronze : List Int := [-1, -3, 1]

/-- **Cayley–Hamilton for the bronze mean.** `evalMatPoly charPolyBronze M = 0`, i.e. `M² = 3M + I`. -/
theorem cayleyHamilton_bronze :
    evalMatPoly charPolyBronze bronzeMatrix = matZero :=
  funext fun i => funext fun j =>
    match i, j with
    | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl
    | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl

/-- The bronze mean's inflation recurrence `M² = 3M + I` (the larger root of `x² − 3x − 1`). Each
cell is `rfl`. -/
theorem bronze_quadratic :
    ∀ i j, matPow bronzeMatrix 2 i j = 3 * bronzeMatrix i j + matId i j
  | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl
  | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl

/-- The **n-th metallic-mean substitution matrix** `[[n,1],[1,0]]`, directly as a function of `n`
(the whole family in one definition). -/
def metallicMatrix (n : Int) : Mat 2 := fun i j =>
  if i = 0 then (if j = 0 then n else 1) else (if j = 0 then 1 else 0)

/-- **The metallic-mean inflation recurrence, for the whole family.** For every `n`, the matrix
`[[n,1],[1,0]]` satisfies `M² = nM + I` — the n-th metallic mean's defining equation `x² = nx + 1`,
generalizing the golden/plastic/silver/bronze instances over all `n`. -/
theorem metallic_quadratic (n : Int) :
    ∀ i j, matPow (metallicMatrix n) 2 i j = n * metallicMatrix n i j + matId i j
  | ⟨0, _⟩, ⟨0, _⟩ => by simp [matPow, matMul, isum_succ, isum_zero, metallicMatrix, matId]
  | ⟨0, _⟩, ⟨1, _⟩ => by simp [matPow, matMul, isum_succ, isum_zero, metallicMatrix, matId]
  | ⟨1, _⟩, ⟨0, _⟩ => by simp [matPow, matMul, isum_succ, isum_zero, metallicMatrix, matId]
  | ⟨1, _⟩, ⟨1, _⟩ => by simp [matPow, matMul, isum_succ, isum_zero, metallicMatrix, matId]

/-- The n-th metallic mean's characteristic polynomial `x² − nx − 1`, ascending `[-1, -n, 1]` — the
whole family in one definition. -/
def charPolyMetallic (n : Int) : List Int := [-1, -n, 1]

/-- **Cayley–Hamilton for the metallic-mean family, for all `n`.** The matrix `[[n,1],[1,0]]` is
annihilated by its characteristic polynomial `x² − nx − 1`: `evalMatPoly (charPolyMetallic n) M = 0`.
Proven uniformly via the `isum` matrix algebra — the corpus's golden/plastic instances generalized to
the entire family of metallic means. -/
theorem cayleyHamilton_metallic (n : Int) :
    evalMatPoly (charPolyMetallic n) (metallicMatrix n) = matZero :=
  funext fun i => funext fun j =>
    match i, j with
    | ⟨0, _⟩, ⟨0, _⟩ => by simp [evalMatPoly, charPolyMetallic, matAdd, intSmul, matMul, isum_succ, isum_zero, metallicMatrix, matId, matZero] <;> omega
    | ⟨0, _⟩, ⟨1, _⟩ => by simp [evalMatPoly, charPolyMetallic, matAdd, intSmul, matMul, isum_succ, isum_zero, metallicMatrix, matId, matZero] <;> omega
    | ⟨1, _⟩, ⟨0, _⟩ => by simp [evalMatPoly, charPolyMetallic, matAdd, intSmul, matMul, isum_succ, isum_zero, metallicMatrix, matId, matZero] <;> omega
    | ⟨1, _⟩, ⟨1, _⟩ => by simp [evalMatPoly, charPolyMetallic, matAdd, intSmul, matMul, isum_succ, isum_zero, metallicMatrix, matId, matZero] <;> omega

/-! ## The integer inflation engine: the metallic-mean recurrence and its convergents

The metallic mean `μ_n` is the limit of the ratios `F_{k+1}/F_k` of the **metallic recurrence**
`F_{k+2} = n·F_{k+1} + F_k` (`F_0 = 0`, `F_1 = 1`) — the integer tile-counts at each inflation level
(`Fibonacci` at `n = 1`, `Pell` at `n = 2`). The substitution matrix `[[n,1],[1,0]]` *is* the
companion matrix of this recurrence: its `k`-th power literally tabulates four consecutive `F`-values,
so the proven matrix algebra (`metallic_quadratic`, `cayleyHamilton_metallic`) and the counting
sequence are one object. This pins the real eigenvalue as the limit of an explicit rational sequence
of convergents — the sharp form of "`μ_n = (n+√(n²+4))/2`" reachable from the integer side.

The two remaining obligations to *land* `μ_n` as a `Real.RReal` (`Real/Internal.lean`) are
exactly stateable: (1) the convergent gaps are `|F_{k+1}/F_k − F_{k+2}/F_{k+1}| = 1/(F_k·F_{k+1})`
(the Cassini determinant identity `F_{k+2}·F_k − F_{k+1}² = (−1)^{k+1}`, a *nonlinear* integer
identity awaiting a `ring`-style normalizer in dependency-free core), which together with the positivity
`metallicNum_pos` and the superlinear recurrence growth gives the explicit Cauchy modulus; and (2) the
defining equation `μ² = n·μ + 1`,
which awaits **real multiplication** (the Bishop reals here are an ordered abelian group: `add`/`neg`/
`le`/`completeness` are built, `mul` is not yet). -/

/-- The **metallic recurrence** `F_{k+2} = n·F_{k+1} + F_k`, `F_0 = 0`, `F_1 = 1` — the integer
inflation tile-counts whose ratios `F_{k+1}/F_k` converge to the n-th metallic mean (Fibonacci at
`n = 1`, Pell/silver at `n = 2`). -/
def metallicNum (n : Int) : Nat → Int
  | 0 => 0
  | 1 => 1
  | (k+2) => n * metallicNum n (k+1) + metallicNum n k

/-- **The substitution matrix is the companion matrix of the metallic recurrence.** Its `(k+1)`-th
power tabulates four consecutive recurrence values:
`[[F_{k+2}, F_{k+1}], [F_{k+1}, F_k]]`. So `matPow (metallicMatrix n) k` *computes* the inflation
tile-counts — the proven matrix algebra and the integer counting sequence are the same object. Proved
by induction on `k`: the step is the matrix product `Mᵏ⁺¹ = Mᵏ · M`, whose `isum` entries are exactly
the recurrence `F_{k+2} = n·F_{k+1} + F_k`. -/
theorem metallicMatrix_pow_succ (n : Int) (k : Nat) :
    matPow (metallicMatrix n) (k+1) 0 0 = metallicNum n (k+2)
  ∧ matPow (metallicMatrix n) (k+1) 0 1 = metallicNum n (k+1)
  ∧ matPow (metallicMatrix n) (k+1) 1 0 = metallicNum n (k+1)
  ∧ matPow (metallicMatrix n) (k+1) 1 1 = metallicNum n k := by
  induction k with
  | zero => refine ⟨?_, ?_, ?_, ?_⟩ <;>
      simp [matPow, matMul, isum_succ, isum_zero, metallicMatrix, metallicNum, matId]
  | succ k ih =>
    obtain ⟨h00, h01, h10, h11⟩ := ih
    have hu : ∀ i j, matPow (metallicMatrix n) (k+1+1) i j
        = isum (fun l => matPow (metallicMatrix n) (k+1) i l * metallicMatrix n l j) :=
      fun i j => rfl
    refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [hu] <;>
      simp [isum_succ, isum_zero, metallicMatrix, h00, h01, h10, h11, metallicNum, Int.mul_comm]

/-- **Every convergent denominator is positive:** `1 ≤ F_{k+1}` for all `k` (when `n ≥ 1`). So the
convergents `F_{k+1}/F_k` are well-defined and the denominators never vanish — the integer fact the
real construction needs. Proved by a two-step pair-carry (the recurrence reaches back two indices),
each step `n·F_{k+2} + F_{k+1} ≥ F_{k+2} + F_{k+1} ≥ 2 ≥ 1`. -/
theorem metallicNum_pos {n : Int} (hn : 1 ≤ n) : ∀ k, 1 ≤ metallicNum n (k+1) := by
  have key : ∀ k, 1 ≤ metallicNum n (k+1) ∧ 1 ≤ metallicNum n (k+2) := by
    intro k
    induction k with
    | zero => exact ⟨by simp [metallicNum], by simpa [metallicNum] using hn⟩
    | succ k ih =>
        obtain ⟨h1, h2⟩ := ih
        refine ⟨h2, ?_⟩
        have hrec : metallicNum n (k+1+2)
            = n * metallicNum n (k+2) + metallicNum n (k+1) := rfl
        have hmul : metallicNum n (k+2) ≤ n * metallicNum n (k+2) := by
          have := Int.mul_le_mul_of_nonneg_right hn (by omega : (0:Int) ≤ metallicNum n (k+2))
          simpa using this
        rw [hrec]; omega
  exact fun k => (key k).1

end Persistence.Aperiodic.StepN
end Infomaterial
