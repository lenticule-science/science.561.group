---
title: Transition Law
act: TransitionLaw
slug: transition-law
top: FlowMeasureStep
bottom: FixedInvariant
summary: Map fixed invariant states through the one-step update by composing `FlowMeasureStep` with `FixedInvariant`.
tags:
- act
layer: act
status: plan
---
# Transition Law

A transition law records how each invariant state spreads into its possible
successors.  With the one-step update
([FlowMeasureStep](flow-measure-step.md)) and the domain of fixed invariant
states ([FixedInvariant](fixed-invariant.md)), we let the step witness
the invariant recognitions to obtain the transition map:
`(FlowMeasureStep FixedInvariant)` earns ***TransitionLaw***.

`FixedInvariant` lists the fixed states, and `FlowMeasureStep`
describes how a step transforms any such state.  Their composition maps
each fixed invariant into its evolution–measurement successors, yielding the
transition law of the observation kernel.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
