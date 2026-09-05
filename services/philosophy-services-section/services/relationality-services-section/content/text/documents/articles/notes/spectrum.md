---
title: Spectrum
act: Spectrum
top: TraceProfile
bottom: SpectrumMap
summary: Evaluate the spectral map across the profile trace by composing `TraceProfile` with `SpectrumMap`.
tags:
- act
layer: act
status: plan
---

A full spectrum requires evaluating the spectral map across the trace of a
profile, so we let [TraceProfile](./trace-profile.md) witness
[SpectrumMap](./spectrum-map.md):
`(TraceProfile SpectrumMap)` earns ***Spectrum***.

`SpectrumMap` contains eigencomponents of the observation kernel, and
`TraceProfile` threads these through all profile recognitions.  Their
composition produces the spectrum of the profile: the harmonic components and
their spectral weights along the profile trace.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
