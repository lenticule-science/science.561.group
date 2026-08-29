---
title: Revision Operator
id: revision-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Revision Operator

AGM-style belief revision in relational form.

## Definition
- Inputs: a [Belief Base](../structure/belief-base.md) and an
  [Observation](../structure/observation.md).
- Output: updated [Belief Base](../structure/belief-base.md) incorporating the
  observation.
- Behaviour: add the observation, remove minimal conflicting beliefs, and close
  under inference/nucleus.

## Invariants
- Success: observation is in the revised base (unless inconsistent).
- Minimal change: removes as little as possible to restore consistency (per
  chosen preorder).
- Closure: revised base is closed under earned inference.

## Proof
- Uses: [Belief Base](../structure/belief-base.md) and
  [Observation](../structure/observation.md).
- Produces: revised [Belief Base](../structure/belief-base.md).
- Shows that: belief revision can be expressed via recognitions consistent with
  modal/logic structure.
