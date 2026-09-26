---
title: Observation Witness
id: observation-witness
role: structure
status: plan
proof_refs: []
derives-from: acts/witness-observation
description: Certificate that observations suffice to witness contextual equivalence in the full profile.
---



Certificate that observations suffice to witness contextual equivalence in the
full profile.

## Definition
- Carrier: witnesses produced by applying [Observe](./observe.md) through
  [Witness Observation](./witness-observation.md) to establish contextual
  equivalence.
- Role: evidence that two contexts are indistinguishable using earned
  observations across the entire index base.

## Invariants
- Observation-closed: witnesses reference only earned [Observation](observation.md) carriers.
- Reindexing-stable: witnesses remain valid under all base morphisms admitted
  by the flow/nucleus adjunction.

## Proof
- Derived from: [Witness Observation](./witness-observation.md), which
  provides the observation-to-equivalence witness.
- Shows that: the act yields a carrier of witnesses confined to earned
  observations, sufficient to decide contextual equivalence in the full
  profile; this carrier is used directly by witness operators.
