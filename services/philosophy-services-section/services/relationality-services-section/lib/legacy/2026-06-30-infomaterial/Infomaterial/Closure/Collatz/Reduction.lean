import Infomaterial.Closure.Collatz.SemigroupGap

/-!
# Collatz reduction: from the gap and crossing to termination

This module assembles the conditional reduction the whole development targets:

  `ParentBarrierGap` + `EveryNonterminalHasCrossing` ⟹ accelerated Collatz termination.

The **coefficient crossing** of a seed `n` is the first prefix length `k` at which its
parity word turns contracting; that crossing word is exactly a first-passage word
(`firstCoeffCrossing_word_is_firstPassage`). The parent-barrier gap forces every
first-passage cylinder to descend (handling the two terminal-adjacent cylinders `[E]`
and `[O,E]` directly), and the crossing hypothesis supplies a crossing for every
nonterminal seed. Together they give universal descent below self, which the proven
reduction `reachesTerminal_of_all_fall_below` turns into termination.

The two genuinely open inputs are kept as the frontier holes `parentBarrierGap_holds`
(the residue gap, `SemigroupGap`) and `everyNonterminalHasCrossing_holds` (no infinite
barrier stream). The headline `accelerated_collatz` is honestly derived from exactly
those two — nothing else is left unproved.

## Main definitions

* `FirstCoeffCrossing` — the first contracting prefix length of a seed.
* `EveryNonterminalHasCrossing` — every `n > 2` has such a crossing.

## Main results

* `firstCoeffCrossing_word_is_firstPassage` — a crossing word is first-passage.
* `parentBarrierGap_implies_all_firstPassage_descent` — the gap descends every cylinder.
* `collatz_from_parentBarrierGap_and_crossing` — the conditional reduction.
* `accelerated_collatz` — termination, modulo the two frontier holes.

## Tags

collatz, coefficient crossing, descent, reduction, termination
-/

namespace Infomaterial
namespace Closure
namespace Collatz

/-! ## Parity-word prefixes -/

/-- A proper prefix of a parity word is the shorter parity word. -/
theorem parityWord_take : ∀ (n k j : Nat), j ≤ k →
    (parityWord n k).take j = parityWord n j := by
  intro n k j
  induction j generalizing n k with
  | zero => intro _; rfl
  | succ j ih =>
      intro h
      cases k with
      | zero => exact absurd h (by omega)
      | succ k =>
          rw [parityWord_succ, List.take_succ_cons, ih (step n) k (by omega), parityWord_succ]

/-- `parityWord n 1 = [branch n]`. -/
theorem parityWord_one (n : Nat) : parityWord n 1 = [branch n] := rfl
/-- `parityWord n 2 = [branch n, branch (step n)]`. -/
theorem parityWord_two (n : Nat) :
    parityWord n 2 = [branch n, branch (step n)] := rfl

/-! ## Coefficient crossing -/

/-- The first coefficient crossing: the parity word of length `k` contracts, every
shorter parity word does not. -/
def FirstCoeffCrossing (n k : Nat) : Prop :=
  CoeffContracting (parityWord n k) ∧ ∀ j, j < k → CoeffNoncontracting (parityWord n j)

/-- A first coefficient crossing word is a first-passage word. -/
theorem firstCoeffCrossing_word_is_firstPassage {n k : Nat}
    (h : FirstCoeffCrossing n k) : FirstPassageWord (parityWord n k) := by
  obtain ⟨hc, hnc⟩ := h
  refine ⟨hc, ?_⟩
  intro j hj
  rw [parityWord_length] at hj
  rw [parityWord_take n k j (Nat.le_of_lt hj)]
  exact hnc j hj

/-- Every nonterminal seed reaches a finite coefficient crossing. -/
def EveryNonterminalHasCrossing : Prop := ∀ n, 2 < n → ∃ k, FirstCoeffCrossing n k

