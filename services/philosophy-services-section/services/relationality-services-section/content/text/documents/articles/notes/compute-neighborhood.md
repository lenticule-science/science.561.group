---
title: Compute Neighborhood
id: compute-neighborhood
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Computes the relational neighborhood (open ball) of a recognition.

## Definition
- Inputs: a recognition in the [Recognition Carrier](./recognition.md).
- Output: a [Relational Neighborhood](./relational-neighborhood.md)
  consisting of flow-successors within one nucleus class.
- Behaviour: apply one-step [Flow Context](./flow-context.md), close under
  nucleus, collect resulting recognitions.

## Invariants
- Minimal: contains exactly the immediate flow/nucleus successors.
- Monotone: neighborhoods expand (never shrink) as flow is iterated.

## Proof
- Uses: [Flow Context](./flow-context.md) and the recognition lattice.
- Produces: [Relational Neighborhood](./relational-neighborhood.md).
- Shows that: neighborhoods are computable and form the basis for relational
  topology/metric definitions.
