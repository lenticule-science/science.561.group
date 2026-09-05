---
title: Persist Snapshot
id: persist-snapshot
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
- call
  - write-snapshot
  - snapshot
proof_refs:
- snapshot
- failure-carrier
- write-snapshot
---


Writes an encoded snapshot atomically to storage, returning the persisted
snapshot or failure.

## Proof
- Uses: storage write primitive.
- Shows that: persistence is explicit and failure surfaced.
