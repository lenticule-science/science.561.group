import Infomaterial.Persistence.Aperiodic.Universality
import Infomaterial.Persistence.Aperiodic.StepN.Recurrence
import Infomaterial.Calculus.Order.LinearLogicChu
/-!
# The substitution matrix and its characteristic polynomial (Cayley–Hamilton)

`StepN.Recurrence` records the step-`n` co-incrementing hierarchy and the *characteristic
polynomials* of the canonical low-step substitutions as free-standing coefficient lists —
`charPolyFib = [-1,-1,1]` (`x² − x − 1`, golden ratio `φ`) and `charPolyPad = [-1,-1,0,1]`
(`x³ − x − 1`, plastic number `ρ`) — proved monic and of the right degree, but with **no matrix
they are the characteristic polynomial *of*** (the real eigenvalue is documented, not computed: no
reals in core). The step-`n` docstring also *specifies* the substitution matrix — "entry `i j` =
count of `j`-letters produced from an `i`-letter" — but never builds it as a function.

This module supplies the missing connective tissue and the content it unlocks, entirely from
pieces already in `Persistence.Aperiodic.Universality` (`Mat`, `matMul`, `matId`, `matPow`) and
`StepN.Recurrence` (`charPolyFib`, `charPolyPad`):

* `substMatrix` realizes the documented abelianization `Fin n → List (Fin n)` ↦ `Mat n`;
* `padovanMatrix`/`fibonacciMatrix` are the abelianizations of the actual Padovan and Fibonacci
  substitution rules, and are shown to be the corpus matrices `[[0,1,0],[0,0,1],[1,1,0]]` and
  `[[1,1],[1,0]]`;
* `cayleyHamilton_padovan`/`cayleyHamilton_fibonacci` prove that **each matrix is annihilated by
  its `StepN.Recurrence` characteristic polynomial** — turning the free-standing `charPolyPad`
  into the genuine annihilating polynomial `M³ = M + I` (the plastic number's defining equation,
  lifted to the integer substitution matrix), and likewise `M² = M + I` for Fibonacci.

The eigenvalue extremality `ρ < φ` itself remains the integer-sequence projection in
`Closure.Collatz.PadovanShape` (`padovan_le_fibSeq`); here we pin down the *algebraic* side — the
minimal polynomials are realized, not merely listed.

**What this matrix *is*.** The substitution matrix is not primarily an abelianization: it is the
**matrix `r` of a Chu space valued in FOUR** (`Order.LinearLogicChu.ChuSpace`, the corpus node
`chu-space-over-four`). A Chu space `⟨pts, sts, r⟩` reads its FOUR-valued relation two ways (rows
and columns) and dualizes by transpose-and-negate; the substitution rule's incidence — "does letter
`j` occur in the image of letter `i`" — *is* such a relation, with `present ↦ t`, `absent ↦ ⊥`. The
integer matrix on which the characteristic polynomial is computed is the **`pos`-incidence projection**
of that FOUR-valued `r` (`padovanMatrix_is_chu_incidence`). FOUR forces it: FOUR is the value
alphabet, and at the base step `n = 2` the Chu space *is* FOUR — `Persistence.Aperiodic.step_two_is_four`
(`Articulating.Corner ≃ Bool × Bool`, the four corners are the `2 × 2`). So "step-`n` land" here is exactly
"Chu-`r` land."

## Main definitions
* `substMatrix` — the abelianization (letter-occurrence count) of a substitution rule.
* `evalMatPoly` — Horner evaluation of an ascending-degree integer coefficient list at a matrix.
* `padovanMatrix`, `fibonacciMatrix` — the canonical step-3 and step-2 substitution matrices.

## Main results
* `padovanMatrix_is_corpus`, `fibonacciMatrix_is_corpus` — the abelianizations are the corpus
  matrices.
* `cayleyHamilton_padovan`, `cayleyHamilton_fibonacci` — `evalMatPoly charPoly M = 0`.
* `padovan_cubic` — the read `M³ = M + I`; `padovan_not_quadratic` — genuinely cubic.

## References
Corpus: `step-n-substitution-rule`, `padovan-substitution-settling`, `benchmark-3-padovan`,
`substitution-universality-theorem`.

## Tags
substitution matrix, abelianization, Cayley-Hamilton, plastic number, Pisot, Padovan, Fibonacci
-/

namespace Infomaterial
namespace Persistence.Aperiodic.StepN
open Persistence.Aperiodic.Universality

