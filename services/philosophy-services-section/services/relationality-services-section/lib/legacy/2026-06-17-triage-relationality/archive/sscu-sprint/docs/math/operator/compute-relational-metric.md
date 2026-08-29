---
title: Compute Relational Metric
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



Computes flow-based distances between recognitions.

## Definition
- Inputs: recognitions and admissible [Flow Context](flow-context.md).
- Output: a [Relational Metric](../structure/relational-metric.md).
- Behaviour: search for shortest admissible flow paths modulo nucleus
  equivalence; assign distances; store as metric data.

## Invariants
- Triangle inequality via path concatenation.
- Zero distance on nucleus-equivalent recognitions.
- Monotone with respect to adding admissible flow steps.

## Proof
- Uses: flow/neighborhood structure to define path lengths.
- Produces: [Relational Metric](../structure/relational-metric.md).
- Shows that: distances are well-defined from flow dynamics.
