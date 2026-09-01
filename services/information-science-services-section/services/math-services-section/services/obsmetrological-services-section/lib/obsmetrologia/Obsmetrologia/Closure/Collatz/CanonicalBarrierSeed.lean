import Obsmetrologia.Closure.Collatz.OddRunSeed
import Obsmetrologia.Closure.Collatz.BackwardSeed
import Obsmetrologia.Closure.Collatz.ResidueGap

/-!
# Collatz canonical-barrier seeds

The canonical (front-loaded) parent-barrier word `canonicalWord a b = O^a ++ E^b`
is a `ParentBarrier` exactly when `2^(a+b) ≤ 3^a < 2^(a+b+1)`
(`canonicalWord_isParentBarrier`) — the same defining inequality as any parent
barrier, specialized to this word shape.

`OddRunSeed` built the seed `2^a - 1`, which realizes the bare run `O^a` but
only continues correctly into the barrier's `b` trailing `E`s when the residue
happens to be trivial (`a = 1, 2`). This module builds the **general** seed:
the residue `σ` with `3^a · σ ≡ 1 (mod 2^{b+1})`, produced by the same
Bézout/modular-inverse machinery `ResidueGap` uses (`exists_residue`,
`coprime_odd_two_pow`). The seed `σ · 2^a - 1` then provably realizes the full
first-passage cylinder `canonicalWord a b ++ [E]`
(`canonicalWord_seed_exists`), for *every* `a, b` — no divisibility luck
required, and no transcendence input.

This still does not close `parentBarrierGap_holds`. What it establishes is
existence and realizability of the cylinder seed; whether that seed's value
satisfies the descent inequality `C < D · r` (`ParentBarrierResidueGap`) is
the untouched arithmetic frontier — the part that, per this project's
`OddRunSeed` note, looks like it needs a size bound on the canonical
denominator `2^(a+b+1)-3^a`, rather than anything foldable from Bézout alone.

## Main definitions

* `canonicalWord` — the front-loaded word `O^a ++ E^b`.
* `CanonicalSameStepMargins` — the same-`b` margin at every canonical
  transition with `a ≥ 3`, the named arithmetic frontier of this module.

## Main results

* `canonicalWord_isParentBarrier` — `canonicalWord a b` is a `ParentBarrier`
  exactly when `2^(a+b) ≤ 3^a < 2^(a+b+1)`.
* `parentC_canonicalWord` — the affine offset of the canonical word is
  `3^a - 2^a`.
* `canonicalWord_gap_of_denominator_bound` — a denominator lower bound
  `2^(b+1) ≤ parentD (canonicalWord a b)` forces the strict residue-gap
  inequality at every positive seed coefficient `σ`.
* `canonicalWord_backwardSeed_of_residue` — the canonical residue seed is the
  bounded first-passage backward seed of the canonical cylinder.
* `canonicalWord_backwardSeeds_descend_of_denominator_bound` — the same
  denominator lower bound forces every canonical first-passage backward seed to
  descend, using the backward-cylinder residue uniqueness.
* `canonicalWord_residueGap_of_denominator_bound` — the denominator lower bound
  closes the sharp residue inequality for the canonical word.
* `canonicalWord_not_inTwoGenSemigroup_of_denominator_bound` — equivalently, the
  denominator lower bound excludes the two-generator semigroup obstruction for
  the canonical word.
* `canonicalDenominator_same_transition_iff` — the coefficient condition for
  keeping the same trailing-even count is the recurrence condition `P < 3D`.
* `canonicalDenominator_update_same` / `canonicalDenominator_update_up` — the
  two exact denominator recurrences for same-`b` and up-step transitions.
* `canonicalDenominator_no_consecutive_same` — same-`b` transitions cannot
  occur consecutively in the canonical parent-barrier range.
* `canonicalDenominator_same_forces_next_up` — after a same-`b` transition, the
  following transition must raise the trailing-even count.
* `canonicalDenominator_failure_forces_next_up_margin` — a denominator-bound
  failure at `a ≥ 2` lies strictly on the next up-branch side.
* `canonicalDenominator_failure_forces_next_not_same` — equivalently, a failure
  cannot be followed by a same-`b` transition.
* `canonicalDenominatorBound_step_same_iff_margin` — the same-`b` transition is
  exactly the stronger-margin inequality.
* `canonicalDenominatorBound_of_same_step_margins` — the global canonical
  denominator-growth bound follows from that same-step margin at every same
  transition.
* `canonicalDenominatorBound_iff_same_step_margins` — conversely, the global
  canonical denominator-growth bound is equivalent to filling exactly those
  same-step margins; up-steps contribute no remaining arithmetic hole.
* `canonicalDenominator_failure_forces_top_quotient` — any counterexample to
  the denominator bound must put the quotient `3^a / 2^(b+1)` at the top
  Mersenne block `2^a - 1`.
* `canonicalDenominatorBound_iff_not_top_quotient` — with the parent-barrier
  upper bound in force, the denominator-growth bound is exactly avoidance of
  that top quotient block.
* `canonicalDenominatorBound_iff_not_last_dyadic_slice` — the same bound is
  exactly avoidance of the final dyadic slice of width `2^(b+1)` below the
  parent ceiling `2^(a+b+1)`.
* `canonicalDenominatorBound_all_iff_not_top_quotient` /
  `canonicalDenominatorBound_all_iff_not_last_dyadic_slice` — the global
  canonical denominator-growth target is exactly the corresponding global
  avoidance statement.
* `canonicalWord_not_inTwoGenSemigroup_of_sameStepMargins` — the named margins
  close the semigroup gap on every canonical parent barrier with `a ≥ 3`.
* `canonicalDenominator_failure_iff_top_remainder_exists` — failure is exactly
  existence of a positive remainder inside the final dyadic slice.
* `canonicalDenominator_no_top_remainder_iff_not_last_dyadic_slice` — absence
  of a positive remainder witness is exactly avoidance of that slice.
* `canonicalDenominatorBound_all_iff_no_top_remainder_exists` — the global
  target is exactly absence of those positive top-slice remainder witnesses.
* `canonicalWord_seed_exists` — every canonical barrier's first-passage
  cylinder `canonicalWord a b ++ [E]` has a realizing seed, built from the
  Bézout residue `σ` with `3^a · σ ≡ 1 (mod 2^{b+1})`.
* `canonicalSameStepMargins_below_3000` — the same-step margins hold by
  kernel `decide` for every `3 ≤ a < 3000` (this instance recomputes
  `canonicalTrailingEven` from scratch at each `a`, so it costs `O(N^2)`).
* `canonicalMarginRun` — a near-linear, `O(N)`-total accumulator that walks
  the canonical trailing-even recurrence forward one step at a time while
  checking the same-step margin at every point visited, instead of
  recomputing `canonicalTrailingEven` from scratch at each `a`.
* `canonicalSameStepMargins_below_20000` — the same-step margins hold by
  kernel `decide` for every `3 ≤ a < 20000`, via the near-linear
  `canonicalMarginRun` sweep — the blueprint's stated numerical target.

## Tags

collatz, parent barrier, canonical seed, modular inverse
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

/-! ## The canonical front-loaded word -/

theorem oddCount_replicate_O (a : Nat) : oddCount (List.replicate a Branch.O) = a := by
  induction a with
  | zero => rfl
  | succ n ih => simp [List.replicate_succ, oddCount, ih]

theorem oddCount_replicate_E (b : Nat) : oddCount (List.replicate b Branch.E) = 0 := by
  induction b with
  | zero => rfl
  | succ n ih => simp [List.replicate_succ, oddCount, ih]

/-- The canonical front-loaded parent-barrier word: `a` odd steps then `b` even steps. -/
def canonicalWord (a b : Nat) : List Branch :=
  List.replicate a Branch.O ++ List.replicate b Branch.E

theorem oddCount_canonicalWord (a b : Nat) : oddCount (canonicalWord a b) = a := by
  unfold canonicalWord
  rw [oddCount_append, oddCount_replicate_O, oddCount_replicate_E]
  omega

theorem length_canonicalWord (a b : Nat) : (canonicalWord a b).length = a + b := by
  simp [canonicalWord]

theorem traceA_canonicalWord (a b : Nat) : (traceOfWord (canonicalWord a b)).A = 3 ^ a := by
  rw [trace_A_eq_three_pow_oddCount, oddCount_canonicalWord]

theorem traceB_canonicalWord (a b : Nat) : (traceOfWord (canonicalWord a b)).B = 2 ^ (a + b) := by
  rw [trace_B_eq_two_pow_length, length_canonicalWord]

