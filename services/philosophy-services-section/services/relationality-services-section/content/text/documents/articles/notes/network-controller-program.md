---
title: Network Controller Program
id: network-controller-program
role: structure
status: someday
proof_refs: []
derives-from:
  - computer/type/documentation-interpreter
description: The Network Controller Program is a computer-layer refinement of the documentation interpreter.
---



The **Network Controller Program** is a computer-layer refinement of the
documentation interpreter. It wires modules,
routes data, and exposes policy-controlled APIs over authorised channels while
respecting topology constraints and traceability.

## Carrier
- **Module registry:** recognitions describing modules, inputs/outputs, and
  dependencies as [Computer Recognition](./computer-recognition.md).
- **Channel graph:** wiring plan describing queues/streams and their
  connections as [Computer Wiring Plan](./computer-wiring-plan.md).
- **Policy and topology constraints:** recognitions that annotate channels with
  allowed scopes and placement.
- **Failure carriers:** emitted when routing or registration violates policy,
  topology, or wiring constraints as [Computer Failure](./computer-failure.md).

## Behaviour
1. Register modules and their ports in the module registry; validate against
   policy and topology constraints.
2. Build channels/streams per the wiring plan; attach traceability references
   to each connection.
3. Expose API endpoints (per interface specs) that enqueue requests after
   intake/policy checks.
4. Route messages along authorised channels; apply backpressure when telemetry
   signals congestion.
5. Emit [Computer Failure](./computer-failure.md) when a
   routing or registration step violates constraints.

## Invariants
- Channels respect dependency order and topology constraints encoded in the
  wiring plan.
- All requests and responses are validated, policy-compliant, and traceable to
  earned acts/specs.
- Network state is observable via measurement/telemetry; failures are surfaced
  as failure carriers.

## Proof
Refines the documentation interpreter by specialising the wiring to network channels and
API intake. The refinement preserves acyclicity and failure semantics while
constraining carriers to network registries, channels, and policy/topology
recognitions.

## Earlier material

## Carrier
- **Module registry:** recognitions describing modules, inputs/outputs, and
  dependencies as [Computer Recognition](computer-recognition.md).
- **Channel graph:** wiring plan describing queues/streams and their
  connections as [Computer Wiring Plan](computer-wiring-plan.md).
- **Policy and topology constraints:** recognitions that annotate channels with
  allowed scopes and placement.
- **Failure carriers:** emitted when routing or registration violates policy,
  topology, or wiring constraints as [Computer Failure](computer-failure.md).
