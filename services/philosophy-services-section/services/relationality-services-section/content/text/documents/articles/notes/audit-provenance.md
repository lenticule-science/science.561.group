---
title: Audit Provenance
id: audit-provenance
role: Relate an audit event to the packets/channels it traversed and derive an audit
  report.
status: plan
inputs:
- id: audit-event-carrier
  name: audit-event
- id: distribution-packet-carrier
  name: packets
- id: distribution-channel-carrier
  name: channels
outputs:
- id: audit-report-carrier
  name: report
transformation:
- return
- value
proof_refs: []
---


# Audit Provenance

Relates an audit event to the distribution packets and channels it traversed,
producing an audit report.

## Definition
- Inputs: [Audit Event](./audit-event-carrier.md),
  [Distribution Packet](./distribution-packet-carrier.md)
  collection, [Distribution Channel](./distribution-channel-carrier.md)
  collection.
- Behaviour: route packets, reconcile channel metadata, and assemble an audit
  report summarising provenance.
- Outputs: [Audit Report](./audit-report-carrier.md).

## Invariants
- Provenance completeness: every packet associated with the event is traced.
- Consistency: channels/packets recorded in the report match observed event metadata.

## Proof
- Uses: [distribution-route](./distribution-route.md) to map packets over
  channels, `normalize-channels` to reconcile channel metadata, and
  `assemble-audit-report` to build the report carrier.
- Shows that: combining routed packets/channels with the audit event yields a
  deterministic audit report witnessing provenance.
