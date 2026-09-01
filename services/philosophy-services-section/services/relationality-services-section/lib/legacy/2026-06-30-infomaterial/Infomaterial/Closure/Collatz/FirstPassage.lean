import Infomaterial.Closure.Collatz.AffineTrace

/-!
# Collatz first-passage words and parent barriers

A parity word is **coefficient-contracting** when its trace satisfies `A < B`
(`3^{oddCount} < 2^{|w|}`): the divide-by-two coefficient has overtaken the
multiply-by-three coefficient. A **first-passage word** is the first prefix at which
this happens — every proper prefix is still noncontracting. This module proves the
structural backbone of the first-passage analysis:

* a first-passage word always ends in `E` (the crossing letter);
* `w = p ++ [E]` is first-passage iff `p` is a **parent barrier**
  (`B ≤ A < 2B` with all proper prefixes noncontracting);
* the crossing pins the exponents: `2^{|w|-1} ≤ 3^{oddCount w} < 2^{|w|}`.

These are the lawful finite cells on which the descent obstruction (the semigroup
gap, next module) is stated. Nothing here proves Collatz.

## Main definitions

* `CoeffContracting`, `CoeffNoncontracting` — the trace coefficient comparison.
* `FirstPassageWord` — contracting, with every proper prefix noncontracting.
* `ParentBarrier` — the prefix `p` such that `p ++ [E]` is first-passage.

## Main results

* `trace_append_E`, `trace_append_O` — one trailing letter advances the trace.
* `firstPassage_E` — the one-letter word `[E]` is first-passage.
* `firstPassage_last_E` — a nonempty first-passage word ends in `E`.
* `firstPassage_append_E_iff_parentBarrier` — the structural equivalence.
* `firstPassage_power_bounds` — the exponent sandwich at the crossing.

## Tags

collatz, first passage, parent barrier, coefficient crossing
-/

namespace Infomaterial
namespace Closure
namespace Collatz

/-! ## Coefficient comparison -/

/-- The word's trace is contracting: `A_w < B_w`. -/
def CoeffContracting (w : List Branch) : Prop :=
  (traceOfWord w).A < (traceOfWord w).B

/-- The word's trace is noncontracting: `B_w ≤ A_w`. -/
def CoeffNoncontracting (w : List Branch) : Prop :=
  (traceOfWord w).B ≤ (traceOfWord w).A

/-! ## Trace under a trailing letter -/

theorem trace_append_E (w : List Branch) :
    traceOfWord (w ++ [Branch.E]) = traceStep (traceOfWord w) Branch.E := by
  unfold traceOfWord; rw [List.foldl_append]; rfl

theorem trace_append_O (w : List Branch) :
    traceOfWord (w ++ [Branch.O]) = traceStep (traceOfWord w) Branch.O := by
  unfold traceOfWord; rw [List.foldl_append]; rfl

theorem oddCount_append (w v : List Branch) :
    oddCount (w ++ v) = oddCount w + oddCount v := by
  induction w with
  | nil => simp [oddCount]
  | cons b w ih => cases b <;> simp [oddCount, ih] <;> omega

/-! ## First-passage words and parent barriers -/

/-- A first-passage word: contracting, with every proper prefix noncontracting. -/
def FirstPassageWord (w : List Branch) : Prop :=
  CoeffContracting w ∧ ∀ k, k < w.length → CoeffNoncontracting (w.take k)

/-- A parent barrier `p`: noncontracting with `A < 2B`, every proper prefix
noncontracting. Then `p ++ [E]` is exactly the first-passage word it generates. -/
def ParentBarrier (p : List Branch) : Prop :=
  (traceOfWord p).B ≤ (traceOfWord p).A
  ∧ (traceOfWord p).A < 2 * (traceOfWord p).B
  ∧ ∀ k, k < p.length → CoeffNoncontracting (p.take k)

/-- The single even step is first-passage. -/
theorem firstPassage_E : FirstPassageWord [Branch.E] := by
  refine ⟨?_, ?_⟩
  · show (traceOfWord [Branch.E]).A < (traceOfWord [Branch.E]).B
    decide
  · intro k hk
    simp only [List.length_cons, List.length_nil] at hk
    have : k = 0 := by omega
    subst this
    show (traceOfWord (List.take 0 [Branch.E])).B ≤ (traceOfWord (List.take 0 [Branch.E])).A
    decide

