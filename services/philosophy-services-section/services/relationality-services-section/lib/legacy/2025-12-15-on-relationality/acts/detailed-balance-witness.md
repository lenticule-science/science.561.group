---
title: Witnessing Detailed Balance
act: DetailedBalanceWitness
slug: detailed-balance-witness
top: FixedObserve
bottom: ReverseFlowStep
summary: >-
  Witness equality between forward and reverse transitions by composing
  `FixedObserve` with `ReverseFlowStep`.
tags:
  - act
---
# Witnessing Detailed Balance

Detailed balance requires the forward and reverse transitions to align under the
stationary kernel.  To make this explicit, we compare
[FlowMeasureStep](flow-measure-step.md) and
[ReverseFlowStep](reverse-flow-step.md) using profile
observations.  Composing
`(FixedObserve ReverseFlowStep)` earns
***DetailedBalanceWitness***.

[FixedObserve](fixed-observe.md) records observation acts in the fixed
profile, while `ReverseFlowStep` gives reverse transitions.  Their
composition yields recognitions that witness equality between forward and
backward transitions under observation.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
