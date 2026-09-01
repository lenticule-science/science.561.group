import Obsmetrologia.Calculus.Real.Logarithm

/-!
# Scalar cancellation in `ℝ`, and the per-step log-Lipschitz bound

`logNat_pow_bernoulli` proved the *power-level* bound `log₂((M+1)^(k+1)) ≤ 1 + log₂(M^(k+1))`, i.e.
`(k+1)·log₂((M+1)/M) ≤ 1`. To divide by `(k+1)` we need **scalar cancellation** on the Bishop reals:
`m·X ≤ m·Y → X ≤ Y` for `m ≥ 1`. Core Lean has no `ring`/ordered-field automation and `RReal` carries
no multiplicative order, so this is built from the ground up: `Int.le_of_mul_le_mul_left` lifts to a `ℚ`
cancellation (`Rat.le_of_ofNat_mul_le`), and `nsmul` (repeated addition) has pointwise sequence
`(m·x).seq n = m · x.seq n`, so the cancellation descends to `ℝ` index-by-index.

With cancellation, the power law (`logNat_pow_succ` ⟹ `logNat 2 (Nᵉ) = e·log₂ N`) and
`(k+1)·(1/(k+1)) = 1` turn the power-level bound into the **per-step bound**
`log₂(M+1) ≤ log₂ M + 1/(k+1)` (`logNat_step_bound`) — exactly the `log`-Lipschitz modulus that makes
the golden convergent-logs a regular Cauchy sequence.

## Main results
* `Rat.le_of_ofNat_mul_le` — `ℚ` cancellation of a positive integer scalar (with slack).
* `nsmul_le_cancel` — scalar cancellation in `ℝ`.
* `logNat_pow_eq_nsmul` — the power law in `nsmul` form: `log₂(Nᵉ) = e·log₂ N`.
* `logNat_step_bound` — `log₂(M+1) ≤ log₂ M + 1/(k+1)` when `2(k+1) ≤ M`.
-/

namespace Obsmetrologia
namespace Real.Internal

/-! ## (1) Rational cancellation of a positive scalar -/

/-- Cancel a positive integer scalar on the left in `ℚ`: `ofNat m · a ≤ ofNat m · b → a ≤ b`. -/
theorem Rat.le_of_ofNat_mul_le_left (m : Nat) (hm : 1 ≤ m) {a b : Rat}
    (h : Rat.ofNat m * a ≤ Rat.ofNat m * b) : a ≤ b := by
  revert h
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  show Rat.ofNat m * Rat.mk a ≤ Rat.ofNat m * Rat.mk b → Rat.mk a ≤ Rat.mk b
  intro h
  rw [show Rat.ofNat m = Rat.mk (PreRat.ofNat m) from rfl, Rat.mk_mul, Rat.mk_mul, Rat.mk_le] at h
  rw [Rat.mk_le]
  show a.num * b.den ≤ b.num * a.den
  have e1 : (PreRat.mul (PreRat.ofNat m) a).num * (PreRat.mul (PreRat.ofNat m) b).den
      = (m : Int) * (a.num * b.den) := by simp only [PreRat.mul, PreRat.ofNat]; iring
  have e2 : (PreRat.mul (PreRat.ofNat m) b).num * (PreRat.mul (PreRat.ofNat m) a).den
      = (m : Int) * (b.num * a.den) := by simp only [PreRat.mul, PreRat.ofNat]; iring
  have hkey : (m : Int) * (a.num * b.den) ≤ (m : Int) * (b.num * a.den) := by
    have hh : (PreRat.mul (PreRat.ofNat m) a).num * (PreRat.mul (PreRat.ofNat m) b).den
        ≤ (PreRat.mul (PreRat.ofNat m) b).num * (PreRat.mul (PreRat.ofNat m) a).den := h
    rwa [e1, e2] at hh
  have hmpos : (0 : Int) < (m : Int) := by exact_mod_cast hm
  exact Int.le_of_mul_le_mul_left hkey hmpos

/-- `1 ≤ ofNat m` when `1 ≤ m`. -/
theorem Rat.one_le_ofNat {m : Nat} (hm : 1 ≤ m) : (1 : Rat) ≤ Rat.ofNat m := by
  show Rat.mk PreRat.one ≤ Rat.mk (PreRat.ofNat m)
  rw [Rat.mk_le]
  show (1 : Int) * 1 ≤ (m : Int) * 1
  have : (1 : Int) ≤ (m : Int) := by exact_mod_cast hm
  omega

