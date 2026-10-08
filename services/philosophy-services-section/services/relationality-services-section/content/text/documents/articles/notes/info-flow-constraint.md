---
title: Information Flow Constraint
id: info-flow-constraint
role: structure
status: plan
proof_refs: []
description: Constraints on how recognitions may flow across channels/ports to enforce security.
---



Constraints on how recognitions may flow across channels/ports to enforce security.

## Definition
- Policy: lattice of security levels/labels on ports/channels and recognitions.
- Constraint: forbids flows from higher to lower levels unless declassified.

## Invariants
- Noninterference: low outputs unaffected by high inputs when constraint holds.
- Stability: constraints preserved under channel composition and port use.

## Proof
- Uses: channel/port labels to define admissible flows.
- Shows that: policies can be enforced to prevent illicit information flow.
