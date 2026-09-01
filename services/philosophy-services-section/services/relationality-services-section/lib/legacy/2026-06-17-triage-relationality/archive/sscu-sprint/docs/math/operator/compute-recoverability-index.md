---
title: Compute Recoverability Index
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



Computes the recoverability index for a collapsed recognition.

## Definition
- Inputs: a collapsed recognition and its preimage structure under
  [Nucleus](nucleus.md).
- Output: [Recoverability Index](../structure/recoverability-index.md).
- Behaviour: count/measure distinct preimages or reconstruction potential; assign
  index value.

## Invariants
- Correctness: index reflects actual preimage multiplicity.
- Monotone: coarser collapses reduce index.

## Proof
- Uses: nucleus mapping to analyse preimages.
- Produces: recoverability index.
- Shows that: information recoverability is computable.
