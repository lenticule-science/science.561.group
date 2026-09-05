---
title: Check Noninterference
id: check-noninterference
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Verifies that information-flow constraints enforce noninterference across channels/ports.

## Definition
- Inputs: labelled [Message Channels](./message-channel.md),
  [Ports Carrier](./ports-carrier.md), and an
  [Information Flow Constraint](./info-flow-constraint.md).
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
