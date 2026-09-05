---
title: Branching Time World
id: branching-time-world
role: structure
status: plan
proof_refs: []
---



Tree of time slices representing possible futures in a relational world.

## Definition
- Components: a [Relational World](relational-world.md) and a tree/poset of
  [Time Slices](time-slice.md) connected by forward edges.
- Structure: flow applies along forward edges; rollbacks create branches.

## Invariants
- Forward flow: context/section evolution only along forward edges.
- Branching: rollback spawns new branches; branches inherit world geometry/logics.
- Consistency: slices respect causal/flow constraints of the underlying world.

## Proof
- Uses: [Relational World](relational-world.md) and [Time Slice](time-slice.md)
  to organise temporal branching.
- Shows that: possible futures can be modelled as a branching structure with
  earned flow and rollback semantics.
