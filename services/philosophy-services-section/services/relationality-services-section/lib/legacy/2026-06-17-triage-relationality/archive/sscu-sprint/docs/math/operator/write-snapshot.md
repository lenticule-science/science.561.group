---
title: Write Snapshot
role: operator
inputs:
- id: snapshot
  alias: snapshot
outputs:
- id: snapshot
  alias: persisted
- id: failure-carrier
  alias: failure
transformation:
- return
  - persisted
  - failure
proof_refs:
- snapshot
- failure-carrier
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Atomically writes an encoded snapshot to storage, returning the stored handle
or failure.

## Invariants
- Atomic write: either persists the snapshot or yields an explicit failure.
- Does not mutate the input snapshot; returns stored handle/provenance.
