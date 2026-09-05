---
title: Seeding Orbit
act: OrbitSeed
slug: orbit-seed
top: FixedReach
bottom: HeadTrace
summary: >-
  Isolate the starting layer of each reachability orbit by letting
  `FixedReach` witness `HeadTrace`.
tags:
  - act
---
# Seeding Orbit

[FixedReach](fixed-reach.md) records which invariant states are reachable under
the flow, but we have not yet isolated the “starting layer” of each orbit.
[HeadTrace](head-trace.md) isolates the head of a trace.  To seed an orbit, we
let the reachability act witness the trace head: `(FixedReach HeadTrace)` earns
***OrbitSeed***.

`FixedReach` evolves invariant states according to the flow, and `HeadTrace`
picks out the first step of any completed trace.  Their composition therefore
records the initial reachable layer associated with the first trace action from
each invariant state.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