/-- Cancel a positive integer scalar with slack: `ofNat m · a ≤ ofNat m · b + ε → a ≤ b + ε`
(`m ≥ 1`, `ε ≥ 0`). The `ℚ`-level "divide by `m`". -/
theorem Rat.le_of_ofNat_mul_le (m : Nat) (hm : 1 ≤ m) {a b ε : Rat} (hε : (0 : Rat) ≤ ε)
    (h : Rat.ofNat m * a ≤ Rat.ofNat m * b + ε) : a ≤ b + ε := by
  apply Rat.le_of_ofNat_mul_le_left m hm
  have hεm : ε ≤ Rat.ofNat m * ε := by
    have := Rat.mul_le_mul_of_nonneg_right (Rat.one_le_ofNat hm) hε
    rwa [Rat.one_mul] at this
  have step : Rat.ofNat m * a ≤ Rat.ofNat m * b + Rat.ofNat m * ε :=
    Rat.le_trans h (Rat.add_le_add_left hεm _)
  rwa [← Rat.left_distrib] at step

/-! ## (2) `nsmul` and its pointwise sequence -/

/-- `m`-fold sum of a `Real`, `realNsmul m x = x + x + ⋯ + x`. -/
def realNsmul : Nat → Real → Real
  | 0, _ => Real.zero
  | (m + 1), x => Real.add (realNsmul m x) x

/-- **The `m`-fold sum scales the sequence**: `(realNsmul m x).seq n = m · x.seq n`. -/
theorem realNsmul_seq (m : Nat) (x : Real) (n : Nat) :
    (realNsmul m x).seq n = Rat.ofNat m * x.seq n := by
  induction m with
  | zero =>
      show (0 : Rat) = Rat.ofNat 0 * x.seq n
      rw [show Rat.ofNat 0 = (0 : Rat) from rfl, Rat.zero_mul]
  | succ m ih =>
      show (realNsmul m x).seq n + x.seq n = Rat.ofNat (m + 1) * x.seq n
      have hcast : Rat.ofNat (m + 1) = Rat.ofNat m + 1 := by
        apply Rat.mk_eq.mpr
        show ((m + 1 : Nat) : Int) * 1 = ((m : Int) * 1 + 1 * 1) * 1
        have : ((m + 1 : Nat) : Int) = (m : Int) + 1 := by omega
        rw [this]; iring
      rw [ih, hcast, Rat.right_distrib, Rat.one_mul]

/-- `nsmul` on `ℝ`. -/
def nsmul : Nat → RReal → RReal
  | 0, _ => RReal.zero
  | (m + 1), X => nsmul m X + X

/-- `nsmul` commutes with the quotient: `nsmul m (mk x) = mk (realNsmul m x)`. -/
theorem nsmul_mk (m : Nat) (x : Real) : nsmul m (RReal.mk x) = RReal.mk (realNsmul m x) := by
  induction m with
  | zero => rfl
  | succ m ih => show nsmul m (RReal.mk x) + RReal.mk x = RReal.mk (Real.add (realNsmul m x) x);
                 rw [ih, RReal.mk_add]

/-- **Scalar cancellation in `ℝ`**: `m·X ≤ m·Y → X ≤ Y` for `m ≥ 1`. The pointwise `m·`-scaling of the
sequences plus the `ℚ` cancellation `Rat.le_of_ofNat_mul_le`. -/
theorem nsmul_le_cancel (m : Nat) (hm : 1 ≤ m) (X Y : RReal) (h : nsmul m X ≤ nsmul m Y) : X ≤ Y := by
  revert h
  refine Quotient.inductionOn₂ X Y (fun x y => ?_)
  show nsmul m (RReal.mk x) ≤ nsmul m (RReal.mk y) → RReal.mk x ≤ RReal.mk y
  intro h
  rw [nsmul_mk, nsmul_mk, RReal.mk_le] at h
  rw [RReal.mk_le]
  intro j
  obtain ⟨N, hN⟩ := h j
  refine ⟨N, fun n hn => ?_⟩
  have hh := hN n hn
  rw [realNsmul_seq, realNsmul_seq] at hh
  exact Rat.le_of_ofNat_mul_le m hm (Rat.invNatP_nonneg j) hh