/-- The offset accumulated by a bare odd run is `3^a - 2^a`. -/
theorem traceC_replicate_O (a : Nat) :
    (traceOfWord (List.replicate a Branch.O)).C = 3 ^ a - 2 ^ a := by
  induction a with
  | zero => rfl
  | succ a ih =>
    rw [List.replicate_succ', traceOfWord, List.foldl_append]
    simp [traceStep, traceOfWord] at ih ⊢
    have hB : (List.foldl traceStep identityTrace
        (List.replicate a Branch.O)).B = 2 ^ a := by
      simpa [traceOfWord, List.length_replicate, identityTrace] using
        trace_B_eq_two_pow_length (List.replicate a Branch.O)
    rw [ih, hB]
    have hpow3 : 3 ^ (a + 1) = 3 * 3 ^ a := by
      rw [Nat.pow_succ, Nat.mul_comm]
    have hpow2 : 2 ^ (a + 1) = 2 * 2 ^ a := by
      rw [Nat.pow_succ, Nat.mul_comm]
    have hle : 2 ^ a ≤ 3 ^ a := Nat.pow_le_pow_left (by omega) a
    rw [hpow3, hpow2]
    omega

/-- Appending trailing even branches does not change the affine offset. -/
theorem traceC_append_replicate_E (w : List Branch) (b : Nat) :
    (traceOfWord (w ++ List.replicate b Branch.E)).C = (traceOfWord w).C := by
  induction b with
  | zero => simp
  | succ b ih =>
    rw [List.replicate_succ', ← List.append_assoc, traceOfWord, List.foldl_append]
    simp [traceStep, traceOfWord] at ih ⊢
    exact ih

/-- The canonical front-loaded word has offset `3^a - 2^a`. -/
theorem traceC_canonicalWord (a b : Nat) :
    (traceOfWord (canonicalWord a b)).C = 3 ^ a - 2 ^ a := by
  unfold canonicalWord
  rw [traceC_append_replicate_E, traceC_replicate_O]

/-- The canonical parent offset is `3^a - 2^a`. -/
theorem parentC_canonicalWord (a b : Nat) :
    parentC (canonicalWord a b) = 3 ^ a - 2 ^ a := by
  unfold parentC
  exact traceC_canonicalWord a b

/-- The canonical gap generator is `2^(a+b+1) - 3^a`. -/
theorem parentD_canonicalWord (a b : Nat) :
    parentD (canonicalWord a b) = 2 ^ (a + b + 1) - 3 ^ a := by
  unfold parentD parentA parentB
  rw [traceA_canonicalWord, traceB_canonicalWord]
  have hpow : 2 ^ (a + b + 1) = 2 * 2 ^ (a + b) := by
    rw [Nat.pow_succ, Nat.mul_comm]
  rw [hpow]

/-- The canonical parent modulus is `2^(a+b+1)`. -/
theorem parentM_canonicalWord (a b : Nat) :
    parentM (canonicalWord a b) = 2 ^ (a + b + 1) := by
  unfold parentM parentB
  rw [traceB_canonicalWord]
  rw [Nat.pow_succ, Nat.mul_comm]

/-- A canonical denominator lower bound forces the strict gap at any positive
coefficient seed `σ * 2^a - 1`. -/
theorem canonicalWord_gap_of_denominator_bound {a b σ : Nat}
    (hD : 2 ^ (b + 1) ≤ parentD (canonicalWord a b))
    (hσ : 0 < σ) :
    parentC (canonicalWord a b) < parentD (canonicalWord a b) * (σ * 2 ^ a - 1) := by
  rw [parentC_canonicalWord, parentD_canonicalWord] at *
  have hpow : 2 ^ (a + b + 1) = 2 ^ a * 2 ^ (b + 1) := by
    rw [← Nat.pow_add]
    congr 1
  let T := 2 ^ (b + 1)
  let D := 2 ^ (a + b + 1) - 3 ^ a
  let S := σ * 2 ^ a
  have h2a : 0 < 2 ^ a := Nat.pow_pos (by omega)
  have h3a : 0 < 3 ^ a := Nat.pow_pos (by omega)
  have hTpos : 0 < T := by
    dsimp [T]
    exact Nat.pow_pos (by omega)
  have hC_lt : 3 ^ a - 2 ^ a < 3 ^ a := Nat.sub_lt h3a h2a
  have h3_le_mid : 3 ^ a ≤ T * (2 ^ a - 1) := by
    have hT : T ≤ D := by simpa [D, T] using hD
    have hsum : T + 3 ^ a ≤ 2 ^ (a + b + 1) := by
      dsimp [D] at hT
      omega
    have hmul : T * (2 ^ a - 1) = 2 ^ (a + b + 1) - T := by
      rw [hpow]
      rw [Nat.mul_comm T (2 ^ a - 1), Nat.sub_mul, Nat.one_mul]
    rw [hmul]
    omega
  have hS_le : 2 ^ a - 1 ≤ S - 1 := by
    have hS : 2 ^ a ≤ S := by
      dsimp [S]
      calc 2 ^ a = 1 * 2 ^ a := by rw [Nat.one_mul]
        _ ≤ σ * 2 ^ a := Nat.mul_le_mul_right _ (by omega)
    omega
  have hmid_le : T * (2 ^ a - 1) ≤ D * (S - 1) := by
    have hT : T ≤ D := by simpa [D, T] using hD
    exact Nat.mul_le_mul hT hS_le
  exact Nat.lt_of_lt_of_le hC_lt (Nat.le_trans h3_le_mid hmid_le)

/-- The same gap bridge stated with the explicit canonical denominator
`2^(a+b+1) - 3^a`. -/
theorem canonicalWord_gap_of_explicit_denominator_bound {a b σ : Nat}
    (hD : 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a)
    (hσ : 0 < σ) :
    parentC (canonicalWord a b) < parentD (canonicalWord a b) * (σ * 2 ^ a - 1) := by
  exact canonicalWord_gap_of_denominator_bound (a := a) (b := b) (σ := σ)
    (by simpa [parentD_canonicalWord] using hD) hσ

/-- The same-`b` transition condition is exactly `P < 3D`, where
`D = 2^(a+b+1) - 3^a` and `P = 2^(a+b+1)`. -/
theorem canonicalDenominator_same_transition_iff {a b : Nat}
    (hbase : 3 ^ a ≤ 2 ^ (a + b + 1)) :
    (3 ^ (a + 1) < 2 ^ (a + b + 2)) ↔
      2 ^ (a + b + 1) < 3 * (2 ^ (a + b + 1) - 3 ^ a) := by
  have hpow3 : 3 ^ (a + 1) = 3 * 3 ^ a := by
    rw [Nat.pow_succ, Nat.mul_comm]
  have hpow2 : 2 ^ (a + b + 2) = 2 * 2 ^ (a + b + 1) := by
    rw [Nat.pow_succ, Nat.mul_comm]
  rw [hpow3, hpow2]
  constructor <;> intro h <;> omega

/-- Same-`b` denominator update: the next denominator is `3D - P`, where
`D = 2^(a+b+1) - 3^a` and `P = 2^(a+b+1)`. -/
theorem canonicalDenominator_update_same {a b : Nat}
    (hbase : 2 ^ (a + b + 1) ≤ 3 * (2 ^ (a + b + 1) - 3 ^ a)) :
    2 ^ (a + b + 2) - 3 ^ (a + 1) =
      3 * (2 ^ (a + b + 1) - 3 ^ a) - 2 ^ (a + b + 1) := by
  have hpow3 : 3 ^ (a + 1) = 3 * 3 ^ a := by
    rw [Nat.pow_succ, Nat.mul_comm]
  have hpow2 : 2 ^ (a + b + 2) = 2 * 2 ^ (a + b + 1) := by
    rw [Nat.pow_succ, Nat.mul_comm]
  rw [hpow3, hpow2]
  omega

/-- Up-step denominator update: the next denominator is `P + 3D`, where
`D = 2^(a+b+1) - 3^a` and `P = 2^(a+b+1)`. -/
theorem canonicalDenominator_update_up {a b : Nat}
    (hbase : 3 ^ a ≤ 2 ^ (a + b + 1)) :
    2 ^ (a + b + 3) - 3 ^ (a + 1) =
      2 ^ (a + b + 1) + 3 * (2 ^ (a + b + 1) - 3 ^ a) := by
  have hpow3 : 3 ^ (a + 1) = 3 * 3 ^ a := by
    rw [Nat.pow_succ, Nat.mul_comm]
  have hpow2 : 2 ^ (a + b + 3) = 4 * 2 ^ (a + b + 1) := by
    calc 2 ^ (a + b + 3) = 2 ^ ((a + b + 1) + 2) := by congr 1
      _ = 2 ^ (a + b + 1) * 2 ^ 2 := by rw [Nat.pow_add]
      _ = 4 * 2 ^ (a + b + 1) := by omega
  rw [hpow3, hpow2]
  omega

/-- In the canonical parent-barrier range, same-`b` transitions cannot occur
consecutively: after a same-`b` advance, the next same-`b` test fails. -/
theorem canonicalDenominator_no_consecutive_same {a b : Nat}
    (hlo : 2 ^ (a + b) ≤ 3 ^ a) :
    3 * (2 ^ (a + b + 2) - 3 ^ (a + 1)) ≤ 2 ^ (a + b + 2) := by
  have hpow3 : 3 ^ (a + 1) = 3 * 3 ^ a := by
    rw [Nat.pow_succ, Nat.mul_comm]
  have hpow2 : 2 ^ (a + b + 2) = 2 * 2 ^ (a + b + 1) := by
    rw [Nat.pow_succ, Nat.mul_comm]
  rw [hpow3, hpow2]
  have hDle : 2 * (2 ^ (a + b + 1) - 3 ^ a) ≤ 2 ^ (a + b + 1) := by
    have hP : 2 ^ (a + b + 1) = 2 * 2 ^ (a + b) := by
      rw [Nat.pow_succ, Nat.mul_comm]
    rw [hP]
    omega
  omega

/-- A same-`b` transition forces the following transition to raise the
trailing-even count. -/
theorem canonicalDenominator_same_forces_next_up {a b : Nat}
    (hlo : 2 ^ (a + b) ≤ 3 ^ a)
    (hsame : 2 ^ (a + b + 1) < 3 * (2 ^ (a + b + 1) - 3 ^ a)) :
    2 ^ (a + b + 3) ≤ 3 ^ (a + 2) := by
  have hnc := canonicalDenominator_no_consecutive_same (a := a) (b := b) hlo
  have hnextDpos : 2 ^ (a + b + 1) ≤ 3 * (2 ^ (a + b + 1) - 3 ^ a) := by
    omega
  have hupdate := canonicalDenominator_update_same (a := a) (b := b) hnextDpos
  have hpow3 : 3 ^ (a + 2) = 3 * 3 ^ (a + 1) := by
    rw [Nat.pow_succ, Nat.mul_comm]
  have hpow2 : 2 ^ (a + b + 3) = 2 * 2 ^ (a + b + 2) := by
    rw [Nat.pow_succ, Nat.mul_comm]
  rw [hupdate] at hnc
  rw [hpow3, hpow2]
  omega

/-- A denominator-bound failure at `a ≥ 2` lies strictly on the next up-branch
side of the recurrence. -/
theorem canonicalDenominator_failure_forces_next_up_margin {a b : Nat}
    (ha : 2 ≤ a)
    (hfail : ¬ 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a) :
    3 * (2 ^ (a + b + 1) - 3 ^ a) < 2 ^ (a + b + 1) := by
  let T := 2 ^ (b + 1)
  let P := 2 ^ (a + b + 1)
  let D := P - 3 ^ a
  have hDltT : D < T := by
    dsimp [D, P, T]
    exact Nat.lt_of_not_ge hfail
  have hP : P = 2 ^ a * T := by
    dsimp [P, T]
    have hidx : a + (b + 1) = a + b + 1 := by omega
    rw [← hidx, Nat.pow_add]
  have hthree_le_twoa : 3 ≤ 2 ^ a := by
    calc
      3 ≤ 2 ^ 2 := by decide
      _ ≤ 2 ^ a := Nat.pow_le_pow_right (by decide) ha
  have h3T_le_P : 3 * T ≤ P := by
    rw [hP]
    exact Nat.mul_le_mul_right T hthree_le_twoa
  have h3D_lt_3T : 3 * D < 3 * T := by
    omega
  exact Nat.lt_of_lt_of_le h3D_lt_3T h3T_le_P

/-- A denominator-bound failure at `a ≥ 2` cannot be followed by a same-`b`
transition. -/
theorem canonicalDenominator_failure_forces_next_not_same {a b : Nat}
    (ha : 2 ≤ a)
    (hfail : ¬ 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a) :
    ¬ 2 ^ (a + b + 1) < 3 * (2 ^ (a + b + 1) - 3 ^ a) := by
  have hlt := canonicalDenominator_failure_forces_next_up_margin
    (a := a) (b := b) ha hfail
  intro hsame
  exact Nat.lt_asymm hsame hlt

/-- If the canonical denominator bound holds at `(a,b)`, it automatically holds
at the next odd count when the trailing-even count rises to `b+1`. -/
theorem canonicalDenominatorBound_step_up {a b : Nat}
    (hD : 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a) :
    2 ^ (b + 2) ≤ 2 ^ (a + b + 3) - 3 ^ (a + 1) := by
  have hpow3 : 3 ^ (a + 1) = 3 * 3 ^ a := by
    rw [Nat.pow_succ, Nat.mul_comm]
  have hpow2 : 2 ^ (a + b + 3) = 4 * 2 ^ (a + b + 1) := by
    calc 2 ^ (a + b + 3) = 2 ^ ((a + b + 1) + 2) := by congr 1
      _ = 2 ^ (a + b + 1) * 2 ^ 2 := by rw [Nat.pow_add]
      _ = 4 * 2 ^ (a + b + 1) := by omega
  have htarget : 2 ^ (b + 2) = 2 * 2 ^ (b + 1) := by
    rw [Nat.pow_succ, Nat.mul_comm]
  have hbase : 3 ^ a ≤ 2 ^ (a + b + 1) := by
    by_cases hb : 3 ^ a ≤ 2 ^ (a + b + 1)
    · exact hb
    · exfalso
      have hlt : 2 ^ (a + b + 1) < 3 ^ a := Nat.lt_of_not_ge hb
      have hzero : 2 ^ (a + b + 1) - 3 ^ a = 0 :=
        Nat.sub_eq_zero_of_le (Nat.le_of_lt hlt)
      have hpos : 0 < 2 ^ (b + 1) := Nat.pow_pos (by omega)
      omega
  have hsum := Nat.add_le_of_le_sub hbase hD
  rw [hpow3, hpow2, htarget]
  omega

/-- When the next odd count keeps the same trailing-even count `b`, the next
denominator bound follows from an explicit stronger-margin inequality. -/
theorem canonicalDenominatorBound_step_same_of_margin {a b : Nat}
    (hmargin :
      2 ^ (a + b + 1) + 2 ^ (b + 1) ≤ 3 * (2 ^ (a + b + 1) - 3 ^ a)) :
    2 ^ (b + 1) ≤ 2 ^ (a + b + 2) - 3 ^ (a + 1) := by
  have hpow3 : 3 ^ (a + 1) = 3 * 3 ^ a := by
    rw [Nat.pow_succ, Nat.mul_comm]
  have hpow2 : 2 ^ (a + b + 2) = 2 * 2 ^ (a + b + 1) := by
    rw [Nat.pow_succ, Nat.mul_comm]
  rw [hpow3, hpow2]
  have hbase : 3 ^ a ≤ 2 ^ (a + b + 1) := by
    by_cases hb : 3 ^ a ≤ 2 ^ (a + b + 1)
    · exact hb
    · exfalso
      have hzero : 2 ^ (a + b + 1) - 3 ^ a = 0 :=
        Nat.sub_eq_zero_of_le (Nat.le_of_lt (Nat.lt_of_not_ge hb))
      have hleftpos : 0 < 2 ^ (a + b + 1) + 2 ^ (b + 1) :=
        Nat.add_pos_left (Nat.pow_pos (by omega)) _
      omega
  omega

/-- The same-`b` next-step denominator bound is exactly the stronger-margin
inequality. -/
theorem canonicalDenominatorBound_step_same_iff_margin {a b : Nat} :
    (2 ^ (b + 1) ≤ 2 ^ (a + b + 2) - 3 ^ (a + 1)) ↔
      2 ^ (a + b + 1) + 2 ^ (b + 1) ≤ 3 * (2 ^ (a + b + 1) - 3 ^ a) := by
  constructor
  · intro hnext
    have hpow3 : 3 ^ (a + 1) = 3 * 3 ^ a := by
      rw [Nat.pow_succ, Nat.mul_comm]
    have hpow2 : 2 ^ (a + b + 2) = 2 * 2 ^ (a + b + 1) := by
      rw [Nat.pow_succ, Nat.mul_comm]
    rw [hpow3, hpow2] at hnext
    have h3base : 3 * 3 ^ a ≤ 2 * 2 ^ (a + b + 1) := by
      by_cases hle : 3 * 3 ^ a ≤ 2 * 2 ^ (a + b + 1)
      · exact hle
      · exfalso
        have hzero : 2 * 2 ^ (a + b + 1) - 3 * 3 ^ a = 0 :=
          Nat.sub_eq_zero_of_le (Nat.le_of_lt (Nat.lt_of_not_ge hle))
        have hTpos : 0 < 2 ^ (b + 1) := Nat.pow_pos (by omega)
        omega
    have hsum := Nat.add_le_of_le_sub h3base hnext
    have hmul : 3 * (2 ^ (a + b + 1) - 3 ^ a) =
        3 * 2 ^ (a + b + 1) - 3 * 3 ^ a := by
      rw [Nat.mul_sub_left_distrib]
    rw [hmul]
    omega
  · intro hmargin
    exact canonicalDenominatorBound_step_same_of_margin hmargin

/-! ## The canonical trailing-even recurrence -/

/-- The trailing-even count selected by the canonical parent-barrier inequalities.

The step from `a` to `a+1` keeps the same trailing-even count exactly when
`3^(a+1) < 2^(a+b+2)`; otherwise it raises the count by one. -/
def canonicalTrailingEven : Nat → Nat
  | 0 => 0
  | 1 => 0
  | n + 2 =>
      let b := canonicalTrailingEven (n + 1)
      if 3 ^ (n + 2) < 2 ^ (n + 1 + b + 2) then b else b + 1

/-- The recursive trailing-even count stays in the canonical parent-barrier
range `2^(a+b) ≤ 3^a < 2^(a+b+1)`, stated from `a = n+1`. -/
theorem canonicalTrailingEven_parentBarrier_range_offset :
    ∀ n, 2 ^ (n + 1 + canonicalTrailingEven (n + 1)) ≤ 3 ^ (n + 1) ∧
      3 ^ (n + 1) < 2 ^ (n + 1 + canonicalTrailingEven (n + 1) + 1) := by
  intro n
  induction n with
  | zero => decide
  | succ n ih =>
    rw [canonicalTrailingEven.eq_3]
    by_cases hsame :
        3 ^ (n + 2) < 2 ^ (n + 1 + canonicalTrailingEven (n + 1) + 2)
    · simp only [hsame, ite_true]
      constructor
      · have hlo := ih.1
        have hpow2 : 2 ^ (n + 2 + canonicalTrailingEven (n + 1)) =
            2 * 2 ^ (n + 1 + canonicalTrailingEven (n + 1)) := by
          have hidx : n + 2 + canonicalTrailingEven (n + 1) =
              (n + 1 + canonicalTrailingEven (n + 1)) + 1 := by omega
          calc
            2 ^ (n + 2 + canonicalTrailingEven (n + 1))
                = 2 ^ ((n + 1 + canonicalTrailingEven (n + 1)) + 1) := by rw [hidx]
            _ = 2 ^ (n + 1 + canonicalTrailingEven (n + 1)) * 2 := by rw [Nat.pow_succ]
            _ = 2 * 2 ^ (n + 1 + canonicalTrailingEven (n + 1)) := by omega
        have hpow3 : 3 ^ (n + 2) = 3 * 3 ^ (n + 1) := by
          have hidx : n + 2 = (n + 1) + 1 := by omega
          calc
            3 ^ (n + 2) = 3 ^ ((n + 1) + 1) := by rw [hidx]
            _ = 3 ^ (n + 1) * 3 := by rw [Nat.pow_succ]
            _ = 3 * 3 ^ (n + 1) := by omega
        rw [hpow2, hpow3]
        exact Nat.mul_le_mul (by omega) hlo
      · simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hsame
    · simp only [hsame, ite_false]
      constructor
      · simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
          Nat.le_of_not_gt hsame
      · have hhi := ih.2
        have hpow2 :
            2 ^ (n + 2 + (canonicalTrailingEven (n + 1) + 1) + 1) =
              4 * 2 ^ (n + 1 + canonicalTrailingEven (n + 1) + 1) := by
          have hidx : n + 2 + (canonicalTrailingEven (n + 1) + 1) + 1 =
              (n + 1 + canonicalTrailingEven (n + 1) + 1) + 2 := by omega
          calc
            2 ^ (n + 2 + (canonicalTrailingEven (n + 1) + 1) + 1)
                = 2 ^ ((n + 1 + canonicalTrailingEven (n + 1) + 1) + 2) := by
                  rw [hidx]
            _ = 2 ^ (n + 1 + canonicalTrailingEven (n + 1) + 1) * 2 ^ 2 := by
                  rw [Nat.pow_add]
            _ = 4 * 2 ^ (n + 1 + canonicalTrailingEven (n + 1) + 1) := by omega
        have hpow3 : 3 ^ (n + 2) = 3 * 3 ^ (n + 1) := by
          have hidx : n + 2 = (n + 1) + 1 := by omega
          calc
            3 ^ (n + 2) = 3 ^ ((n + 1) + 1) := by rw [hidx]
            _ = 3 ^ (n + 1) * 3 := by rw [Nat.pow_succ]
            _ = 3 * 3 ^ (n + 1) := by omega
        rw [hpow2, hpow3]
        have h3 :
            3 * 3 ^ (n + 1) <
              3 * 2 ^ (n + 1 + canonicalTrailingEven (n + 1) + 1) :=
          Nat.mul_lt_mul_of_pos_left hhi (by omega)
        have h4 :
            3 * 2 ^ (n + 1 + canonicalTrailingEven (n + 1) + 1) ≤
              4 * 2 ^ (n + 1 + canonicalTrailingEven (n + 1) + 1) :=
          Nat.mul_le_mul_right _ (by omega)
        exact Nat.lt_of_lt_of_le h3 h4

/-- The recursive trailing-even count stays in the canonical parent-barrier
range `2^(a+b) ≤ 3^a < 2^(a+b+1)`. -/
theorem canonicalTrailingEven_parentBarrier_range {a : Nat} (ha : 1 ≤ a) :
    2 ^ (a + canonicalTrailingEven a) ≤ 3 ^ a ∧
      3 ^ a < 2 ^ (a + canonicalTrailingEven a + 1) := by
  have h := canonicalTrailingEven_parentBarrier_range_offset (a - 1)
  have hidx : a - 1 + 1 = a := by omega
  simpa [hidx] using h

/-- The next-step denominator bound follows from the current denominator bound
and, in the same-`b` branch, the stronger same-step margin. -/
theorem canonicalDenominatorBound_step {a b : Nat}
    (hD : 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a)
    (hmargin : 3 ^ (a + 1) < 2 ^ (a + b + 2) →
      2 ^ (a + b + 1) + 2 ^ (b + 1) ≤
        3 * (2 ^ (a + b + 1) - 3 ^ a)) :
    2 ^ ((if 3 ^ (a + 1) < 2 ^ (a + b + 2) then b else b + 1) + 1) ≤
      2 ^ (a + 1 +
          (if 3 ^ (a + 1) < 2 ^ (a + b + 2) then b else b + 1) + 1) -
        3 ^ (a + 1) := by
  by_cases hsame : 3 ^ (a + 1) < 2 ^ (a + b + 2)
  · simp [hsame]
    have h := canonicalDenominatorBound_step_same_of_margin (a := a) (b := b)
      (hmargin hsame)
    simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h
  · simp [hsame]
    have h := canonicalDenominatorBound_step_up (a := a) (b := b) hD
    simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h

/-- The global canonical denominator-growth bound follows from the same-step
margin at every same-`b` transition. This isolates the remaining arithmetic
frontier after the up-step propagation has been discharged. -/
theorem canonicalDenominatorBound_of_same_step_margins
    (hmargin : ∀ a, 3 ≤ a →
      3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2) →
        2 ^ (a + canonicalTrailingEven a + 1) +
            2 ^ (canonicalTrailingEven a + 1) ≤
          3 * (2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a)) :
    ∀ a, 3 ≤ a →
      2 ^ (canonicalTrailingEven a + 1) ≤
        2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a := by
  intro a ha
  have hoff :
      ∀ n, 2 ^ (canonicalTrailingEven (n + 3) + 1) ≤
        2 ^ (n + 3 + canonicalTrailingEven (n + 3) + 1) - 3 ^ (n + 3) := by
    intro n
    induction n with
    | zero => decide
    | succ n ih =>
      rw [canonicalTrailingEven.eq_3]
      have hstep := canonicalDenominatorBound_step (a := n + 3)
        (b := canonicalTrailingEven (n + 3)) ih (hmargin (n + 3) (by omega))
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hstep
  have h := hoff (a - 3)
  have hidx : a - 3 + 3 = a := by omega
  simpa [hidx] using h

/-- A same-`b` transition leaves the recursive trailing-even count unchanged. -/
theorem canonicalTrailingEven_succ_eq_of_same {a : Nat} (ha : 1 ≤ a)
    (hsame : 3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2)) :
    canonicalTrailingEven (a + 1) = canonicalTrailingEven a := by
  obtain ⟨n, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : a ≠ 0)
  rw [canonicalTrailingEven.eq_3]
  exact if_pos hsame

