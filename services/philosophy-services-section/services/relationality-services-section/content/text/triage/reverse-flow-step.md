---
title: "Reverse Flow\u2013Measure Step"
act: ReverseFlowStep
slug: reverse-flow-step
top: FixedKernel
bottom: FixedFlowProfile
summary: Capture the reverse step by letting the stationary kernel witness the fixed flow.
tags:
- act
layer: act
status: plan
---
# Reverse Flow–Measure Step

Detailed balance compares forward and reverse transitions.  The forward flow–measure
step is [FlowMeasureStep](flow-measure-step.md); the reverse uses the stationary
kernel applied backwards through the flow.  We therefore compose the stationary
kernel with the flow:
`(FixedKernel FixedFlowProfile)` earns
***ReverseFlowStep***.

[FixedKernel](fixed-kernel.md) is fixed under kernel updates, and
`FixedFlowProfile` is invertible up to nucleus and stabilization.  Their
composition yields the reverse step: the evolution that recovers the pre-image
up to stabilization.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
