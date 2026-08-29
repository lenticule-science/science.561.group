---
title: Profile Bisimulation
role: operator
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



Profile/flow acts provide a bisimulation principle: recognitions are bisimilar
if they inhabit the same profile and evolve identically under inherited flows
and nuclei.

## Definition
- Inputs/Outputs: recognitions within the same profile carrier.
- Behaviour: two recognitions are bisimilar if their flows/nuclei evolve
  identically along the trace/profile.

## Invariants
- Profile alignment: bisimulation only within the same profile.
- Flow/nucleus coherence: bisimulation respects earned dynamics.

## Proof
- Uses: [Profile Recognitions](../structure/profile-recognitions.md) with their
  earned [Flow](flow-context.md) and [Nucleus](nucleus.md) actions.
- Shows that: requiring recognitions to evolve identically under the profile’s
  flow/nucleus dynamics yields a bisimulation relation stable within the
  profile.
