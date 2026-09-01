---
title: Relational Metric
id: relational-metric
role: structure
status: plan
proof_refs: []
---



Assigns distances to recognitions based on minimal admissible flow paths modulo
nucleus equivalence.

## Definition
- Distance: length of shortest sequence of [Flow Context](../operator/flow-context.md)
  steps connecting two recognitions, factoring by nucleus equivalence.
- Normalisation: may weight steps by neighborhood size or other earned costs.

## Invariants
- Non-negativity and symmetry (if flow is reversible; otherwise quasi-metric).
- Triangle inequality from path concatenation.
- Zero distance iff recognitions are nucleus-equivalent.

## Proof
- Uses: [Relational Neighborhood](relational-neighborhood.md) to define step
  transitions and nucleus to collapse equivalences.
- Shows that: flow-based distances form a metric/quasi-metric on recognitions.
