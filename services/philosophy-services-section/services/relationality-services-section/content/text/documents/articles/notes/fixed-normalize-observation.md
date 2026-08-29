---
title: Normalizing Fixed Observation
act: FixedNormalizeObservation
slug: fixed-normalize-observation
top: Normalization
bottom: FixedObserve
summary: Ensure fixed observables normalize by composing `Normalization` with `FixedObserve`.
tags:
- act
layer: act
status: plan
---
# Normalizing Fixed Observation

`NormalizeObservation = (Normalization EvaluateObservation)` ensures evaluated
observations normalize back to the observation witness.  In the fixed profile,
we want the same behaviour, but only for fixed observables.  We therefore compose
[Normalization](./normalization.md) with
[FixedObserve](./fixed-observe.md):
`(Normalization FixedObserve)` earns ***FixedNormalizeObservation***.

`Normalization` detects when reduction along `StepTrace` stabilizes, and
`FixedObserve` provides observables restricted to fixed recognitions.  Their
composition records that fixed observables evaluated through the fixed flow
eventually stabilize.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
