---
title: Introspection Probe
id: introspection-probe
role: structure
status: plan
derived_from: math/structure/trace
proof_refs: []
---


# Introspection Probe

Defines measurement points attached to ports, channels, or tasks. Each probe
declares which observables (progress, entropy, invariants, etc.) it can emit.

## Definition
- Carrier: probe metadata binding an [Interface Port](interface-port.md) or task
  to a set of observables and a trace span (from [Trace Carrier](../math/structure/trace.md)).
- Fields: target reference, observable types, sampling policy, trace context.

## Invariants
- Target typing: probe target must be a valid interface/task endpoint.
- Trace alignment: emitted observables are tagged with the trace span.
- Policy compliance: probes respect policy regimes attached to targets.

## Proof
- Derived from: [Trace Carrier](../math/structure/trace.md) to attach
  ordered spans to observables.
- Uses: [Interface Port](interface-port.md) to anchor probes to endpoints.
- Shows that: defining probes as trace-scoped observability points yields
  telemetry suited for introspection channels.
