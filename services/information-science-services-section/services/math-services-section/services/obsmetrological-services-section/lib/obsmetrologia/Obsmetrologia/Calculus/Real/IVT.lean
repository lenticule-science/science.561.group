import Obsmetrologia.Calculus.Real.Multiplication

/-!
# Toward a constructive intermediate value theorem (rational bisection)

The Salem signature (`AperiodicOrder.Tiling.StepN.Salem`) is recorded as *sign changes* of the trace resolvent —
`q(−2) > 0 > q(0)` and `q(2) < 0 < q(3)` — which, by the intermediate value theorem, bracket actual
roots (the unit-circle trace value and the real Salem root `λ`). This module builds toward that IVT
*constructively*, the only way over the Bishop reals: **rational bisection**. At a rational
midpoint the sign of a rational-valued function is decidable, so bisection is an algorithm; the
nested brackets shrink geometrically, giving a regular Cauchy real, and continuity pins the limit as a
root.

The gateway is a **decidable order on `Rat`** — `mk a ≤ mk b` is, by `mk_le`, the decidable integer
inequality `a.num·b.den ≤ b.num·a.den`. With it, bisection can branch on `f m ≤ 0`.

This is the first stone; the bracket-is-Cauchy construction and the continuity step (`f root = 0`) build
on top.
-/

namespace Obsmetrologia
namespace Real.Internal
namespace Rat

/-- **Equality on `Rat` is decidable** — it is the decidable cross-multiplication `PreRat.equiv`. -/
instance instDecidableEq : DecidableEq Rat := fun a b =>
  Quotient.recOnSubsingleton₂ a b fun a b =>
    decidable_of_iff (a.num * b.den = b.num * a.den)
      ⟨fun h => mk_eq.mpr h, fun h => mk_eq.mp h⟩

/-- **The order on `Rat` is decidable** — `mk a ≤ mk b` is defeq the decidable integer inequality
`a.num·b.den ≤ b.num·a.den` (`mk_le`). This is what lets bisection branch on the sign of a rational. -/
instance instDecidableLE : @DecidableLE Rat _ := fun a b =>
  Quotient.recOnSubsingleton₂ a b fun a b =>
    decidable_of_iff (a.num * b.den ≤ b.num * a.den)
      ⟨fun h => (mk_le a b).mpr h, fun h => (mk_le a b).mp h⟩

end Rat

/-! ## Integer floor square root (dependency-free; `Nat.sqrt` is not in this core) -/

/-- **Floor square root** `⌊√n⌋`, by climbing one unit each time `n` crosses a perfect square. -/
def natSqrt : Nat → Nat
  | 0 => 0
  | (n + 1) => let p := natSqrt n; if (p + 1) * (p + 1) ≤ n + 1 then p + 1 else p

/-- **Correctness of `natSqrt`:** `⌊√n⌋² ≤ n < (⌊√n⌋ + 1)²`. -/
theorem natSqrt_spec : ∀ n, natSqrt n * natSqrt n ≤ n ∧ n < (natSqrt n + 1) * (natSqrt n + 1)
  | 0 => ⟨by decide, by decide⟩
  | (n + 1) => by
      obtain ⟨hle, hlt⟩ := natSqrt_spec n
      simp only [natSqrt]
      by_cases h : (natSqrt n + 1) * (natSqrt n + 1) ≤ n + 1
      · rw [if_pos h]
        refine ⟨h, ?_⟩
        have hmono : (natSqrt n + 1) * (natSqrt n + 1)
            < (natSqrt n + 1 + 1) * (natSqrt n + 1 + 1) := Nat.mul_self_lt_mul_self (by omega)
        omega
      · rw [if_neg h]
        exact ⟨by omega, by omega⟩

/-- **Square-monotone reflection on `Nat`:** `a² ≤ b² → a ≤ b`. The contrapositive of
`Nat.mul_self_lt_mul_self`. This is the lever that lets the `√` Cauchy modulus be proved on the integer
numerators (cross-multiplied), avoiding `Rat` ring-identity gymnastics. -/
theorem le_of_mul_self_le_mul_self {a b : Nat} (h : a * a ≤ b * b) : a ≤ b := by
  rcases Nat.lt_or_ge b a with hba | hab
  · exact absurd h (Nat.not_le.mpr (Nat.mul_self_lt_mul_self hba))
  · exact hab

