---

name: laplacian
act: Laplacian
top: FixedIdentity
bottom: ObservationKernel
summary: Measure deviation from stationarity by composing the identity with the observation kernel.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The Laplacian measures how a state deviates from being stationary, given by
`I − ObservationKernel`.  We capture this by letting the identity observe the
kernel:
`(FixedIdentity ObservationKernel)` earns
***Laplacian***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
