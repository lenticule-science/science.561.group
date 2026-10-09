---
title: Sound Profile Physics
act: SoundProfilePhysics
top: PhysicsProfile
bottom: ProfileSemantics
summary: Witness that profile-level physics judgments are valid in profile semantics by composing `PhysicsProfile` with `ProfileSemantics`.
tags:
- act
layer: act
status: plan
description: Witness that profile-level physics judgments are valid in profile semantics by composing `PhysicsProfile` with `ProfileSemantics`.
---

`PhysicsProfile = (FlowObservation FlowProfile)` couples the profile flow with
observations to produce physical judgments.
[ProfileSemantics](./profile-semantics.md) interprets those judgments.  Their
composition,
`(PhysicsProfile ProfileSemantics)`, earns
***SoundProfilePhysics***,
recording that profile physics stays inside the profile semantics.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
