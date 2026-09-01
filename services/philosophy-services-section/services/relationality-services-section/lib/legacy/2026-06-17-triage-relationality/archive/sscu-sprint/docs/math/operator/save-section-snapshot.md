---
title: Save Section Snapshot
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



Math-level operator mirroring save-snapshot: captures and stores a section state.

## Definition
- Inputs: current [Hypertensor Section](../structure/hypertensor-section.md),
  [State Transition](../structure/state-transition.md) metadata.
- Output: persisted section encoding and/or marked checkpoint in the section.
- Behaviour: apply [Store Section](store-section.md) to capture state; record
  transition metadata for future restoration.

## Invariants
- Fidelity: saved snapshot corresponds to current section state.
- Restorability: can be reloaded to an equivalent section via load.

## Proof
- Uses: store/transition to capture state.
- Produces: saved snapshot artefact.
- Shows that: snapshotting can be formalised on sections for machine alignment.
