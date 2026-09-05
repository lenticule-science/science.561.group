import Obsmetrologia.AperiodicOrder.Tiling.PortGrowth
import Obsmetrologia.Closure.Collatz.PadovanShape
import Obsmetrologia.Closure.Regime

/-!
# The settlement spiral: the growth tower of the Pisot recurrences

This module formalizes the **honest, provable slice** of the legacy corpus theorem
"residuation forces a spiral" (`b4-559432443-residuation-forces-a-spiral.md`, see also
`b4-525496948-settlement-spiral.md`): the elementary-number-theoretic content — the
Padovan/Fibonacci/Tribonacci/`k`-bonacci growth tower, and the fact that each of the
step-2/step-3 recurrences literally **is** the letter-count of its own substitution's iterated
image (a substitution-matrix row-sum) — is genuine, kernel-checked mathematics, and is proved
here outright.

What is **not** proved here — and must not be, per the blueprint's disavowal
(`Obsmetrologia/Closure/Collatz/PadovanShape.lean`, and its corpus source
`collatz-padovan-shape-law`) — is the *regime ↔ Pisot-number identification* the legacy corpus
pages assert (`strict-finite ↔ plastic ρ`, `Scott ↔ golden φ`, …, table reproduced in
`b4-559432443`/`b4-525496948`). `PadovanShape` already recorded, in prose, that this
identification is `hacking/`-flagged, unproven, and in the one case checked (Padovan vs.
Fibonacci) **actively mistaken**: Padovan and Fibonacci settlings are the *same* regime
(aperiodic), not opposite ends of a strict↔Scott split. Sections 1–4 below are ordinary
Lean theorems. Section 5 is *only* named `Prop`s and `def`s — data structures recording what
the correspondence *would* say, never asserted as a theorem, with the disavowed row flagged
explicitly.

## Main definitions
* `padovan`, `fibonacci` — reused from `Closure.Collatz.PadovanShape` (`padovan`, `fibSeq`).
* `tribonacci` — the step-3 Tribonacci-shaped sequence, `T 0 = T 1 = T 2 = 1`,
  `T(n+3) = T(n+2) + T(n+1) + T n`.
* `nbonacci k` — the `k`-step (`k`-bonacci) family: `k` unit base values, then each term the
  sum of the previous `k`.
* `InflationOrder n` — the strict growth chain `padovan n < fibonacci n < tribonacci n < 2ⁿ`.
* `padovanCount`, `fibonacciCount` — the row-sum (letter-count) of the iterated Padovan/Fibonacci
  substitution matrices, proved equal to `padovan`/`fibonacci`.
* `RegimeInflationCorrespondence` — the frontier conjecture (unproved `Prop`), with the disavowed
  `strict` row flagged.

## Main results
* `padovan_lt_fibonacci`, `fibonacci_le_tribonacci`, `fibonacci_lt_tribonacci` — the strict
  growth-rate tower between consecutive members.
* `nbonacci_le_two_pow` — every `k`-bonacci (`k ≥ 1`) is bounded by `2ⁿ`, the aperiodic
  accumulation ceiling `λ → 2`.
* `tribonacci_lt_two_pow` — `tribonacci n < 2 ^ n` for `n ≥ 1`.
* `padovanCount_eq`, `fibonacciCount_eq` — the substitution-matrix row-sum **is** the recurrence.
* `inflationOrder_holds` — the combined strict chain, for `n ≥ 5`.

## References
Corpus: `residuation-forces-a-spiral` (`b4-559432443`), `settlement-spiral` (`b4-525496948`),
`step-n-substitution-recurrence`, `padovan-substitution-settling`, `collatz-padovan-shape-law`
(disavowal). Reuses `Obsmetrologia.AperiodicOrder.Tiling.PortGrowth`/`StepN.SubstitutionMatrix`
(substitution matrices, Cayley–Hamilton, `matPow_add`) and
`Obsmetrologia.Closure.Collatz.PadovanShape` (Padovan/Fibonacci Nat sequences).

## Tags
padovan, fibonacci, tribonacci, n-bonacci, plastic number, Pisot, settlement spiral,
substitution matrix, frontier conjecture
-/

namespace Obsmetrologia
namespace Closure.SettlementSpiral

open AperiodicOrder.Tiling.Universality
open AperiodicOrder.Tiling.StepN
open AperiodicOrder.Tiling (matPow_add)

/-! ## (1) The four recurrences -/

/-- The **Padovan/Perrin** sequence, reused verbatim from
`Closure.Collatz.PadovanShape.padovan` (`P 0 = P 1 = P 2 = 1`, `P(n+3) = P(n+1) + P n`) — the
integer-sequence certificate of the plastic number `ρ`, the smallest Pisot number. -/
abbrev padovan : Nat → Nat := Obsmetrologia.Closure.Collatz.PadovanShape.padovan

