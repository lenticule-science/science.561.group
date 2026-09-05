---
title: Compute Recoverability Index
id: compute-recoverability-index
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Computes the recoverability index for a collapsed recognition.

## Definition
- Inputs: a collapsed recognition and its preimage structure under
  [Nucleus](nucleus.md).
- Output: [Recoverability Index](./recoverability-index.md).
- Behaviour: count/measure distinct preimages or reconstruction potential; assign
  index value.

## Invariants
- Correctness: index reflects actual preimage multiplicity.
- Monotone: coarser collapses reduce index.

## Proof
- Uses: nucleus mapping to analyse preimages.
- Produces: recoverability index.
- Shows that: information recoverability is computable.