/-- The canonical denominator-growth bound is equivalent to filling every
same-step boundary margin.

Up-steps propagate the bound automatically; this theorem says the only
remaining arithmetic hole in the canonical recurrence is the same-`b` margin
`2^(a+b+1) + 2^(b+1) ≤ 3D`. -/
theorem canonicalDenominatorBound_iff_same_step_margins :
    (∀ a, 3 ≤ a →
      2 ^ (canonicalTrailingEven a + 1) ≤
        2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a) ↔
    (∀ a, 3 ≤ a →
      3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2) →
        2 ^ (a + canonicalTrailingEven a + 1) +
            2 ^ (canonicalTrailingEven a + 1) ≤
          3 * (2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a)) := by
  constructor
  · intro hD a ha hsame
    have htrail :
        canonicalTrailingEven (a + 1) = canonicalTrailingEven a :=
      canonicalTrailingEven_succ_eq_of_same (a := a) (by omega) hsame
    have hnext := hD (a + 1) (by omega)
    rw [htrail] at hnext
    have hnext' :
        2 ^ (canonicalTrailingEven a + 1) ≤
          2 ^ (a + canonicalTrailingEven a + 2) - 3 ^ (a + 1) := by
      have hpow :
          2 ^ (a + 1 + canonicalTrailingEven a + 1) =
            2 ^ (a + canonicalTrailingEven a + 2) := by
        congr 1
        omega
      rw [hpow] at hnext
      exact hnext
    exact (canonicalDenominatorBound_step_same_iff_margin
      (a := a) (b := canonicalTrailingEven a)).mp hnext'
  · intro hmargin
    exact canonicalDenominatorBound_of_same_step_margins hmargin

