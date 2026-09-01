---
title: Causal Guard
id: causal-guard
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Ensures rollbacks and trace manipulations respect causality constraints.

## Definition
- Inputs: a [Trace Shuffle Class](./trace-shuffle-class.md) and a
  [Time Slice](./time-slice.md).
- Output: causal validation (or refusal) that the shuffle does not introduce
  new influence paths across the rollback boundary.
- Behaviour: checks that reordering via shuffle preserves dependency/causality
  relative to the time slice; if violated, guard fails and advises rollback
  rejection.

## Invariants
- Soundness: accepted shuffles cannot create new causal paths across the slice.
- Stability: guards compose over multiple shuffles and slices.

## Proof
- Uses: [Trace Shuffle Class](./trace-shuffle-class.md) and
  [Time Slice](./time-slice.md).
- Shows that: causal constraints can be enforced when manipulating traces with
  rollbacks.
