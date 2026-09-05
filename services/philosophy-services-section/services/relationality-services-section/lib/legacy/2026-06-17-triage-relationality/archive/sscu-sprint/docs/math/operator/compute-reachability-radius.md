---
title: Compute Reachability Radius
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



Computes the minimal flow distance between two recognitions.

## Definition
- Inputs: source/target recognitions, flow rules, and [Relational Metric](../structure/relational-metric.md).
- Output: [Reachability Radius](../structure/reachability-radius.md).
- Behaviour: search admissible flow paths, take minimal metric length.

## Invariants
- Minimality: reported radius is minimal over admissible paths.
- Symmetry if flow is reversible; otherwise directed radius.

## Proof
- Uses: flow/metric to compute shortest paths.
- Produces: radius measure.
- Shows that: reachability cost is computable for planning/scheduling.
