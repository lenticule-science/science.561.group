---

name: fixed-dynamics
act: FixedDynamics
slug: fixed-dynamics
top: ProfileDynamics
bottom: FixedPhaseSpace
summary: Restrict the profile dynamics to fixed phase-space states to define the fixed dynamics.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

Dynamics describe how the phase space evolves.  Starting from the general
[ProfileDynamics](profile-dynamics.md), restricting to
[FixedPhaseSpace](fixed-phase-space.md) yields the fixed dynamics:
`(ProfileDynamics FixedPhaseSpace)` earns
***FixedDynamics***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
