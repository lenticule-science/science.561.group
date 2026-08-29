---
title: Write Snapshot
id: write-snapshot
role: operator
status: plan
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
---

# Write Snapshot

Atomically writes an encoded snapshot to storage, returning the stored handle
or failure.

## Invariants
- Atomic write: either persists the snapshot or yields an explicit failure.
- Does not mutate the input snapshot; returns stored handle/provenance.
