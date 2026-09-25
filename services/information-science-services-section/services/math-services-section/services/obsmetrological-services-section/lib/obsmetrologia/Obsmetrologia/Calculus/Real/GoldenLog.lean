import Obsmetrologia.Calculus.Real.LogLipschitz

/-!
# Toward `log₂ φ` as a single Bishop real: Fibonacci, Cassini, and the convergent-width bound

The golden mean `φ = (1+√5)/2` is the limit of the continued-fraction convergents `F_{n+1}/F_n`, so
`log₂ φ` is the limit of `logRatN (F_{n+1}) (F_n)` (`golden_log_nested` already bracketed it). To realise
that limit as one Bishop real via `real_completeness`, the convergent-logarithms must be a *regular*
Cauchy sequence. This file builds the two facts that give the modulus:

* **Cassini's identity** `F_{n+2}·F_n − F_{n+1}² = (−1)ⁿ` — consecutive convergent ratios differ by
  exactly `1/F_{n+1}²`, so the gap between consecutive convergent-logs is `log₂(1 ± 1/F_{n+1}²)`.
* **The convergent-width bound** — that gap is `≤ 1/(k+1)` once `F_{n+1}² ≥ 2(k+1)`, directly from
  `logNat_step_bound`. Since `F` grows geometrically, this is the Cauchy modulus.

## Main results
* `fib`, `fib_pos` — the Fibonacci sequence (`F₀=F₁=1`) and its positivity.
* `cassini` — `F_{n+2}·F_n − F_{n+1}² = (−1)ⁿ`.
-/

namespace Obsmetrologia
namespace Real.Internal

/-- The **Fibonacci sequence** `F₀ = F₁ = 1`, `F_{n+2} = F_{n+1} + F_n` — so the convergents
`F_{n+1}/F_n` run `1/1, 2/1, 3/2, 5/3, 8/5, …` toward `φ`. -/
def fib : Nat → Nat
  | 0 => 1
  | 1 => 1
  | (n + 2) => fib (n + 1) + fib n

/-- **Every Fibonacci number is positive.** -/
theorem fib_pos : ∀ n, 1 ≤ fib n
  | 0 => Nat.le_refl _
  | 1 => Nat.le_refl _
  | (n + 2) => by
      have h1 := fib_pos (n + 1)
      have h2 := fib_pos n
      show 1 ≤ fib (n + 1) + fib n
      omega

/-- **Cassini's identity** `F_{n+2}·F_n − F_{n+1}² = (−1)ⁿ`. The arithmetic source of the convergent
gaps: consecutive convergent ratios `F_{n+1}/F_n` and `F_{n+2}/F_{n+1}` cross-multiply to numbers that
differ by exactly `1`. -/
theorem cassini : ∀ n,
    (fib (n + 2) : Int) * fib n - (fib (n + 1) : Int) * (fib (n + 1) : Int) = (-1) ^ n
  | 0 => by decide
  | (n + 1) => by
      have ih := cassini n
      have h3 : (fib (n + 3) : Int) = (fib (n + 2) : Int) + (fib (n + 1) : Int) := by
        rw [show fib (n + 3) = fib (n + 2) + fib (n + 1) from rfl, Int.natCast_add]
      have h2 : (fib (n + 2) : Int) = (fib (n + 1) : Int) + (fib n : Int) := by
        rw [show fib (n + 2) = fib (n + 1) + fib n from rfl, Int.natCast_add]
      show (fib (n + 3) : Int) * fib (n + 1)
          - (fib (n + 2) : Int) * (fib (n + 2) : Int) = (-1) ^ (n + 1)
      have hpow : (-1 : Int) ^ (n + 1) = -((-1 : Int) ^ n) := by rw [Int.pow_succ]; iring
      have key : ((fib (n + 2) : Int) + (fib (n + 1) : Int)) * (fib (n + 1) : Int)
          - (fib (n + 2) : Int) * (fib (n + 2) : Int)
          = -((fib (n + 2) : Int) * (fib n : Int)
              - (fib (n + 1) : Int) * (fib (n + 1) : Int)) := by
        rw [h2]; iring <;> omega
      rw [h3, key, ih, hpow]

