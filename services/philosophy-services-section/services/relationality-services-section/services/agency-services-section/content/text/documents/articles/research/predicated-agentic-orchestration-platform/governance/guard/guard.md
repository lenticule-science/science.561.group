---
type: concept
class: operation-kind
depends-on: [operation-kinds, dispatch]
see-also: [authorization, governance, soul-violation-check, guard-verdict-is-bilattice-meet]
title: Guard
description: "The platform's admissibility-check operation kind: an operation that reads a proposed action's predications, the targeted scope's constraints, and the actor's authorization, and produces an admissibility value (admitted, rejected,…"
---

# Guard

The platform's *admissibility-check* operation kind: an operation that reads a proposed action's predications, the targeted [scope](../../scope/scope.md)'s constraints, and the actor's [authorization](../authorization/authorization.md), and produces an *admissibility value* (admitted, rejected, contested) without itself performing the proposed action.

A guard is structurally distinct from a [mutation](../../memory/mutation/mutation.md): the guard does not change substrate state — it produces only a verdict.
The verdict is what [dispatch](dispatch.md) consults to decide whether to admit the proposed action; if admitted, the action proceeds (typically as a separate mutation operation); if rejected, the substrate records the rejection and the action does not occur.

## Three structural moves a guard performs

A guard's body composes the following:

- **Read-against-shape.** Read the proposed action's predications and the targeted scope's [shape](../../scope/shape/shape-record/shape-record.md) records.
  Compute whether the action's predications satisfy the relevant shapes.
- **Read-against-authorization.** Read the actor's authorization predications (powers, duties, privileges, immunities) and the proposed action's required authorization.
  Compute whether the actor's authorization admits the action.
- **Read-against-soul.** Per [soul-violation-check](../../agent/governing-soul/soul-violation-check/soul-violation-check.md), check whether the proposed action would violate the scope's [governing soul](../../agent/governing-soul/governing-soul.md).

The guard's verdict is the composition: admitted iff all three reads return admit; rejected if any returns reject; contested if reads disagree (typically a substrate-coherence issue requiring repair).

## Engineering properties

- **Read-only.** A guard does not mutate substrate state; its only output is the verdict and a [witness](../../teaching/explanations/witness.md) recording the verdict's basis.
- **Local.** A guard reads only at the bounded radius of the action's predications, the targeted scope's shapes, and the actor's authorization.
  Per [locality](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront.md), the guard cannot scan the global graph.
- **Witness-recorded.** Every guard invocation produces a witness with the verdict and the predications that determined it.
  An auditor can re-run the guard from substrate state and reproduce the verdict.
- **Composable.** Multiple guards can be composed into a guard-pipeline: each guard reads the verdict of the previous and may further refine it.
  Final verdict is the composition's outcome.

## Position in the platform

Guards are the platform's *admissibility infrastructure*.
They are what make the platform's operations honor authorization, shape constraints, and soul provisions consistently across all operations — every operation that mutates substrate state has a guard step that runs first.
The substrate's discipline is that admissibility checks are *guard operations*, not implicit code-level if-statements; the discipline is what makes the platform's authorization auditable.

Particular guard patterns:

- **Authorization-guard.** Reads only authorization; admits iff the actor has the required power.
- **Shape-guard.** Reads only shapes; admits iff the proposed predications satisfy the targeted shapes.
- **Soul-guard.** Reads only soul predications; admits iff the proposed action does not violate the scope's soul.
- **Composite-guard.** Reads all three; the conjunction's verdict.
