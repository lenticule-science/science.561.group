---

title: Geometry of Fixed Invariant States
act: FixedInvariantGeometry
slug: fixed-invariant-geometry
top: ProfileInvariantGeometry
bottom: FixedInvariantLattice
summary: Restrict the profile invariant geometry to the fixed lattice by composing `ProfileInvariantGeometry` with `FixedInvariantLattice`. - free
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`ProfileInvariantGeometry = (GeometryProfile ProfileInvariantLattice)` packages
the geometry of profile-invariant states.
[FixedInvariantLattice](fixed-invariant-lattice.md) exhibits the order
structure of fixed invariant states.  Restricting the profile geometry to this
lattice,
`(ProfileInvariantGeometry FixedInvariantLattice)` earns
***FixedInvariantGeometry***.

`ProfileInvariantGeometry` provides flow and nucleus for the profile invariants,
and `FixedInvariantLattice` describes the meet–join order on states fixed by
the flow and compatible with `FixedShape`.  Their composition packages
the order, closure, and dynamics of fixed invariant states as a geometric
structure in its own right.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