/-- **The convergent-log gap bound.** By Cassini, the two consecutive convergent ratios cross-multiply
to `F_{n+1}²` and `F_{n+1}² ± 1`, so the gap between their logarithms is `log₂((F²+1)/F²)`. By
`logNat_step_bound` that gap is `≤ 1/(k+1)` once `F_{n+1}² ≥ 2(k+1)` — and since `F` grows
geometrically, this is the Cauchy modulus of the convergent-logarithm sequence. -/
theorem convergent_log_gap (n k : Nat) (h : 2 * (k + 1) ≤ fib (n + 1) * fib (n + 1)) :
    logRatN (fib (n + 1) * fib (n + 1) + 1) (fib (n + 1) * fib (n + 1)) (by omega) (by omega)
      ≤ RReal.ofRat (Rat.invNatP k) := by
  have hstep := logNat_step_bound (fib (n + 1) * fib (n + 1)) k h
  unfold logRatN
  have key := RReal.add_le_add_right hstep
      (- logNat 2 (fib (n + 1) * fib (n + 1)) (by decide) (by omega))
  have e : (logNat 2 (fib (n + 1) * fib (n + 1)) (by decide) (by omega)
        + RReal.ofRat (Rat.invNatP k))
      + (- logNat 2 (fib (n + 1) * fib (n + 1)) (by decide) (by omega))
      = RReal.ofRat (Rat.invNatP k) := by
    rw [RReal.add_comm (logNat 2 (fib (n + 1) * fib (n + 1)) (by decide) (by omega))
          (RReal.ofRat (Rat.invNatP k)), RReal.add_assoc, RReal.add_right_neg, RReal.add_zero]
  rw [e] at key
  exact key

/-! ## Convergent monotonicity from Cassini -/

/-- `(−1)^(2i) = 1`. -/
theorem neg_one_pow_even : ∀ i, (-1 : Int) ^ (2 * i) = 1
  | 0 => by decide
  | (i + 1) => by
      rw [show 2 * (i + 1) = 2 * i + 1 + 1 from by omega, Int.pow_succ, Int.pow_succ,
          neg_one_pow_even i]; decide

/-- `(−1)^(2i+1) = −1`. -/
theorem neg_one_pow_odd (i : Nat) : (-1 : Int) ^ (2 * i + 1) = -1 := by
  rw [Int.pow_succ, neg_one_pow_even i]; decide

/-- **Cassini, even index, in `ℕ`**: `F_{2i+2}·F_{2i} = F_{2i+1}² + 1`. -/
theorem cassini_even (i : Nat) : fib (2 * i + 2) * fib (2 * i) = fib (2 * i + 1) * fib (2 * i + 1) + 1 := by
  have hc := cassini (2 * i)
  rw [neg_one_pow_even i] at hc
  have hcast : ((fib (2 * i + 2) * fib (2 * i) : Nat) : Int)
      = ((fib (2 * i + 1) * fib (2 * i + 1) + 1 : Nat) : Int) := by
    rw [Int.natCast_mul, Int.natCast_add, Int.natCast_mul]; omega
  exact_mod_cast hcast

/-- **Cassini, odd index, in `ℕ`**: `F_{2i+3}·F_{2i+1} + 1 = F_{2i+2}²`. -/
theorem cassini_odd (i : Nat) :
    fib (2 * i + 3) * fib (2 * i + 1) + 1 = fib (2 * i + 2) * fib (2 * i + 2) := by
  have hc := cassini (2 * i + 1)
  rw [neg_one_pow_odd i, show 2 * i + 1 + 2 = 2 * i + 3 from rfl,
      show 2 * i + 1 + 1 = 2 * i + 2 from rfl] at hc
  have hcast : ((fib (2 * i + 3) * fib (2 * i + 1) + 1 : Nat) : Int)
      = ((fib (2 * i + 2) * fib (2 * i + 2) : Nat) : Int) := by
    rw [Int.natCast_add, Int.natCast_mul, Int.natCast_mul]; omega
  exact_mod_cast hcast