/-- A cross-multiplication chain: `A ≤ cc·B`, `cc·C ≤ D` ⟹ `A·C ≤ D·B`. -/
private theorem mulChain (A B C D cc : Nat) (h1 : A ≤ cc * B) (h2 : cc * C ≤ D) :
    A * C ≤ D * B :=
  calc A * C ≤ (cc * B) * C := Nat.mul_le_mul_right _ h1
    _ = (cc * C) * B := by rw [Nat.mul_right_comm]
    _ ≤ D * B := Nat.mul_le_mul_right _ h2

/-! ## `√` of a natural as a Bishop real (the floor-approximation Cauchy sequence) -/

/-- The **`k`-th rational under-approximation of `√c`**: `⌊√(c·(k+1)²)⌋ / (k+1) = ⌊(k+1)√c⌋/(k+1)`,
a rational `≤ √c` within `1/(k+1)` of it. -/
def sqrtSeq (c : Nat) (k : Nat) : Rat :=
  Rat.mk ⟨(natSqrt (c * ((k + 1) * (k + 1))) : Int), (k : Int) + 1, by omega⟩

/-- **The numerator cross-multiplication bound:** `⌊(m+1)√c⌋·(n+1) ≤ (⌊(n+1)√c⌋+1)·(m+1)`. The
integer heart of the Cauchy modulus — `sqrtSeq c m ≤ sqrtSeq c n + 1/(n+1)`. Proved via
`le_of_mul_self_le_mul_self` on the squared numerators and `mulChain` from `natSqrt_spec`. -/
theorem sqrtSeq_num_le (c m n : Nat) :
    natSqrt (c * ((m + 1) * (m + 1))) * (n + 1)
      ≤ (natSqrt (c * ((n + 1) * (n + 1))) + 1) * (m + 1) := by
  apply le_of_mul_self_le_mul_self
  rw [Nat.mul_mul_mul_comm (natSqrt (c * ((m + 1) * (m + 1)))) (n + 1)
        (natSqrt (c * ((m + 1) * (m + 1)))) (n + 1),
      Nat.mul_mul_mul_comm (natSqrt (c * ((n + 1) * (n + 1))) + 1) (m + 1)
        (natSqrt (c * ((n + 1) * (n + 1))) + 1) (m + 1)]
  refine mulChain _ _ _ _ c ?_ ?_
  · exact (natSqrt_spec _).1
  · exact Nat.le_of_lt (natSqrt_spec _).2

/-- **The directional Cauchy bound:** `sqrtSeq c m ≤ sqrtSeq c n + 1/(n+1)` — every approximation is
below any other plus its own slack. Lifts `sqrtSeq_num_le` to `Rat`. -/
theorem sqrtSeq_le_succ (c m n : Nat) : sqrtSeq c m ≤ sqrtSeq c n + Rat.invNatP n := by
  unfold sqrtSeq Rat.invNatP
  rw [Rat.mk_add, Rat.mk_le]
  show (natSqrt (c * ((m + 1) * (m + 1))) : Int) * (((n : Int) + 1) * ((n : Int) + 1))
      ≤ ((natSqrt (c * ((n + 1) * (n + 1))) : Int) * ((n : Int) + 1) + 1 * ((n : Int) + 1))
          * ((m : Int) + 1)
  have hnum : (natSqrt (c * ((m + 1) * (m + 1))) : Int) * ((n : Int) + 1)
      ≤ ((natSqrt (c * ((n + 1) * (n + 1))) : Int) + 1) * ((m : Int) + 1) := by
    exact_mod_cast sqrtSeq_num_le c m n
  have hmul := Int.mul_le_mul_of_nonneg_right hnum (by omega : (0 : Int) ≤ (n : Int) + 1)
  calc (natSqrt (c * ((m + 1) * (m + 1))) : Int) * (((n : Int) + 1) * ((n : Int) + 1))
      = ((natSqrt (c * ((m + 1) * (m + 1))) : Int) * ((n : Int) + 1)) * ((n : Int) + 1) := by iring
    _ ≤ (((natSqrt (c * ((n + 1) * (n + 1))) : Int) + 1) * ((m : Int) + 1)) * ((n : Int) + 1) := hmul
    _ = ((natSqrt (c * ((n + 1) * (n + 1))) : Int) * ((n : Int) + 1) + 1 * ((n : Int) + 1))
          * ((m : Int) + 1) := by iring