/-- **Well-ordering for a decidable predicate** (derived here): a witness yields a
least witness, with everything below it failing. By structural recursion on the witness. -/
theorem exists_least : ∀ (m : Nat) (P : Nat → Prop), DecidablePred P → P m →
    ∃ k, P k ∧ ∀ j, j < k → ¬ P j
  | 0, _, _, hP => ⟨0, hP, fun j hj => absurd hj (Nat.not_lt_zero j)⟩
  | m + 1, P, hdec, hP => by
    haveI : DecidablePred P := hdec
    by_cases h0 : P 0
    · exact ⟨0, h0, fun j hj => absurd hj (Nat.not_lt_zero j)⟩
    · obtain ⟨k, hk, hkmin⟩ := exists_least m (fun i => P (i + 1)) (fun i => hdec (i + 1)) hP
      refine ⟨k + 1, hk, ?_⟩
      intro j hj
      cases j with
      | zero => exact h0
      | succ i => exact hkmin i (by omega)

/-- A *first* coefficient crossing exists as soon as *any* contracting prefix does: the least
contracting length is automatically a first crossing (all shorter prefixes noncontracting). -/
theorem firstCoeffCrossing_of_contracting {n : Nat}
    (h : ∃ k, CoeffContracting (parityWord n k)) : ∃ k, FirstCoeffCrossing n k := by
  obtain ⟨m, hm⟩ := h
  obtain ⟨k, hk, hkmin⟩ :=
    exists_least m (fun k => CoeffContracting (parityWord n k)) (fun k => Nat.decLt _ _) hm
  refine ⟨k, hk, ?_⟩
  intro j hj
  have hjnc := hkmin j hj
  unfold CoeffContracting at hjnc
  unfold CoeffNoncontracting
  omega

/-- The sharp form of the crossing hypothesis: every nonterminal seed has *some* contracting
parity prefix (`A < B`, i.e. `3^{oddCount} < 2^{len}`). -/
def EveryNonterminalContracts : Prop :=
  ∀ n, 2 < n → ∃ k, CoeffContracting (parityWord n k)

/-- The sharp contracting form implies the crossing hypothesis — so the open hole reduces to
"every `n > 2` eventually contracts," dropping the first/all-prior-noncontracting bookkeeping. -/
theorem everyNonterminalContracts_implies_crossing
    (h : EveryNonterminalContracts) : EveryNonterminalHasCrossing :=
  fun n hn => firstCoeffCrossing_of_contracting (h n hn)

/-- **The purl: a descending step is a contracting step.** Because the offset `C ≥ 0`, the
surplus `A·n + C − B·n` can only be negative when the coefficient has already crossed (`A < B`).
So descent forces the crossing — the crossing is the back-side of the same stitch. -/
theorem contracting_of_descent {n k : Nat} (hlt : orbit n k < n) :
    CoeffContracting (parityWord n k) := by
  rw [descent_iff_coeff] at hlt
  unfold CoeffContracting
  rcases Nat.lt_or_ge (traceOfWord (parityWord n k)).A (traceOfWord (parityWord n k)).B with h | h
  · exact h
  · exfalso; have := Nat.mul_le_mul_right n h; omega

/-- Hence universal descent below self *contains* the crossing hypothesis: the crossing hole is
not independent — it is folded into the descent (gap) side. -/
theorem everyNonterminalContracts_of_allFallBelow
    (h : ∀ n, 2 < n → FallsBelowSelf n) : EveryNonterminalContracts := by
  intro n hn
  obtain ⟨k, hk⟩ := h n hn
  exact ⟨k, contracting_of_descent hk⟩

/-! ## Descent of the terminal-adjacent cylinders -/

/-- The cylinder `[E]` descends for `n > 2`: an even seed halves. -/
theorem firstPassage_E_descends {n : Nat}
    (hword : parityWord n ([Branch.E].length) = [Branch.E]) (hn : 2 < n) :
    orbit n ([Branch.E].length) < n := by
  change parityWord n 1 = [Branch.E] at hword
  change step n < n
  rw [parityWord_one] at hword
  injection hword with hb _
  have hev : n % 2 = 0 := by
    rcases (by omega : n % 2 = 0 ∨ n % 2 = 1) with h | h
    · exact h
    · rw [branch_odd (by omega)] at hb; exact absurd hb (by decide)
  unfold step; rw [if_pos hev]; omega

