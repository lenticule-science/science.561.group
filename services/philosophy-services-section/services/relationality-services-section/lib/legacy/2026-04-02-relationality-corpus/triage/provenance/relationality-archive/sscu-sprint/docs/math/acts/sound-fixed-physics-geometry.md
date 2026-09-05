---

name: sound-fixed-physics-geometry
act: SoundFixedPhysicsGeometry
top: SoundProfileGeometry
bottom: FixedGeometryProfile
summary: Specialize profile-geometry soundness to the fixed profile by composing `SoundProfileGeometry` with `FixedGeometryProfile`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`SoundProfileGeometry = (PhysicsProfile GeometryProfile)` already records that
profile physics respects the profile geometry.
`FixedGeometryProfile` restricts the global geometry to the fixed recognitions,
recognitions, inheriting the commutation laws between flow and nucleus.
Composing them:
`(SoundProfileGeometry FixedGeometryProfile)` earns
***SoundFixedPhysicsGeometry***,
recording that fixed-physical behaviours remain inside the geometric invariants
they are supposed to respect.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