/-- Under the parent-barrier upper bound, a failure of the denominator-growth
bound forces the high quotient to be the top Mersenne block.

Equivalently, a counterexample cannot be an arbitrary small gap: it must place
`3^a` in the last quotient block below `2^(a+b+1)`, with
`3^a / 2^(b+1) = 2^a - 1`. -/
theorem canonicalDenominator_failure_forces_top_quotient {a b : Nat}
    (hhi : 3 ^ a < 2 ^ (a + b + 1))
    (hfail : ¬ 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a) :
    3 ^ a / 2 ^ (b + 1) = 2 ^ a - 1 := by
  let T := 2 ^ (b + 1)
  let P := 2 ^ (a + b + 1)
  let N := 3 ^ a
  have hTpos : 0 < T := by
    dsimp [T]
    exact Nat.pow_pos (by omega)
  have hpowpos : 0 < 2 ^ a := Nat.pow_pos (by omega)
  have hpow_ge_one : 1 ≤ 2 ^ a := hpowpos
  have hP : P = 2 ^ a * T := by
    dsimp [P, T]
    have hidx : a + (b + 1) = a + b + 1 := by omega
    rw [← hidx, Nat.pow_add]
  have hNleP : N ≤ P := by
    dsimp [N, P]
    exact Nat.le_of_lt hhi
  have hfail_lt : P - N < T := by
    dsimp [P, N, T]
    exact Nat.lt_of_not_ge hfail
  have hP_lt_T_add_N : P < T + N := by omega
  have htop_mul : (2 ^ a - 1) * T = P - T := by
    calc
      (2 ^ a - 1) * T = 2 ^ a * T - 1 * T := by rw [Nat.sub_mul]
      _ = 2 ^ a * T - T := by rw [Nat.one_mul]
      _ = P - T := by rw [hP]
  have hlo_mul : (2 ^ a - 1) * T ≤ N := by
    rw [htop_mul]
    exact (Nat.sub_le_iff_le_add).mpr (by omega)
  have hlo : 2 ^ a - 1 ≤ N / T := by
    exact (Nat.le_div_iff_mul_le hTpos).mpr hlo_mul
  have hupper : N / T < 2 ^ a := by
    exact (Nat.div_lt_iff_lt_mul hTpos).mpr (by
      rw [← hP]
      exact hhi)
  have hle : N / T ≤ 2 ^ a - 1 := by
    exact (Nat.le_sub_iff_add_le hpow_ge_one).mpr (by omega)
  exact Nat.le_antisymm hle hlo

/-- Powers of three are odd, stated as an explicit witness. -/
theorem three_pow_odd_witness (a : Nat) : ∃ m, 3 ^ a = 2 * m + 1 := by
  induction a with
  | zero => exact ⟨0, by decide⟩
  | succ a ih =>
    rcases ih with ⟨m, hm⟩
    refine ⟨3 * m + 1, ?_⟩
    rw [Nat.pow_succ, hm]
    omega

/-- A power of three cannot equal a positive two-block multiple of the Mersenne
block `2^a - 1`. -/
theorem three_pow_ne_mersenne_two_block (a b : Nat) :
    3 ^ a ≠ (2 ^ a - 1) * 2 ^ (b + 1) := by
  have hodd := three_pow_odd_witness a
  intro h
  rcases hodd with ⟨m, hm⟩
  have heven : (2 ^ a - 1) * 2 ^ (b + 1) =
      2 * ((2 ^ a - 1) * 2 ^ b) := by
    calc
      (2 ^ a - 1) * 2 ^ (b + 1)
          = (2 ^ a - 1) * (2 ^ b * 2) := by rw [Nat.pow_succ]
      _ = ((2 ^ a - 1) * 2 ^ b) * 2 := by rw [Nat.mul_assoc]
      _ = 2 * ((2 ^ a - 1) * 2 ^ b) := by rw [Nat.mul_comm]
  rw [heven] at h
  omega

/-- Under the parent-barrier upper bound, landing in the top quotient block
forces failure of the denominator-growth bound. -/
theorem canonicalDenominator_top_quotient_forces_failure {a b : Nat}
    (hhi : 3 ^ a < 2 ^ (a + b + 1))
    (htop : 3 ^ a / 2 ^ (b + 1) = 2 ^ a - 1) :
    ¬ 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a := by
  let T := 2 ^ (b + 1)
  let P := 2 ^ (a + b + 1)
  let N := 3 ^ a
  have hTpos : 0 < T := by
    dsimp [T]
    exact Nat.pow_pos (by omega)
  have hNleP : N ≤ P := by
    dsimp [N, P]
    exact Nat.le_of_lt hhi
  have hP : P = 2 ^ a * T := by
    dsimp [P, T]
    have hidx : a + (b + 1) = a + b + 1 := by omega
    rw [← hidx, Nat.pow_add]
  have htop_mul : (2 ^ a - 1) * T = P - T := by
    calc
      (2 ^ a - 1) * T = 2 ^ a * T - 1 * T := by rw [Nat.sub_mul]
      _ = 2 ^ a * T - T := by rw [Nat.one_mul]
      _ = P - T := by rw [hP]
  have hblock_le : P - T ≤ N := by
    rw [← htop_mul]
    exact (Nat.le_div_iff_mul_le hTpos).mp (by
      rw [htop]
      exact Nat.le_refl _)
  intro hD
  have hsum_le : T + N ≤ P := Nat.add_le_of_le_sub hNleP hD
  have hP_le_sum : P ≤ T + N := by
    have h := (Nat.sub_le_iff_le_add).mp hblock_le
    omega
  have hN_eq : N = P - T := by omega
  have hneq := three_pow_ne_mersenne_two_block a b
  dsimp [N] at hN_eq
  rw [← htop_mul] at hN_eq
  exact hneq hN_eq

/-- Under the parent-barrier upper bound, the denominator-growth bound is
exactly the assertion that `3^a` avoids the top quotient block below
`2^(a+b+1)`. -/
theorem canonicalDenominatorBound_iff_not_top_quotient {a b : Nat}
    (hhi : 3 ^ a < 2 ^ (a + b + 1)) :
    (2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a) ↔
      ¬ 3 ^ a / 2 ^ (b + 1) = 2 ^ a - 1 := by
  constructor
  · intro hD htop
    exact (canonicalDenominator_top_quotient_forces_failure hhi htop) hD
  · intro hnot
    by_cases hD : 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a
    · exact hD
    · exfalso
      exact hnot (canonicalDenominator_failure_forces_top_quotient hhi hD)

/-- Under the parent-barrier upper bound, the denominator-growth bound is
exactly avoidance of the final dyadic slice below the parent ceiling.

