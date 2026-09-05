import Infomaterial.Persistence.Aperiodic.StepN.SubstitutionMatrix

/-!
# Primitivity of substitution matrices (the integer Perron–Frobenius precondition)

`StepN.SubstitutionMatrix` builds the abelianizations `fibonacciMatrix = [[1,1],[1,0]]` and
`padovanMatrix = [[0,1,0],[0,0,1],[1,1,0]]` and pins their minimal polynomials by Cayley–Hamilton, but
says nothing about the **sign structure** that drives substitution dynamics. A nonnegative integer
matrix is **primitive** when some power is strictly positive; primitivity is the hypothesis of the
Perron–Frobenius theorem (a simple dominant real eigenvalue with a positive eigenvector — the tile
frequencies / inflation factor). Reals are not in this dependency-free core, so the eigenvalue itself
stays out; what *is* in core is the finite, decidable combinatorial precondition, proved here.

`Primitive M := ∃ k, PositiveMatrix (Mᵏ)`. The witnesses are concrete and small:
`fibonacciMatrix² = [[2,1],[1,1]]` (`k = 2`) and `padovanMatrix⁵ = [[1,1,1],[1,2,1],[1,2,2]]` (`k = 5`)
are both strictly positive — each cell is a kernel computation (`decide`), the same way the parent
module reduces matrix powers cellwise.

## Main definitions
* `NonnegativeMatrix`, `PositiveMatrix`, `Primitive` — entrywise sign predicates on `Mat n`.

## Main results
* `PositiveMatrix.nonneg` — a positive matrix is nonnegative.
* `fibonacciMatrix_nonnegative`, `padovanMatrix_nonnegative` — both substitution matrices are `≥ 0`.
* `fibonacciMatrix_primitive` (`k = 2`), `padovanMatrix_primitive` (`k = 5`).

## References
Corpus: `substitution-universality-theorem`, `step-n-substitution-rule`,
`padovan-substitution-settling`. Perron–Frobenius primitivity (the eigenvalue side is the
`Closure.Collatz.PadovanShape` integer-sequence projection `ρ < φ`; here the sign precondition).

## Tags
substitution matrix, primitive matrix, Perron–Frobenius, nonnegative matrix, Padovan, Fibonacci
-/

namespace Infomaterial
namespace Persistence.Aperiodic.StepN

open Persistence.Aperiodic.Universality

/-- A matrix is **nonnegative** when every entry is `≥ 0`. -/
def NonnegativeMatrix {n : Nat} (M : Mat n) : Prop := ∀ i j, 0 ≤ M i j

/-- A matrix is **strictly positive** when every entry is `> 0`. -/
def PositiveMatrix {n : Nat} (M : Mat n) : Prop := ∀ i j, 0 < M i j

/-- A matrix is **primitive** when some power is strictly positive — the integer, eigenvalue-free
Perron–Frobenius precondition. -/
def Primitive {n : Nat} (M : Mat n) : Prop := ∃ k, PositiveMatrix (matPow M k)

/-- **A strictly positive matrix is nonnegative.** -/
theorem PositiveMatrix.nonneg {n : Nat} {M : Mat n} (h : PositiveMatrix M) :
    NonnegativeMatrix M := fun i j => by have := h i j; omega

/-- **The Fibonacci substitution matrix is nonnegative** (entries `0`/`1`). -/
theorem fibonacciMatrix_nonnegative : NonnegativeMatrix fibonacciMatrix := by
  show ∀ i j, 0 ≤ fibonacciMatrix i j
  decide

/-- **The Padovan substitution matrix is nonnegative** (entries `0`/`1`). -/
theorem padovanMatrix_nonnegative : NonnegativeMatrix padovanMatrix := by
  show ∀ i j, 0 ≤ padovanMatrix i j
  decide

/-- `fibonacciMatrix² = [[2,1],[1,1]]` is strictly positive. -/
theorem fibonacciMatrix_pow2_positive : PositiveMatrix (matPow fibonacciMatrix 2) := by
  show ∀ i j, 0 < matPow fibonacciMatrix 2 i j
  decide

/-- **The Fibonacci substitution matrix is primitive**, witnessed by `k = 2`. -/
theorem fibonacciMatrix_primitive : Primitive fibonacciMatrix :=
  ⟨2, fibonacciMatrix_pow2_positive⟩

/-- `padovanMatrix⁵ = [[1,1,1],[1,2,1],[1,2,2]]` is strictly positive — the first strictly positive
power (`M⁴` still has a zero at `(0,0)`). -/
theorem padovanMatrix_pow5_positive : PositiveMatrix (matPow padovanMatrix 5) := by
  show ∀ i j, 0 < matPow padovanMatrix 5 i j
  decide

/-- **The Padovan substitution matrix is primitive**, witnessed by `k = 5`. -/
theorem padovanMatrix_primitive : Primitive padovanMatrix :=
  ⟨5, padovanMatrix_pow5_positive⟩

end Persistence.Aperiodic.StepN
end Infomaterial
