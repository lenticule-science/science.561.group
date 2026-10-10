import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Order and closure overview" =>

# Order And Closure

Status: foundation and recovered mathematics.

Modules: `OrderInfra`, `TruthOrder`, `ClosureOrdinal`,
`ClosureOrdinalRegime`, `ClosureMonad`, `Closure2MonadKZ`,
`ClosureOperatorFiber`, `ClosureRuleSystem`, `ScottContinuousClosure`,
`KnasterTarskiStandalone`, `StepNRecurrence`, `StepNFixedPoint`,
`TransfiniteClosureFlow`, `Ordinal`.

This family documents the point where Infomaterial stops treating order as ambient
background and starts recovering order as a consequence of settling and closure.

`OrderInfra` and `TruthOrder` provide the local order infrastructure needed by
later constructions. `ClosureOrdinal` and `ClosureOrdinalRegime` record the
finite and ordinal behavior of iteration. `ClosureMonad` and `Closure2MonadKZ`
package closure as monadic or KZ-like structure when that packaging is generated
by the earlier order.

`ClosureRuleSystem`, `ScottContinuousClosure`, `StepNRecurrence`,
`StepNFixedPoint`, and `TransfiniteClosureFlow` document operational views of
closure: rule systems, continuity questions, finite recurrence, fixed points, and
transfinite iteration. `Ordinal` gives the local ordinal vocabulary needed here.

Reader warning: order is not the hidden floor of the library. The manual should
keep showing where each order is generated and what it measures.
