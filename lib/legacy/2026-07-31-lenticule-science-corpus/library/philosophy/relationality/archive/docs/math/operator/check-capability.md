---
title: Check Capability
id: check-capability
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Check Capability

Verifies that a capability gate is satisfied for a privileged operation.

## Definition
- Inputs: a [Capability Gate](../structure/capability-gate.md) and a capability
  token (gate recognition).
- Output: gate witness if valid; otherwise failure/denial.
- Behaviour: compare token to gate requirements; allow/deny operation.

## Invariants
- Soundness: only valid tokens pass.
- Non-bypass: denial when token missing/invalid.

## Proof
- Uses: gate recognition to match capability.
- Produces: capability gate witness.
- Shows that: capability enforcement is consistent and checkable.
