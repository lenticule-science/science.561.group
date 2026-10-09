import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Order and closure overview" =>

# Order And Closure

Status: foundation and recovered mathematics.

Modules: `OrderInfra`, `TruthOrder`, `Ord`,
`ClosureRegimeData`, `Closure.Monad`, `Closure.Monad.KZ`,
`Closure.Operator`, `ClosureRule.RuleSystem`, `Closure.Scott`,
`KnasterTarskiStandalone`, `AperiodicOrder.Tiling.StepN.Recurrence`,
`AperiodicOrder.Tiling.StepN.FixedPoint`,
`TransfiniteClosureFlow`, `Ordinal`.

This family documents the point where Obsmetrologia stops treating order as ambient
background and starts recovering order as a consequence of settling and closure.

`OrderInfra` and `TruthOrder` provide the local order infrastructure needed by
later constructions. `Ord` and `ClosureRegimeData` record the
finite and ordinal behavior of iteration. `Closure.Monad` and `Closure.Monad.KZ`
package closure as monadic or KZ-like structure when that packaging is generated
by the earlier order.

`ClosureRule.RuleSystem`, `Closure.Scott`, `AperiodicOrder.Tiling.StepN.Recurrence`,
`AperiodicOrder.Tiling.StepN.FixedPoint`, and `TransfiniteClosureFlow` document operational views of
closure: rule systems, continuity questions, finite recurrence, fixed points, and
transfinite iteration. `Ordinal` gives the local ordinal vocabulary needed here.

Reader warning: order is not the hidden floor of the library. The manual should
keep showing where each order is generated and what it measures.
