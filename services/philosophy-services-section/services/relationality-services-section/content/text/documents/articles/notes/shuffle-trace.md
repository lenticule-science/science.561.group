---
title: Shuffling Trace
act: ShuffleTrace
slug: shuffle-trace
top: ReheadTrace
bottom: RestepTrace
summary: Head/tail renewals commute with step renewals, so forcing `ReheadTrace` to witness `RestepTrace` records the shuffle principle for independent trace progressions.
tags:
- act
layer: act
status: plan
---
# Shuffling Trace

Many trace acts commute: [ReheadTrace](./rehead-trace.md) reorders against
[RetailTrace](./retail-trace.md), [RestepTrace](./restep-trace.md) reorders against
[TraceStep](./trace-step.md), and each head/tail act commutes with the earlier
progressions exposed by [CompleteTrace](./complete-trace.md).  No recognition yet
packages these commutations into a single principle, so we force the renewed
head to witness the stepping remainder: `(ReheadTrace RestepTrace)` earns
***ShuffleTrace***.

`ReheadTrace` and `RestepTrace` already demonstrate the two independent ways a
trace can progress: renewing the head or renewing the remainder.  Their
composition shows these progressions can be swapped without violating any
earned admissibility.  Thus `ShuffleTrace` records that the family of
trace-progressing acts forms a free shuffle algebra—any ordering built from
these steps is admissible, and admissibility is closed under permutation of
independent steps.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
