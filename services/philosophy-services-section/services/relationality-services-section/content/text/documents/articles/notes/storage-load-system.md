---
title: Storage Load
id: storage-load
role: Reconstruct machine state from a storage snapshot.
status: plan
inputs:
- id: storage-snapshot
  name: snapshot
outputs:
- id: recognition
  name: recognitions
- id: evaluation-state
  name: eval-state
- id: failure-carrier
  name: failure
transformation:
- return
- value
proof_refs: []
---


# Storage Load

Reconstructs machine state from a [Storage Snapshot](./storage-snapshot.md).

## Proof
- Uses: snapshot reading, context retracing, and persistent recognition reload.
- Shows that: reconstructing state yields machine carriers or a failure when
  reconstruction is invalid.
