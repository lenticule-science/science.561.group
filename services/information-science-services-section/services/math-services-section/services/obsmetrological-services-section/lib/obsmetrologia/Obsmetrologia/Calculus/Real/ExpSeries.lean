import Obsmetrologia.Calculus.Real.Internal
import Obsmetrologia.Calculus.Order.NumberTheoryCombinatorics

/-!
# The exponential power series — the factorial decay that forces the `ω`-limit

The metallic lens (`AperiodicOrder.Tiling.StepN.MetallicPowerLens`) graded *algebraic* powers `zᵏ = Pₖz + Qₖ` at
`κ < ω`. The chromatic-Lorentzian residue that no finite recurrence catches is transcendental, and its
closure is the `ω`-limit of a power series — `Real.Internal` is exactly the `κ = ω` Scott-continuous
completion of `ℚ`, so the power series lives there, not outside.

This module builds the convergence engine of the exponential series `e = ∑ 1/n!`. The decisive fact is
the **factorial halving** `term(i+1) + term(i+1) ≤ term i` (`term_halving`, ⟺ `2·i! ≤ (i+1)!`): each
term is at most half the previous. That super-geometric decay is what *cannot be metallized* — it
falls faster than any fixed algebraic (metallic) recurrence, so the series has no algebraic closed form
and settles only at the `ω`-limit. It is the per-step bound a telescoping Cauchy modulus (mirroring the
metallic `conv_telescope`) sums to summability — the transcendental discharge of the jammed residue.

## Main definitions

* `expTerm n` — the term `1/n!` as a rational.
* `expSeq N` — the partial sum `∑_{n<N} 1/n!`.

## Main results

* `term_halving` — `term(i+1) + term(i+1) ≤ term i` for `i ≥ 1`: the factorial halving (decay).
* `term_antitone` — the terms decrease.
* `factorial_ge_self` / `factorial_mono` — the factorial bounds the modulus telescope needs.

## References

`AperiodicOrder.Tiling.StepN.MetallicReal` (the metallic `conv_telescope` this mirrors); `Real.Internal` (the
`κ = ω` completion). The chromatic-Lorentzian transcendental residue of `AperiodicOrder.Tiling.ChromaticLorentzian`.

## Tags

exponential, power series, factorial, decay, kappa-omega, transcendental
-/

namespace Obsmetrologia
namespace Real.Internal

open Obsmetrologia.NumberTheory

/-! ## (A) Factorial bounds -/

/-- `N ≤ N!` — the factorial dominates its argument. -/
theorem factorial_ge_self : ∀ N : Nat, N ≤ factorial N
  | 0 => Nat.zero_le _
  | N + 1 => by
    rw [factorial_succ]
    have h := factorial_pos N
    calc N + 1 = (N + 1) * 1 := by omega
      _ ≤ (N + 1) * factorial N := Nat.mul_le_mul_left (N + 1) h

/-- The factorial is monotone: `a ≤ b → a! ≤ b!`. -/
theorem factorial_mono {a b : Nat} (h : a ≤ b) : factorial a ≤ factorial b := by
  induction b with
  | zero => exact Nat.le_of_eq (congrArg factorial (Nat.le_zero.mp h))
  | succ b ih =>
    rcases Nat.lt_or_ge a (b + 1) with hlt | hge
    · have hab : a ≤ b := Nat.le_of_lt_succ hlt
      rw [factorial_succ]
      have hpos := factorial_pos b
      calc factorial a ≤ factorial b := ih hab
        _ = 1 * factorial b := by omega
        _ ≤ (b + 1) * factorial b := Nat.mul_le_mul_right (factorial b) (by omega)
    · exact Nat.le_of_eq (congrArg factorial (Nat.le_antisymm h hge))

/-! ## (B) The series term and partial sums -/

/-- The exponential term `1/n!` as a positive rational. -/
def expTerm (n : Nat) : Rat :=
  Rat.mk ⟨1, (factorial n : Int), by exact_mod_cast factorial_pos n⟩

/-- The partial sum `∑_{n<N} 1/n!`. -/
def expSeq : Nat → Rat
  | 0 => 0
  | N + 1 => expSeq N + expTerm N

/-! ## (C) Factorial halving — the decay that forces the `ω`-limit -/

