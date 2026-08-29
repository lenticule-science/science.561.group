---
title: Measure Modal Drift
id: measure-modal-drift
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Measure Modal Drift

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