/-- The **Fibonacci** sequence, reused verbatim from `Closure.Collatz.PadovanShape.fibSeq`
(`F 0 = F 1 = 1`, `F(n+2) = F(n+1) + F n`) — the integer projection of the golden ratio `φ`. -/
abbrev fibonacci : Nat → Nat := Obsmetrologia.Closure.Collatz.PadovanShape.fibSeq

theorem padovan_rec (n : Nat) : padovan (n + 3) = padovan (n + 1) + padovan n :=
  Obsmetrologia.Closure.Collatz.PadovanShape.padovan_rec n

theorem fibonacci_rec (n : Nat) : fibonacci (n + 2) = fibonacci (n + 1) + fibonacci n :=
  Obsmetrologia.Closure.Collatz.PadovanShape.fibSeq_rec n

theorem fibonacci_pos (n : Nat) : 0 < fibonacci n :=
  Obsmetrologia.Closure.Collatz.PadovanShape.fibSeq_pos n

/-- **The extremal slow-growth certificate** (reused). -/
theorem padovan_le_fibonacci (n : Nat) : padovan n ≤ fibonacci n :=
  Obsmetrologia.Closure.Collatz.PadovanShape.padovan_le_fibSeq n

/-- The **Tribonacci**-shaped sequence: `T 0 = T 1 = T 2 = 1`,
`T(n+3) = T(n+2) + T(n+1) + T n`: `1,1,1,3,5,9,17,31,57,…`. The step-3 sibling of `padovan`
(same base convention, three-term instead of skip-one recurrence) — the corpus's
transfinite-bounded-regime recurrence in `b4-559432443`'s table. -/
def tribonacci : Nat → Nat
  | 0 => 1
  | 1 => 1
  | 2 => 1
  | (n + 3) => tribonacci (n + 2) + tribonacci (n + 1) + tribonacci n

@[simp] theorem tribonacci_rec (n : Nat) :
    tribonacci (n + 3) = tribonacci (n + 2) + tribonacci (n + 1) + tribonacci n := rfl

theorem tribonacci_pos : ∀ n, 0 < tribonacci n
  | 0 => by decide
  | 1 => by decide
  | 2 => by decide
  | (n + 3) => by
      have := tribonacci_pos n
      rw [tribonacci_rec]; omega

/-! ## (2) The growth tower

Strict eventual (in fact near-immediate) domination all the way up the Pisot chain
`ρ < φ < τ_trib < ⋯ → 2`, proved elementarily from the recurrences and the already-proved
non-strict `padovan_le_fibonacci`. -/

/-- **Fibonacci strictly dominates Padovan from `n = 2` on.** Sharper than the corpus's
qualitative "smallest Pisot" claim: an explicit, checkable threshold. Proved directly from
`padovan_le_fibonacci` (no separate induction needed) — for `n = m + 3`,
`padovan(m+3) = padovan(m+1) + padovan m ≤ fibonacci(m+1) + fibonacci m
< fibonacci(m+1) + fibonacci(m+1) + fibonacci m = fibonacci(m+3)`,
using only `fibonacci_pos (m+1) > 0` for the strict step. -/
theorem padovan_lt_fibonacci : ∀ n, 2 ≤ n → padovan n < fibonacci n
  | 0, h => absurd h (by omega)
  | 1, h => absurd h (by omega)
  | 2, _ => by decide
  | (m + 3), _ => by
      have h1 : padovan (m + 1) ≤ fibonacci (m + 1) := padovan_le_fibonacci (m + 1)
      have h0 : padovan m ≤ fibonacci m := padovan_le_fibonacci m
      have hpos : 0 < fibonacci (m + 1) := fibonacci_pos (m + 1)
      have e1 : padovan (m + 3) = padovan (m + 1) + padovan m := padovan_rec m
      have e2 : fibonacci (m + 3) = fibonacci (m + 2) + fibonacci (m + 1) := fibonacci_rec (m + 1)
      have e3 : fibonacci (m + 2) = fibonacci (m + 1) + fibonacci m := fibonacci_rec m
      omega

