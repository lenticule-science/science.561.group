---
title: Decode Snapshot
role: operator
inputs:
- id: snapshot
  alias: snapshot
outputs:
- id: recognition
  alias: recognitions
- id: evaluation-state
  alias: eval-state
- id: failure-carrier
  alias: failure
transformation:
- return
  - recognitions
  - eval-state
  - failure
proof_refs:
- snapshot
- recognition
- evaluation-state
- failure-carrier
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Decodes a stored [Snapshot](../structure/snapshot.md) into recognitions and
evaluation state, or failure if reconstruction is impossible.

## Invariants
- Verifies snapshot integrity and schema before reconstruction.
- Produces recognitions/state or a failure; inputs remain unchanged.
