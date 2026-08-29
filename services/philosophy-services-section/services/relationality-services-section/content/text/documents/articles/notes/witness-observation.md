---
title: Witness Observation
id: witness-observation
role: operator
status: plan
derived_from: acts/witness-observation
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Witness Observation

## Definition
- Inputs: [Observation](./observation.md).
- Outputs: [Observation Witness](./observation-witness.md) certifying contextual equivalence.
- Behaviour: applies [Witness Observation](./witness-observation.md) to produce a witness that earned observations suffice to establish contextual equivalence over the full profile.

## Invariants
- Uses only earned observations; witnesses remain within the observation carrier and earned recognitions.
- Witnesses are stable under reindexing across the base.

## Proof
- Derived from: [Witness Observation](./witness-observation.md).
- Shows that: the act yields observation witnesses, realized here as a math operator that produces the corresponding witness structure over the full profile.
