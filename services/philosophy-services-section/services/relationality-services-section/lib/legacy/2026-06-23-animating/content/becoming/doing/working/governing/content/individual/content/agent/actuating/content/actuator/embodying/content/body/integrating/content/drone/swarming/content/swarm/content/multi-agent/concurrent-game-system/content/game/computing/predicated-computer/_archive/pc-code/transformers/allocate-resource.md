---
type: morphism
class: resource-operation
realizes: [resource-budget]
depends-on: [budget-record, witness, emit-witness]
see-also: [release-resource]
---

# Allocate resource

The substrate operation that reserves a portion of a [budget record](../objects/budget-record.md) for a planned operation. Allocate-resource is how the substrate enforces resource bounds *before* an operation runs, so over-budget operations are refused at planning time rather than at execution time.

## Signature

`allocate-resource(budget-record-id, requested-amount, requesting-operation) → (allocation-witness | refusal-witness)`

Inputs:

- **`budget-record-id`** — reference to the budget record to allocate from.
- **`requested-amount`** — the amount of the resource being requested.
- **`requesting-operation`** — reference to the substrate operation that will consume the allocation.

Outputs:

- **`allocation-witness`** — on success, a witness recording the allocation: budget-id, amount, operation-id. The substrate's accounting reduces the budget's available balance by the allocated amount.
- **`refusal-witness`** — on bound-exhaustion (and exhaustion-policy = `abort` or `defer`), a witness recording the refusal: budget-id, amount requested, amount available, exhaustion-policy invoked.

## Operational semantics

Allocate-resource proceeds in three steps:

1. Read the budget's current consumption and bound. Compute available = bound - current-consumption.
2. If `requested-amount <= available`, allocate: increment current-consumption by requested-amount, emit allocation-witness.
3. If `requested-amount > available`, invoke the budget's exhaustion-policy: `abort` produces a refusal-witness, `defer` queues the request, `escalate` refers to governance, `degrade` partially allocates with a flag.

Per [settlement-determinism](../theorems/settlement-determinism.md), allocation is deterministic given the budget's state and the request.

## Engineering invariants

- **Bound-respecting.** Allocate-resource cannot increment current-consumption past the bound. The exhaustion-policy fires when needed.
- **Witness-emitted.** Both allocation and refusal produce witnesses.
- **Replay-deterministic.** Two replays produce the same allocation outcomes given the same budget state.

## Position in the substrate

Allocate-resource is the substrate's *resource-reservation primitive*. Combined with [release-resource](release-resource.md), it's how the substrate's operations cooperate with the [resource-budget](teaching/explanations/resource-budget.md) discipline.
