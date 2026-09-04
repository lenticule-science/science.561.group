import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Language.Positing.TruthOrder

/-!
# Weiqi — evidence moves are knowledge-monotone but not truth-monotone

Glass-sponge §17.5 made exact. This module reuses the corpus's existing FOUR
charge bilattice verbatim — `Charge` and its knowledge join `Charge.joinK`
(`Obsmetrologia/Language/Positing/Charge.lean`), the pointwise `Valuation`
and its `Valuation.leK`/`Valuation.joinK` (`Obsmetrologia/Language/Positing/
Valuation.lean`), and the truth order `Charge.leT`/`Charge.TLE`
(`Obsmetrologia/Language/Positing/TruthOrder.lean`) — and adds no new charge
algebra. An **evidence move** at a locus is exactly `Valuation.joinK v ev` for
an evidence valuation `ev` that is `Charge.kBot` off the locus and carries
positive or negative evidence at it: joining new evidence into the knowledge
order is the reused primitive, not a new one.

* `knowledge_monotone_of_evidence` — every evidence move is `Valuation.leK`
  above the valuation it starts from (reuses `Charge.leK_joinK_left`
  pointwise).
* `evidence_not_truth_monotone` — a decide-checked witness that the *same*
  move is not truth-monotone: joining negative evidence onto the truth-top
  charge `t` (told true only) produces `⊤ₖ` (told both), which is *strictly
  below* `t` in the truth order `≤ₜ` — the move told more, and so, by the
  bilattice's own truth order, is *less true*.
* `not_forall_truth_monotone` — the general negative statement: no evidence
  move is truth-monotone for every charge, witnessed by the same instance.
-/

namespace Obsmetrologia
namespace GameTheory
namespace Weiqi
namespace Evidence

/-! ## Knowledge-order monotonicity -/

/-- **Every evidence move is knowledge-monotone.** Joining an evidence
valuation into `v` only ever raises `v` in the pointwise knowledge order — the
reused fact is `Charge.leK_joinK_left`, lifted pointwise across the claim
points a `Valuation` assigns. -/
theorem knowledge_monotone_of_evidence (v ev : Valuation) :
    Valuation.leK v (Valuation.joinK v ev) := by
  intro phi
  exact Charge.leK_joinK_left (v phi) (ev phi)

/-! ## Truth-order non-monotonicity -/

/-- **The witness.** Joining negative evidence (`ofSlots false true`) onto the
truth-top charge `tTop` ("told true only") produces `kTop` ("told both") — and
`kTop` sits *strictly below* `tTop` in the truth order: it is `≤ₜ`-below, and
it is not equal. Adding negative evidence lowers truth. -/
theorem evidence_lowers_truth :
    Charge.TLE (Charge.joinK Charge.tTop (Charge.ofSlots false true)) Charge.tTop ∧
      Charge.joinK Charge.tTop (Charge.ofSlots false true) ≠ Charge.tTop := by
  constructor
  · decide
  · decide

/-- **Evidence moves are not truth-monotone.** The forward direction
`Charge.leT a (joinK a e) = true` (the move never *lowers* truth) fails at the
same instance: negative evidence onto `tTop` is not `≤ₜ`-above `tTop`. -/
theorem evidence_not_truth_monotone :
    Charge.leT Charge.tTop (Charge.joinK Charge.tTop (Charge.ofSlots false true)) = false := by
  decide

/-- **No evidence move is truth-monotone in general.** Restated as the
existential failure of the universally-quantified truth-monotonicity claim,
witnessed by `evidence_not_truth_monotone`. -/
theorem not_forall_truth_monotone :
    ¬ (∀ a e : Charge, Charge.leT a (Charge.joinK a e) = true) := by
  intro h
  exact absurd (h Charge.tTop (Charge.ofSlots false true)) (by decide)

end Evidence
end Weiqi
end GameTheory
end Obsmetrologia

#print axioms Obsmetrologia.GameTheory.Weiqi.Evidence.knowledge_monotone_of_evidence
#print axioms Obsmetrologia.GameTheory.Weiqi.Evidence.evidence_lowers_truth
#print axioms Obsmetrologia.GameTheory.Weiqi.Evidence.evidence_not_truth_monotone
#print axioms Obsmetrologia.GameTheory.Weiqi.Evidence.not_forall_truth_monotone
