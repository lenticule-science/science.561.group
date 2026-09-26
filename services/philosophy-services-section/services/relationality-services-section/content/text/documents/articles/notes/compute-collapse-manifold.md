---
title: Compute Collapse Manifold
id: compute-collapse-manifold
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Computes the collapse manifold for a recognition.
---



Computes the collapse manifold for a recognition.

## Definition
- Inputs: recognition, flow rules, and nucleus.
- Output: [Collapse Manifold](./collapse-manifold.md) containing all
  recognitions that collapse to the same limit.
- Behaviour: explore flow extensions, apply nucleus, collect recognitions with
  identical limits.

## Invariants
- Correctness: manifold matches shared collapse limit.
- Stability: manifold closed under flow/nucleus to the limit.

## Proof
- Uses: flow and nucleus operations.
- Produces: collapse manifold witness.
- Shows that: collapse equivalence classes are computable.
