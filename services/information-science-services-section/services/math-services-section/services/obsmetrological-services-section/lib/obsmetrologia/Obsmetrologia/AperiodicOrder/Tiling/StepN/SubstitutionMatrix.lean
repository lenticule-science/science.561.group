import Obsmetrologia.AperiodicOrder.Tiling.Universality
import Obsmetrologia.AperiodicOrder.Tiling.StepN.Recurrence
import Obsmetrologia.Calculus.Logic.LinearLogicChu
import Obsmetrologia.Closure.Odometer
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
pieces already in `AperiodicOrder.Tiling.Universality` (`Mat`, `matMul`, `matId`, `matPow`) and
`StepN.Recurrence` (`charPolyFib`, `charPolyPad`):

* `substMatrix` realizes the documented abelianization `Fin n → List (Fin n)` ↦ `Mat n`;
* `padovanMatrix`/`fibonacciMatrix` are the abelianizations of the actual Padovan and Fibonacci
  substitution rules, and are shown to be the corpus matrices `[[0,1,0],[0,0,1],[1,1,0]]` and
  `[[1,1],[1,0]]`;
* `cayleyHamilton_padovan`/`cayleyHamilton_fibonacci` prove that **each matrix is annihilated by
  its `StepN.Recurrence` characteristic polynomial** — turning the free-standing `charPolyPad`
  into the annihilating polynomial `M³ = M + I` (the plastic number's defining equation,
  lifted to the integer substitution matrix), and likewise `M² = M + I` for Fibonacci.

The eigenvalue extremality `ρ < φ` itself remains the integer-sequence projection in
`Closure.Collatz.PadovanShape` (`padovan_le_fibSeq`); here we pin down the *algebraic* side — the
minimal polynomials are realized, not merely listed.

**What this matrix *is*.** The substitution matrix is not primarily an abelianization: it is the
**matrix `r` of a Chu space valued in FOUR** (`Logic.LinearLogicChu.ChuSpace`, the corpus node
`chu-space-over-four`). A Chu space `⟨pts, sts, r⟩` reads its FOUR-valued relation two ways (rows
and columns) and dualizes by transpose-and-negate; the substitution rule's incidence — "does letter
`j` occur in the image of letter `i`" — *is* such a relation, with `present ↦ t`, `absent ↦ ⊥`. The
integer matrix on which the characteristic polynomial is computed is the **`pos`-incidence projection**
of that FOUR-valued `r` (`padovanMatrix_is_chu_incidence`). FOUR forces it: FOUR is the value
alphabet, and at the base step `n = 2` the Chu space *is* FOUR — `AperiodicOrder.Tiling.step_two_is_four`
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
* `padovan_cubic` — the read `M³ = M + I`; `padovan_not_quadratic` — cubic.

## References
Corpus: `step-n-substitution-rule`, `padovan-substitution-settling`, `benchmark-3-padovan`,
`substitution-universality-theorem`.

## Tags
substitution matrix, abelianization, Cayley-Hamilton, plastic number, Pisot, Padovan, Fibonacci
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.StepN
open AperiodicOrder.Tiling.Universality

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
the free-standing `charPolyPad` the annihilating polynomial of a real matrix — the plastic
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

/-- `M² ≠ M + I` at entry `(0,0)` (`0 ≠ 1`): the minimal polynomial has degree `3`, not `2`. -/
theorem padovan_not_quadratic :
    ¬ (∀ i j, matPow padovanMatrix 2 i j = padovanMatrix i j + matId i j) :=
  fun h => absurd (h 0 0) (of_decide_eq_false rfl)

/-! ## The matrix is the `r` of a Chu space valued in FOUR

