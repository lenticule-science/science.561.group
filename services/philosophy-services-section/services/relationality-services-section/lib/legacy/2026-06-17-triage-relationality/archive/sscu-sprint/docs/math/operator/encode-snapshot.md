---
title: Encode Snapshot
role: operator
inputs:
- id: snapshot
  alias: snapshot
outputs:
- id: snapshot
  alias: encoded
- id: failure-carrier
  alias: failure
transformation:
- call
  - encode-snapshot-payload
  - snapshot
proof_refs:
- snapshot
- failure-carrier
- encode-snapshot-payload
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Serializes and validates snapshot fields (id, version, timestamp, provenance,
hash, recognitions, evaluation state), yielding an encoded snapshot or failure.

## Invariants
- Validates schema and integrity, producing encoded snapshot or explicit failure.
- Does not mutate input snapshot.