/-- **Fibonacci is dominated (non-strictly) by Tribonacci from `n = 3` on.** For `n = m + 5`,
`fibonacci(m+5) = fibonacci(m+4) + fibonacci(m+3) ≤ tribonacci(m+4) + tribonacci(m+3)
≤ tribonacci(m+4) + tribonacci(m+3) + tribonacci(m+2) = tribonacci(m+5)`, by strong induction
(the two smaller instances needed, at `m+4` and `m+3`, are both `≥ 3`). -/
theorem fibonacci_le_tribonacci : ∀ n, 3 ≤ n → fibonacci n ≤ tribonacci n := by
  intro n
  induction n using Nat.strongRecOn with
  | ind n ih =>
    intro hn
    match n, hn with
    | 0, h => omega
    | 1, h => omega
    | 2, h => omega
    | 3, _ => decide
    | 4, _ => decide
    | (m + 5), _ =>
        have ih1 : fibonacci (m + 4) ≤ tribonacci (m + 4) := ih (m + 4) (by omega) (by omega)
        have ih0 : fibonacci (m + 3) ≤ tribonacci (m + 3) := ih (m + 3) (by omega) (by omega)
        have ef : fibonacci (m + 5) = fibonacci (m + 4) + fibonacci (m + 3) :=
          fibonacci_rec (m + 3)
        have et : tribonacci (m + 5) = tribonacci (m + 4) + tribonacci (m + 3) + tribonacci (m + 2) :=
          tribonacci_rec (m + 2)
        omega

/-- **Tribonacci strictly dominates Fibonacci from `n = 5` on.** Sharpens
`fibonacci_le_tribonacci` using `tribonacci_pos` for the missing strict term. -/
theorem fibonacci_lt_tribonacci (n : Nat) (hn : 5 ≤ n) : fibonacci n < tribonacci n := by
  have key : ∀ m, fibonacci (m + 5) < tribonacci (m + 5) := by
    intro m
    have ih1 : fibonacci (m + 4) ≤ tribonacci (m + 4) := fibonacci_le_tribonacci (m + 4) (by omega)
    have ih0 : fibonacci (m + 3) ≤ tribonacci (m + 3) := fibonacci_le_tribonacci (m + 3) (by omega)
    have hpos : 0 < tribonacci (m + 2) := tribonacci_pos (m + 2)
    have ef : fibonacci (m + 5) = fibonacci (m + 4) + fibonacci (m + 3) := fibonacci_rec (m + 3)
    have et : tribonacci (m + 5) = tribonacci (m + 4) + tribonacci (m + 3) + tribonacci (m + 2) :=
      tribonacci_rec (m + 2)
    omega
  have e : n = (n - 5) + 5 := by omega
  rw [e]; exact key (n - 5)

/-- `n + 1 ≤ 2 ^ n` for every `n` — the elementary fact behind every `2ⁿ` growth ceiling below. -/
theorem succ_le_two_pow : ∀ n, n + 1 ≤ 2 ^ n
  | 0 => by decide
  | (n + 1) => by
      have ih := succ_le_two_pow n
      have e : (2:Nat) ^ (n + 1) = 2 ^ n + 2 ^ n := by
        rw [Nat.pow_succ]; omega
      omega

/-- **Tribonacci is bounded by `2ⁿ`, strictly, from `n = 1` on.** For `n = m + 3`,
`tribonacci(m+3) = tribonacci(m+2) + tribonacci(m+1) + tribonacci m
≤ 2^(m+2) + 2^(m+1) + 2^m = 7·2^m < 8·2^m = 2^(m+3)`, using only the (already-established)
non-strict per-term bound and elementary `2ⁿ` arithmetic — no separate strong induction for the
strict step. -/
theorem tribonacci_le_two_pow : ∀ n, tribonacci n ≤ 2 ^ n
  | 0 => by decide
  | 1 => by decide
  | 2 => by decide
  | (n + 3) => by
      have h2 : tribonacci (n + 2) ≤ 2 ^ (n + 2) := tribonacci_le_two_pow (n + 2)
      have h1 : tribonacci (n + 1) ≤ 2 ^ (n + 1) := tribonacci_le_two_pow (n + 1)
      have h0 : tribonacci n ≤ 2 ^ n := tribonacci_le_two_pow n
      have e1 : (2:Nat) ^ (n + 1) = 2 ^ n + 2 ^ n := by rw [Nat.pow_succ]; omega
      have e2 : (2:Nat) ^ (n + 2) = 2 ^ (n + 1) + 2 ^ (n + 1) := by rw [Nat.pow_succ]; omega
      have e3 : (2:Nat) ^ (n + 3) = 2 ^ (n + 2) + 2 ^ (n + 2) := by rw [Nat.pow_succ]; omega
      rw [tribonacci_rec]
      omega

