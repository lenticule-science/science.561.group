---
name: witness-observation
role: operator
derived_from: acts/witness-observation
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Inputs: [Observation](../structure/observation.md).
- Outputs: [Observation Witness](../structure/observation-witness.md) certifying contextual equivalence.
- Behaviour: applies [Witness Observation](../acts/witness-observation.md) to produce a witness that earned observations suffice to establish contextual equivalence over the full profile.

## Invariants
- Uses only earned observations; witnesses remain within the observation carrier and earned recognitions.
- Witnesses are stable under reindexing across the base.

## Proof
- Derived from: [Witness Observation](../acts/witness-observation.md).
- Shows that: the act yields observation witnesses, realized here as a math operator that produces the corresponding witness structure over the full profile.
