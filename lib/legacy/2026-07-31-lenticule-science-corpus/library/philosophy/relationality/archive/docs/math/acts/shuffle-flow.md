---
title: Flowing Shuffle Trace
act: ShuffleFlow
slug: shuffle-flow
top: Flow
bottom: ShuffleTrace
summary: Evolve the entire admissible shuffle class of a trace by letting the global flow witness the shuffle act, producing a flow whose orbits are the admissible reorderings.
tags:
- act
layer: act
status: plan
---
# Flowing Shuffle Trace

[Flow](flow.md) already records how observation and judgment traces evolve
through evaluation contexts, and [ShuffleTrace](shuffle-trace.md) records how
trace-progress steps can be freely commuted without changing the underlying
shape.  By treating admissible trace shuffles themselves as the state being
evolved and letting the global flow witness the shuffle act,
`(Flow ShuffleTrace)` earns ***ShuffleFlow***.

`Flow` binds the observation and judgment flows, describing how dynamics
transport recognitions through contexts.  `ShuffleTrace` records the free
shuffle structure on trace-progress recognitions: reheading and restepping
commute in all admissible ways.  The composition therefore evolves families of
shuffled traces along evaluation contexts: the flow does not move a single
trace but the entire admissible-shuffle class, tracking the dynamics of
admissible reorderings as first-class objects.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
