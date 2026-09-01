---
title: Audit Event Carrier
id: audit-event-carrier
role: Events emitted by introspection probes packaged with trace/channel metadata.
status: plan
inputs:
- id: trace
  name: trace
outputs:
- id: audit-event-carrier
  name: audit-event
proof_refs: []
---



## Definition
- Carrier: events emitted by [Introspection Probe](./introspection-probe.md)
  over [Introspection Channel](./introspection-channel.md), packaged into
  [Distribution Packets](distribution-packet-carrier.md) with trace context.
- Fields: probe id, channel endpoints, payload (observables), trace span,
  storage metadata, invariants snapshot.

## Invariants
- Trace alignment: events carry the trace span of the probe/channel.
- Integrity: storage metadata covers payload/invariants.
- Provenance: probe/channel identifiers recorded for auditability.

## Proof
- Derived from: [Trace Carrier](./trace.md) to sequence
  events.
- Uses: introspection probe/channel and distribution packets to define payload
  and transport context.
- Shows that: packaging observables with trace/channel/storage metadata yields
  an audit event carrier suitable for reporting.