/-- **Even convergents increase (one step)**: `F_{2i+1}·F_{2i+2} ≤ F_{2i+3}·F_{2i}` — so
`a_{2i} ≤ a_{2i+2}` by `logRatN_mono`. The cross-difference is exactly `cassini_even = 1`. -/
theorem cross_even_up (i : Nat) : fib (2 * i + 1) * fib (2 * i + 2) ≤ fib (2 * i + 3) * fib (2 * i) := by
  have hce := cassini_even i
  have e3 : fib (2 * i + 3) = fib (2 * i + 2) + fib (2 * i + 1) := rfl
  have e2 : fib (2 * i + 2) = fib (2 * i + 1) + fib (2 * i) := rfl
  rw [e3, Nat.add_mul, hce, e2, Nat.mul_add]
  omega

/-- **Odd convergents decrease (one step)**: `F_{2i+4}·F_{2i+1} ≤ F_{2i+2}·F_{2i+3}` — so
`a_{2i+3} ≤ a_{2i+1}` by `logRatN_mono`. -/
theorem cross_odd_down (i : Nat) :
    fib (2 * i + 4) * fib (2 * i + 1) ≤ fib (2 * i + 2) * fib (2 * i + 3) := by
  have hco := cassini_odd i
  have e4 : fib (2 * i + 4) = fib (2 * i + 3) + fib (2 * i + 2) := rfl
  have e3 : fib (2 * i + 3) = fib (2 * i + 2) + fib (2 * i + 1) := rfl
  have lhs : fib (2 * i + 4) * fib (2 * i + 1)
      = fib (2 * i + 3) * fib (2 * i + 1) + fib (2 * i + 2) * fib (2 * i + 1) := by
    rw [e4, Nat.add_mul]
  have rhs : fib (2 * i + 2) * fib (2 * i + 3)
      = fib (2 * i + 2) * fib (2 * i + 2) + fib (2 * i + 2) * fib (2 * i + 1) := by
    rw [e3, Nat.mul_add]
  rw [lhs, rhs]; omega

/-- **Adjacent even ≤ odd**: `F_{2i+3}·F_{2i+1} ≤ F_{2i+2}·F_{2i+2}` — so `a_{2i+2} ≤ a_{2i+1}` by
`logRatN_mono`. Directly `cassini_odd`. -/
theorem cross_even_le_odd (i : Nat) :
    fib (2 * i + 3) * fib (2 * i + 1) ≤ fib (2 * i + 2) * fib (2 * i + 2) := by
  have := cassini_odd i; omega

/-- The `n`-th convergent logarithm `aₙ = log₂(F_{n+1}/F_n)`. -/
def aLog (n : Nat) : RReal := logRatN (fib (n + 1)) (fib n) (fib_pos _) (fib_pos _)

/-- Even convergents increase: `a_{2i} ≤ a_{2i+2}`. -/
theorem aLog_even_up (i : Nat) : aLog (2 * i) ≤ aLog (2 * i + 2) :=
  logRatN_mono (fib (2 * i + 1)) (fib (2 * i)) (fib (2 * i + 3)) (fib (2 * i + 2))
    (fib_pos _) (fib_pos _) (fib_pos _) (fib_pos _) (cross_even_up i)

/-- Odd convergents decrease: `a_{2i+3} ≤ a_{2i+1}`. -/
theorem aLog_odd_down (i : Nat) : aLog (2 * i + 3) ≤ aLog (2 * i + 1) :=
  logRatN_mono (fib (2 * i + 4)) (fib (2 * i + 3)) (fib (2 * i + 2)) (fib (2 * i + 1))
    (fib_pos _) (fib_pos _) (fib_pos _) (fib_pos _) (cross_odd_down i)

/-- Each even convergent is below the matching odd one: `a_{2i+2} ≤ a_{2i+1}`. -/
theorem aLog_even_le_odd (i : Nat) : aLog (2 * i + 2) ≤ aLog (2 * i + 1) :=
  logRatN_mono (fib (2 * i + 3)) (fib (2 * i + 2)) (fib (2 * i + 2)) (fib (2 * i + 1))
    (fib_pos _) (fib_pos _) (fib_pos _) (fib_pos _) (cross_even_le_odd i)

