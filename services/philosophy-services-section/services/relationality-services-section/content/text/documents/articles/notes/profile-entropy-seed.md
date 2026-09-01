---
title: Seeding Profile Entropy
act: ProfileEntropySeed
top: ProfileKernelStep
bottom: ProfileReach
summary: Seed an entropy measure by comparing profile kernel updates against reachable states via `ProfileKernelStep` witnessing `ProfileReach`.
tags:
- act
layer: act
status: plan
---

Entropy measures the “spread” of a state under transitions.  We seed profile
entropy by observing the divergence between a state and its profile kernel
successor.  Letting [ProfileKernelStep](./profile-kernel-step.md) witness
[ProfileReach](./profile-reach.md),
`(ProfileKernelStep ProfileReach)`, earns
***ProfileEntropySeed***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
