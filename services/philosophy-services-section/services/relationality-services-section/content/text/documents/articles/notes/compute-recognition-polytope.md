---
title: Compute Recognition Polytope
id: compute-recognition-polytope
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Computes the closure of a finite set of recognitions under join/meet to form a recognition polytope.
---



Computes the closure of a finite set of recognitions under join/meet to form a
recognition polytope.

## Definition
- Inputs: finite generator set in [Recognition Carrier](./recognition.md).
- Output: [Recognition Polytope](./recognition-polytope.md).
- Behaviour: iteratively apply join/meet until closure stabilises.

## Invariants
- Finite termination: closure stabilises after finite steps.
- Minimality: yields smallest closed set containing generators.

## Proof
- Uses: recognition lattice operations.
- Produces: polytope closure.
- Shows that: finite generators yield a closed polytope via joins/meets.
