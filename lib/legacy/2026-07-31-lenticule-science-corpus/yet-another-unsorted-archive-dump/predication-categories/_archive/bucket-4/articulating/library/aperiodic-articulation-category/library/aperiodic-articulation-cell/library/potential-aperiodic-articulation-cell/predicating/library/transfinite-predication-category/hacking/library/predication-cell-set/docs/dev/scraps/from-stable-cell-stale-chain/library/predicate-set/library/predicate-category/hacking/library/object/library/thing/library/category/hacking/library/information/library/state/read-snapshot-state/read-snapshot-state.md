---
title: Read Snapshot State
id: read-snapshot-state
role: operator
status: plan
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
- return
  - snapshot
  - failure
proof_refs:
- recognition
- evaluation-state
- snapshot
- failure-carrier
---


Reads recognitions and evaluation state to produce snapshot content, or a
failure if state cannot be read consistently.

## Invariants
- Point-in-time consistency: captures recognitions and evaluation state atomically.
- Non-mutating: does not modify inputs; failures leave state unchanged.
