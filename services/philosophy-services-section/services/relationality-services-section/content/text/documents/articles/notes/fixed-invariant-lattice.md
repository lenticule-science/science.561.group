---
title: Structuring Fixed Invariant Lattice
act: FixedInvariantLattice
top: ProfileInvariantLattice
bottom: FixedInvariantOrder
summary: Restrict the profile invariant lattice to the fixed order by composing `ProfileInvariantLattice` with `FixedInvariantOrder`.
tags:
- act
layer: act
status: plan
---

`ProfileInvariantLattice = (StructureSemantics ProfileInvariantOrder)` packages
the lattice structure on profile invariants.  Restricting it along
[FixedInvariantOrder](./fixed-invariant-order.md) yields the lattice structure
on fixed invariants:
`(ProfileInvariantLattice FixedInvariantOrder)` earns
***FixedInvariantLattice***.

`ProfileInvariantLattice` encapsulates the algebraic laws of meets, joins, and
implication on the restricted order, and `FixedInvariantOrder` narrows that
order to the fixed invariants.  Their composition records that the fixed
invariant states inherit the same lattice structure.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
