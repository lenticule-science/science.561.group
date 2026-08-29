---
title: Failure Absorb
role: operator
inputs:
- id: failure-carrier
  alias: payload
outputs:
- id: failure-carrier
  alias: result
transformation:
- return
  - result
proof_refs:
- failure-carrier
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Implements the absorption law of the failure algebra: if `payload` contains a
failure element, returns that failure; otherwise returns the original payload.

## Invariants
- If `payload` includes a failure, that failure is returned; otherwise `payload` passes through.
- Pure check; no mutation of payload contents.
