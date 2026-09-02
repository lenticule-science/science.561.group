---
title: Detailed Balance
act: DetailedBalance
slug: detailed-balance
top: DetailedBalanceWitness
bottom: FlowMeasureStep
summary: >-
  Assert detailed balance by composing the witness with the forward
  flow–measure step.
tags:
  - act
---
# Detailed Balance

To assert detailed balance, we require the flow–measure step
and its reverse to be observationally indistinguishable when weighted by the
stationary kernel.  We therefore let
[DetailedBalanceWitness](detailed-balance-witness.md) witness
[FlowMeasureStep](flow-measure-step.md):
`(DetailedBalanceWitness FlowMeasureStep)` earns
***DetailedBalance***.

`DetailedBalanceWitness` compares reverse transitions to forward ones
under observation, and `FlowMeasureStep` is the forward step.  Their composition
asserts that the two are equivalent after weighting by observations and
stabilization, which is exactly the detailed-balance condition internal to the
profile.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
