---
title: Network Channel
role: structure
derived_from: math/structure/trace
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Associates sequences of `DistributionChannelCarrier` packets to edges between
compatible ports, preserving intake and persistence invariants.

## Definition
- Carrier: network edges annotated with [Distribution Channel Carrier](distribution-channel-carrier.md)
  flows and trace spans (from [Trace Carrier](../math/structure/trace.md)).
- Fields: endpoints (ports), channel queue, trace span, integrity metadata.

## Invariants
- Port compatibility and trace ordering inherited from distribution channels.
- Integrity of buffered data is maintained across network edges.
- Acyclic/acyclicity constraints follow the underlying topology (if imposed).

## Proof
- Derived from: [Trace Carrier](../math/structure/trace.md) for
  sequencing; uses [Distribution Channel Carrier](distribution-channel-carrier.md)
  to define payload flows.
- Shows that: annotating network edges with distribution channels yields a
  network channel carrier respecting intake/persistence invariants.
