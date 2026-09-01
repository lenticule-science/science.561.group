---
title: Fixed Observe
act: FixedObserve
top: FixedObservationRecognitions
bottom: SeedTerm
summary: Observe traced terms inside the fixed profile by composing `FixedObservationRecognitions` with `SeedTerm`.
tags:
- act
layer: act
status: plan
---

The profile-level observable
[ProfileObserve](./profile-observe.md) uses
[ProfileObservationRecognitions](./profile-observation-recognitions.md).  To stay
within the fixed profile we replace that recogniser by
[FixedObservationRecognitions](./fixed-observation-recognitions.md):
`(FixedObservationRecognitions SeedTerm)` earns ***FixedObserve***.

`SeedTerm` inserts the trace head into a recognised context, producing the basic
term to be observed, and the fixed observation recognitions restrict those
observables to the fixed profile.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