theorem tribonacci_lt_two_pow (n : Nat) (hn : 1 ≤ n) : tribonacci n < 2 ^ n := by
  match n, hn with
  | 0, h => omega
  | 1, _ => decide
  | 2, _ => decide
  | (m + 3), _ =>
      have h2 : tribonacci (m + 2) ≤ 2 ^ (m + 2) := tribonacci_le_two_pow (m + 2)
      have h1 : tribonacci (m + 1) ≤ 2 ^ (m + 1) := tribonacci_le_two_pow (m + 1)
      have h0 : tribonacci m ≤ 2 ^ m := tribonacci_le_two_pow m
      have e1 : (2:Nat) ^ (m + 1) = 2 ^ m + 2 ^ m := by rw [Nat.pow_succ]; omega
      have e2 : (2:Nat) ^ (m + 2) = 2 ^ (m + 1) + 2 ^ (m + 1) := by rw [Nat.pow_succ]; omega
      have e3 : (2:Nat) ^ (m + 3) = 2 ^ (m + 2) + 2 ^ (m + 2) := by rw [Nat.pow_succ]; omega
      have hpos : m + 1 ≤ 2 ^ m := succ_le_two_pow m
      rw [tribonacci_rec]
      omega

theorem padovan_lt_two_pow (n : Nat) (hn : 2 ≤ n) : padovan n < 2 ^ n := by
  match n, hn with
  | 0, h => omega
  | 1, h => omega
  | 2, _ => decide
  | (m + 3), _ =>
      have h1 := padovan_lt_fibonacci (m + 3) (by omega)
      have h2 := fibonacci_le_tribonacci (m + 3) (by omega)
      have h3 := tribonacci_le_two_pow (m + 3)
      omega

/-- **Fibonacci is strictly below `2ⁿ` from `n = 3` on.** Direct check at `3, 4`; for `n ≥ 5`,
transitivity through `fibonacci_lt_tribonacci` and `tribonacci_le_two_pow`. -/
theorem fibonacci_lt_two_pow (n : Nat) (hn : 3 ≤ n) : fibonacci n < 2 ^ n := by
  match n, hn with
  | 3, _ => decide
  | 4, _ => decide
  | (m + 5), _ =>
      have h1 := fibonacci_lt_tribonacci (m + 5) (by omega)
      have h2 := tribonacci_le_two_pow (m + 5)
      omega

/-! ## (3) The recurrence IS the substitution matrix's row-sum

`AperiodicOrder.Tiling.StepN.SubstitutionMatrix` already exhibits `padovanMatrix`/`fibonacciMatrix`
(the abelianizations of `padovanSubst`/`fibonacciSubst`) and their Cayley–Hamilton identities
`M³ = M + I` (`padovan_cubic`) / `M² = M + I` (proved below as `fibonacci_quadratic`, the
missing entrywise sibling of `padovan_cubic`). Here we show the **letter count of the iterated
substitution's image of the seed letter** — the row-sum `Σⱼ (Mᵗ) 0 j`, i.e. `|σᵗ(a)|` — literally
**is** `padovan t` / `fibonacci t`: not merely satisfying the same recurrence, but proved equal
by that shared recurrence plus matching base cases. -/

/-- **Right-distributivity of `matMul` over `matAdd`.** `A·(B+C) = A·B + A·C`, by `isum_add` and
`Int.mul_add`. The one piece of matrix algebra `StepN.SubstitutionMatrix`/`PortGrowth` did not
already supply. -/
theorem matMul_add_right {n : Nat} (A B C : Mat n) :
    matMul A (matAdd B C) = matAdd (matMul A B) (matMul A C) := by
  funext i j
  show isum (fun l => A i l * (matAdd B C l j)) = matMul A B i j + matMul A C i j
  have heq : (fun l => A i l * (matAdd B C l j))
      = (fun l => A i l * B l j + A i l * C l j) := by
    funext l
    show A i l * (B l j + C l j) = A i l * B l j + A i l * C l j
    exact Int.mul_add (A i l) (B l j) (C l j)
  rw [heq]
  exact isum_add (fun l => A i l * B l j) (fun l => A i l * C l j)

/-- **The Fibonacci Cayley–Hamilton identity, entrywise.** The missing sibling of `padovan_cubic`:
`fibonacciMatrix² = fibonacciMatrix + I`, each cell `rfl` (mirrors `padovan_cubic`'s proof
shape). -/
theorem fibonacci_quadratic :
    ∀ i j, matPow fibonacciMatrix 2 i j = fibonacciMatrix i j + matId i j
  | ⟨0, _⟩, ⟨0, _⟩ => rfl | ⟨0, _⟩, ⟨1, _⟩ => rfl
  | ⟨1, _⟩, ⟨0, _⟩ => rfl | ⟨1, _⟩, ⟨1, _⟩ => rfl

/-- The matrix-level (funext) form of `padovan_cubic`: `padovanMatrix³ = padovanMatrix + I`. -/
theorem padovan_cubic_matrix : matPow padovanMatrix 3 = matAdd padovanMatrix matId :=
  funext fun i => funext fun j => padovan_cubic i j

