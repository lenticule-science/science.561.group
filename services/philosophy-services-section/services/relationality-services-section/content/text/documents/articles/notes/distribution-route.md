---
title: Distribution Routing
id: distribution-route
role: Enqueue distribution packets on compatible channels.
status: plan
inputs:
- id: distribution-packet-carrier
  name: packet
- id: distribution-channel-carrier
  name: channel
outputs:
- id: distribution-channel-carrier
  name: channel'
transformation:
- return
- value
proof_refs: []
---



Routes packets to channels respecting port compatibility, trace, and storage
constraints.

## Definition
- Inputs: [Distribution Packet](./distribution-packet-carrier.md).
- Outputs: updated [Distribution Channel](./distribution-channel-carrier.md)
  with packet queued, or no-op if incompatible.
- Behaviour: select channels whose ports are compatible with the packet
  endpoints and whose trace/storage constraints are satisfied; enqueue packet
  preserving trace order and integrity.

## Invariants
- Port compatibility: only enqueue on matching port types/policy.
- Trace preservation: channel trace spans updated consistently.
- Integrity: storage checks must pass before enqueue.

## Proof
- Uses: channel/packet compatibility checks and enqueue semantics to preserve
  trace/integrity.
- Shows that: routing packets along compatible ports with trace/integrity
  constraints refines the distribution acts.
