---
title: Sound Profile Geometry
act: SoundProfileGeometry
top: PhysicsProfile
bottom: GeometryProfile
summary: Show that profile physics respects the profile geometry by composing `PhysicsProfile` with `GeometryProfile`.
tags:
- act
layer: act
status: plan
---

`GeometryProfile = (FlowProfile NucleateProfile)` packages the compatible
flow–nucleus pair on the potential profile.  `PhysicsProfile = (FlowObservation
FlowProfile)` couples the same flow with observations.  To record that the
physical dynamics respect the geometric invariants, we compose them:
`(PhysicsProfile GeometryProfile)` earns
***SoundProfileGeometry***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
