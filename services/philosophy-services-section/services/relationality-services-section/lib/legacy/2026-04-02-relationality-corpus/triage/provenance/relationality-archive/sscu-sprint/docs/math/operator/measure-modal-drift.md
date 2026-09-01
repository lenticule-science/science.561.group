---
name: measure-modal-drift
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



Measures drift of recognitions across modal layers under flow.

## Definition
- Inputs: recognitions, [Modal Structure](../structure/modal-structure.md),
  and [Flow Context](flow-context.md).
- Output: [Modal Drift](../structure/modal-drift.md) measurement.
- Behaviour: track modal layer changes per flow step; quantify drift rate.

## Invariants
- Monotonic tracking: drift accumulates; stabilises if modal status fixed.
- Zero drift when modal status unchanged.

## Proof
- Uses: modal structure and flow to observe changes.
- Produces: modal drift data.
- Shows that: modal drift is measurable.
