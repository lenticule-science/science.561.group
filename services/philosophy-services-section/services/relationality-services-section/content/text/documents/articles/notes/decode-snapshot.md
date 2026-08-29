---
title: Decode Snapshot
id: decode-snapshot
role: operator
status: plan
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
---

# Decode Snapshot

Decodes a stored [Snapshot](./snapshot.md) into recognitions and
evaluation state, or failure if reconstruction is impossible.

## Invariants
- Verifies snapshot integrity and schema before reconstruction.
- Produces recognitions/state or a failure; inputs remain unchanged.