/-- The matrix-level (funext) form of `fibonacci_quadratic`: `fibonacciMatrix² = fibonacciMatrix +
I`. -/
theorem fibonacci_quadratic_matrix : matPow fibonacciMatrix 2 = matAdd fibonacciMatrix matId :=
  funext fun i => funext fun j => fibonacci_quadratic i j

/-- **The Padovan matrix power obeys the Padovan recurrence, as matrices.**
`Mᵗ⁺³ = Mᵗ·M³ = Mᵗ·(M+I) = Mᵗ·M + Mᵗ·I = M^(t+1) + Mᵗ`, using `matPow_add`,
`padovan_cubic_matrix`, `matMul_add_right`, and `matMul_id_right`. -/
theorem padovan_pow_add3 (t : Nat) :
    matPow padovanMatrix (t + 3) = matAdd (matPow padovanMatrix (t + 1)) (matPow padovanMatrix t) := by
  have h1 : matPow padovanMatrix (t + 3)
      = matMul (matPow padovanMatrix t) (matPow padovanMatrix 3) := matPow_add padovanMatrix t 3
  rw [h1, padovan_cubic_matrix, matMul_add_right, matMul_id_right]
  rfl

/-- **The Fibonacci matrix power obeys the Fibonacci recurrence, as matrices.**
`M^(t+2) = M^(t+1) + Mᵗ`, the quadratic analogue of `padovan_pow_add3`. -/
theorem fibonacci_pow_add2 (t : Nat) :
    matPow fibonacciMatrix (t + 2) = matAdd (matPow fibonacciMatrix (t + 1)) (matPow fibonacciMatrix t) := by
  have h1 : matPow fibonacciMatrix (t + 2)
      = matMul (matPow fibonacciMatrix t) (matPow fibonacciMatrix 2) := matPow_add fibonacciMatrix t 2
  rw [h1, fibonacci_quadratic_matrix, matMul_add_right, matMul_id_right]
  rfl

/-- **The Padovan word-count**: the row-sum `Σⱼ (padovanMatrixᵗ) 0 j` — the letter-count `|σᵗ(a)|`
of the `t`-th iterate of the Padovan substitution applied to the seed letter `a = 0`. -/
def padovanCount (t : Nat) : Int := isum (fun j : Fin 3 => matPow padovanMatrix t 0 j)

/-- **The Fibonacci word-count**: the row-sum `Σⱼ (fibonacciMatrixᵗ) 0 j` — `|σᵗ(a)|` for the
Fibonacci substitution, seed letter `a = 0`. -/
def fibonacciCount (t : Nat) : Int := isum (fun j : Fin 2 => matPow fibonacciMatrix t 0 j)

theorem padovanCount_rec (t : Nat) :
    padovanCount (t + 3) = padovanCount (t + 1) + padovanCount t := by
  show isum (fun j => matPow padovanMatrix (t + 3) 0 j) = _
  rw [padovan_pow_add3]
  show isum (fun j => matPow padovanMatrix (t + 1) 0 j + matPow padovanMatrix t 0 j) = _
  exact isum_add _ _

theorem fibonacciCount_rec (t : Nat) :
    fibonacciCount (t + 2) = fibonacciCount (t + 1) + fibonacciCount t := by
  show isum (fun j => matPow fibonacciMatrix (t + 2) 0 j) = _
  rw [fibonacci_pow_add2]
  show isum (fun j => matPow fibonacciMatrix (t + 1) 0 j + matPow fibonacciMatrix t 0 j) = _
  exact isum_add _ _

/-- **The Padovan substitution's word-count IS `padovan`.** Both sides satisfy the same
`P(t+3) = P(t+1) + P t` recurrence (`padovanCount_rec`/`padovan_rec`) with the same base values
`t = 0, 1, 2` (all `1`), so they agree everywhere: the Padovan recurrence *is* the letter-count
of the iterated Padovan substitution, not merely analogous to it. -/
theorem padovanCount_eq : ∀ t, padovanCount t = (padovan t : Int) := by
  intro t
  induction t using Nat.strongRecOn with
  | ind t ih =>
    match t with
    | 0 => decide
    | 1 => decide
    | 2 => decide
    | (m + 3) =>
        have ih1 := ih (m + 1) (by omega)
        have ih0 := ih m (by omega)
        have hc : padovanCount (m + 3) = padovanCount (m + 1) + padovanCount m :=
          padovanCount_rec m
        have hp : padovan (m + 3) = padovan (m + 1) + padovan m := padovan_rec m
        rw [hc, ih1, ih0]
        omega

