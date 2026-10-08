---
title: Profile Kernel Step
act: ProfileKernelStep
top: ObservationKernel
bottom: BuildProfileTower
summary: Lift the observation kernel through the profile tower by composing it with `BuildProfileTower`.
tags:
- act
layer: act
status: plan
description: Lift the observation kernel through the profile tower by composing it with `BuildProfileTower`.
---

A flow–measure kernel evolves fixed invariant states within a single profile.
To propagate these dynamics between profiles we use the profile tower
recognitions: [BuildProfileTower](./build-profile-tower.md) maps physics,
semantics, and syntax upward through profiles.  Letting the kernel
witness this tower,
`(ObservationKernel BuildProfileTower)`, earns
***ProfileKernelStep***.

[ObservationKernel](2026/03/04/2026-03-04-observation-kernel.md) is the one-step operator on fixed
invariant states.  `BuildProfileTower` records how each layer of recognitions
reconstructs the next profile.  Their composition lifts an update from a profile
to its successor in the tower, giving the profile-level transition step.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