/-- **Even convergents are monotone increasing**: `i ≤ j → a_{2i} ≤ a_{2j}`. -/
theorem aLog_even_mono {i j : Nat} (hij : i ≤ j) : aLog (2 * i) ≤ aLog (2 * j) := by
  obtain ⟨d, rfl⟩ : ∃ d, j = i + d := ⟨j - i, by omega⟩
  clear hij
  induction d with
  | zero => exact RReal.le_refl _
  | succ d ih =>
      refine RReal.le_trans ih ?_
      rw [show 2 * (i + (d + 1)) = 2 * (i + d) + 2 from by omega]
      exact aLog_even_up (i + d)

/-- **Odd convergents are monotone decreasing**: `i ≤ j → a_{2j+1} ≤ a_{2i+1}`. -/
theorem aLog_odd_anti {i j : Nat} (hij : i ≤ j) : aLog (2 * j + 1) ≤ aLog (2 * i + 1) := by
  obtain ⟨d, rfl⟩ : ∃ d, j = i + d := ⟨j - i, by omega⟩
  clear hij
  induction d with
  | zero => exact RReal.le_refl _
  | succ d ih =>
      refine RReal.le_trans ?_ ih
      rw [show 2 * (i + (d + 1)) + 1 = 2 * (i + d) + 3 from by omega]
      exact aLog_odd_down (i + d)

/-! ## The width bound and the regularity helpers -/

/-- **`n ≤ F_n`** — a crude Fibonacci lower bound, enough to apply the width bound. -/
theorem fib_ge : ∀ n, n ≤ fib n
  | 0 => by decide
  | 1 => by decide
  | (n + 2) => by
      have h1 := fib_ge (n + 1)
      have h2 := fib_pos n
      show n + 2 ≤ fib (n + 1) + fib n
      omega

/-- **General per-step bound** `log₂((M+1)/M) ≤ 1/(k+1)` for `2(k+1) ≤ M` — the un-specialised
`convergent_log_gap`, used at the non-square denominators `F_{2i+1}·F_{2i+3}`. -/
theorem logRatN_succ_le (M k : Nat) (h : 2 * (k + 1) ≤ M) :
    logRatN (M + 1) M (by omega) (by omega) ≤ RReal.ofRat (Rat.invNatP k) := by
  have hstep := logNat_step_bound M k h
  unfold logRatN
  have key := RReal.add_le_add_right hstep (- logNat 2 M (by decide) (by omega))
  have e : (logNat 2 M (by decide) (by omega) + RReal.ofRat (Rat.invNatP k))
      + (- logNat 2 M (by decide) (by omega)) = RReal.ofRat (Rat.invNatP k) := by
    rw [RReal.add_comm (logNat 2 M (by decide) (by omega)) (RReal.ofRat (Rat.invNatP k)),
        RReal.add_assoc, RReal.add_right_neg, RReal.add_zero]
  rw [e] at key
  exact key

/-- Double negation in `ℝ`. -/
theorem RReal.neg_neg (a : RReal) : -(-a) = a := by
  calc -(-a) = -(-a) + RReal.zero := (RReal.add_zero _).symm
    _ = -(-a) + (-a + a) := by rw [RReal.add_left_neg]
    _ = (-(-a) + -a) + a := (RReal.add_assoc _ _ _).symm
    _ = RReal.zero + a := by rw [RReal.add_left_neg]
    _ = a := RReal.zero_add _

