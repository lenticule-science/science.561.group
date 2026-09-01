import Obsmetrologia.Cohomology.CurrencyCocone
import Obsmetrologia.Dynamics.Flow.FreeEnergyLyapunov

/-! # The attention allocation — the demand side of reconciliation

The currency cocone (`CurrencyCocone`) and the budget split
(`Valuation.irreversible_within_budget`) price reconciliation: the *cost* side, the
thermodynamics of attention. This module is the *demand* side. A bounded agent has
a finite attention budget `B` and many obstructions, each with a reconciliation
cost (its certificate size / settling flux) and a benefit (the held-`⊤` it removes).
The allocation problem: which subset does the agent reconcile to minimise residual
held-`⊤` under `∑ cost ≤ B`?

The light cone makes this not a free knapsack. A jump — the irreversible timelike
spend of `Valuation`'s §12 — is committed once and cannot be refunded, so the budget
is consumed monotonically: selecting an obstruction never returns cost
(`cost_monotone_cons`), and feasibility is downward closed
(`feasible_of_cons`). Residual is antitone in captured benefit
(`residual_antitone`): the optimal feasible selection is the one of maximum benefit,
and the empty selection is the feasibility base with maximal residual
(`residual_empty`). Greedy extension within remaining budget stays feasible and
strictly captures benefit (`feasible_extend`).

## References
`CurrencyCocone` (the priced obstructions); `Valuation.irreversible_within_budget`
(the per-obstruction budget feasibility); the attention-economics reading of the
free energy as the budget spent at settling.
-/

namespace Obsmetrologia
namespace Cohomology
namespace Attention

/-- An **obstruction** as a demand: a reconciliation `cost` (its certificate size or
settling flux) and a `benefit` (the held-`⊤` mass reconciling it removes). -/
structure Obstruction where
  /-- The reconciliation cost — attention spent to settle this obstruction. -/
  cost : Nat
  /-- The benefit — held-`⊤` removed by reconciling it. -/
  benefit : Nat
deriving DecidableEq

/-- The total attention cost of a selection. -/
def totalCost (S : List Obstruction) : Nat := (S.map (·.cost)).foldr (· + ·) 0

/-- The total benefit captured by a selection. -/
def totalBenefit (S : List Obstruction) : Nat := (S.map (·.benefit)).foldr (· + ·) 0

/-- A selection is **feasible** under budget `B` when its total cost fits. -/
def Feasible (B : Nat) (S : List Obstruction) : Prop := totalCost S ≤ B

/-- The **residual held-`⊤`** after reconciling selection `S` out of the universe of
obstructions `U`: the benefit not captured. -/
def residual (U S : List Obstruction) : Nat := totalBenefit U - totalBenefit S

theorem totalCost_cons (o : Obstruction) (S : List Obstruction) :
    totalCost (o :: S) = o.cost + totalCost S := rfl

theorem totalBenefit_cons (o : Obstruction) (S : List Obstruction) :
    totalBenefit (o :: S) = o.benefit + totalBenefit S := rfl

/-! ## Feasibility and irreversibility -/

/-- **The empty selection is feasible.** The base of the allocation: reconciling
nothing costs nothing. -/
theorem empty_feasible (B : Nat) : Feasible B [] := Nat.zero_le _

/-- **Budget is consumed monotonically.** Selecting an obstruction never lowers the
total cost — the irreversible spend of a jump is committed, not refundable. -/
theorem cost_monotone_cons (o : Obstruction) (S : List Obstruction) :
    totalCost S ≤ totalCost (o :: S) := by rw [totalCost_cons]; exact Nat.le_add_left _ _

/-- **Feasibility is downward closed.** If a selection with `o` added is feasible, so
is the selection without it: dropping a reconciliation never breaks the budget. -/
theorem feasible_of_cons (B : Nat) (o : Obstruction) (S : List Obstruction)
    (h : Feasible B (o :: S)) : Feasible B S := by
  unfold Feasible at *
  rw [totalCost_cons] at h
  exact Nat.le_trans (Nat.le_add_left _ _) h

/-- **Greedy extension within remaining budget.** If `S` is feasible and `o` fits in
the remaining budget, then `o :: S` is feasible and captures `o`'s benefit on top. -/
theorem feasible_extend (B : Nat) (o : Obstruction) (S : List Obstruction)
    (hroom : o.cost + totalCost S ≤ B) :
    Feasible B (o :: S) ∧ totalBenefit (o :: S) = o.benefit + totalBenefit S := by
  refine ⟨?_, totalBenefit_cons o S⟩
  unfold Feasible
  rw [totalCost_cons]
  exact hroom

/-! ## Optimality — residual is minimised by maximal captured benefit -/

/-- **Residual is antitone in captured benefit.** A selection capturing at least as
much benefit leaves at most as much residual: minimising residual is maximising
captured benefit. -/
theorem residual_antitone (U S S' : List Obstruction)
    (h : totalBenefit S ≤ totalBenefit S') : residual U S' ≤ residual U S := by
  unfold residual
  exact Nat.sub_le_sub_left h _

/-- **The empty selection has maximal residual.** Reconciling nothing leaves the whole
universe's benefit as residual held-`⊤` — the feasibility base is the worst case, and
every feasible selection improves on it. -/
theorem residual_empty (U : List Obstruction) : residual U [] = totalBenefit U := by
  unfold residual totalBenefit
  simp

/-- **The allocation.** Bundled: the empty selection is feasible with maximal
residual; budget is consumed monotonically and feasibility is downward closed (the
light-cone irreversibility); greedy extension within budget captures benefit; and
residual is minimised by maximal captured benefit. The demand side of reconciliation
over the priced obstructions, a budget-constrained selection with a one-way spend. -/
theorem attention_allocation (B : Nat) (U : List Obstruction) :
    Feasible B [] ∧ residual U [] = totalBenefit U
    ∧ (∀ o S, totalCost S ≤ totalCost (o :: S))
    ∧ (∀ o S, Feasible B (o :: S) → Feasible B S)
    ∧ (∀ S S', totalBenefit S ≤ totalBenefit S' → residual U S' ≤ residual U S) :=
  ⟨empty_feasible B, residual_empty U, cost_monotone_cons,
   fun o S => feasible_of_cons B o S, fun S S' => residual_antitone U S S'⟩

end Attention
end Cohomology
end Obsmetrologia
