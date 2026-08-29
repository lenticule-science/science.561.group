---
title: Load Snapshot
id: load-snapshot
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
- call
  - decode-snapshot
  - snapshot
proof_refs:
- snapshot
- recognition
- evaluation-state
- failure-carrier
- decode-snapshot
---

# Load Snapshot

Reconstructs recognitions and evaluation state from a stored [Snapshot](./snapshot.md).

## Proof
- Uses: decode/reconstruction primitive.
- Shows that: loading is explicit; failures are surfaced when reconstruction
  cannot satisfy invariants.