/-- **Combining convergent-log differences**: `log₂(p/q) − log₂(p'/q') = log₂((p·q')/(q·p'))`. The
additive-group identity behind the adjacent-convergent gap, closed under `logNat_mul`. -/
theorem logRatN_sub (p q p' q' : Nat) (hp : 1 ≤ p) (hq : 1 ≤ q) (hp' : 1 ≤ p') (hq' : 1 ≤ q') :
    logRatN p q hp hq + (- logRatN p' q' hp' hq')
      = logRatN (p * q') (q * p')
          (by have := Nat.mul_le_mul hp hq'; simpa using this)
          (by have := Nat.mul_le_mul hq hp'; simpa using this) := by
  unfold logRatN
  rw [logNat_mul 2 p q' (by decide) hp hq', logNat_mul 2 q p' (by decide) hq hp',
      RReal.neg_add (logNat 2 p' (by decide) hp') (- logNat 2 q' (by decide) hq'),
      RReal.neg_neg (logNat 2 q' (by decide) hq')]
  rw [RReal.add_assoc (logNat 2 p (by decide) hp) (- logNat 2 q (by decide) hq)
        (logNat 2 q' (by decide) hq' + - logNat 2 p' (by decide) hp'),
      ← RReal.add_assoc (- logNat 2 q (by decide) hq) (logNat 2 q' (by decide) hq')
        (- logNat 2 p' (by decide) hp'),
      RReal.add_comm (- logNat 2 q (by decide) hq) (logNat 2 q' (by decide) hq'),
      RReal.add_assoc (logNat 2 q' (by decide) hq') (- logNat 2 q (by decide) hq)
        (- logNat 2 p' (by decide) hp'),
      ← RReal.add_assoc (logNat 2 p (by decide) hp) (logNat 2 q' (by decide) hq')
        (- logNat 2 q (by decide) hq + - logNat 2 p' (by decide) hp'),
      RReal.neg_add (logNat 2 q (by decide) hq) (logNat 2 p' (by decide) hp'),
      RReal.add_comm (- logNat 2 q (by decide) hq) (- logNat 2 p' (by decide) hp')]

/-- `logRatN (M+1)/M ≤ 1/(k+1)` re-expressed for a numerator given by an equation `N = M+1`. -/
theorem logRatN_succ_le_of_eq (M N k : Nat) (hN : N = M + 1) (h : 2 * (k + 1) ≤ M)
    (hM : 1 ≤ M) (hNp : 1 ≤ N) : logRatN N M hNp hM ≤ RReal.ofRat (Rat.invNatP k) := by
  subst hN
  exact logRatN_succ_le M k h

/-- `a + (−b) ≤ c → a ≤ b + c`. -/
theorem RReal.le_add_of_sub_le {a b c : RReal} (h : a + (-b) ≤ c) : a ≤ b + c := by
  have key := RReal.add_le_add_right h b
  have e : (a + (-b)) + b = a := by
    rw [RReal.add_assoc, RReal.add_left_neg, RReal.add_zero]
  rw [e] at key
  rwa [RReal.add_comm c b] at key

/-- **The bracket width bound** `a_{2i+1} ≤ a_{2i+2} + 1/(i+1)`. The gap between the adjacent
high/low convergents combines (`logRatN_sub`) to `log₂(F_{2i+2}²/(F_{2i+1}F_{2i+3}))`, and Cassini makes
that numerator one more than the denominator, so `logRatN_succ_le` bounds it by `1/(i+1)`. -/
theorem aLog_bracket (i : Nat) :
    aLog (2 * i + 1) ≤ aLog (2 * i + 2) + RReal.ofRat (Rat.invNatP i) := by
  have hco := cassini_odd i
  have hM : fib (2 * i + 2) * fib (2 * i + 2) = fib (2 * i + 1) * fib (2 * i + 3) + 1 := by
    rw [Nat.mul_comm (fib (2 * i + 1)) (fib (2 * i + 3))]; omega
  have hMbound : 2 * (i + 1) ≤ fib (2 * i + 1) * fib (2 * i + 3) := by
    have hp := fib_pos (2 * i + 1)
    have hg := fib_ge (2 * i + 3)
    have := Nat.le_mul_of_pos_left (fib (2 * i + 3)) hp
    omega
  have hsub : aLog (2 * i + 1) + (- aLog (2 * i + 2))
      = logRatN (fib (2 * i + 2) * fib (2 * i + 2)) (fib (2 * i + 1) * fib (2 * i + 3))
          (by have := Nat.mul_le_mul (fib_pos (2 * i + 2)) (fib_pos (2 * i + 2)); simpa using this)
          (by have := Nat.mul_le_mul (fib_pos (2 * i + 1)) (fib_pos (2 * i + 3)); simpa using this) := by
    unfold aLog
    exact logRatN_sub (fib (2 * i + 2)) (fib (2 * i + 1)) (fib (2 * i + 3)) (fib (2 * i + 2))
      (fib_pos _) (fib_pos _) (fib_pos _) (fib_pos _)
  apply RReal.le_add_of_sub_le
  rw [hsub]
  exact logRatN_succ_le_of_eq (fib (2 * i + 1) * fib (2 * i + 3)) (fib (2 * i + 2) * fib (2 * i + 2))
    i hM hMbound _ _

/-! ## The single real `log₂ φ` -/

/-- `a ≤ a + 1/(k+1)`. -/
theorem RReal.le_add_invNatP (a : RReal) (k : Nat) : a ≤ a + RReal.ofRat (Rat.invNatP k) := by
  have h0 : RReal.zero ≤ RReal.ofRat (Rat.invNatP k) := by
    show RReal.ofRat 0 ≤ RReal.ofRat (Rat.invNatP k)
    rw [RReal.ofRat_le_iff]; exact Rat.invNatP_nonneg k
  calc a = a + RReal.zero := (RReal.add_zero a).symm
    _ ≤ a + RReal.ofRat (Rat.invNatP k) := RReal.add_le_add_left h0 a

/-- **Regularity for `i ≤ j`**: the even convergents `a_{2i+2}` are `Within i` of each other — below by
monotonicity, above by the bracket `a_{2j+2} ≤ a_{2j+1} ≤ a_{2i+1} ≤ a_{2i+2} + 1/(i+1)`. -/
theorem goldenLog_within (i j : Nat) (hij : i ≤ j) :
    RReal.Within i (aLog (2 * i + 2)) (aLog (2 * j + 2)) := by
  refine ⟨?_, ?_⟩
  · show aLog (2 * i + 2) ≤ aLog (2 * j + 2) + RReal.ofRat (Rat.invNatP i)
    have hmono : aLog (2 * i + 2) ≤ aLog (2 * j + 2) := by
      have h := aLog_even_mono (show i + 1 ≤ j + 1 by omega)
      rwa [show 2 * (i + 1) = 2 * i + 2 from by omega,
           show 2 * (j + 1) = 2 * j + 2 from by omega] at h
    exact RReal.le_trans hmono (RReal.le_add_invNatP (aLog (2 * j + 2)) i)
  · show aLog (2 * j + 2) ≤ aLog (2 * i + 2) + RReal.ofRat (Rat.invNatP i)
    exact RReal.le_trans (aLog_even_le_odd j) (RReal.le_trans (aLog_odd_anti hij) (aLog_bracket i))

/-- A `Real` representative of the even convergent logarithm `a_{2i+2}`. -/
def goldenLogRep (i : Nat) : Real :=
  Real.add (logReal 2 (fib (2 * i + 3)) (by decide) (fib_pos _))
    (Real.neg (logReal 2 (fib (2 * i + 2)) (by decide) (fib_pos _)))

theorem mk_goldenLogRep (i : Nat) : RReal.mk (goldenLogRep i) = aLog (2 * i + 2) := by
  unfold goldenLogRep aLog logRatN logNat
  rw [RReal.mk_neg, RReal.mk_add]

/-- The convergent-logarithm sequence is regular Cauchy. -/
theorem goldenLog_reg (i j : Nat) :
    RReal.Within (Nat.min i j) (RReal.mk (goldenLogRep i)) (RReal.mk (goldenLogRep j)) := by
  rw [mk_goldenLogRep, mk_goldenLogRep]
  rcases Nat.le_total i j with hij | hji
  · have hm : Nat.min i j = i := Nat.min_eq_left hij
    rw [hm]; exact goldenLog_within i j hij
  · have hm : Nat.min i j = j := Nat.min_eq_right hji
    rw [hm]; exact RReal.Within_symm (goldenLog_within j i hji)

/-- **`log₂ φ` as a single Bishop real** — the diagonal limit of the Fibonacci convergent logarithms. -/
def logTwoGolden : RReal := RReal.mk (RReal.diagonal goldenLogRep goldenLog_reg)

/-- **The convergent logarithms converge to `log₂ φ`.** Their limit is realised as one Bishop real by
`real_completeness`; this is `log₂ φ ≈ 0.694`, the golden inflation entropy, constructed. -/
theorem goldenLog_converges :
    RReal.ConvergesTo (fun n => RReal.mk (goldenLogRep n)) logTwoGolden :=
  RReal.real_completeness goldenLogRep goldenLog_reg

end Real.Internal
end Obsmetrologia
