---
title: Seeding Entropy
act: EntropySeed
top: FlowMeasureStep
bottom: FixedReach
summary: "Seed an entropy measure by composing the one-step flow\u2013measure update with the reachability recognitions."
tags:
- act
layer: act
status: plan
---

Entropy measures the “spread” of a state under transitions.  We seed entropy by
observing the divergence between the original state and its successor.
[FixedReach](fixed-reach.md) gives reachable states, and [FlowMeasureStep](flow-measure-step.md)
gives the successor.  Letting these witness each other,
`(FlowMeasureStep FixedReach)`, earns ***EntropySeed***.

`FixedReach` lists the reachable states and `FlowMeasureStep` describes the
successor states after one evolution–measurement.  Their composition
records the divergence between present and next-step reachable states, seeding
the entropy measure.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