The forbidden slice has width `2^(b+1)` and left endpoint
`2^(a+b+1) - 2^(b+1)`. -/
theorem canonicalDenominatorBound_iff_not_last_dyadic_slice {a b : Nat}
    (hhi : 3 ^ a < 2 ^ (a + b + 1)) :
    (2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a) ↔
      ¬ 2 ^ (a + b + 1) - 2 ^ (b + 1) < 3 ^ a := by
  let T := 2 ^ (b + 1)
  let P := 2 ^ (a + b + 1)
  let N := 3 ^ a
  have hNleP : N ≤ P := by
    dsimp [N, P]
    exact Nat.le_of_lt hhi
  have hP : P = 2 ^ a * T := by
    dsimp [P, T]
    have hidx : a + (b + 1) = a + b + 1 := by omega
    rw [← hidx, Nat.pow_add]
  have hTleP : T ≤ P := by
    rw [hP]
    calc
      T = 1 * T := by rw [Nat.one_mul]
      _ ≤ 2 ^ a * T := Nat.mul_le_mul_right _ (by
        exact Nat.succ_le_of_lt (Nat.pow_pos (by omega) : 0 < 2 ^ a))
  constructor
  · intro hD hlast
    have hsum : T + N ≤ P := Nat.add_le_of_le_sub hNleP hD
    have hNlePT : N ≤ P - T :=
      (Nat.le_sub_iff_add_le hTleP).mpr (by omega)
    omega
  · intro hnot
    have hNlePT : N ≤ P - T := Nat.le_of_not_gt hnot
    have hsum' : N + T ≤ P :=
      (Nat.le_sub_iff_add_le hTleP).mp hNlePT
    exact (Nat.le_sub_iff_add_le hNleP).mpr (by omega)

/-- The global canonical denominator-growth bound is exactly global avoidance
of the top quotient block. -/
theorem canonicalDenominatorBound_all_iff_not_top_quotient :
    (∀ a, 3 ≤ a →
      2 ^ (canonicalTrailingEven a + 1) ≤
        2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a) ↔
    (∀ a, 3 ≤ a →
      ¬ 3 ^ a / 2 ^ (canonicalTrailingEven a + 1) = 2 ^ a - 1) := by
  constructor
  · intro hD a ha
    have hhi := (canonicalTrailingEven_parentBarrier_range (a := a) (by omega)).2
    exact (canonicalDenominatorBound_iff_not_top_quotient
      (a := a) (b := canonicalTrailingEven a) hhi).mp (hD a ha)
  · intro havoid a ha
    have hhi := (canonicalTrailingEven_parentBarrier_range (a := a) (by omega)).2
    exact (canonicalDenominatorBound_iff_not_top_quotient
      (a := a) (b := canonicalTrailingEven a) hhi).mpr (havoid a ha)

/-- The global canonical denominator-growth bound is exactly global avoidance
of the final dyadic slice below each canonical parent ceiling. -/
theorem canonicalDenominatorBound_all_iff_not_last_dyadic_slice :
    (∀ a, 3 ≤ a →
      2 ^ (canonicalTrailingEven a + 1) ≤
        2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a) ↔
    (∀ a, 3 ≤ a →
      ¬ 2 ^ (a + canonicalTrailingEven a + 1) -
          2 ^ (canonicalTrailingEven a + 1) < 3 ^ a) := by
  constructor
  · intro hD a ha
    have hhi := (canonicalTrailingEven_parentBarrier_range (a := a) (by omega)).2
    exact (canonicalDenominatorBound_iff_not_last_dyadic_slice
      (a := a) (b := canonicalTrailingEven a) hhi).mp (hD a ha)
  · intro havoid a ha
    have hhi := (canonicalTrailingEven_parentBarrier_range (a := a) (by omega)).2
    exact (canonicalDenominatorBound_iff_not_last_dyadic_slice
      (a := a) (b := canonicalTrailingEven a) hhi).mpr (havoid a ha)

/-- Under the parent-barrier upper bound, failure of the denominator-growth
bound is exactly the existence of a positive remainder in the final dyadic
slice.

