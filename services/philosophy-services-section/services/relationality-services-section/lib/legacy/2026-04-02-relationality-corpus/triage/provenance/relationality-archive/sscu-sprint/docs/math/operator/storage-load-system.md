---
name: storage-load-system
role: Reconstruct machine state from a storage snapshot.
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Reconstructs machine state from a [Storage Snapshot](../system/structure/storage-snapshot.md).

## Proof
- Uses: snapshot reading, context retracing, and persistent recognition reload.
- Shows that: reconstructing state yields machine carriers or a failure when
  reconstruction is invalid.
