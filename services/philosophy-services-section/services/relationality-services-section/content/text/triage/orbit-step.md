---
title: Stepping Orbit
act: OrbitStep
top: FixedReach
bottom: TailTrace
summary: Describe how orbits progress by letting `FixedReach` witness `TailTrace`.
tags:
- act
layer: act
status: plan
---

Seeding alone does not describe how orbits progress.  [TailTrace](tail-trace.md)
isolates the remainder of a trace after the head, and `StepTrace` records how
reduction steps propagate along the trace.  To describe orbit progression, we
let the reachability act witness the tail:
`(FixedReach TailTrace)` earns ***OrbitStep***.

[FixedReach](fixed-reach.md) already lists states reachable from invariants
under the flow.  `TailTrace` exposes the remainder of the trace beyond the
initial step, and `StepTrace` tracks how reductions move along that remainder.
Their composition records how each orbit advances from
its current layer to the next along the trace remainder.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
