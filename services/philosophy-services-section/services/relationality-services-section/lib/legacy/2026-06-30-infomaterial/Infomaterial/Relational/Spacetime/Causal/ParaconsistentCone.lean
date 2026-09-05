import Infomaterial.Language.Positing.Value.PreCategory
import Infomaterial.Relational.Spacetime.Causal.Cone
import Infomaterial.Language.Positing.Valuation

/-!
# Paraconsistent cone field — causal *reports* valued in the FOUR bilattice

Not a claim that physical spacetime is paraconsistent: a claim that **causal knowledge** can be.
A report may say both *`x` can affect `y`* and *`x` cannot* (inconsistent, `⊤`), or neither
(unknown, `⊥`). Causal reports are valued in the `Charge` bilattice, merged under the knowledge join
(climbing in knowledge), and a Boolean causal relation embeds as a consistent report. The non-thin
value layer this needs is `Positing.Value.PreValueCategory`; `genuine_lax_cone_needs_non_thin_carrier`
there is the structural reason a paraconsistent cone carrier cannot be the thin `ValueCategory`.

Paraconsistency lives strictly in the report/observation layer — the substrate for contradictory
light observations, agent traces, and conflicting causal reconstructions.

## Main definitions

* `ConeReport` — a charge for each ordered event pair.
* `ReportsReachable` / `ReportsInconsistent` / `ReportsUnknown` — the report's verdicts.
* `mergeReports` — knowledge-join of two reports.
* `booleanConeReport` — a Boolean causal relation as a (consistent) charged report.

## Main results

* `mergeReports_comm` — report merge is commutative.
* `charge_leK_joinK_left` / `mergeReports_infl_left` — merging climbs in knowledge order.
* `booleanConeReport_consistent` — a Boolean cone never reports inconsistency.
* `booleanConeReport_reachable_iff` — its reachability verdict is exactly the Boolean relation.
* `paraconsistent_cone_reports` — the bundled headline.

## References

`content/.../aperiodic-settling`, `content/.../inconsistency-sheaf`. Built on
`Infomaterial.Positing.Value.PreCategory`, `Infomaterial.Relational.Spacetime.Causal.Cone`, `Infomaterial.Positing`.

## Tags

paraconsistent, causal report, bilattice, knowledge join, inconsistency, light cone
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.ParaconsistentCone

open Infomaterial.Relational.Spacetime.Causal.Order

variable {E : Type}

/-! ## (A) Charged causal reports -/

/-- A paraconsistent causal relation reports a `Charge` for each ordered event pair. -/
abbrev ConeReport (E : Type) := E → E → Charge

/-- The report affirms reachability `x ⤳ y` when its charge carries a positive (truth) slot. -/
def ReportsReachable (R : ConeReport E) (x y : E) : Prop := (R x y).pos = true

/-- The report is inconsistent at `(x,y)` when it is the over-determined charge `⊤`. -/
def ReportsInconsistent (R : ConeReport E) (x y : E) : Prop := R x y = Charge.kTop

/-- The report is unknown at `(x,y)` when it is the under-determined charge `⊥`. -/
def ReportsUnknown (R : ConeReport E) (x y : E) : Prop := R x y = Charge.kBot

/-- The charged future cone of `x`: the charge reported for each target. -/
def ChargedFuture (R : ConeReport E) (x : E) : E → Charge := fun y => R x y

/-! ## (B) Merging reports under knowledge join -/

/-- Merge two reports cellwise under the knowledge join `∨ₖ`. -/
def mergeReports (R S : ConeReport E) : ConeReport E :=
  fun x y => Charge.joinK (R x y) (S x y)

/-- Report merge is commutative. -/
theorem mergeReports_comm (R S : ConeReport E) : mergeReports R S = mergeReports S R := by
  funext x y
  exact Charge.joinK_comm (R x y) (S x y)

/-- The knowledge order is below the knowledge join on the left (per charge). -/
theorem charge_leK_joinK_left (a b : Charge) : Charge.leK a (Charge.joinK a b) = true := by
  cases a <;> cases b <;> decide

/-- Merging a report accumulates knowledge: each cell climbs in the knowledge order. -/
theorem mergeReports_infl_left (R S : ConeReport E) :
    ∀ x y, Charge.leK (R x y) (mergeReports R S x y) = true :=
  fun x y => charge_leK_joinK_left (R x y) (S x y)

/-! ## (C) Boolean causality as a consistent report -/

/-- A Boolean causal relation as a charged report: affirmative `t` where it holds, unknown `⊥`
elsewhere — never inconsistent. -/
def booleanConeReport (prec : E → E → Bool) : ConeReport E :=
  fun x y => bif prec x y then Charge.tTop else Charge.kBot

/-- A Boolean cone report is never the inconsistent charge `⊤`. -/
theorem booleanConeReport_ne_kTop (prec : E → E → Bool) (x y : E) :
    booleanConeReport prec x y ≠ Charge.kTop := by
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
    ∧ (∀ (R S : ConeReport E) x y, Charge.leK (R x y) (mergeReports R S x y) = true)
    ∧ (∀ (R S : ConeReport E), mergeReports R S = mergeReports S R)
    ∧ (∀ (prec : E → E → Bool) x y,
        ReportsReachable (booleanConeReport prec) x y ↔ prec x y = true) :=
  ⟨fun prec => booleanConeReport_consistent prec,
   fun R S => mergeReports_infl_left R S,
   fun R S => mergeReports_comm R S,
   fun prec => booleanConeReport_reachable_iff prec⟩

end Relational.Spacetime.Causal.ParaconsistentCone
end Infomaterial
