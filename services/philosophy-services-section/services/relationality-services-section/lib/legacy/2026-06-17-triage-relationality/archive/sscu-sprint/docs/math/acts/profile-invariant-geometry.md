---

title: Geometry of Profile Invariant States
act: ProfileInvariantGeometry
top: GeometryProfile
bottom: ProfileInvariantLattice
summary: Combine the profile geometry with the invariant lattice by composing `GeometryProfile` with `ProfileInvariantLattice`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`GeometryProfile = (FlowProfile NucleateProfile)` records the geometry of the
active profile as a whole.  [ProfileInvariantLattice](profile-invariant-lattice.md)
exhibits the order structure of profile-invariant states.  Letting the profile
geometry witness that lattice,
`(GeometryProfile ProfileInvariantLattice)` earns
***ProfileInvariantGeometry***.

This packages the order, closure, and dynamics of profile-invariant states as a
geometric structure in its own right.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