/-- **The Fibonacci substitution's word-count IS `fibonacci`, shifted by one.** Unlike Padovan's
`a ↦ b` (a single-letter image), Fibonacci's seed rule `a ↦ ab` doubles the seed letter on the
very first step, so `|σᵗ(a)| = fibonacci (t + 1)` rather than `fibonacci t` (check: `|σ⁰(a)| = 1
= fibonacci 1`, `|σ¹(a)| = |ab| = 2 = fibonacci 2`). Same recurrence-uniqueness argument as
`padovanCount_eq`, index-shifted. -/
theorem fibonacciCount_eq : ∀ t, fibonacciCount t = (fibonacci (t + 1) : Int) := by
  intro t
  induction t using Nat.strongRecOn with
  | ind t ih =>
    match t with
    | 0 => decide
    | 1 => decide
    | (m + 2) =>
        have ih1 := ih (m + 1) (by omega)
        have ih0 := ih m (by omega)
        have hc : fibonacciCount (m + 2) = fibonacciCount (m + 1) + fibonacciCount m :=
          fibonacciCount_rec m
        have hidx : m + 2 + 1 = m + 1 + 2 := by omega
        have hf : fibonacci (m + 2 + 1) = fibonacci (m + 1 + 1) + fibonacci (m + 1) := by
          rw [hidx]; exact fibonacci_rec (m + 1)
        rw [hc, ih1, ih0]
        omega

/-! ## (4a) The `n`-bonacci (`k`-step) family, and its `2ⁿ` ceiling

