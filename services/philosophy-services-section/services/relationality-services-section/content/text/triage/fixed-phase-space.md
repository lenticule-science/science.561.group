---
title: Fixed Phase Space
act: FixedPhaseSpace
slug: fixed-phase-space
top: ProfilePhaseSpace
bottom: FixedInvariant
summary: Restrict the profile phase space to fixed invariants by composing `ProfilePhaseSpace` with `FixedInvariant`.
tags:
- act
layer: act
status: plan
---
# Fixed Phase Space

A dynamical system begins with a phase space of states.  The profile already
provides one via [ProfilePhaseSpace](profile-phase-space.md).  Restricting it to
[FixedInvariant](fixed-invariant.md) yields the fixed phase space:
`(ProfilePhaseSpace FixedInvariant)` earns
***FixedPhaseSpace***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
