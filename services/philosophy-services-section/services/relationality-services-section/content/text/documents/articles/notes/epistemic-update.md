---
title: Epistemic Update
id: epistemic-update
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Update an epistemic profile with a new observation by restricting to compatible
states and flowing evidence into context.

## Definition
- Inputs: an [Epistemic Profile](./epistemic-profile.md) and an
  [Observation](./observation.md).
- Output: an [Epistemic Profile](./epistemic-profile.md) narrowed to
  states consistent with the observation.
- Behaviour:
  1. Restrict the epistemic profile to recognitions compatible with the
     observation.
  2. Apply [Flow Context](./flow-context.md) to propagate the evidence through the
     profile’s context/nucleus.
  3. Optionally normalise with the know modality for the agent.

## Invariants
- Consistency: updated profile contains only states consistent with the
  observation.
- Monotone: successive updates refine (never enlarge) the epistemic profile.
- Stability: updates commute with admissible reindexing in the profile topos.

## Proof
- Uses: [Epistemic Profile](./epistemic-profile.md) as carrier,
  [Observation](./observation.md) as evidence, and
  [Flow Context](./flow-context.md) to propagate updates.
- Produces: refined [Epistemic Profile](./epistemic-profile.md).
- Shows that: epistemic evidence can be integrated via restriction and flow,
  preserving modal/recognitional invariants.
