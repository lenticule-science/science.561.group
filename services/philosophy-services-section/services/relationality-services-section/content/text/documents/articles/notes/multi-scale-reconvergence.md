---
title: Multi-Scale Reconvergence
id: multi-scale-reconvergence
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Collapses recognitions across multiple scales to a unified shape when consistent.

## Definition
- Inputs: recognitions/sections at multiple levels of the [Scale Tower](./scale-tower.md).
- Output: unified [Hypertensor Section](./hypertensor-section.md) if
  consistent; otherwise refusal/failure.
- Behaviour: check compatibility across scales via rescaling; if consistent,
  apply multi-level nucleus to converge to a common section.

## Invariants
- Consistency: only converges when cross-scale data agree under rescaling.
- Idempotent: reconverging an already converged set yields the same result.

## Proof
- Uses: scale rescaling and nucleus to merge multi-scale data.
- Produces: unified section or signals inconsistency.
- Shows that: multi-scale data can be reconciled when compatible.
