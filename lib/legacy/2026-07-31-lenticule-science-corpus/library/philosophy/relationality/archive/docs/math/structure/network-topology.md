---
title: Network Topology
id: network-topology
role: structure
status: plan
derived_from: math/structure/trace
proof_refs: []
---



Defines ports and edges between compatible ports, extending the wiring
structure to capture allowable data paths.

## Definition
- Carrier: graph of [Interface Ports](interface-port.md) and edges annotated
  with trace spans and policy/compatibility constraints.
- Fields: port set, edge set, compatibility relation.

## Invariants
- Port compatibility enforced on edges.
- Trace coherence: edges respect trace ordering/causality when instantiated.
- Acyclicity or allowed cycles specified per deployment.

## Proof
- Derived from: [Trace Carrier](../math/structure/trace.md) to attach
  sequencing when instantiated.
- Uses: [Interface Port](interface-port.md) for endpoints.
- Shows that: defining allowable port connections yields a topology carrier for
  system wiring/routing.
