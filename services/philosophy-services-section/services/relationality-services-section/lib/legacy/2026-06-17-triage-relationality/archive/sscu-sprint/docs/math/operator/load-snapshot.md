---
title: Load Snapshot
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
- call
  - decode-snapshot
  - snapshot
proof_refs:
- snapshot
- recognition
- evaluation-state
- failure-carrier
- decode-snapshot
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Reconstructs recognitions and evaluation state from a stored [Snapshot](../structure/snapshot.md).

## Proof
- Uses: decode/reconstruction primitive.
- Shows that: loading is explicit; failures are surfaced when reconstruction
  cannot satisfy invariants.
