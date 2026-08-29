---
title: Introspection Channel
role: structure
derived_from: math/structure/trace
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Channels in the distribution/network used to carry probe outputs to monitoring
consumers, preserving trace semantics and storage invariants.

## Definition
- Carrier: specialised [Distribution Channel](distribution-channel-carrier.md)
  dedicated to introspection payloads emitted by [Introspection Probe](introspection-probe.md).
- Fields: channel endpoints, packet queue of probe outputs, trace span, storage
  metadata.

## Invariants
- Port compatibility and trace ordering inherited from distribution channels.
- Payload typing restricted to introspection probe outputs.
- Integrity of buffered data matches storage metadata.

## Proof
- Derived from: [Trace Carrier](../math/structure/trace.md) to attach
  ordered trace spans.
- Uses: [Distribution Channel Carrier](distribution-channel-carrier.md) and
  [Introspection Probe](introspection-probe.md) to define endpoints/payloads.
- Shows that: specialising distribution channels to introspection payloads yields
  an introspection channel carrier ready for monitoring flows.
