---
title: Check Noninterference
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Verifies that information-flow constraints enforce noninterference across channels/ports.

## Definition
- Inputs: labelled [Message Channels](../structure/message-channel.md),
  [Ports Carrier](../structure/ports-carrier.md), and an
  [Information Flow Constraint](../structure/info-flow-constraint.md).
- Output: updated constraint witness if flows are compliant; otherwise failure.
- Behaviour: check that low-observable outputs are independent of high inputs
  per policy.

## Invariants
- Soundness: passes only if noninterference holds.
- Compositional: checks compose over channel networks.

## Proof
- Uses: policy lattice to test flows.
- Produces: constraint witness.
- Shows that: noninterference can be validated at the math level.
