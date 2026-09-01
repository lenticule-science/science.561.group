title: Wiring Structure
tags:
  - integration
  - wiring
  - dependency
depends_on:
  - calculus/structure/trace-carrier
  - math/structure/evaluation-state
  - math/operator/evaluation-step
  - math/structure/persistent-context-carrier
  - math/structure/persistent-recognition-carrier
  - math/structure/intake-observation
  - math/structure/intake-context
  - math/structure/observable-carrier
  - math/structure/measure-carrier
  - math/structure/measurement-kernel
  - theorem/internal/tower-interaction
  - system/structure/interface-port
  - system/structure/connection-graph
---
# Wiring Structure

The trace infrastructure, evaluation engine structure, intake/persistence and
measurement stacks, tower interaction, and interface/connection graph
structures together induce a single **wiring structure**: a graph of ports
with a compatibility relation describing which connections are allowed.

Formally, there exists a structure

```text
Wiring = (Ports, Connect, Compatible)
```

such that:

1. **Ports.**
   `Ports` is the set of interface ports from the interface-port structure.
   Each port is tagged with trace, storage, policy, and measurement
   expectations.

2. **Connections.**
   `Connect` encodes possible edges between ports. A connection
   `Connect(p_out, p_in)` exists only when:
   - the recognition/carrier types match,
   - trace positions and storage channels are consistent with the trace and
     persistence stacks, and
   - policy and measurement constraints on both ends are jointly satisfiable.

3. **Compatibility.**
   The relation `Compatible ⊆ Ports × Ports` holds when a pair of ports can
   be wired together in a way that respects:
   - evaluation behaviour (via the evaluation engine structure),
   - dataflow and storage (via intake, persistence, and distribution), and
   - tower/measurement coherence (via tower interaction and measurement
     stacks).

This wiring structure is the single object that system-level architecture must
instantiate: concrete runtimes and deployment diagrams are required to provide
ports and connections that realise `Wiring` and preserve its compatibility
relation.