/-- **Factorial halving.** `term(i+1) + term(i+1) ≤ term i` for `i ≥ 1`, i.e. `2/(i+1)! ≤ 1/i!`,
equivalently the factorial fact `2·i! ≤ (i+1)!`. Each term is at most half the previous one — the
super-geometric decay that no fixed algebraic (metallic) recurrence has, forcing the `κ = ω` closure. -/
theorem term_halving (i : Nat) (hi : 1 ≤ i) :
    expTerm (i + 1) + expTerm (i + 1) ≤ expTerm i := by
  unfold expTerm
  rw [Rat.mk_add, Rat.mk_le]
  simp only [PreRat.add, PreRat.le]
  have hkeyNat : factorial i + factorial i ≤ factorial (i + 1) := by
    rw [factorial_succ]
    have hmul : 2 * factorial i ≤ (i + 1) * factorial i :=
      Nat.mul_le_mul_right (factorial i) (by omega)
    omega
  have hkey : (factorial i : Int) + (factorial i : Int) ≤ (factorial (i + 1) : Int) := by
    exact_mod_cast hkeyNat
  have hF1 : (0 : Int) ≤ (factorial (i + 1) : Int) := by exact_mod_cast Nat.zero_le _
  have hmul : (factorial (i + 1) : Int) * ((factorial i : Int) + (factorial i : Int))
      ≤ (factorial (i + 1) : Int) * (factorial (i + 1) : Int) :=
    Int.mul_le_mul_of_nonneg_left hkey hF1
  have hL : (1 * (factorial (i + 1) : Int) + 1 * (factorial (i + 1) : Int)) * (factorial i : Int)
      = (factorial (i + 1) : Int) * ((factorial i : Int) + (factorial i : Int)) := by iring
  have hR : (1 : Int) * ((factorial (i + 1) : Int) * (factorial (i + 1) : Int))
      = (factorial (i + 1) : Int) * (factorial (i + 1) : Int) := by iring
  rw [hL, hR]
  exact hmul

/-- **Term antitonicity.** `a ≤ b → term b ≤ term a` — the terms decrease. -/
theorem term_antitone {a b : Nat} (h : a ≤ b) : expTerm b ≤ expTerm a := by
  unfold expTerm
  rw [Rat.mk_le]
  simp only [PreRat.le]
  have hmono : (factorial a : Int) ≤ (factorial b : Int) := by exact_mod_cast factorial_mono h
  omega

/-- Every term is nonnegative. -/
theorem expTerm_nonneg (n : Nat) : (0 : Rat) ≤ expTerm n := by
  unfold expTerm
  exact (Rat.zero_le_mk _).mpr (by show (0 : Int) ≤ 1; omega)

/-! ## (D) Summability — the tail is bounded, so the series settles at `κ = ω`

The running "cap" `expSeq X + (term X + term X)` is **non-increasing** past `X ≥ 1` (factorial
halving), so the partial sums are uniformly bounded by `expSeq N + 2·term N`. That uniform tail bound
is the Cauchy/convergence content: the exponential power series settles at the `ω`-limit. -/

/-- The cap `expSeq X + 2·term X` is non-increasing for `X ≥ 1` (one step), by factorial halving. -/
theorem cap_dec (X : Nat) (hX : 1 ≤ X) :
    expSeq (X + 1) + (expTerm (X + 1) + expTerm (X + 1))
      ≤ expSeq X + (expTerm X + expTerm X) := by
  have h2 : expTerm X + (expTerm (X + 1) + expTerm (X + 1)) ≤ expTerm X + expTerm X :=
    Rat.add_le_add_left (term_halving X hX) (expTerm X)
  have h3 : expSeq X + (expTerm X + (expTerm (X + 1) + expTerm (X + 1)))
      ≤ expSeq X + (expTerm X + expTerm X) := Rat.add_le_add_left h2 (expSeq X)
  calc expSeq (X + 1) + (expTerm (X + 1) + expTerm (X + 1))
      = expSeq X + (expTerm X + (expTerm (X + 1) + expTerm (X + 1))) := by
        show expSeq X + expTerm X + (expTerm (X + 1) + expTerm (X + 1))
            = expSeq X + (expTerm X + (expTerm (X + 1) + expTerm (X + 1)))
        rw [Rat.add_assoc]
    _ ≤ expSeq X + (expTerm X + expTerm X) := h3

/-- The cap is non-increasing over any number of steps past `N ≥ 1`. -/
theorem cap_mono (N : Nat) (hN : 1 ≤ N) : ∀ M,
    expSeq (N + M) + (expTerm (N + M) + expTerm (N + M))
      ≤ expSeq N + (expTerm N + expTerm N) := by
  intro M
  induction M with
  | zero => exact Rat.le_refl _
  | succ M ih =>
    exact Rat.le_trans (cap_dec (N + M) (Nat.le_trans hN (Nat.le_add_right N M))) ih

/-- **Summability of the exponential series.** Every partial sum past `N ≥ 1` is bounded by
`expSeq N + 2·term N`, uniformly in `M`: `expSeq (N + M) ≤ expSeq N + (term N + term N)`. The tail is
bounded by twice the `N`-th term — the Cauchy/convergence content, the power series settling at the
`κ = ω` limit (the transcendental discharge no algebraic recurrence reaches). -/
theorem expSeq_summable (N : Nat) (hN : 1 ≤ N) (M : Nat) :
    expSeq (N + M) ≤ expSeq N + (expTerm N + expTerm N) := by
  have hnn : (0 : Rat) ≤ expTerm (N + M) + expTerm (N + M) :=
    Rat.le_trans (expTerm_nonneg (N + M))
      (Rat.le_add_nonneg (expTerm (N + M)) (expTerm_nonneg (N + M)))
  exact Rat.le_trans (Rat.le_add_nonneg (expSeq (N + M)) hnn) (cap_mono N hN M)

