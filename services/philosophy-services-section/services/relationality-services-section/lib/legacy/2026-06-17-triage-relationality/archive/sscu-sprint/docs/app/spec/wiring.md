---
title: Wiring and Runbook Simulation
tags:
  - simulation
  - wiring
  - runbook
layer: spec
status: plan
depends-on:
  - system/structure/interface-port
  - system/structure/connection-graph
  - theorem/internal/module-wiring
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Instantiates interface ports, connection graphs, and wiring structures so composition happens via earned wiring semantics."# Wiring and Runbook Simulation

This specification instantiates the **Interface Port**, **Connection Graph**,
and **Wiring** structures inside the relational computer. It fixes concrete
carriers and functions for ports, connections, and runbooks so that all
composition of acts happens via earned wiring semantics.

## 1. Types

- **Port (`Port`).**  
  A carrier for interface ports from the interface-port structure:
  - direction (input or output),
  - carrier/recognition types expected at the port,
  - policy regimes and filters attached to the port,
  - measurement views (observables) provided or consumed.

- **Connection (`Connection`).**  
  A carrier representing a compatible pairing of ports:
  - source and target `Port` identifiers,
  - constraints (trace positions, storage channels, policy/measurement checks).

- **Runbook step (`Step`).**  
  A carrier for a single runbook step:
  - act identifier,
  - input and output port identifiers,
  - parameters (if any) for the act.

- **Runbook (`Runbook`).**  
  A carrier for a finite directed acyclic graph of steps:
  - set of `Step` values,
  - wiring information (which output ports feed which input ports),
  - entry and exit ports.

## 2. Functions

Implementations must provide functions corresponding to the wiring structure.

- **Port compatibility.**

  ```text
  compatible : Port × Port → bool
  ```

  - returns `true` exactly when a connection between the two ports is allowed
    by the `Compatible` relation from the wiring theorem:
    - carrier/recognition types match,
    - trace/storage channels are consistent,
    - policy/measurement constraints are jointly satisfiable.

- **Connection construction.**

  ```text
  connect : Port × Port ⇀ Connection
  ```

  - builds a `Connection` value when `compatible` holds; undefined otherwise.

- **Runbook validation.**

  ```text
  validate_runbook : Runbook → bool
  ```

  - checks that:
    - all referenced ports exist,
    - every connection in the runbook is a valid `Connection`,
    - the resulting graph of `Step` values is acyclic.

- **Runbook planning.**

  ```text
  plan_execution : Runbook → list[Step]
  ```

  - produces a topological ordering of steps consistent with the wiring and
    the trace/evaluation semantics, suitable for the rewriter engine.

## 3. Invariants

- All connections in a valid runbook must arise from `compatible` ports and
  respect the wiring structure.
- Runbooks must be finite and acyclic; cyclic wiring is rejected.
- Execution plans must respect the dependency order implied by the wiring:
  no step is executed before all its inputs are available.

These types and functions are the bridge between the mathematical wiring
structure and the runtime rewriter/engine: YAML runbooks are concrete
instances of `Runbook`, and the engine realises `validate_runbook` and
`plan_execution` over them.