/-- Every list is empty or ends in a final element. -/
theorem nil_or_concat (w : List Branch) : w = [] ∨ ∃ p b, w = p ++ [b] := by
  induction w with
  | nil => exact Or.inl rfl
  | cons a t ih =>
      rcases ih with h | ⟨p, b, hp⟩
      · subst h; exact Or.inr ⟨[], a, rfl⟩
      · subst hp; exact Or.inr ⟨a :: p, b, rfl⟩

/-- A nonempty first-passage word ends in the crossing letter `E`. -/
theorem firstPassage_last_E {w : List Branch}
    (h : FirstPassageWord w) (hne : w ≠ []) :
    ∃ p, w = p ++ [Branch.E] := by
  rcases nil_or_concat w with h0 | ⟨p, b, rfl⟩
  · exact absurd h0 hne
  · cases b with
    | E => exact ⟨p, rfl⟩
    | O =>
      exfalso
      obtain ⟨hc, hpre⟩ := h
      -- contracting: 3·A_p < 2·B_p
      unfold CoeffContracting at hc
      rw [trace_append_O] at hc
      simp only [traceStep] at hc
      -- prefix at p.length: noncontracting p, i.e. B_p ≤ A_p
      have hlen : p.length < (p ++ [Branch.O]).length := by
        simp only [List.length_append, List.length_cons, List.length_nil]; omega
      have hp : (traceOfWord p).B ≤ (traceOfWord p).A := by
        have hh := hpre p.length hlen
        unfold CoeffNoncontracting at hh
        rw [List.take_append_of_le_length (Nat.le_refl _), List.take_length] at hh
        exact hh
      have hApos := trace_A_pos p
      omega

/-- The structural equivalence: `p ++ [E]` is first-passage iff `p` is a parent
barrier. -/
theorem firstPassage_append_E_iff_parentBarrier (p : List Branch) :
    FirstPassageWord (p ++ [Branch.E]) ↔ ParentBarrier p := by
  unfold FirstPassageWord ParentBarrier CoeffContracting CoeffNoncontracting
  rw [trace_append_E]
  simp only [traceStep, List.length_append, List.length_cons, List.length_nil]
  constructor
  · rintro ⟨hc, hpre⟩
    refine ⟨?_, hc, ?_⟩
    · have := hpre p.length (by omega)
      rwa [List.take_append_of_le_length (Nat.le_refl _), List.take_length] at this
    · intro k hk
      have := hpre k (by omega)
      rwa [List.take_append_of_le_length (by omega)] at this
  · rintro ⟨hb, hc, hpre⟩
    refine ⟨hc, ?_⟩
    intro k hk
    rw [List.take_append_of_le_length (by omega)]
    rcases Nat.lt_or_ge k p.length with h | h
    · exact hpre k h
    · have hkp : k = p.length := by omega
      rw [hkp, List.take_length]; exact hb

/-- At the crossing the exponents are sandwiched: `2^{|w|-1} ≤ 3^{oddCount w} < 2^{|w|}`. -/
theorem firstPassage_power_bounds {w : List Branch}
    (h : FirstPassageWord w) (hlen : 0 < w.length) :
    2 ^ (w.length - 1) ≤ 3 ^ oddCount w ∧ 3 ^ oddCount w < 2 ^ w.length := by
  obtain ⟨p, rfl⟩ := firstPassage_last_E h (by
    intro hcontra; rw [hcontra] at hlen; simp at hlen)
  obtain ⟨hb, _, hpre⟩ := (firstPassage_append_E_iff_parentBarrier p).mp h
  refine ⟨?_, ?_⟩
  · -- 2^{|p|} ≤ 3^{oddCount p} from B_p ≤ A_p, and lengths/odd-counts line up
    rw [trace_B_eq_two_pow_length, trace_A_eq_three_pow_oddCount] at hb
    rw [oddCount_append]
    simp only [oddCount, Nat.add_zero, List.length_append, List.length_cons,
      List.length_nil, Nat.add_sub_cancel]
    exact hb
  · -- 3^{oddCount} < 2^{length} is CoeffContracting via the closed forms
    obtain ⟨hc, _⟩ := h
    rw [CoeffContracting, trace_A_eq_three_pow_oddCount, trace_B_eq_two_pow_length] at hc
    exact hc

end Collatz
end Closure
end Infomaterial
