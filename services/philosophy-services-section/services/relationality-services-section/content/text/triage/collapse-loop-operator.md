---
title: Collapse Loop Operator
id: collapse-loop-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Collapse Loop Operator

Collapses loops of recognitions into fundamental “shape classes” (π₁ analogue).

## Definition
- Inputs: loops in [Loop Space](../structure/loop-space.md) / paths in the
  [Fundamental Groupoid](../structure/fundamental-groupoid.md).
- Output: recognition of the loop’s homotopy class (shape class).
- Behaviour: classify loops up to homotopy, report class as recognition.

## Invariants
- Homotopy invariance: loops in same class yield same recognition.
- Groupoid compatibility: composition corresponds to class composition.

## Proof
- Uses: loop/fundamental groupoid structure to identify homotopy classes.
- Produces: recognition marking the class.
- Shows that: fundamental group(oid) information can be captured recognitionally.