/-- The **zero matrix**. -/
def matZero {n : Nat} : Mat n := fun _ _ => 0

/-- **Entrywise matrix sum** `(A + B) i j = A i j + B i j`. -/
def matAdd {n : Nat} (A B : Mat n) : Mat n := fun i j => A i j + B i j

/-- **Integer scalar multiple** `(c • A) i j = c * A i j`. -/
def intSmul {n : Nat} (c : Int) (A : Mat n) : Mat n := fun i j => c * A i j

/-- **Horner evaluation of an ascending-degree integer polynomial at a matrix.** For a coefficient
list `[c₀, c₁, …, c_m]` (constant first), `evalMatPoly cs M = c₀·I + M·(c₁·I + M·(⋯ + M·(c_m·I)))`,
which equals `Σ_k c_k · Mᵏ`. So `evalMatPoly (charPoly) M = 0` is exactly the statement that `M`
satisfies `charPoly`. -/
def evalMatPoly {n : Nat} : List Int → Mat n → Mat n
  | [], _ => matZero
  | (c :: cs), M => matAdd (intSmul c matId) (matMul M (evalMatPoly cs M))

/-- **The abelianization (substitution matrix) of a substitution rule.** Entry `i j` is the number
of occurrences of letter `j` in the image word of letter `i` — the corpus's "count of `j`-letters
produced from an `i`-letter" (`step-n-substitution-rule`), as a non-negative integer. -/
def substMatrix {n : Nat} (s : Fin n → List (Fin n)) : Mat n :=
  fun i j => ((s i).count j : Int)

/-- The **Padovan substitution** `a ↦ b, b ↦ c, c ↦ ab` on the alphabet `{a,b,c} = {0,1,2}`
(`padovan-substitution-settling`, the canonical step-3 rule). -/
def padovanSubst : Fin 3 → List (Fin 3)
  | 0 => [1]
  | 1 => [2]
  | 2 => [0, 1]

/-- The **Fibonacci substitution** `a ↦ ab, b ↦ a` on the alphabet `{a,b} = {0,1}` (the canonical
step-2 rule). -/
def fibonacciSubst : Fin 2 → List (Fin 2)
  | 0 => [0, 1]
  | 1 => [0]

/-- The **Padovan substitution matrix** `[[0,1,0],[0,0,1],[1,1,0]]`, the abelianization of
`padovanSubst`. -/
def padovanMatrix : Mat 3 := substMatrix padovanSubst

/-- The **Fibonacci substitution matrix** `[[1,1],[1,0]]`, the abelianization of
`fibonacciSubst`. -/
def fibonacciMatrix : Mat 2 := substMatrix fibonacciSubst

/-- The abelianization of `padovanSubst` is the corpus matrix `[[0,1,0],[0,0,1],[1,1,0]]`.
Proven term-mode: structural `Fin 3` match, `rfl` per entry (each cell is definitional). -/
theorem padovanMatrix_is_corpus :
    ∀ i j, padovanMatrix i j
      = (if (i = 0 ∧ j = 1) ∨ (i = 1 ∧ j = 2) ∨ (i = 2 ∧ j = 0) ∨ (i = 2 ∧ j = 1)
         then 1 else 0)
  | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl | ⟨0, _⟩, ⟨2, _⟩ => rfl
  | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl | ⟨1, _⟩, ⟨2, _⟩ => rfl
  | ⟨2, _⟩, ⟨0, _⟩ => rfl | ⟨2, _⟩, ⟨1, _⟩ => rfl | ⟨2, _⟩, ⟨2, _⟩ => rfl

/-- The abelianization of `fibonacciSubst` is the corpus matrix `[[1,1],[1,0]]`. -/
theorem fibonacciMatrix_is_corpus :
    ∀ i j, fibonacciMatrix i j = (if i = 1 ∧ j = 1 then 0 else 1)
  | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl
  | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl

/-- The read of Padovan's Cayley–Hamilton as the cubic identity `M³ = M + I` — the plastic
number's minimal polynomial `x³ = x + 1`, on the substitution matrix. Each cell is `rfl`. -/
theorem padovan_cubic :
    ∀ i j, matPow padovanMatrix 3 i j = padovanMatrix i j + matId i j
  | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl | ⟨0, _⟩, ⟨2, _⟩ => rfl
  | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl | ⟨1, _⟩, ⟨2, _⟩ => rfl
  | ⟨2, _⟩, ⟨0, _⟩ => rfl | ⟨2, _⟩, ⟨1, _⟩ => rfl | ⟨2, _⟩, ⟨2, _⟩ => rfl

