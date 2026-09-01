---
title: Witness Fixed Observation
id: fixed-observation-witness
role: operator
status: plan
derived_from: acts/fixed-witness-observation
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



## Statement

The act [`fixed-witness-observation`](../acts/fixed-witness-observation.md)
restricted to [Fixed Observation](../structure/fixed-observation.md) witnesses
that contextual equivalence on the fixed profile can be tested using only fixed
observations.

## Definition
- Inputs: [Fixed Observation](../structure/fixed-observation.md) and the base
  [Observation Witness](../structure/observation-witness.md) over the full
  profile.
- Outputs: [Fixed Observation Witness](../structure/fixed-observation-witness.md),
  certifying contextual equivalence in the fixed profile.
- Behaviour: applies [Fixed Witness Observation](../acts/fixed-witness-observation.md)
  to restrict the general witness to fixed observations, demonstrating that the
  fixed-profile carrier suffices.

## Invariants
- Uses only fixed-profile observations; no unfixed observations are admitted.
- Witnesses remain within the fixed observation carrier and respect fixed-profile restrictions.
- Restriction-compatible: the fixed witness is obtained by restricting the full
  observation witness; no new observational power is introduced.

## Proof
- Derived from: [Fixed Witness Observation](../acts/fixed-witness-observation.md).
- Uses: [Observation Witness](../structure/observation-witness.md) as the
  full-profile witness to restrict.
- Shows that: restricting the witness to
  [Fixed Observation](../structure/fixed-observation.md) suffices to decide
  contextual equivalence in the fixed profile because the equate-contexts act
  is closed under fixed-profile restriction; outputs are the fixed observation
  witnesses used for that decision.
