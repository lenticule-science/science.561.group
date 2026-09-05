---
title: Cross-Scale Influence
id: cross-scale-influence
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Measures how changes at fine scale alter coarse-scale recognitions.

## Definition
- Inputs: fine/coarse levels in the [Scale Tower](./scale-tower.md)
  and a [Hypertensor Section](./hypertensor-section.md).
- Output: recognition reflecting sensitivity of coarse recognitions to fine
  perturbations (scale-gradient).
- Behaviour: perturb fine level, rescale to coarse, measure resulting change,
  express as recognition.

## Invariants
- Monotonicity: larger fine changes yield larger coarse influence.
- Stability: zero influence when fine changes collapse under rescaling.

## Proof
- Uses: rescaling across scales and recognition comparison.
- Produces: [Recognition Carrier](./recognition.md) measure.
- Shows that: cross-scale effects are recognisable and quantifiable.