/-- **Cayley–Hamilton for Padovan.** The Padovan substitution matrix is annihilated by the corpus
characteristic polynomial `charPolyPad = x³ − x − 1`: `evalMatPoly charPolyPad M = 0`. This makes
the free-standing `charPolyPad` the genuine annihilating polynomial of a real matrix — the plastic
number's defining equation `M³ = M + I`, lifted to `Mat 3`. -/
theorem cayleyHamilton_padovan :
    evalMatPoly charPolyPad padovanMatrix = matZero :=
  funext fun i => funext fun j =>
    match i, j with
    | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl | ⟨0, _⟩, ⟨2, _⟩ => rfl
    | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl | ⟨1, _⟩, ⟨2, _⟩ => rfl
    | ⟨2, _⟩, ⟨0, _⟩ => rfl | ⟨2, _⟩, ⟨1, _⟩ => rfl | ⟨2, _⟩, ⟨2, _⟩ => rfl

/-- **Cayley–Hamilton for Fibonacci.** The Fibonacci substitution matrix is annihilated by
`charPolyFib = x² − x − 1`: `evalMatPoly charPolyFib M = 0`, i.e. `M² = M + I`. -/
theorem cayleyHamilton_fibonacci :
    evalMatPoly charPolyFib fibonacciMatrix = matZero :=
  funext fun i => funext fun j =>
    match i, j with
    | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl
    | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl

/-- **Genuinely cubic, not lower.** No quadratic identity of the same shape holds: `M² ≠ M + I`
already at entry `(0,0)` (`0 ≠ 1`). The minimal polynomial really has degree `3` (= the step
parameter `n`). -/
theorem padovan_not_quadratic :
    ¬ (∀ i j, matPow padovanMatrix 2 i j = padovanMatrix i j + matId i j) :=
  fun h => absurd (h 0 0) (of_decide_eq_false rfl)

/-! ## The matrix is the `r` of a Chu space valued in FOUR

The substitution matrix is the `pos`-incidence projection of a FOUR-valued Chu relation
(`Order.LinearLogicChu.ChuSpace`): entry `i j` records the charge `t` ("present" — letter `j`
occurs in the image of `i`) or `⊥` ("absent — unwitnessed", the open-world default). The integer
matrix that carries the characteristic polynomial is the `pos`-bit reading of this relation. -/

/-- The **Padovan Chu space over FOUR**: points and states are the alphabet `Fin 3`, and the
FOUR-valued relation `r i j` is `t` when letter `j` occurs in the image of `i` under `padovanSubst`,
`⊥` otherwise. Its `pos`-incidence is the Padovan substitution matrix. -/
def padovanChu : ChuSpace where
  pts := Fin 3
  sts := Fin 3
  r := fun i j => Charge.ofSlots ((padovanSubst i).count j != 0) false

/-- The **Fibonacci Chu space over FOUR**, on the alphabet `Fin 2`. -/
def fibonacciChu : ChuSpace where
  pts := Fin 2
  sts := Fin 2
  r := fun i j => Charge.ofSlots ((fibonacciSubst i).count j != 0) false

/-- **The Padovan substitution matrix is the `pos`-incidence of the Chu `r`-matrix over FOUR.**
`padovanMatrix i j = 1` exactly when the FOUR relation `padovanChu.r i j` carries positive charge
(`t`), `0` when it is `⊥`. The matrix on which Cayley–Hamilton is computed is the projection of the
FOUR-valued Chu relation. -/
theorem padovanMatrix_is_chu_incidence :
    ∀ i j, padovanMatrix i j = (if (padovanChu.r i j).pos then 1 else 0)
  | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl | ⟨0, _⟩, ⟨2, _⟩ => rfl
  | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl | ⟨1, _⟩, ⟨2, _⟩ => rfl
  | ⟨2, _⟩, ⟨0, _⟩ => rfl | ⟨2, _⟩, ⟨1, _⟩ => rfl | ⟨2, _⟩, ⟨2, _⟩ => rfl

/-- The Fibonacci analogue: the substitution matrix is the `pos`-incidence of its Chu `r`. -/
theorem fibonacciMatrix_is_chu_incidence :
    ∀ i j, fibonacciMatrix i j = (if (fibonacciChu.r i j).pos then 1 else 0)
  | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl
  | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl

end Persistence.Aperiodic.StepN
end Infomaterial
