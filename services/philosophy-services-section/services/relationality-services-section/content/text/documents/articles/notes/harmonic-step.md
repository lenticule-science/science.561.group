---
title: Harmonic Step
act: HarmonicStep
top: HarmonicSeed
bottom: OrbitStep
summary: Track the evolution of harmonics by composing the harmonic seed with the orbit step.
tags:
- act
layer: act
status: plan
---

Harmonics progress as oscillations across orbit layers.
[OrbitStep](./orbit-step.md) gives the next reachable layer.
Letting the harmonic seed witness each step,
`(HarmonicSeed OrbitStep)`, earns ***HarmonicStep***.

[HarmonicSeed](./harmonic-seed.md) captures the initial oscillation,
and `OrbitStep` advances one layer, so their composition yields the
evolving harmonic component across the orbit.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