/-- **`√c` as a Bishop real:** the floor-approximation sequence is regular Cauchy with modulus `k`
(the two directional bounds `sqrtSeq_le_succ` recombine through `abs_le_of_both`). -/
def sqrtReal (c : Nat) : Real where
  seq := sqrtSeq c
  modulus := fun k => k
  cauchy := fun k m n hm hn => by
    have h1 : sqrtSeq c m - sqrtSeq c n ≤ Rat.invNatP k :=
      Rat.le_trans (Rat.le_sub_iff.mp (sqrtSeq_le_succ c m n)) (Rat.invNatP_le_of_ge hn)
    have h2 : -(sqrtSeq c m - sqrtSeq c n) ≤ Rat.invNatP k := by
      rw [Rat.neg_sub]
      exact Rat.le_trans (Rat.le_sub_iff.mp (sqrtSeq_le_succ c n m)) (Rat.invNatP_le_of_ge hm)
    exact Rat.abs_le_of_both h1 h2

/-- **`√c : ℝ`** — the square root of a natural number as a real (the descent of `sqrtReal`). A reusable
`√` for the Bishop reals: the analytic capability the Salem real root (and the metallic
`(n+√(n²+4))/2`) needs. -/
def sqrtNat (c : Nat) : RReal := RReal.mk (sqrtReal c)

/-- **Lower bracket:** every approximation under-estimates, `sqrtSeq c k ² ≤ c`. Directly
`natSqrt_spec.1`. (Half of `(√c)² = c`; the matching upper bound `c < (sqrtSeq + 1/(k+1))²` and the
null-sequence squeeze finish it.) -/
theorem sqrtSeq_sq_le (c k : Nat) : sqrtSeq c k * sqrtSeq c k ≤ Rat.ofNat c := by
  unfold sqrtSeq Rat.ofNat
  rw [Rat.mk_mul, Rat.mk_le]
  show (natSqrt (c * ((k + 1) * (k + 1))) : Int) * (natSqrt (c * ((k + 1) * (k + 1))) : Int) * 1
      ≤ (c : Int) * (((k : Int) + 1) * ((k : Int) + 1))
  have h := (natSqrt_spec (c * ((k + 1) * (k + 1)))).1
  have hc : (natSqrt (c * ((k + 1) * (k + 1))) : Int) * (natSqrt (c * ((k + 1) * (k + 1))) : Int)
      ≤ (c : Int) * (((k : Int) + 1) * ((k : Int) + 1)) := by exact_mod_cast h
  calc (natSqrt (c * ((k + 1) * (k + 1))) : Int) * (natSqrt (c * ((k + 1) * (k + 1))) : Int) * 1
      = (natSqrt (c * ((k + 1) * (k + 1))) : Int) * (natSqrt (c * ((k + 1) * (k + 1))) : Int) := by
        iring
    _ ≤ (c : Int) * (((k : Int) + 1) * ((k : Int) + 1)) := hc

/-- `⌊(k+1)√c⌋ ≤ c·(k+1)` (for `c ≥ 1`) — the upper bound on the numerator used to control
`c − sqrtSeq²`. -/
theorem natSqrt_le_mul {c k : Nat} (hc : 1 ≤ c) :
    natSqrt (c * ((k + 1) * (k + 1))) ≤ c * (k + 1) := by
  apply le_of_mul_self_le_mul_self
  refine Nat.le_trans (natSqrt_spec _).1 ?_
  rw [Nat.mul_mul_mul_comm c (k + 1) c (k + 1)]
  exact Nat.mul_le_mul_right _ (Nat.le_mul_of_pos_left c hc)