The witness `ρ` records the exact depth of `3^a` inside the forbidden slice:
`3^a = (2^a - 1) * 2^(b+1) + ρ` with `0 < ρ < 2^(b+1)`. -/
theorem canonicalDenominator_failure_iff_top_remainder_exists {a b : Nat}
    (hhi : 3 ^ a < 2 ^ (a + b + 1)) :
    (¬ 2 ^ (b + 1) ≤ 2 ^ (a + b + 1) - 3 ^ a) ↔
      ∃ ρ, 0 < ρ ∧ ρ < 2 ^ (b + 1) ∧
        3 ^ a = (2 ^ a - 1) * 2 ^ (b + 1) + ρ := by
  let T := 2 ^ (b + 1)
  let P := 2 ^ (a + b + 1)
  let N := 3 ^ a
  have hNleP : N ≤ P := by
    dsimp [N, P]
    exact Nat.le_of_lt hhi
  have hP : P = 2 ^ a * T := by
    dsimp [P, T]
    have hidx : a + (b + 1) = a + b + 1 := by omega
    rw [← hidx, Nat.pow_add]
  have hTleP : T ≤ P := by
    rw [hP]
    calc
      T = 1 * T := by rw [Nat.one_mul]
      _ ≤ 2 ^ a * T := Nat.mul_le_mul_right _ (Nat.pow_pos (by omega))
  have htop_mul : (2 ^ a - 1) * T = P - T := by
    calc
      (2 ^ a - 1) * T = 2 ^ a * T - 1 * T := by rw [Nat.sub_mul]
      _ = 2 ^ a * T - T := by rw [Nat.one_mul]
      _ = P - T := by rw [hP]
  constructor
  · intro hfail
    have hslice : P - T < N := by
      by_cases hslice : P - T < N
      · exact hslice
      · exfalso
        have hbound : T ≤ P - N := by
          have hiff := canonicalDenominatorBound_iff_not_last_dyadic_slice
            (a := a) (b := b) hhi
          exact by simpa [T, P, N] using hiff.mpr hslice
        exact hfail (by simpa [T, P, N] using hbound)
    have hbase_le : P - T ≤ N := Nat.le_of_lt hslice
    have hdecomp_sum : N - (P - T) + (P - T) = N :=
      Nat.sub_add_cancel hbase_le
    have hdecomp_left : P - T + (N - (P - T)) = N := by
      rw [Nat.add_comm]
      exact hdecomp_sum
    refine ⟨N - (P - T), ?_, ?_, ?_⟩
    · exact Nat.sub_pos_of_lt hslice
    · have hNltP : N < P := by simpa [N, P] using hhi
      have hceil_sum : P - T + T = P := Nat.sub_add_cancel hTleP
      have hadd_lt : P - T + (N - (P - T)) < P - T + T := by
        rw [hdecomp_left, hceil_sum]
        exact hNltP
      exact Nat.lt_of_add_lt_add_left hadd_lt
    · have hdecomp : N = (P - T) + (N - (P - T)) := hdecomp_left.symm
      have htarget : N = (2 ^ a - 1) * T + (N - (P - T)) := by
        rw [htop_mul]
        exact hdecomp
      simpa [N, T] using htarget
  · intro hrem
    rcases hrem with ⟨ρ, hρpos, _hρlt, hN⟩
    intro hD
    have hsum : T + N ≤ P := Nat.add_le_of_le_sub hNleP hD
    have hN' : N = (2 ^ a - 1) * T + ρ := by
      simpa [N, T] using hN
    rw [hN', htop_mul] at hsum
    omega

/-- Absence of a positive top-slice remainder witness is exactly avoidance of
the final dyadic slice. -/
theorem canonicalDenominator_no_top_remainder_iff_not_last_dyadic_slice {a b : Nat}
    (hhi : 3 ^ a < 2 ^ (a + b + 1)) :
    (¬ ∃ ρ, 0 < ρ ∧ ρ < 2 ^ (b + 1) ∧
      3 ^ a = (2 ^ a - 1) * 2 ^ (b + 1) + ρ) ↔
    ¬ 2 ^ (a + b + 1) - 2 ^ (b + 1) < 3 ^ a := by
  let T := 2 ^ (b + 1)
  let P := 2 ^ (a + b + 1)
  let N := 3 ^ a
  have hNltP : N < P := by simpa [N, P] using hhi
  have hP : P = 2 ^ a * T := by
    dsimp [P, T]
    have hidx : a + (b + 1) = a + b + 1 := by omega
    rw [← hidx, Nat.pow_add]
  have hTleP : T ≤ P := by
    rw [hP]
    calc
      T = 1 * T := by rw [Nat.one_mul]
      _ ≤ 2 ^ a * T := Nat.mul_le_mul_right _ (Nat.pow_pos (by omega))
  have htop_mul : (2 ^ a - 1) * T = P - T := by
    calc
      (2 ^ a - 1) * T = 2 ^ a * T - 1 * T := by rw [Nat.sub_mul]
      _ = 2 ^ a * T - T := by rw [Nat.one_mul]
      _ = P - T := by rw [hP]
  constructor
  · intro hno hslice
    have hslice' : P - T < N := by simpa [P, T, N] using hslice
    have hbase_le : P - T ≤ N := Nat.le_of_lt hslice'
    have hdecomp_sum : N - (P - T) + (P - T) = N :=
      Nat.sub_add_cancel hbase_le
    have hdecomp_left : P - T + (N - (P - T)) = N := by
      rw [Nat.add_comm]
      exact hdecomp_sum
    have hρlt : N - (P - T) < T := by
      have hceil_sum : P - T + T = P := Nat.sub_add_cancel hTleP
      have hadd_lt : P - T + (N - (P - T)) < P - T + T := by
        rw [hdecomp_left, hceil_sum]
        exact hNltP
      exact Nat.lt_of_add_lt_add_left hadd_lt
    have htarget : N = (2 ^ a - 1) * T + (N - (P - T)) := by
      rw [htop_mul]
      exact hdecomp_left.symm
    exact hno ⟨N - (P - T), Nat.sub_pos_of_lt hslice', hρlt,
      by simpa [N, T] using htarget⟩
  · intro hnot hrem
    rcases hrem with ⟨ρ, hρpos, _hρlt, hN⟩
    have hN' : N = (2 ^ a - 1) * T + ρ := by simpa [N, T] using hN
    have hslice' : P - T < N := by
      rw [hN', htop_mul]
      omega
    exact hnot (by simpa [P, T, N] using hslice')

/-- The global canonical denominator-growth target is exactly absence of a
positive remainder witness in every canonical final dyadic slice. -/
theorem canonicalDenominatorBound_all_iff_no_top_remainder_exists :
    (∀ a, 3 ≤ a →
      2 ^ (canonicalTrailingEven a + 1) ≤
        2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a) ↔
    (∀ a, 3 ≤ a →
      ¬ ∃ ρ,
        0 < ρ ∧ ρ < 2 ^ (canonicalTrailingEven a + 1) ∧
          3 ^ a = (2 ^ a - 1) * 2 ^ (canonicalTrailingEven a + 1) + ρ) := by
  constructor
  · intro hbound a ha
    have hlast := (canonicalDenominatorBound_all_iff_not_last_dyadic_slice.mp hbound) a ha
    have hhi := (canonicalTrailingEven_parentBarrier_range (a := a) (by omega)).2
    exact (canonicalDenominator_no_top_remainder_iff_not_last_dyadic_slice
      (a := a) (b := canonicalTrailingEven a) hhi).mpr hlast
  · intro hno
    exact canonicalDenominatorBound_all_iff_not_last_dyadic_slice.mpr (by
      intro a ha
      have hhi := (canonicalTrailingEven_parentBarrier_range (a := a) (by omega)).2
      exact (canonicalDenominator_no_top_remainder_iff_not_last_dyadic_slice
        (a := a) (b := canonicalTrailingEven a) hhi).mp (hno a ha))

theorem take_canonicalWord_le {a b k : Nat} (hk : k ≤ a) :
    (canonicalWord a b).take k = List.replicate k Branch.O := by
  unfold canonicalWord
  rw [List.take_append]
  have hlen : (List.replicate a Branch.O).length = a := by simp
  rw [List.take_replicate, Nat.min_eq_left hk, hlen]
  have hz : k - a = 0 := by omega
  rw [hz, List.take_zero, List.append_nil]

theorem take_canonicalWord_ge {a b k : Nat} (hka : a ≤ k) (hkb : k - a ≤ b) :
    (canonicalWord a b).take k =
      List.replicate a Branch.O ++ List.replicate (k - a) Branch.E := by
  unfold canonicalWord
  rw [List.take_append]
  have hlen : (List.replicate a Branch.O).length = a := by simp
  rw [hlen, List.take_replicate, Nat.min_eq_right hka, List.take_replicate,
    Nat.min_eq_left hkb]

/-- Strict monotonicity of `2^·`, proved directly (avoids the `Classical.choice`
pulled in by core's `Nat.pow_lt_pow_right`). -/
theorem two_pow_lt_two_pow_of_lt {i j : Nat} (h : i < j) : (2:Nat) ^ i < 2 ^ j := by
  have hsplit : (2:Nat) ^ j = 2 ^ i * 2 ^ (j - i) := by
    rw [← Nat.pow_add]; congr 1; omega
  have hpos : 0 < (2:Nat) ^ i := Nat.pow_pos (by omega)
  have h2 : 2 ≤ (2:Nat) ^ (j - i) := by
    have h1 : (2:Nat) ^ 1 ≤ 2 ^ (j - i) := Nat.pow_le_pow_right (by omega) (by omega)
    simpa using h1
  calc (2:Nat) ^ i = 2 ^ i * 1 := by rw [Nat.mul_one]
    _ < 2 ^ i * 2 ^ (j - i) := Nat.mul_lt_mul_of_pos_left (by omega) hpos
    _ = 2 ^ j := hsplit.symm

/-- The canonical word is a parent barrier exactly under the standard
crossing inequality `2^(a+b) ≤ 3^a < 2^(a+b+1)`. -/
theorem canonicalWord_isParentBarrier {a b : Nat}
    (hlo : 2 ^ (a + b) ≤ 3 ^ a) (hhi : 3 ^ a < 2 ^ (a + b + 1)) :
    ParentBarrier (canonicalWord a b) := by
  refine ⟨?_, ?_, ?_⟩
  · rw [traceA_canonicalWord, traceB_canonicalWord]; exact hlo
  · rw [traceA_canonicalWord, traceB_canonicalWord, Nat.pow_succ] at *
    omega
  · intro k hk
    rw [length_canonicalWord] at hk
    unfold CoeffNoncontracting
    by_cases hka : k ≤ a
    · rw [take_canonicalWord_le hka, trace_A_eq_three_pow_oddCount, trace_B_eq_two_pow_length,
        oddCount_replicate_O, List.length_replicate]
      exact Nat.pow_le_pow_left (by omega) k
    · rw [take_canonicalWord_ge (by omega) (by omega), trace_A_eq_three_pow_oddCount,
        trace_B_eq_two_pow_length, oddCount_append, oddCount_replicate_O, oddCount_replicate_E,
        List.length_append, List.length_replicate, List.length_replicate]
      simp only [Nat.add_zero]
      have heq : a + (k - a) = k := by omega
      rw [heq]
      have hlt : (2:Nat) ^ k < 2 ^ (a + b) := two_pow_lt_two_pow_of_lt hk
      omega

/-- The canonical word using the recursive trailing-even count is a parent
barrier. -/
theorem canonicalWord_parentBarrier_canonicalTrailingEven {a : Nat} (ha : 1 ≤ a) :
    ParentBarrier (canonicalWord a (canonicalTrailingEven a)) := by
  have h := canonicalTrailingEven_parentBarrier_range ha
  exact canonicalWord_isParentBarrier h.1 h.2

/-! ## The general Bézout seed -/

/-- General odd-run seed: `c` odd steps from `X · 2^c - 1` land on `3^c · X - 1`.
Generalizes `OddRunSeed.orbit_three_pow_two_pow_sub_one` (`X = 3^i`) to an
arbitrary positive coefficient `X`. -/
theorem orbit_two_pow_mul_sub_one :
    ∀ (c X : Nat), 0 < X → orbit (X * 2 ^ c - 1) c = 3 ^ c * X - 1 := by
  intro c
  induction c with
  | zero => intro X _; simp
  | succ c ih =>
    intro X hX
    have hval : X * 2 ^ (c + 1) = 2 * (X * 2 ^ c) := by
      rw [Nat.pow_succ, ← Nat.mul_assoc, Nat.mul_comm (X * 2 ^ c) 2]
    have hposX : 0 < X * 2 ^ c := Nat.mul_pos hX (Nat.pow_pos (by omega))
    have hassoc : 3 * (X * 2 ^ c) = 3 * X * 2 ^ c := by rw [Nat.mul_assoc]
    rw [hval, orbit_step, step_two_mul_sub_one hposX, hassoc, ih (3 * X) (by omega)]
    rw [Nat.pow_succ, Nat.mul_assoc, Nat.mul_left_comm]

/-- The parity word of `X · 2^c - 1` over `c` steps is the bare odd run `O^c`,
for any positive coefficient `X`. -/
theorem parityWord_two_pow_mul_sub_one :
    ∀ (c X : Nat), 0 < X → parityWord (X * 2 ^ c - 1) c = List.replicate c Branch.O := by
  intro c
  induction c with
  | zero => intro X _; rfl
  | succ c ih =>
    intro X hX
    have hval : X * 2 ^ (c + 1) = 2 * (X * 2 ^ c) := by
      rw [Nat.pow_succ, ← Nat.mul_assoc, Nat.mul_comm (X * 2 ^ c) 2]
    have hposX : 0 < X * 2 ^ c := Nat.mul_pos hX (Nat.pow_pos (by omega))
    have hassoc : 3 * (X * 2 ^ c) = 3 * X * 2 ^ c := by rw [Nat.mul_assoc]
    rw [hval, parityWord_succ, branch_two_mul_sub_one hposX, step_two_mul_sub_one hposX,
      hassoc, ih (3 * X) (by omega), List.replicate_succ]

/-- Running `c` even steps from `2^c · k` lands exactly on `k`. -/
theorem orbit_two_pow_mul : ∀ (c k : Nat), orbit (2 ^ c * k) c = k := by
  intro c
  induction c with
  | zero => intro k; simp
  | succ c ih =>
    intro k
    have hval : (2:Nat) ^ (c + 1) * k = 2 * (2 ^ c * k) := by
      rw [Nat.pow_succ, Nat.mul_comm (2 ^ c) 2, Nat.mul_assoc]
    have heven : (2 * (2 ^ c * k)) % 2 = 0 := by omega
    have hstep2 : step (2 * (2 ^ c * k)) = 2 ^ c * k := by
      have h := step_even_eq heven; omega
    rw [hval, orbit_step, hstep2, ih]

/-- The parity word of `2^c · k` over `c` steps is the bare even run `E^c`. -/
theorem parityWord_two_pow_mul :
    ∀ (c k : Nat), parityWord (2 ^ c * k) c = List.replicate c Branch.E := by
  intro c
  induction c with
  | zero => intro k; rfl
  | succ c ih =>
    intro k
    have hval : (2:Nat) ^ (c + 1) * k = 2 * (2 ^ c * k) := by
      rw [Nat.pow_succ, Nat.mul_comm (2 ^ c) 2, Nat.mul_assoc]
    have heven : (2 * (2 ^ c * k)) % 2 = 0 := by omega
    have hbranch : branch (2 * (2 ^ c * k)) = Branch.E := branch_even heven
    have hstep2 : step (2 * (2 ^ c * k)) = 2 ^ c * k := by
      have h := step_even_eq heven; omega
    rw [hval, parityWord_succ, hbranch, hstep2, ih, List.replicate_succ]

/-- The parity word of a seed splits along any split of the step count. -/
theorem parityWord_append (n a c : Nat) :
    parityWord n (a + c) = parityWord n a ++ parityWord (orbit n a) c := by
  induction a generalizing n with
  | zero => simp
  | succ a ih =>
    have hstep : a + 1 + c = (a + c) + 1 := by omega
    rw [hstep, parityWord_succ, ih (step n), parityWord_succ, ← orbit_step]
    simp

/-- A residue coefficient `σ` with `3^a * σ ≡ 1 (mod 2^(b+1))` gives the
bounded first-passage backward seed of the canonical cylinder. -/
theorem canonicalWord_backwardSeed_of_residue {a b σ : Nat}
    (hσM : σ < 2 ^ (b + 1))
    (hσ : (3 ^ a * σ) % 2 ^ (b + 1) = 1 % 2 ^ (b + 1)) :
    FirstPassageBackwardSeed (canonicalWord a b) (σ * 2 ^ a - 1) := by
  have hMge2 : (2:Nat) ≤ 2 ^ (b + 1) := by
    have h1 : (2:Nat) ^ 1 ≤ 2 ^ (b + 1) := Nat.pow_le_pow_right (by omega) (by omega)
    simpa using h1
  have h1mod : (1:Nat) % 2 ^ (b + 1) = 1 :=
    Nat.mod_eq_of_lt (Nat.lt_of_lt_of_le (by omega) hMge2)
  have hσpos : 0 < σ := by
    rcases Nat.eq_zero_or_pos σ with hz | hp
    · exfalso
      rw [hz, Nat.mul_zero, Nat.zero_mod, h1mod] at hσ
      exact absurd hσ (by omega)
    · exact hp
  have h3pos : 0 < (3:Nat) ^ a := Nat.pow_pos (by omega)
  have hle : (1:Nat) ≤ 3 ^ a * σ := Nat.mul_pos h3pos hσpos
  obtain ⟨W, hW⟩ := dvd_sub_of_mod_eq hσ.symm hle
  constructor
  · have hlen : (canonicalWord a b ++ [Branch.E]).length = a + b + 1 := by
      simp [canonicalWord]
      omega
    rw [hlen]
    have hpow : 2 ^ (a + b + 1) = 2 ^ (b + 1) * 2 ^ a := by
      have hidx : a + b + 1 = a + (b + 1) := by omega
      rw [hidx, Nat.pow_add, Nat.mul_comm]
    rw [hpow]
    have hmul : σ * 2 ^ a < 2 ^ (b + 1) * 2 ^ a :=
      Nat.mul_lt_mul_of_pos_right hσM (Nat.pow_pos (by omega))
    omega
  · have horbit : orbit (σ * 2 ^ a - 1) a = 3 ^ a * σ - 1 :=
      orbit_two_pow_mul_sub_one a σ hσpos
    have hpword : parityWord (σ * 2 ^ a - 1) a = List.replicate a Branch.O :=
      parityWord_two_pow_mul_sub_one a σ hσpos
    have hlen : (canonicalWord a b ++ [Branch.E]).length = a + b + 1 := by
      simp [canonicalWord]
      omega
    have hstep2 : a + b + 1 = a + (b + 1) := by omega
    rw [hlen, hstep2, parityWord_append, hpword, horbit, hW, parityWord_two_pow_mul]
    unfold canonicalWord
    rw [List.append_assoc, ← List.replicate_succ']

/-- On the canonical word, the denominator lower bound is enough on the backward
cylinder side: every bounded first-passage backward seed descends. -/
theorem canonicalWord_backwardSeeds_descend_of_denominator_bound {a b : Nat}
    (hp : ParentBarrier (canonicalWord a b))
    (hD : 2 ^ (b + 1) ≤ parentD (canonicalWord a b)) :
    ∀ n, FirstPassageBackwardSeed (canonicalWord a b) n →
      orbit n (canonicalWord a b ++ [Branch.E]).length < n := by
  obtain ⟨σ, hσM, hσ⟩ := exists_residue (C := 1)
    (coprime_odd_two_pow (three_pow_mod_two a) (b + 1))
    (Nat.pow_pos (a := 2) (by omega) : 0 < 2 ^ (b + 1))
  have hseedr := canonicalWord_backwardSeed_of_residue (a := a) (b := b) (σ := σ) hσM hσ
  have hσpos : 0 < σ := by
    have hMge2 : (2:Nat) ≤ 2 ^ (b + 1) := by
      have h1 : (2:Nat) ^ 1 ≤ 2 ^ (b + 1) := Nat.pow_le_pow_right (by omega) (by omega)
      simpa using h1
    have h1mod : (1:Nat) % 2 ^ (b + 1) = 1 :=
      Nat.mod_eq_of_lt (Nat.lt_of_lt_of_le (by omega) hMge2)
    rcases Nat.eq_zero_or_pos σ with hz | hpσ
    · exfalso
      rw [hz, Nat.mul_zero, Nat.zero_mod, h1mod] at hσ
      exact absurd hσ (by omega)
    · exact hpσ
  intro n hseed
  have hnM := firstPassageBackwardSeed_bound_parentM hseed
  have hrM := firstPassageBackwardSeed_bound_parentM hseedr
  have hrmod := firstPassage_seed_residue (p := canonicalWord a b)
    (n := σ * 2 ^ a - 1) hp hseedr.2
  have hnr := firstPassage_seed_eq_residue (p := canonicalWord a b)
    (n := n) (r := σ * 2 ^ a - 1) hp hnM hseed.2 hrM hrmod
  have hgap : parentC (canonicalWord a b) <
      parentD (canonicalWord a b) * (σ * 2 ^ a - 1) :=
    canonicalWord_gap_of_denominator_bound (a := a) (b := b) (σ := σ) hD hσpos
  have hdesc := (firstPassage_descent_iff_gap (p := canonicalWord a b)
    (n := σ * 2 ^ a - 1) hp hseedr.2).mpr hgap
  simpa [hnr, List.length_append] using hdesc

/-- The canonical denominator lower bound closes the sharp residue inequality
for this canonical parent barrier. -/
theorem canonicalWord_residueGap_of_denominator_bound {a b r : Nat}
    (hp : ParentBarrier (canonicalWord a b))
    (hD : 2 ^ (b + 1) ≤ parentD (canonicalWord a b))
    (hrM : r < parentM (canonicalWord a b))
    (hr : (parentD (canonicalWord a b) * r) % parentM (canonicalWord a b) =
      parentC (canonicalWord a b) % parentM (canonicalWord a b)) :
    parentC (canonicalWord a b) < parentD (canonicalWord a b) * r := by
  have hseed : FirstPassageBackwardSeed (canonicalWord a b) r :=
    parentBarrier_inverseResidue_is_backwardSeed hp hrM hr
  have hdesc := canonicalWord_backwardSeeds_descend_of_denominator_bound hp hD r hseed
  exact (firstPassage_descent_iff_gap (p := canonicalWord a b) (n := r) hp hseed.2).mp hdesc

/-- Equivalently, the canonical denominator lower bound excludes the
two-generator semigroup obstruction for this canonical parent barrier. -/
theorem canonicalWord_not_inTwoGenSemigroup_of_denominator_bound {a b : Nat}
    (hp : ParentBarrier (canonicalWord a b))
    (hD : 2 ^ (b + 1) ≤ parentD (canonicalWord a b)) :
    ¬ InTwoGenSemigroup (parentC (canonicalWord a b))
      (parentD (canonicalWord a b)) (parentM (canonicalWord a b)) := by
  rw [inTwoGenSemigroup_iff_badBackwardSeed hp]
  rintro ⟨n, hbad⟩
  have hdesc := canonicalWord_backwardSeeds_descend_of_denominator_bound hp hD n hbad.1
  exact Nat.not_lt_of_ge hbad.2 hdesc

/-- **The general canonical-barrier seed.** Every canonical barrier's
first-passage cylinder `canonicalWord a b ++ [E]` has a realizing seed,
built from the residue `σ` with `3^a · σ ≡ 1 (mod 2^{b+1})` (produced by
Bézout via `exists_residue`, no divisibility luck required). This holds for
every `a, b` — it does not need `canonicalWord a b` to actually be a parent
barrier. -/
theorem canonicalWord_seed_exists (a b : Nat) :
    ∃ r, parityWord r (a + b + 1) = canonicalWord a b ++ [Branch.E] := by
  obtain ⟨σ, _, hσ⟩ := exists_residue (C := 1) (coprime_odd_two_pow (three_pow_mod_two a) (b + 1))
    (Nat.pow_pos (a := 2) (by omega) : 0 < 2 ^ (b + 1))
  have hMge2 : (2:Nat) ≤ 2 ^ (b + 1) := by
    have h1 : (2:Nat) ^ 1 ≤ 2 ^ (b + 1) := Nat.pow_le_pow_right (by omega) (by omega)
    simpa using h1
  have h1mod : (1:Nat) % 2 ^ (b + 1) = 1 :=
    Nat.mod_eq_of_lt (Nat.lt_of_lt_of_le (by omega) hMge2)
  have hσpos : 0 < σ := by
    rcases Nat.eq_zero_or_pos σ with hz | hp
    · exfalso
      rw [hz, Nat.mul_zero, Nat.zero_mod, h1mod] at hσ
      exact absurd hσ (by omega)
    · exact hp
  have h3pos : 0 < (3:Nat) ^ a := Nat.pow_pos (by omega)
  have hle : (1:Nat) ≤ 3 ^ a * σ := Nat.mul_pos h3pos hσpos
  obtain ⟨W, hW⟩ := dvd_sub_of_mod_eq hσ.symm hle
  refine ⟨σ * 2 ^ a - 1, ?_⟩
  have horbit : orbit (σ * 2 ^ a - 1) a = 3 ^ a * σ - 1 := orbit_two_pow_mul_sub_one a σ hσpos
  have hpword : parityWord (σ * 2 ^ a - 1) a = List.replicate a Branch.O :=
    parityWord_two_pow_mul_sub_one a σ hσpos
  have hstep2 : a + b + 1 = a + (b + 1) := by omega
  rw [hstep2, parityWord_append, hpword, horbit, hW, parityWord_two_pow_mul]
  unfold canonicalWord
  rw [List.append_assoc, ← List.replicate_succ']

/-! ## The named canonical frontier -/

/-- The same-`b` margin at every canonical transition with `a ≥ 3`. This is the
remaining arithmetic content of the canonical denominator recurrence: up-steps
propagate the denominator bound unconditionally
(`canonicalDenominatorBound_iff_same_step_margins`). -/
def CanonicalSameStepMargins : Prop :=
  ∀ a, 3 ≤ a →
    3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2) →
      2 ^ (a + canonicalTrailingEven a + 1) +
          2 ^ (canonicalTrailingEven a + 1) ≤
        3 * (2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a)

/-- The same-step margins close the semigroup gap on every canonical parent
barrier with `a ≥ 3`. -/
theorem canonicalWord_not_inTwoGenSemigroup_of_sameStepMargins
    (h : CanonicalSameStepMargins) {a : Nat} (ha : 3 ≤ a) :
    ¬ InTwoGenSemigroup (parentC (canonicalWord a (canonicalTrailingEven a)))
      (parentD (canonicalWord a (canonicalTrailingEven a)))
      (parentM (canonicalWord a (canonicalTrailingEven a))) := by
  have hp := canonicalWord_parentBarrier_canonicalTrailingEven
    (by omega : 1 ≤ a)
  have hD := canonicalDenominatorBound_of_same_step_margins h a ha
  exact canonicalWord_not_inTwoGenSemigroup_of_denominator_bound hp
    (by rw [parentD_canonicalWord]; exact hD)

/-! ### A verified finite region of the canonical frontier

`CanonicalSameStepMargins` asserts, for *every* `a ≥ 3`, a size bound on
`2^(a+b+2) - 3^(a+1)` (where `b = canonicalTrailingEven a`) whenever the
same-step condition `3^(a+1) < 2^(a+b+2)` holds. In full generality this is
not closed by elementary `omega`/`Nat.pow` reasoning: it amounts to a bound
on how close `3^(a+1)` can sit below the dyadic ceiling `2^(a+b+2)`, which is
exactly the flavor of statement that (for unboundedly large `a`) needs a
quantitative bound on the distance between powers of `3` and the nearest
power of `2` — not something this dependency-free, Mathlib-free library has
built. What *is* available unconditionally and elementarily is the finite
instance: `canonicalTrailingEven` is a computable function, so
`CanonicalSameStepMargins` restricted to any bounded range of `a` is
decidable, and checks out by exhaustive kernel computation (no `sorry`,
`axiom`, or `native_decide` involved — plain `decide`, kernel-checked). This
confirms the margin past the blueprint's noted tightest cases `a = 3` and
`a = 5` (both vacuous: the same-step hypothesis fails at those `a`) and past
the first non-vacuous case `a = 4` (margin `5`), for every `a` up to `2999`. -/
set_option maxRecDepth 20000 in
theorem canonicalSameStepMargins_below_3000 :
    ∀ a, a < 3000 → 3 ≤ a →
      3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2) →
        2 ^ (a + canonicalTrailingEven a + 1) +
            2 ^ (canonicalTrailingEven a + 1) ≤
          3 * (2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a) := by
  decide

/-- Bounded version of `canonicalDenominatorBound_of_same_step_margins`: the
same induction, but only ever invoking the same-step margin hypothesis at
arguments below `N`, so a same-step-margin witness that is itself only known
below `N` (such as `canonicalSameStepMargins_below_3000`) still propagates
the canonical denominator bound across that whole range. -/
theorem canonicalDenominatorBound_of_same_step_margins_below {N : Nat}
    (hmargin : ∀ a, a < N → 3 ≤ a →
      3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2) →
        2 ^ (a + canonicalTrailingEven a + 1) +
            2 ^ (canonicalTrailingEven a + 1) ≤
          3 * (2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a)) :
    ∀ a, a < N → 3 ≤ a →
      2 ^ (canonicalTrailingEven a + 1) ≤
        2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a := by
  intro a haN ha
  have hoff :
      ∀ n, n + 3 < N →
      2 ^ (canonicalTrailingEven (n + 3) + 1) ≤
        2 ^ (n + 3 + canonicalTrailingEven (n + 3) + 1) - 3 ^ (n + 3) := by
    intro n
    induction n with
    | zero => intro _; decide
    | succ n ih =>
      intro hbound
      rw [canonicalTrailingEven.eq_3]
      have hstep := canonicalDenominatorBound_step (a := n + 3)
        (b := canonicalTrailingEven (n + 3)) (ih (by omega))
        (hmargin (n + 3) (by omega) (by omega))
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hstep
  have h := hoff (a - 3) (by omega)
  have hidx : a - 3 + 3 = a := by omega
  simpa [hidx] using h

/-- The semigroup gap closes, unconditionally, on every canonical parent
barrier with `3 ≤ a < 3000` — a strictly-scoped special case of
`canonicalWord_not_inTwoGenSemigroup_of_sameStepMargins` that does not need
the open `CanonicalSameStepMargins` hypothesis, only the kernel-verified
finite instance `canonicalSameStepMargins_below_3000`. -/
theorem canonicalWord_not_inTwoGenSemigroup_of_lt_3000 {a : Nat}
    (ha : 3 ≤ a) (ha' : a < 3000) :
    ¬ InTwoGenSemigroup (parentC (canonicalWord a (canonicalTrailingEven a)))
      (parentD (canonicalWord a (canonicalTrailingEven a)))
      (parentM (canonicalWord a (canonicalTrailingEven a))) := by
  have hp := canonicalWord_parentBarrier_canonicalTrailingEven
    (by omega : 1 ≤ a)
  have hD := canonicalDenominatorBound_of_same_step_margins_below
    (N := 3000) canonicalSameStepMargins_below_3000 a ha' ha
  exact canonicalWord_not_inTwoGenSemigroup_of_denominator_bound hp
    (by rw [parentD_canonicalWord]; exact hD)

/-! ### A near-linear kernel-checked sweep of the canonical frontier

`canonicalSameStepMargins_below_3000` recomputes `canonicalTrailingEven a`
from scratch at each `a` it visits (the recursive definition unwinds all the
way back to the base case every time), so checking the range `a < N` costs
`O(N^2)` total kernel work — the file's own note records that `N = 3000`
already took about 78 seconds this way. `canonicalMarginRun` instead carries
the pair `(a, canonicalTrailingEven a)` forward one step at a time, so the
whole range `a < N` costs `O(N)` kernel reductions instead of `O(N^2)`,
letting the same kernel-checked, `sorry`/`axiom`/`native_decide`-free
`decide` machinery reach the blueprint's stated numerical target `N = 20000`
(`docs/blueprint/src/chapters/collatz/settlement-reading/03-residue-gap-arithmetic.tex`,
"Numerically clean through a=20000") in about a minute, instead of the
roughly hour-long `O(N^2)` cost that range would otherwise take. -/

/-- Whether the same-step margin holds at `(a, b)` — vacuously `true` when
`a < 3` or the same-step condition fails there. This is the per-point payload
threaded by `canonicalMarginStep`. -/
def canonicalMarginOkAt (a b : Nat) : Bool :=
  if 3 ≤ a ∧ 3 ^ (a + 1) < 2 ^ (a + b + 2) then
    decide (2 ^ (a + b + 1) + 2 ^ (b + 1) ≤ 3 * (2 ^ (a + b + 1) - 3 ^ a))
  else true

/-- One step of the canonical trailing-even recurrence, carried forward as a
state `(a, canonicalTrailingEven a, accumulated same-step-margin verdict)`. -/
def canonicalMarginStep (s : Nat × Nat × Bool) : Nat × Nat × Bool :=
  let a := s.1
  let b := s.2.1
  let acc := s.2.2
  let b' := if 3 ^ (a + 1) < 2 ^ (a + b + 2) then b else b + 1
  (a + 1, b', acc && canonicalMarginOkAt a b)

/-- Iterating `canonicalMarginStep` `k` times from the trivial start state
walks the canonical trailing-even recurrence out to `a = k`, while
accumulating whether every same-step margin visited along the way holds. -/
def canonicalMarginRun : Nat → Nat × Nat × Bool
  | 0 => (0, 0, true)
  | k + 1 => canonicalMarginStep (canonicalMarginRun k)

theorem canonicalMarginRun_fst (k : Nat) : (canonicalMarginRun k).1 = k := by
  induction k with
  | zero => rfl
  | succ k ih => simp [canonicalMarginRun, canonicalMarginStep, ih]

/-- The recursive trailing-even count obeys, at every `a` (including the base
case `a = 0`, where it happens to agree with the general recursive branch's
formula), the same one-step recurrence used by `canonicalMarginStep`. -/
theorem canonicalTrailingEven_succ (a : Nat) :
    canonicalTrailingEven (a + 1) =
      if 3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2) then
        canonicalTrailingEven a
      else canonicalTrailingEven a + 1 := by
  match a with
  | 0 => decide
  | n + 1 =>
    show canonicalTrailingEven (n + 2) = _
    rw [canonicalTrailingEven.eq_3]

theorem canonicalMarginRun_snd_fst (k : Nat) :
    (canonicalMarginRun k).2.1 = canonicalTrailingEven k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    have hfst := canonicalMarginRun_fst k
    show (canonicalMarginStep (canonicalMarginRun k)).2.1 = canonicalTrailingEven (k + 1)
    unfold canonicalMarginStep
    rw [canonicalTrailingEven_succ, hfst, ih]

theorem canonicalMarginRun_snd_snd_succ (k : Nat) :
    (canonicalMarginRun (k + 1)).2.2 =
      ((canonicalMarginRun k).2.2 &&
        canonicalMarginOkAt (canonicalMarginRun k).1 (canonicalMarginRun k).2.1) := rfl

/-- If the accumulated verdict after `k` steps of `canonicalMarginRun` is
`true`, every same-step margin visited along the way — every `a < k` with
`3 ≤ a` and the same-step condition — holds. -/
theorem canonicalSameStepMargins_below_of_marginRun {k : Nat}
    (hacc : (canonicalMarginRun k).2.2 = true) :
    ∀ a, a < k → 3 ≤ a →
      3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2) →
        2 ^ (a + canonicalTrailingEven a + 1) + 2 ^ (canonicalTrailingEven a + 1) ≤
          3 * (2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a) := by
  induction k with
  | zero => intro a ha; omega
  | succ k ih =>
    intro a ha ha3 hsame
    rw [canonicalMarginRun_snd_snd_succ] at hacc
    have hacc' := Bool.and_eq_true _ _ |>.mp hacc
    rcases Nat.lt_succ_iff_lt_or_eq.mp ha with ha' | ha'
    · exact ih hacc'.1 a ha' ha3 hsame
    · subst ha'
      have hok := hacc'.2
      rw [canonicalMarginRun_fst, canonicalMarginRun_snd_fst] at hok
      unfold canonicalMarginOkAt at hok
      rw [if_pos ⟨ha3, hsame⟩] at hok
      exact of_decide_eq_true hok

set_option maxRecDepth 200000 in
/-- The canonical same-step margins, kernel-checked for every `3 ≤ a < 20000`
by a single near-linear `decide` pass over `canonicalMarginRun`, instead of
the `O(N^2)` re-derivation `canonicalSameStepMargins_below_3000` uses. This
strictly extends the kernel-checked canonical frontier to the blueprint's
stated numerical target. `CanonicalSameStepMargins` itself — the claim for
*every* `a ≥ 3`, unboundedly — is still open; see the module docstring above
for why closing it needs more than kernel computation. -/
theorem canonicalSameStepMargins_below_20000 :
    ∀ a, a < 20000 → 3 ≤ a →
      3 ^ (a + 1) < 2 ^ (a + canonicalTrailingEven a + 2) →
        2 ^ (a + canonicalTrailingEven a + 1) +
            2 ^ (canonicalTrailingEven a + 1) ≤
          3 * (2 ^ (a + canonicalTrailingEven a + 1) - 3 ^ a) :=
  canonicalSameStepMargins_below_of_marginRun (k := 20000) (by decide)

/-- The semigroup gap closes, unconditionally, on every canonical parent
barrier with `3 ≤ a < 20000` — the same result as
`canonicalWord_not_inTwoGenSemigroup_of_lt_3000`, extended to the wider
kernel-checked range `canonicalSameStepMargins_below_20000` covers. -/
theorem canonicalWord_not_inTwoGenSemigroup_of_lt_20000 {a : Nat}
    (ha : 3 ≤ a) (ha' : a < 20000) :
    ¬ InTwoGenSemigroup (parentC (canonicalWord a (canonicalTrailingEven a)))
      (parentD (canonicalWord a (canonicalTrailingEven a)))
      (parentM (canonicalWord a (canonicalTrailingEven a))) := by
  have hp := canonicalWord_parentBarrier_canonicalTrailingEven
    (by omega : 1 ≤ a)
  have hD := canonicalDenominatorBound_of_same_step_margins_below
    (N := 20000) canonicalSameStepMargins_below_20000 a ha' ha
  exact canonicalWord_not_inTwoGenSemigroup_of_denominator_bound hp
    (by rw [parentD_canonicalWord]; exact hD)

end Collatz
end Closure
end Obsmetrologia
