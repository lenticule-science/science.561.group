---
title: Save Snapshot
role: operator
inputs:
- id: recognition
  alias: recognitions
- id: evaluation-state
  alias: eval-state
outputs:
- id: snapshot
  alias: snapshot
- id: failure-carrier
  alias: failure
transformation:
- let
  - descriptor-ok
    - call
      - validate-snapshot-descriptor
      - eval-state
  - content
    - call
      - collect-snapshot-state
      - recognitions
      - eval-state
  - encoded
    - call
      - encode-snapshot
      - content
  - persisted
    - call
      - persist-snapshot
      - encoded
  - return
    - persisted
proof_refs:
- recognition
- evaluation-state
- snapshot
- failure-carrier
- validate-snapshot-descriptor
- collect-snapshot-state
- encode-snapshot
- persist-snapshot
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Persists recognitions and evaluation state into a durable [Snapshot](../structure/snapshot.md),
or emits a [Failure Carrier](../structure/failure-carrier.md) on error.

## Proof
- Uses: validation, collection, encoding, and persistence operators to assemble
  a snapshot.
- Shows that: snapshot persistence is expressed entirely via earned operators
  over earned carriers; failures are explicit.