/-- The cylinder `[O,E]` descends for `n > 2`: `4·T²(n) = 3n+1 < 4n`. -/
theorem firstPassage_OE_descends {n : Nat}
    (hword : parityWord n ([Branch.O, Branch.E].length) = [Branch.O, Branch.E])
    (hn : 2 < n) :
    orbit n ([Branch.O, Branch.E].length) < n := by
  change parityWord n 2 = [Branch.O, Branch.E] at hword
  change step (step n) < n
  rw [parityWord_two] at hword
  injection hword with hb1 htl
  injection htl with hb2 _
  have hodd : n % 2 ≠ 0 := by
    rcases (by omega : n % 2 = 0 ∨ n % 2 = 1) with h | h
    · rw [branch_even h] at hb1; exact absurd hb1 (by decide)
    · omega
  have hev : step n % 2 = 0 := by
    rcases (by omega : step n % 2 = 0 ∨ step n % 2 = 1) with h | h
    · exact h
    · rw [branch_odd (by omega)] at hb2; exact absurd hb2 (by decide)
  have e1 : 2 * step n = 3 * n + 1 := step_odd_eq hodd
  have e2 : 2 * step (step n) = step n := step_even_eq hev
  omega

/-! ## The full first-passage descent -/

/-- Under the gap, every first-passage cylinder descends at any realizing `n > 2`. -/
theorem parentBarrierGap_implies_all_firstPassage_descent (hgap : ParentBarrierGap)
    (w : List Branch) (n : Nat) (hfp : FirstPassageWord w)
    (hword : parityWord n w.length = w) (hn : 2 < n) :
    orbit n w.length < n := by
  have hne : w ≠ [] := by
    intro h; subst h
    have hc := hfp.1; unfold CoeffContracting at hc; simp [trace_empty] at hc
  obtain ⟨p, rfl⟩ := firstPassage_last_E hfp hne
  by_cases htriv : p = [] ∨ p = [Branch.O]
  · rcases htriv with rfl | rfl
    · exact firstPassage_E_descends hword hn
    · exact firstPassage_OE_descends hword hn
  · have hpb : ParentBarrier p := (firstPassage_append_E_iff_parentBarrier p).mp hfp
    exact parentBarrierGap_implies_firstPassageDescent hgap p n hpb htriv hword hn

/-! ## The conditional reduction -/

/-- Universal descent below self follows from the gap and the crossing hypothesis. -/
theorem allFallBelow_of_gap_and_crossing
    (hgap : ParentBarrierGap) (hcross : EveryNonterminalHasCrossing) :
    ∀ n, 2 < n → FallsBelowSelf n := by
  intro n hn
  obtain ⟨k, hk⟩ := hcross n hn
  have hfp : FirstPassageWord (parityWord n k) := firstCoeffCrossing_word_is_firstPassage hk
  have hword : parityWord n (parityWord n k).length = parityWord n k := by
    rw [parityWord_length]
  refine ⟨k, ?_⟩
  have hdesc := parentBarrierGap_implies_all_firstPassage_descent hgap
    (parityWord n k) n hfp hword hn
  rwa [parityWord_length] at hdesc

/-- **Conditional reduction.** The parent-barrier gap and the coefficient-crossing
hypothesis imply accelerated Collatz termination. -/
theorem collatz_from_parentBarrierGap_and_crossing
    (hgap : ParentBarrierGap) (hcross : EveryNonterminalHasCrossing) :
    ∀ n, 0 < n → ReachesTerminal n :=
  reachesTerminal_of_all_fall_below (allFallBelow_of_gap_and_crossing hgap hcross)

/-! ## The frontier holes and the discharged headline -/

/-- **Frontier hole.** No nonterminal seed runs an infinite coefficient-noncontracting
barrier — every `n > 2` has a finite crossing. -/
theorem everyNonterminalHasCrossing_holds : EveryNonterminalHasCrossing := by
  sorry

/-- Every seed above the terminal cycle eventually drops below itself — discharged
from the two frontier holes. -/
theorem all_fall_below : ∀ n, 2 < n → FallsBelowSelf n :=
  allFallBelow_of_gap_and_crossing parentBarrierGap_holds everyNonterminalHasCrossing_holds

/-- **Accelerated Collatz**, discharged from exactly the gap and crossing frontier
holes. -/
theorem accelerated_collatz : ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierGap_and_crossing parentBarrierGap_holds
    everyNonterminalHasCrossing_holds

end Collatz
end Closure
end Infomaterial
