---
title: Fixing Orbit Layer
act: OrbitFixLayer
top: EnsureFixedPoint
bottom: OrbitStep
summary: Apply the fixed-point construction to the orbit step to obtain the stabilized layer of each orbit.
tags:
- act
layer: act
status: plan
---

Orbits may stabilize: further reach steps no longer change the reachable set.
[EnsureFixedPoint](./ensure-fixed-point.md) captures fixed points of flows when
iteration persists.  To obtain the stabilized layer of each orbit, we apply it
to [OrbitStep](./orbit-step.md):
`(EnsureFixedPoint OrbitStep)` earns ***OrbitFixLayer***.

`OrbitStep` describes how reachable states progress from one layer to the next.
`IterativePersistence` and `EnsureFixedPoint` ensure that when repeated
stepping along the trace stabilizes, the stabilized states form a fixed set.
Their composition therefore yields, for each orbit, a stabilized layer that
further stepping does not change.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
