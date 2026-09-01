---
title: Diffuse Fixed Flow Profile
act: DiffuseFixedFlowProfile
top: MeasureDeviationObservationKernel
bottom: FixedFlowProfile
summary: Diffuse invariant recognitions under the deviation operator along the fixed flow by composing `MeasureDeviationObservationKernel` with `FixedFlowProfile`.
tags:
- act
layer: act
status: plan
---

Discrete diffusion in this setting moves invariant recognitions along the fixed
flow profile according to how far they deviate from stationarity under the
observation kernel.  The deviation operator is
`L = I − ObservationKernel`, and the fixed flow profile is given by
`FixedFlowProfile`.

To obtain the diffusion operator on invariant recognitions we compose the
deviation-measuring act with the fixed flow profile:
`(MeasureDeviationObservationKernel FixedFlowProfile)` earns
***DiffuseFixedFlowProfile***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}

