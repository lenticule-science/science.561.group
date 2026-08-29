---
title: Capability Gate
id: capability-gate
role: structure
status: plan
proof_refs: []
---


# Capability Gate

Capability-based gate controlling privileged operations on ports/channels.

## Definition
- Components: [Gate Recognition](gate-recognition.md) tokens bound to
  [Ports Carrier](ports-carrier.md) operations.
- Purpose: only holders of capability tokens may perform certain actions.

## Invariants
- Non-forgeability: capabilities must be earned/issued, not guessed.
- Enforcement: privileged ops require valid capability gates.

## Proof
- Uses: gate recognitions and ports to define capabilities.
- Shows that: capability gating can enforce privilege separation.
