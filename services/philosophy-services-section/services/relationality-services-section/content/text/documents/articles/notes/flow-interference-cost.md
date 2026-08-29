---
title: Flow Interference Cost
id: flow-interference-cost
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Flow Interference Cost

Evaluates cost/penalty of superposed flows using interference patterns and flow potential.

## Definition
- Inputs: two flows, their [Flow Interference Pattern](flow-interference-pattern.md),
  and current [Flow Potential](./flow-potential.md).
- Output: updated potential reflecting interference cost.
- Behaviour: detect constructive/destructive interference; adjust potential to
  reflect scheduling cost/benefit.

## Invariants
- Increased potential for destructive/interfering patterns.
- Composable: multiple interference assessments compose additively/monotonically.

## Proof
- Uses: interference pattern and potential to compute cost adjustment.
- Produces: updated flow potential.
- Shows that: interference effects can be incorporated into cost planning.