/-! ## (E) Packaging the real `e = ∑ 1/n!` -/

/-- The partial sums are non-decreasing: `expSeq n ≤ expSeq (n + d)`. -/
theorem expSeq_le_add (n : Nat) : ∀ d, expSeq n ≤ expSeq (n + d)
  | 0 => Rat.le_refl _
  | d + 1 => by
    show expSeq n ≤ expSeq (n + d) + expTerm (n + d)
    exact Rat.le_trans (expSeq_le_add n d)
      (Rat.le_add_nonneg (expSeq (n + d)) (expTerm_nonneg (n + d)))

/-- **The tail bound meets the modulus.** `2·term(2(k+1)) ≤ 1/(k+1)`, since `2(k+1) ≤ (2(k+1))!`
(`factorial_ge_self`). This is what makes `2(k+1)` a Cauchy modulus for the series. -/
theorem two_term_mod_le (k : Nat) :
    expTerm (2 * (k + 1)) + expTerm (2 * (k + 1)) ≤ Rat.invNatP k := by
  unfold expTerm Rat.invNatP
  rw [Rat.mk_add, Rat.mk_le]
  simp only [PreRat.add, PreRat.le]
  have hge : ((2 * (k + 1) : Nat) : Int) ≤ (factorial (2 * (k + 1)) : Int) := by
    exact_mod_cast factorial_ge_self (2 * (k + 1))
  have hF : (0 : Int) ≤ (factorial (2 * (k + 1)) : Int) := by exact_mod_cast Nat.zero_le _
  have hmul : (factorial (2 * (k + 1)) : Int) * ((2 * (k + 1) : Nat) : Int)
      ≤ (factorial (2 * (k + 1)) : Int) * (factorial (2 * (k + 1)) : Int) :=
    Int.mul_le_mul_of_nonneg_left hge hF
  have hN : ((2 * (k + 1) : Nat) : Int) = ((k : Int) + 1) + ((k : Int) + 1) := by omega
  have hL : (1 * (factorial (2 * (k + 1)) : Int) + 1 * (factorial (2 * (k + 1)) : Int))
        * ((k : Int) + 1)
      = (factorial (2 * (k + 1)) : Int) * ((2 * (k + 1) : Nat) : Int) := by rw [hN]; iring
  have hR : (1 : Int) * ((factorial (2 * (k + 1)) : Int) * (factorial (2 * (k + 1)) : Int))
      = (factorial (2 * (k + 1)) : Int) * (factorial (2 * (k + 1)) : Int) := by iring
  rw [hL, hR]; exact hmul

/-- **The uniform difference bound.** If the subtrahend index `b` is past the modulus `2(k+1)`, then
`expSeq a − expSeq b ≤ 1/(k+1)` — whether `a ≥ b` (bounded by the summable tail `2·term b`) or `a < b`
(the difference is `≤ 0`). This is the Cauchy estimate. -/
theorem expSeq_diff_le (k a b : Nat) (hb : 2 * (k + 1) ≤ b) :
    expSeq a - expSeq b ≤ Rat.invNatP k := by
  rcases Nat.le_total b a with hba | hab
  · obtain ⟨d, rfl⟩ := Nat.le.dest hba
    have hsum := expSeq_summable b (by omega) d
    have h1 : expSeq (b + d) - expSeq b ≤ expTerm b + expTerm b := Rat.le_sub_iff.mp hsum
    have hta : expTerm b ≤ expTerm (2 * (k + 1)) := term_antitone hb
    exact Rat.le_trans h1 (Rat.le_trans (Rat.add_le_add hta hta) (two_term_mod_le k))
  · have hle : expSeq a ≤ expSeq b := by
      obtain ⟨d, rfl⟩ := Nat.le.dest hab; exact expSeq_le_add a d
    have hnp : expSeq a - expSeq b ≤ 0 := Rat.le_sub_iff.mp (by rw [Rat.add_zero]; exact hle)
    exact Rat.le_trans hnp (Rat.invNatP_nonneg k)

/-- **The real `e = ∑ 1/n!`** as a Cauchy-with-modulus real: partial sums `expSeq`, modulus
`2(k+1)`, and the Cauchy field discharged by `expSeq_diff_le` in both directions (`abs_le_of_both`).
The exponential — the transcendental discharge of the chromatic residue — assembled at the `κ = ω`
completion. -/
def expReal : Real where
  seq := expSeq
  modulus := fun k => 2 * (k + 1)
  cauchy := fun k m n hm hn => by
    apply Rat.abs_le_of_both
    · exact expSeq_diff_le k m n hn
    · rw [Rat.neg_sub]; exact expSeq_diff_le k n m hm

/-- **Euler's number `e`** as a corpus real — the power series `∑ 1/n!` settled at the `κ = ω` limit. -/
def e : RReal := RReal.mk expReal

end Real.Internal
end Obsmetrologia