The aperiodic regime's row of the `b4-559432443` table is not one recurrence but a *family*,
`n`-bonacci for `n → ∞`, accumulating at inflation factor `→ 2` (no member reaches `2`; `2` is
the family's limit point, not a Pisot number itself). We model the family by a **sliding
`k`-window**: `nbonacciWindow k n` is the length-`k` list of the `k` most recent terms after `n`
growth steps beyond the all-ones seed, and `nbonacci k` reads the family off that window. The
ceiling `k-bonacci(n) ≤ 2ⁿ` is proved by a window-sum invariant, entirely by structural
induction (no well-founded recursion, no ill-founded degenerate cases). -/

/-- Local `Nat`-sum over a list, avoiding any dependency on a library `List.sum`. -/
def listSum : List Nat → Nat
  | [] => 0
  | x :: xs => x + listSum xs

/-- Local list head with a `0` default — chosen (rather than `1`) so that
`listHeadD0_le_listSum` below holds unconditionally, even on `[]`, with no side conditions. -/
def listHeadD0 : List Nat → Nat
  | [] => 0
  | x :: _ => x

theorem listHeadD0_le_listSum : ∀ L : List Nat, listHeadD0 L ≤ listSum L
  | [] => Nat.le_refl 0
  | (_ :: xs) => Nat.le_add_right _ (listSum xs)

/-- Dropping the last element of a list never increases its sum (the dropped element is a
non-negative `Nat`). Three-way structural induction (`[]`, singleton, `x :: y :: rest`) since
`List.dropLast` itself case-splits that way. -/
theorem listSum_dropLast_le : ∀ L : List Nat, listSum L.dropLast ≤ listSum L
  | [] => Nat.le_refl 0
  | [_] => Nat.zero_le _
  | (x :: y :: rest) => by
      have ih := listSum_dropLast_le (y :: rest)
      show listSum (x :: (y :: rest).dropLast) ≤ listSum (x :: y :: rest)
      show x + listSum (y :: rest).dropLast ≤ x + listSum (y :: rest)
      omega

/-- The **sliding `k`-window** of the `k`-bonacci family, `n` growth steps beyond the seed:
`nbonacciWindow k 0` is `k` copies of the unit seed value; each step computes the sum of the
current window (the next term) and slides it in, dropping the oldest entry. Purely structural
recursion on `n` — no termination proof needed. -/
def nbonacciWindow (k : Nat) : Nat → List Nat
  | 0 => List.replicate k 1
  | (n + 1) => listSum (nbonacciWindow k n) :: (nbonacciWindow k n).dropLast

/-- The sum of `j` copies of `1` is `j`. Lifted to top level (rather than a nested `have`)
because a local `have` cannot recurse on itself. -/
theorem listSum_replicate_one : ∀ j, listSum (List.replicate j (1:Nat)) = j
  | 0 => rfl
  | (j + 1) => by
      show 1 + listSum (List.replicate j 1) = j + 1
      rw [listSum_replicate_one j]; omega

/-- **The window-sum ceiling.** `listSum (nbonacciWindow (k+1) n) ≤ 2 ^ (n + k)` for every `n`,
proved by structural induction on `n`: the base case is `(k+1) ≤ 2^k` (`succ_le_two_pow`); the
step drops one non-negative window entry (`listSum_dropLast_le`) and adds one new entry bounded
by the same ceiling, doubling it. Phrased with `k + 1` (rather than a `1 ≤ k` side condition) so
the induction has no degenerate `k = 0` case to exclude. -/
theorem nbonacciWindow_sum_le : ∀ (k n : Nat), listSum (nbonacciWindow (k + 1) n) ≤ 2 ^ (n + k)
  | k, 0 => by
      have heq : nbonacciWindow (k + 1) 0 = List.replicate (k + 1) 1 := rfl
      have hz : (0:Nat) + k = k := Nat.zero_add k
      rw [heq, listSum_replicate_one (k + 1), hz]
      exact succ_le_two_pow k
  | k, (n + 1) => by
      show listSum (listSum (nbonacciWindow (k + 1) n)
          :: (nbonacciWindow (k + 1) n).dropLast) ≤ 2 ^ (n + 1 + k)
      show listSum (nbonacciWindow (k + 1) n) + listSum (nbonacciWindow (k + 1) n).dropLast
          ≤ 2 ^ (n + 1 + k)
      have h1 := nbonacciWindow_sum_le k n
      have h2 := listSum_dropLast_le (nbonacciWindow (k + 1) n)
      have e : (2:Nat) ^ (n + 1 + k) = 2 ^ (n + k) + 2 ^ (n + k) := by
        have : n + 1 + k = (n + k) + 1 := by omega
        rw [this, Nat.pow_succ]; omega
      omega

/-- **The `k`-step (`n`-bonacci) family.** `k` base values of `1` (indices `0, …, k-1`), then
each term the sum of the previous `k`: `nbonacci 2` is Fibonacci-shaped, `nbonacci 3` is
Tribonacci-shaped (though not proved equal to `fibonacci`/`tribonacci` here — a genuinely
separate construction reusing the same window machinery). For `n < k`, reads a base value; for
`n ≥ k`, reads the head of the window `k` steps in. -/
def nbonacci (k n : Nat) : Nat :=
  if n < k then 1 else listHeadD0 (nbonacciWindow k (n - k + 1))

/-- **The `2ⁿ` ceiling: every `k`-bonacci (`k ≥ 1`) is bounded by `2ⁿ`.** For `n < k`,
`nbonacci k n = 1 ≤ 2ⁿ` (`succ_le_two_pow`, non-strict half). For `n ≥ k`, `nbonacci k n` is the
head of a window whose sum is `≤ 2^((n - k + 1) + (k - 1)) = 2ⁿ` (`nbonacciWindow_sum_le`,
`listHeadD0_le_listSum`), with the index arithmetic closed by `k ≤ n`. This is the aperiodic
regime's accumulation ceiling `λ → 2`: no member of the family ever crosses it. -/
theorem nbonacci_le_two_pow (k : Nat) (hk : 1 ≤ k) (n : Nat) : nbonacci (k) n ≤ 2 ^ n := by
  match k, hk with
  | (j + 1), _ =>
    show (if n < j + 1 then 1 else listHeadD0 (nbonacciWindow (j + 1) (n - (j + 1) + 1)))
        ≤ 2 ^ n
    split
    · rename_i h
      have := succ_le_two_pow n
      omega
    · rename_i h
      have hle : listHeadD0 (nbonacciWindow (j + 1) (n - (j + 1) + 1))
          ≤ listSum (nbonacciWindow (j + 1) (n - (j + 1) + 1)) :=
        listHeadD0_le_listSum _
      have hsum := nbonacciWindow_sum_le j (n - (j + 1) + 1)
      have hidx : (n - (j + 1) + 1) + j = n := by omega
      rw [hidx] at hsum
      omega

/-! ## (4b) `InflationOrder` — the strict growth ordering, bundled -/

/-- **`InflationOrder n`**: the strict growth chain `padovan n < fibonacci n < tribonacci n <
2ⁿ` at index `n` — the Pisot inflation tower `ρ < φ < τ_trib < ⋯ → 2` read as concrete Nat
inequalities at a single index, rather than as an abstract statement about eigenvalues. -/
def InflationOrder (n : Nat) : Prop :=
  padovan n < fibonacci n ∧ fibonacci n < tribonacci n ∧ tribonacci n < 2 ^ n

/-- **`InflationOrder` holds from `n = 5` on.** Assembled from `padovan_lt_fibonacci`,
`fibonacci_lt_tribonacci`, `tribonacci_lt_two_pow` — the growth-rate tower is not merely
asymptotic, it is a checkable strict chain at every index past a small, explicit threshold. -/
theorem inflationOrder_holds (n : Nat) (hn : 5 ≤ n) : InflationOrder n :=
  ⟨padovan_lt_fibonacci n (by omega), fibonacci_lt_tribonacci n hn,
    tribonacci_lt_two_pow n (by omega)⟩

/-! ## (5) The regime ↔ recurrence correspondence — frontier, `Prop`-only, never proved

Everything above (§1–4) is ordinary, proved Lean mathematics: the recurrences, their strict
growth tower, their substitution-matrix realization, and the `2ⁿ` ceiling. What follows is a
**transcription of the legacy corpus's conjecture**, stated only as `def`s and `Prop`s. No
`theorem` in this section asserts that any actual settling realizes this correspondence, and
the `strict` row is explicitly the row `Closure.Collatz.PadovanShape` already disavowed. -/

/-- The four canonical recurrences, indexed to match `ClosureRegime`'s four constructors per the
`residuation-forces-a-spiral` corpus table (`b4-559432443`, §"The regime tower of recurrences"):
`strict ↦ padovan`, `scott ↦ fibonacci`, `transfiniteBounded ↦ tribonacci`, and `aperiodic ↦` no
single member of the `n`-bonacci family — the family only *accumulates* at `λ → 2`, so it is
represented here by the uniform ceiling every `nbonacci k` respects (`nbonacci_le_two_pow`),
**not** by any one recurrence. This `def` is a transcription of the corpus table as *data*; it
is not asserted to describe any actual settling's growth (see `RegimeInflationCorrespondence`
below). -/
def regimeRecurrence : ClosureRegime → (Nat → Nat)
  | ClosureRegime.strict => padovan
  | ClosureRegime.scott => fibonacci
  | ClosureRegime.transfiniteBounded => tribonacci
  | ClosureRegime.aperiodic => fun n => 2 ^ n

