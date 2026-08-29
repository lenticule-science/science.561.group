---
name: audit-provenance
role: Relate an audit event to the packets/channels it traversed and derive an audit
  report.
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Relates an audit event to the distribution packets and channels it traversed,
producing an audit report.

## Definition
- Inputs: [Audit Event](../system/structure/audit-event-carrier.md),
  [Distribution Packet](../system/structure/distribution-packet-carrier.md)
  collection, [Distribution Channel](../system/structure/distribution-channel-carrier.md)
  collection.
- Behaviour: route packets, reconcile channel metadata, and assemble an audit
  report summarising provenance.
- Outputs: [Audit Report](../system/structure/audit-report-carrier.md).

## Invariants
- Provenance completeness: every packet associated with the event is traced.
- Consistency: channels/packets recorded in the report match observed event metadata.

## Proof
- Uses: [distribution-route](distribution-route.md) to map packets over
  channels, `normalize-channels` to reconcile channel metadata, and
  `assemble-audit-report` to build the report carrier.
- Shows that: combining routed packets/channels with the audit event yields a
  deterministic audit report witnessing provenance.