/-- **Upper bracket / squeeze bound:** `c − sqrtSeq c k ² ≤ 2c · 1/(k+1)`. The gap below `c` shrinks
like `1/(k+1)`. Proved on the integer numerators: `c(k+1)² − ⌊·⌋² ≤ 2⌊·⌋ ≤ 2c(k+1)`. -/
theorem ofNat_sub_sqrtSeq_sq_le {c : Nat} (hc : 1 ≤ c) (k : Nat) :
    Rat.ofNat c - sqrtSeq c k * sqrtSeq c k ≤ Rat.ofNat (2 * c) * Rat.invNatP k := by
  unfold sqrtSeq Rat.ofNat Rat.invNatP
  rw [Rat.mk_mul, Rat.mk_sub, Rat.mk_mul, Rat.mk_le]
  simp only [PreRat.le, PreRat.add, PreRat.neg, PreRat.mul, PreRat.ofNat]
  have hU : (c : Int) * (((k : Int) + 1) * ((k : Int) + 1))
      < ((natSqrt (c * ((k + 1) * (k + 1))) : Int) + 1)
          * ((natSqrt (c * ((k + 1) * (k + 1))) : Int) + 1) := by
    exact_mod_cast (natSqrt_spec (c * ((k + 1) * (k + 1)))).2
  have hP : (natSqrt (c * ((k + 1) * (k + 1))) : Int) ≤ (c : Int) * ((k : Int) + 1) := by
    exact_mod_cast natSqrt_le_mul (k := k) hc
  have hUexp : ((natSqrt (c * ((k + 1) * (k + 1))) : Int) + 1)
      * ((natSqrt (c * ((k + 1) * (k + 1))) : Int) + 1)
      = (natSqrt (c * ((k + 1) * (k + 1))) : Int) * (natSqrt (c * ((k + 1) * (k + 1))) : Int)
          + 2 * (natSqrt (c * ((k + 1) * (k + 1))) : Int) + 1 := by rw [Int.two_mul]; iring
  rw [hUexp] at hU
  have core : (c : Int) * (((k : Int) + 1) * ((k : Int) + 1))
      - (natSqrt (c * ((k + 1) * (k + 1))) : Int) * (natSqrt (c * ((k + 1) * (k + 1))) : Int)
      ≤ 2 * ((c : Int) * ((k : Int) + 1)) := by omega
  have step := Int.mul_le_mul_of_nonneg_right core (by omega : (0 : Int) ≤ (k : Int) + 1)
  rw [show ((2 * c : Nat) : Int) = 2 * (c : Int) from by exact_mod_cast rfl]
  calc ((c : Int) * (((k : Int) + 1) * ((k : Int) + 1))
          + -((natSqrt (c * ((k + 1) * (k + 1))) : Int)
              * (natSqrt (c * ((k + 1) * (k + 1))) : Int)) * 1) * (1 * ((k : Int) + 1))
      = ((c : Int) * (((k : Int) + 1) * ((k : Int) + 1))
          - (natSqrt (c * ((k + 1) * (k + 1))) : Int)
              * (natSqrt (c * ((k + 1) * (k + 1))) : Int)) * ((k : Int) + 1) := by iring
    _ ≤ 2 * ((c : Int) * ((k : Int) + 1)) * ((k : Int) + 1) := step
    _ = 2 * (c : Int) * 1 * (1 * (((k : Int) + 1) * ((k : Int) + 1))) := by iring

/-- **`(√c)² = c`** (for `c ≥ 1`): `sqrtNat` is *provably* the square root. The approximations bracket
`c` from below (`sqrtSeq_sq_le`) with a gap `≤ 2c/(k+1) → 0` (`ofNat_sub_sqrtSeq_sq_le`), so the
sequence `sqrtSeq²` is null-equivalent to the constant `c` — the same null-sequence closure that pinned
the metallic mean, now giving an explicit real square root. -/
theorem sq_sqrtNat {c : Nat} (hc : 1 ≤ c) : sqrtNat c * sqrtNat c = RReal.ofRat (Rat.ofNat c) := by
  show RReal.mk (sqrtReal c) * RReal.mk (sqrtReal c) = RReal.mk (Real.ofRat (Rat.ofNat c))
  rw [RReal.mk_mul]
  apply RReal.mk_eq.mpr
  intro j
  refine ⟨2 * c * (j + 1), fun n hn => ?_⟩
  show Rat.abs (sqrtSeq c n * sqrtSeq c n - Rat.ofNat c) ≤ Rat.invNatP j
  apply Rat.abs_le_of_both
  · exact Rat.le_trans (Rat.sub_nonpos_iff.mpr (sqrtSeq_sq_le c n)) (Rat.invNatP_nonneg j)
  · rw [Rat.neg_sub]
    refine Rat.le_trans (ofNat_sub_sqrtSeq_sq_le hc n) ?_
    exact Rat.ofNat_mul_invNatP_le (by omega : 2 * c * (j + 1) ≤ n + 1)

end Real.Internal
end Obsmetrologia
