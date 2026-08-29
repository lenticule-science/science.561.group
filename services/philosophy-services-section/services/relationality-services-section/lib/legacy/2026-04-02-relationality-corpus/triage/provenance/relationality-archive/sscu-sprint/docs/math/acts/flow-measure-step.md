---

name: flow-measure-step
act: FlowMeasureStep
slug: flow-measure-step
top: FixedMeasure
bottom: FixedFlowProfile
summary: "Compose the fixed flow and measurement into a single flow\u2013measure update by letting `FixedMeasure` witness `FixedFlowProfile`."
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

A flow–measure step evolves a state and then measures it.  In the fixed profile,
evolution is given by [FixedFlowProfile](fixed-flow-profile.md) and
measurement by [FixedMeasure](fixed-measure.md).  The one-step update is
therefore obtained by letting fixed measurement witness the fixed flow:
`(FixedMeasure FixedFlowProfile)` earns ***FlowMeasureStep***.

`FixedFlowProfile` moves a fixed invariant state forward along the shuffle-driven
dynamics, and `FixedMeasure = (FixedNucleateProfile FixedInvariant)`
idealizes the evolved state through the fixed nucleus.  Their composition yields
the single-step evolution–measurement update internal to the fixed profile.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
