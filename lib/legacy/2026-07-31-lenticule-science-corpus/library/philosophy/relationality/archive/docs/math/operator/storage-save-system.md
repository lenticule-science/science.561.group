---
title: Storage Save
id: storage-save
role: Extract a storage snapshot from machine state.
status: plan
inputs:
- id: recognition
  name: recognitions
- id: evaluation-state
  name: eval-state
outputs:
- id: storage-snapshot
  name: snapshot
- id: failure-carrier
  name: failure
transformation:
- return
- value
proof_refs: []
---


# Storage Save

System-level operator to extract a storage snapshot from machine state.

## Definition
- Input: machine recognition and evaluation state.
- Output: a [Storage Snapshot](docs/system/structure/storage-snapshot.md).
- Behaviour: isolate baseline remainder, collect intake-normalised observations
  and persistent recognitions, and package them as a storage snapshot.

## Failure
- Emits [`FailureCarrier`](docs/machine/structure/failure-carrier.md) at the
  machine layer on errors.

## Proof
Refines the storage snapshot structure into an operator that saves machine
state. Pairs with `Storage Load` to provide round-trip semantics up to nucleus
equivalence.