/-- **The disavowed row, named.** `regimeRecurrence`'s `strict ↦ padovan` entry reproduces the
`b4-559432443`/`b4-525496948` corpus table's `strict-finite ↔ plastic number` identification.
`Obsmetrologia/Closure/Collatz/PadovanShape.lean` already records — in prose, as the module's own
disavowal — that this identification is `hacking/`-flagged, unproven, and in the one case that
module checks, **actively mistaken**: `benchmark-3-padovan` puts the Padovan *and* Fibonacci
shape substitutions in the **same** closure-ordinal regime (aperiodic), not at opposite ends of
a strict-vs-Scott split, so a `ClosureRegime`-indexed row that sends `strict ↦ padovan` and
`scott ↦ fibonacci` cannot simultaneously be correct in the way the legacy table intends. This
`def` names that fact so it is machine-checkable (definitionally, it just unfolds
`regimeRecurrence`) rather than living only in a comment; it is not a claim that anything holds,
only a pointer to what the disavowal is about. -/
def strictRowIsDisavowed : Prop := regimeRecurrence ClosureRegime.strict = padovan

/-- The `strictRowIsDisavowed` transcription is definitionally trivial (it is exactly
`regimeRecurrence`'s `strict` equation) — recording *that* the disavowed identification is
literally what the corpus table said, not disputing the transcription itself. The dispute (see
`PadovanShape`) is with treating this row as describing a real settling, which is exactly what
`RegimeInflationCorrespondence` below stops short of asserting. -/
theorem strictRowIsDisavowed_holds : strictRowIsDisavowed := rfl

/-- **`RegimeInflationCorrespondence`** (frontier conjecture; corpus
`residuation-forces-a-spiral` / `settlement-spiral`, node status `hacking/` — "asserted from the
worked step-`n` cases, not yet proved in full generality"). For a candidate **firing-count**
assignment — for each regime `r`, a function `firingCount r : Nat → Nat` meant to record "the
count of genuinely-new cells fired at stage `k`" of a settling classified into regime `r`
(`b4-525496948`'s own phrase) — the correspondence asserts that `firingCount` agrees with
`regimeRecurrence` at every regime and every stage.

**This module states the `Prop` and stops.** No settling's actual firing-count function is
constructed or shown to satisfy it anywhere in this file, or cited from elsewhere as doing so:
`Dynamics.Flow.NSCFiring` formalizes *whether* a firing is non-Scott-continuous (`IsNSC`/`L_ns`),
not a per-stage *count* of firings, so there is no existing candidate `firingCount` in the
codebase to even test this against. And the `strict` row is `strictRowIsDisavowed`: recorded
here as the frontier the corpus itself has already flagged as needing correction, not as
something believed. Sections 1–4 supply the growth-rate mathematics this conjecture would need
*if* a `firingCount` were ever constructed and shown Pisot-inflating; they do not supply, and do
not attempt, the identification itself. -/
def RegimeInflationCorrespondence (firingCount : ClosureRegime → Nat → Nat) : Prop :=
  ∀ (r : ClosureRegime) (k : Nat), firingCount r k = regimeRecurrence r k

end Closure.SettlementSpiral
end Obsmetrologia
