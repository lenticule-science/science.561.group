---

name: measure-deviation-observation-kernel
act: MeasureDeviationObservationKernel
top: FixedIdentity
bottom: ObservationKernel
summary: Measure deviation from stationarity by composing the identity with the observation kernel.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The deviation operator in this setting is `L = I − ObservationKernel` on the
fixed invariant basis: it records how a state differs from being stationary
under the observation kernel.  We capture this by letting the identity observe
the kernel:
`(FixedIdentity ObservationKernel)` earns
***MeasureDeviationObservationKernel***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}

