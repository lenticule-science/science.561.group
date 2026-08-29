---
title: Failure Absorb
id: failure-absorb
role: operator
status: plan
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
---

# Failure Absorb

Implements the absorption law of the failure algebra: if `payload` contains a
failure element, returns that failure; otherwise returns the original payload.

## Invariants
- If `payload` includes a failure, that failure is returned; otherwise `payload` passes through.
- Pure check; no mutation of payload contents.
