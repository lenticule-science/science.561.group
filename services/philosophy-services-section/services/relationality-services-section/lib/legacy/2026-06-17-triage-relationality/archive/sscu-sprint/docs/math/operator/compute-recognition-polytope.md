---
title: Compute Recognition Polytope
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



Computes the closure of a finite set of recognitions under join/meet to form a
recognition polytope.

## Definition
- Inputs: finite generator set in [Recognition Carrier](../structure/recognition.md).
- Output: [Recognition Polytope](../structure/recognition-polytope.md).
- Behaviour: iteratively apply join/meet until closure stabilises.

## Invariants
- Finite termination: closure stabilises after finite steps.
- Minimality: yields smallest closed set containing generators.

## Proof
- Uses: recognition lattice operations.
- Produces: polytope closure.
- Shows that: finite generators yield a closed polytope via joins/meets.
