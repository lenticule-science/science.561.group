---

name: wave-operator
act: WaveOperator
top: DiffuseFixedFlowProfile
bottom: HarmonicMode
summary: Apply the diffusion operator to harmonic modes to obtain the wave operator.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

Wave propagation follows the second-order dynamics obtained by repeatedly
applying the discrete diffusion operator to harmonic modes.  We obtain the wave
operator by composing the diffusion act with the harmonic mode:
`(DiffuseFixedFlowProfile HarmonicMode)` earns
***WaveOperator***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
