import Obsmetrologia.Language.Positing.Value.PreCategory
import Obsmetrologia.CausalSets.Causal.Cone
import Obsmetrologia.Language.Positing.Valuation

/-!
# Paraconsistent cone field — causal *reports* valued in the FOUR bilattice

Not a claim that physical spacetime is paraconsistent: a claim that **causal knowledge** can be.
A report may say both *`x` can affect `y`* and *`x` cannot* (inconsistent, `⊤`), or neither
(unknown, `⊥`). Causal reports are valued in the `Reading` bilattice, merged under the knowledge join
(climbing in knowledge), and a Boolean causal relation embeds as a consistent report. The non-thin
value layer this needs is `Positing.Value.PreValueCategory`; `genuine_lax_cone_needs_non_thin_carrier`
there is the structural reason a paraconsistent cone carrier cannot be the thin `ValueCategory`.

Paraconsistency lives strictly in the report/observation layer — the substrate for contradictory
light observations, agent traces, and conflicting causal reconstructions.

## Main definitions

* `ConeReport` — a reading for each ordered event pair.
* `ReportsReachable` / `ReportsInconsistent` / `ReportsUnknown` — the report's verdicts.
* `mergeReports` — knowledge-join of two reports.
* `booleanConeReport` — a Boolean causal relation as a (consistent) valued report.

## Main results

* `mergeReports_comm` — report merge is commutative.
* `reading_leK_joinK_left` / `mergeReports_infl_left` — merging climbs in knowledge order.
* `booleanConeReport_consistent` — a Boolean cone never reports inconsistency.
* `booleanConeReport_reachable_iff` — its reachability verdict is exactly the Boolean relation.
* `paraconsistent_cone_reports` — the bundled headline.

## References

`content/.../aperiodic-settling`, `content/.../inconsistency-sheaf`. Built on
`Obsmetrologia.Positing.Value.PreCategory`, `Obsmetrologia.CausalSets.Causal.Cone`, `Obsmetrologia.Positing`.

## Tags

paraconsistent, causal report, bilattice, knowledge join, inconsistency, light cone
-/

namespace Obsmetrologia
namespace CausalSets.Causal.ParaconsistentCone

open Obsmetrologia.CausalSets.Causal.Order

variable {E : Type}

/-! ## (A) Valued causal reports -/

/-- A paraconsistent causal relation reports a `Reading` for each ordered event pair. -/
abbrev ConeReport (E : Type) := E → E → Reading

/-- The report affirms reachability `x ⤳ y` when its reading carries a positive (truth) slot. -/
def ReportsReachable (R : ConeReport E) (x y : E) : Prop := (R x y).pos = true

/-- The report is inconsistent at `(x,y)` when it is the over-determined reading `⊤`. -/
def ReportsInconsistent (R : ConeReport E) (x y : E) : Prop := R x y = Reading.kTop

/-- The report is unknown at `(x,y)` when it is the under-determined reading `⊥`. -/
def ReportsUnknown (R : ConeReport E) (x y : E) : Prop := R x y = Reading.kBot

/-- The valued future cone of `x`: the reading reported for each target. -/
def ValuedFuture (R : ConeReport E) (x : E) : E → Reading := fun y => R x y

/-! ## (B) Merging reports under knowledge join -/

/-- Merge two reports cellwise under the knowledge join `∨ₖ`. -/
def mergeReports (R S : ConeReport E) : ConeReport E :=
  fun x y => Reading.joinK (R x y) (S x y)

/-- Report merge is commutative. -/
theorem mergeReports_comm (R S : ConeReport E) : mergeReports R S = mergeReports S R := by
  funext x y
  exact Reading.joinK_comm (R x y) (S x y)

/-- The knowledge order is below the knowledge join on the left (per reading). -/
theorem reading_leK_joinK_left (a b : Reading) : Reading.leK a (Reading.joinK a b) = true := by
  cases a <;> cases b <;> decide

/-- Merging a report accumulates knowledge: each cell climbs in the knowledge order. -/
theorem mergeReports_infl_left (R S : ConeReport E) :
    ∀ x y, Reading.leK (R x y) (mergeReports R S x y) = true :=
  fun x y => reading_leK_joinK_left (R x y) (S x y)

/-! ## (C) Boolean causality as a consistent report -/

/-- A Boolean causal relation as a valued report: affirmative `t` where it holds, unknown `⊥`
elsewhere — never inconsistent. -/
def booleanConeReport (prec : E → E → Bool) : ConeReport E :=
  fun x y => bif prec x y then Reading.tTop else Reading.kBot

/-- A Boolean cone report is never the inconsistent reading `⊤`. -/
theorem booleanConeReport_ne_kTop (prec : E → E → Bool) (x y : E) :
    booleanConeReport prec x y ≠ Reading.kTop := by
  unfold booleanConeReport
  cases prec x y <;> decide

/-- A Boolean cone report is consistent everywhere. -/
theorem booleanConeReport_consistent (prec : E → E → Bool) :
    ∀ x y, ¬ ReportsInconsistent (booleanConeReport prec) x y :=
  fun x y h => booleanConeReport_ne_kTop prec x y h

/-- A Boolean cone report's reachability verdict is exactly the Boolean relation. -/
theorem booleanConeReport_reachable_iff (prec : E → E → Bool) (x y : E) :
    ReportsReachable (booleanConeReport prec) x y ↔ prec x y = true := by
  unfold ReportsReachable booleanConeReport
  cases prec x y <;> decide

/-! ## (D) The bundled headline -/

/-- **Paraconsistent causal reports.** Reports merge commutatively, accumulating knowledge (each
cell climbs the knowledge order), and a Boolean causal relation embeds as a consistent report whose
reachability verdict is exactly the Boolean relation. The non-thin value layer this requires is
`Positing.Value.PreValueCategory` (see `genuine_lax_cone_needs_non_thin_carrier`). -/
theorem paraconsistent_cone_reports :
    (∀ (prec : E → E → Bool), ∀ x y, ¬ ReportsInconsistent (booleanConeReport prec) x y)
    ∧ (∀ (R S : ConeReport E) x y, Reading.leK (R x y) (mergeReports R S x y) = true)
    ∧ (∀ (R S : ConeReport E), mergeReports R S = mergeReports S R)
    ∧ (∀ (prec : E → E → Bool) x y,
        ReportsReachable (booleanConeReport prec) x y ↔ prec x y = true) :=
  ⟨fun prec => booleanConeReport_consistent prec,
   fun R S => mergeReports_infl_left R S,
   fun R S => mergeReports_comm R S,
   fun prec => booleanConeReport_reachable_iff prec⟩

end CausalSets.Causal.ParaconsistentCone
end Obsmetrologia
