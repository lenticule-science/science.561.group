---

name: profile-invariant-lattice
act: ProfileInvariantLattice
slug: profile-invariant-lattice
top: StructureSemantics
bottom: ProfileInvariantOrder
summary: Package the order, meet, and join of profile invariants into a lattice by letting `StructureSemantics` witness `ProfileInvariantOrder`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`ProfileInvariantOrder` restricts the recognition order to the profile
invariants, and the corresponding meet/join operations are already defined via
the same restriction.  Letting [StructureSemantics](structure-semantics.md)
witness this order,
`(StructureSemantics ProfileInvariantOrder)`, earns
***ProfileInvariantLattice***.

This packages the lattice structure on the profile-invariant states.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
