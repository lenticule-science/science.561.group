---
title: Harmonic Mode
act: HarmonicMode
top: EnsureFixedPoint
bottom: HarmonicStep
summary: Capture the invariant harmonic oscillation by applying the fixed-point construction to the harmonic step.
tags:
- act
layer: act
status: plan
description: Capture the invariant harmonic oscillation by applying the fixed-point construction to the harmonic step.
---

A harmonic mode is a recognitional oscillation that remains invariant under
the flow, so we apply the fixed-point construction to the harmonic step:
`(EnsureFixedPoint HarmonicStep)` earns ***HarmonicMode***.

By `IterativePersistence`, an oscillation that repeats after successive steps
is a fixed point.  Composing ensures we compute the oscillatory pattern that
survives arbitrary advancement—the stabilized harmonic shape.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