/-- `nsmul` distributes over `+`. -/
theorem nsmul_add (m : Nat) (X Y : RReal) : nsmul m (X + Y) = nsmul m X + nsmul m Y := by
  induction m with
  | zero => exact (RReal.add_zero RReal.zero).symm
  | succ m ih =>
      show nsmul m (X + Y) + (X + Y) = (nsmul m X + X) + (nsmul m Y + Y)
      rw [ih, RReal.add_assoc (nsmul m X) (nsmul m Y) (X + Y),
          ← RReal.add_assoc (nsmul m Y) X Y, RReal.add_comm (nsmul m Y) X,
          RReal.add_assoc X (nsmul m Y) Y, ← RReal.add_assoc (nsmul m X) X (nsmul m Y + Y)]

/-- **`(k+1)` copies of `1/(k+1)` sum to `1`**: `nsmul (k+1) (ofRat (1/(k+1))) = ofRat 1`. -/
theorem nsmul_ofRat_invNatP (k : Nat) :
    nsmul (k + 1) (RReal.ofRat (Rat.invNatP k)) = RReal.ofRat 1 := by
  show nsmul (k + 1) (RReal.mk (Real.ofRat (Rat.invNatP k))) = RReal.mk (Real.ofRat 1)
  rw [nsmul_mk]
  apply RReal.mk_eq_of_seq_eq
  intro n
  rw [realNsmul_seq]
  show Rat.ofNat (k + 1) * Rat.invNatP k = (1 : Rat)
  rw [show Rat.ofNat (k + 1) = Rat.mk (PreRat.ofNat (k + 1)) from rfl, Rat.invNatP, Rat.mk_mul]
  apply Rat.mk_eq.mpr
  show ((k + 1 : Nat) : Int) * 1 * 1 = 1 * (1 * ((k : Int) + 1))
  have : ((k + 1 : Nat) : Int) = (k : Int) + 1 := by omega
  rw [this]; iring

/-- **`log₂ 1 = 0`** as a real. -/
theorem logNat_one : logNat 2 1 (by decide) (by decide) = RReal.zero := by
  show RReal.mk (logReal 2 1 (by decide) (by decide)) = RReal.mk Real.zero
  apply RReal.mk_eq_of_seq_eq
  intro n
  show logSeq 2 1 n = (0 : Rat)
  unfold logSeq
  rw [Nat.one_pow, show natLog 2 1 = 0 from by decide]
  apply Rat.mk_eq.mpr
  show (0 : Int) * 1 = 0 * ((n : Int) + 1)
  iring

/-- **The power law in `nsmul` form**: `log₂(Nᵉ) = e · log₂ N`. By induction from `logNat_pow_succ`. -/
theorem logNat_pow_eq_nsmul (N : Nat) (hN : 1 ≤ N) : ∀ e,
    logNat 2 (N ^ e) (by decide) (Nat.one_le_pow _ _ (by omega))
      = nsmul e (logNat 2 N (by decide) hN)
  | 0 => logNat_one
  | (e + 1) => by
      rw [logNat_pow_succ N e hN]
      show logNat 2 (N ^ e) (by decide) (Nat.one_le_pow _ _ (by omega)) + logNat 2 N (by decide) hN
          = nsmul e (logNat 2 N (by decide) hN) + logNat 2 N (by decide) hN
      rw [logNat_pow_eq_nsmul N hN e]

/-- **The per-step log-Lipschitz bound**: `log₂(M+1) ≤ log₂ M + 1/(k+1)` when `2(k+1) ≤ M`. The
power-level bound `logNat_pow_bernoulli` divided by `(k+1)` via `nsmul_le_cancel`. This is the modulus
that makes the golden convergent-logarithms a *regular* Cauchy sequence — the final input to the single
real `log₂ φ`. -/
theorem logNat_step_bound (M k : Nat) (h : 2 * (k + 1) ≤ M) :
    logNat 2 (M + 1) (by decide) (by omega)
      ≤ logNat 2 M (by decide) (by omega) + RReal.ofRat (Rat.invNatP k) := by
  apply nsmul_le_cancel (k + 1) (by omega)
  rw [nsmul_add, nsmul_ofRat_invNatP,
      ← logNat_pow_eq_nsmul (M + 1) (by omega) (k + 1), ← logNat_pow_eq_nsmul M (by omega) (k + 1),
      RReal.add_comm (logNat 2 (M ^ (k + 1)) (by decide) (Nat.one_le_pow _ _ (by omega)))
        (RReal.ofRat 1)]
  exact logNat_pow_bernoulli M k h

end Real.Internal
end Obsmetrologia