The substitution matrix is the `pos`-incidence projection of a FOUR-valued Chu relation
(`Logic.LinearLogicChu.ChuSpace`): entry `i j` records the charge `t` ("present" — letter `j`
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

/-! ## Permutation matrices and the cyclic annihilator

The Fibonacci and Padovan instances above are annihilated by their
characteristic polynomials at fixed size, each cell `rfl`. Permutation
matrices admit the annihilation as a *family* theorem: a stage map whose
`N`-fold iterate is the identity has permutation matrix annihilated by
`xᴺ − 1`. The dyadic odometer's stage maps (`Closure.Odometer.vershikFin`)
instantiate it at every size `2 ^ n`. -/

/-- The `m`-fold iterate of a self-map. -/
def applyIter {α : Type} (f : α → α) : Nat → α → α
  | 0, x => x
  | m + 1, x => f (applyIter f m x)

/-- The **permutation matrix** of a self-map of `Fin n`: entry `i j` is `1`
when `σ i = j`, else `0`. -/
def permMatrix {n : Nat} (σ : Fin n → Fin n) : Mat n :=
  fun i j => if σ i = j then 1 else 0

/-- Permutation matrices multiply by composing the maps. -/
theorem matMul_permMatrix {n : Nat} (σ τ : Fin n → Fin n) (i j : Fin n) :
    matMul (permMatrix σ) (permMatrix τ) i j
      = permMatrix (fun x => τ (σ x)) i j := by
  show isum (fun k => permMatrix σ i k * permMatrix τ k j) = _
  apply isum_single _ (σ i)
  · show (if σ i = σ i then (1 : Int) else 0) * permMatrix τ (σ i) j = _
    rw [if_pos rfl, Int.one_mul]
    rfl
  · intro k hk
    show (if σ i = k then (1 : Int) else 0) * permMatrix τ k j = 0
    rw [if_neg (fun h => hk h.symm), Int.zero_mul]

/-- Permutation matrices power by iterating the map. -/
theorem matPow_permMatrix {n : Nat} (σ : Fin n → Fin n) :
    ∀ (m : Nat) (i j : Fin n),
      matPow (permMatrix σ) m i j = permMatrix (applyIter σ m) i j
  | 0, _, _ => rfl
  | m + 1, i, j => by
      show isum (fun k => matPow (permMatrix σ) m i k * permMatrix σ k j)
        = permMatrix (applyIter σ (m + 1)) i j
      rw [isum_congr (fun k => by rw [matPow_permMatrix σ m i k])]
      exact matMul_permMatrix (applyIter σ m) σ i j

/-- A matrix commutes with its own powers. -/
theorem matMul_matPow_comm {n : Nat} (M : Mat n) :
    ∀ k : Nat, matMul M (matPow M k) = matMul (matPow M k) M
  | 0 => (matMul_id_right M).trans (matMul_id_left M).symm
  | k + 1 => by
      show matMul M (matMul (matPow M k) M) = matMul (matMul (matPow M k) M) M
      rw [← matMul_assoc, matMul_matPow_comm M k]

/-- Horner evaluation of the monomial `xᵏ` is the `k`-th power. -/
theorem evalMatPoly_monomial {n : Nat} (M : Mat n) :
    ∀ (k : Nat) (i j : Fin n),
      evalMatPoly (List.replicate k 0 ++ [1]) M i j = matPow M k i j
  | 0, i, j => by
      show (1 : Int) * matId i j
          + isum (fun l => M i l * evalMatPoly [] M l j) = matId i j
      have hz : isum (fun l => M i l * evalMatPoly [] M l j) = 0 :=
        isum_eq_zero _ (fun l => Int.mul_zero (M i l))
      rw [Int.one_mul, hz]
      exact Int.add_zero (matId i j)
  | k + 1, i, j => by
      show (0 : Int) * matId i j
          + isum (fun l => M i l * evalMatPoly (List.replicate k 0 ++ [1]) M l j)
        = matPow M (k + 1) i j
      rw [Int.zero_mul, Int.zero_add,
        isum_congr (fun l => by rw [evalMatPoly_monomial M k l j])]
      exact congrFun (congrFun (matMul_matPow_comm M k) i) j

/-- **`xᴺ − 1`** as an ascending coefficient list (`N = 0` degenerates to
the zero polynomial `x⁰ − 1 = 0`). -/
def charPolyCycle : Nat → List Int
  | 0 => [0]
  | k + 1 => -1 :: (List.replicate k 0 ++ [1])

theorem length_replicate_append_one :
    ∀ k : Nat, (List.replicate k (0 : Int) ++ [1]).length = k + 1
  | 0 => rfl
  | k + 1 => congrArg (· + 1) (length_replicate_append_one k)

/-- `xᴺ − 1` has degree `N`. -/
theorem charPolyCycle_degreeN : ∀ N : Nat, degreeN (charPolyCycle N) N
  | 0 => rfl
  | k + 1 => congrArg (· + 1) (length_replicate_append_one k)

/-- `xᴺ − 1` is monic for `N ≥ 1`. -/
theorem charPolyCycle_monic (k : Nat) : monic (charPolyCycle (k + 1)) := by
  show (((-1 : Int) :: List.replicate k (0 : Int)) ++ [(1 : Int)]).getLast? = some 1
  exact List.getLast?_concat

/-- **Cayley–Hamilton for cyclic stage maps.** A self-map of `Fin n` whose
`N`-fold iterate is the identity has permutation matrix annihilated by
`xᴺ − 1`. -/
theorem cayleyHamilton_of_cycle {n N : Nat} (σ : Fin n → Fin n)
    (h : ∀ x, applyIter σ N x = x) (i j : Fin n) :
    evalMatPoly (charPolyCycle N) (permMatrix σ) i j = 0 := by
  match N, h with
  | 0, _ =>
      show (0 : Int) * matId i j
          + isum (fun l => permMatrix σ i l * evalMatPoly [] (permMatrix σ) l j) = 0
      have hz : isum (fun l => permMatrix σ i l * evalMatPoly [] (permMatrix σ) l j) = 0 :=
        isum_eq_zero _ (fun l => Int.mul_zero (permMatrix σ i l))
      rw [Int.zero_mul, Int.zero_add]
      exact hz
  | k + 1, h =>
      show (-1 : Int) * matId i j
          + isum (fun l => permMatrix σ i l
              * evalMatPoly (List.replicate k 0 ++ [1]) (permMatrix σ) l j) = 0
      rw [isum_congr (fun l => by rw [evalMatPoly_monomial (permMatrix σ) k l j])]
      rw [show isum (fun l => permMatrix σ i l * matPow (permMatrix σ) k l j)
            = matPow (permMatrix σ) (k + 1) i j from
          congrFun (congrFun (matMul_matPow_comm (permMatrix σ) k) i) j]
      rw [matPow_permMatrix σ (k + 1) i j]
      have hperm : permMatrix (applyIter σ (k + 1)) i j = matId i j := by
        show (if applyIter σ (k + 1) i = j then (1 : Int) else 0)
          = (if i = j then (1 : Int) else 0)
        rw [h i]
      rw [hperm, Int.neg_one_mul]
      exact Int.add_left_neg (matId i j)

/-- The generic iterate of the stage successor is the odometer's serial
iterate. -/
theorem applyIter_vershikFin (n : Nat) :
    ∀ (m : Nat) (i : Fin (2 ^ n)),
      applyIter (Odometer.vershikFin n) m i = Odometer.vershikFinIter n m i
  | 0, i => (Odometer.vershikFinIter_zero n i).symm
  | m + 1, i => by
      show Odometer.vershikFin n (applyIter (Odometer.vershikFin n) m i)
        = Odometer.vershikFinIter n (m + 1) i
      rw [applyIter_vershikFin n m i, ← Odometer.vershikFinIter_succ n m i]

/-- **Cayley–Hamilton for the odometer tower.** The stage-`n` Vershik
successor's permutation matrix is annihilated by `x^(2^n) − 1`, the monic
degree-`2^n` polynomial `charPolyCycle (2 ^ n)`: the stage cycle
(`Closure.Odometer.vershikFinIter_cycle`) realizes the annihilating
polynomial at every size `2 ^ n` — a matrix family the coefficient-list
convention of `StepN.Recurrence` is the characteristic polynomial *of*. -/
theorem cayleyHamilton_vershik (n : Nat) (i j : Fin (2 ^ n)) :
    evalMatPoly (charPolyCycle (2 ^ n))
      (permMatrix (Odometer.vershikFin n)) i j = 0 :=
  cayleyHamilton_of_cycle (Odometer.vershikFin n)
    (fun x => (applyIter_vershikFin n (2 ^ n) x).trans
      (Odometer.vershikFinIter_cycle n x)) i j

end AperiodicOrder.Tiling.StepN
end Obsmetrologia
