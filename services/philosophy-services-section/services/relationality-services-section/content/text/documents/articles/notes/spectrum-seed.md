---
title: Spectrum Seed
act: SpectrumSeed
slug: spectrum-seed
top: ObservationKernel
bottom: HarmonicMode
summary: Seed the spectrum by letting the observation kernel act on a harmonic mode.
tags:
- act
layer: act
status: plan
---
# Spectrum Seed

The spectrum of an operator measures its action on harmonic modes.  To seed the
spectrum we let the observation kernel act on a harmonic mode:
`(ObservationKernel HarmonicMode)` earns ***SpectrumSeed***.

[ObservationKernel](../../../triage/relationality/relationality-slop-2025-04/internal/observation-kernel.md) evolves states and attaches
observational distributions, while [HarmonicMode](./harmonic-mode.md)
is a stable oscillatory pattern.  Their composition records how the kernel
acts on this harmonic, yielding a spectral seed.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
