---
name: wiring-structure
role: structure
derived_from:
- system/structure/connection-graph
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Wiring Structure** is the system-level graph of ports with compatibility
relations describing allowed connections.

## Definition
- `Ports`: the set of interface ports from
  [interface-port](docs/system/structure/interface-port.md), tagged with trace,
  storage, policy, and measurement expectations.
- `Connect`: possible edges between ports, requiring matching carriers, trace
  consistency, storage channels, and satisfiable policy/measurement constraints.
- `Compatible`: relation on ports indicating they can be wired respecting
  evaluation, dataflow/storage, and tower/measurement coherence.

## Invariants
- Connections respect layer semantics (evaluation, storage, policy, measurement).
- Compatibility is preserved under restriction to subgraphs.

## Proof
Refines the connection-graph/interface-port structures into a single wiring
structure capturing port compatibility per the earned stacks (evaluation,
intake/persistence, measurement, tower interaction).
