---
title: Flow Variance
id: flow-variance
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Computes how recognitions diverge under iterative flow—variance of uncertainty.

## Definition
- Inputs: an [Uncertainty Profile](./uncertainty-profile.md) and
  [Flow Context](./flow-context.md).
- Output: updated [Uncertainty Profile](./uncertainty-profile.md)
  reflecting spread after flow steps.
- Behaviour: iterate flow, measure change in entropy/dispersion, update profile.

## Invariants
- Non-negativity: variance measures are ≥ 0.
- Monotone w.r.t. informative collapse: variance decreases when flow collapses
  to fixed points.

## Proof
- Uses: uncertainty profile and flow dynamics.
- Shows that: divergence/spread under flow is measurable in the relational
  setting.
