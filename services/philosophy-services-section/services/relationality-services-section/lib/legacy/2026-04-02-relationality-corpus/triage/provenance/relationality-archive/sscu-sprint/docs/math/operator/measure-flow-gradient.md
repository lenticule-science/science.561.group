---
name: measure-flow-gradient
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Quantifies rate of change of recognitions along flow.

## Definition
- Inputs: flow dynamics and recognitions.
- Output: [Flow Gradient](../structure/flow-gradient.md) measurements.
- Behaviour: compute derivative-like change per flow step; record as gradient.

## Invariants
- Monotone with respect to flow strength.
- Zero when flow leaves recognition unchanged.

## Proof
- Uses: flow context to measure change.
- Produces: flow gradient data.
- Shows that: flow steepness can be measured recognitionally.
