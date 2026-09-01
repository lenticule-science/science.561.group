---
title: Counterfactual Operator
id: counterfactual-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Constructs the closest alternative world consistent with a hypothetical.

## Definition
- Inputs: a [Branching Time World](./branching-time-world.md) and a
  hypothetical modification to a [Time Slice](./time-slice.md).
- Output: modified [Relational World](./relational-world.md) pushed
  forward under flow from the altered slice.
- Behaviour: modify the slice, apply [Flow Context](./flow-context.md) forward
  along the branch, and collapse via nucleus to obtain the counterfactual
  world.

## Invariants
- Minimal change: alters only what is necessary to satisfy the hypothetical.
- Consistency: resulting world still respects flow/nucleus and branch causality.

## Proof
- Uses: [Branching Time World](./branching-time-world.md) and
  [Flow Context](./flow-context.md).
- Produces: [Relational World](./relational-world.md) representing
  the counterfactual.
- Shows that: counterfactual reasoning fits within earned temporal branching and
  flow semantics.
