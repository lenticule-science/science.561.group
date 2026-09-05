---
title: Observation Kernel
act: ObservationKernel
slug: observation-kernel
top: FixedObservationRecognitions
bottom: TransitionLaw
summary: >-
  Combine the transition law with fixed observations by composing
  `FixedObservationRecognitions` with `TransitionLaw`.
tags:
  - act
---
# Observation Kernel

A kernel couples transition structure with observable outcomes.
[TransitionLaw](transition-law.md) provides the transition step, and
[FixedObservationRecognitions](fixed-observation-recognitions.md) restricts
observations to fixed recognitions.  Letting the observation act witness the
transition law,
`(FixedObservationRecognitions TransitionLaw)`, earns
***ObservationKernel***.

`TransitionLaw` determines how fixed states map to successor recognitions, and
`FixedObservationRecognitions` selects observables available in the fixed
profile.  Their composition assigns to each fixed invariant state the observable
distribution induced by one flow–measure step, yielding the profile’s kernel.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
