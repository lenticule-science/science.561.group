---
title: RelationalState
layer: spec
status: plan
tags:
  - storage
  - state
depends-on:
  - theorem/internal/state-structure
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Instantiates the relational state carrier that realises the mathematical State from state-structure theorem."# RelationalState

`RelationalState` is the machine-level carrier that realises the mathematical
`State` from
[State Structure](../math/theorem/internal/state-structure.md).

Requirements:

- represents a section of the hypertensor sheaf without loss of information;
- remains stable (up to earned equivalence) under the flow/nucleus dynamics
  from the universal state theorem;
- is the sole mutable state manipulated by
  [StorageSave](storage-save.md) and
  [StorageLoad](storage-load.md).
