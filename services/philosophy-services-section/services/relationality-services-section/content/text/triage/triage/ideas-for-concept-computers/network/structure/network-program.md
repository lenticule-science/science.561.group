---
title: Network Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---
# Network Program

This program covers networking for the relational computer: connections,
protocols, and routing expressed as recognitions.

## Behaviour

- Represent endpoints, connections, protocols, and routes as recognitions with
  provenance and policy bindings.
- Track topology, latency, throughput, and reliability measurements.
- Enforce policy for access, encryption, and isolation.

## Intended operators

- Configure and monitor network links with trace.
- Route and prioritize traffic according to measurements and policy.
- Diagnose and remediate network issues via auditable runbooks.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
