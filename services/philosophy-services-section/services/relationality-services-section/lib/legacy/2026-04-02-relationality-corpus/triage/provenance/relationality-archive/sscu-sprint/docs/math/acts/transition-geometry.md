---

name: transition-geometry
act: TransitionGeometry
top: FixedInvariantLattice
bottom: TransitionLaw
summary: Study how the transition law acts on the invariant lattice by letting `FixedInvariantLattice` witness `TransitionLaw`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The fixed invariant lattice describes the order–meet–join structure of
stable states, and the observation kernel sends each state into a successor
distribution.  To observe how the kernel acts geometrically, we let the
invariant lattice witness the transition law:
`(FixedInvariantLattice TransitionLaw)` earns
***TransitionGeometry***.

[FixedInvariantLattice](fixed-invariant-lattice.md) organises fixed invariants
by meet–join structure, and [TransitionLaw](transition-law.md)
provides the relational successor step.  Their composition records how the
successor relation respects the lattice—whether transitions go up, down, or
sideways in the partial order—yielding the geometric view of the kernel
structure.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
