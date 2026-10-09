---
title: Rollback
id: rollback
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Rollback the current relational state to a given time slice.
---



Rollback the current relational state to a given time slice.

## Definition
- Inputs: a [Time Slice](./time-slice.md) and access to
  [Load Context](load-context.md).
- Output: restored [Hypertensor Section](./hypertensor-section.md)
  consistent with the saved memory carrier.
- Behaviour: load saved contexts/recognitions from the slice, replace current
  section, and discard morphisms that do not factor through the slice.

## Invariants
- Causality preservation: no illegal cross-time references survive rollback.
- Fidelity: restored section is nucleus-equivalent to the saved slice.

## Proof
- Uses: [Time Slice](./time-slice.md) and [Load Context](load-context.md).
- Produces: [Hypertensor Section](./hypertensor-section.md).
- Shows that: rollback reconstructs an earlier state without violating earned
  causality constraints.
