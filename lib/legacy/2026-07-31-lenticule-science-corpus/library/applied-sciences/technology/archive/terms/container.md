---
id: container
description: "A separately operable unit that instantiates the RelationalMachine structure: a RelationalMachineInterface, RelationalMachinePort, RelationalMachineSteppingMap, DataStore, Engine, and Observation Layer."
defines: Container
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  interface: relational-universe-morphism
  port: relational-universe
  stepping-map: relational-universe-morphism
  data-store: relational-universe
  engine: relational-universe-morphism
  observation-layer: relational-universe-morphism
output: relational-universe
ast:
  relational-machine-instantiation:
    - interface
    - port
    - stepping-map:
        - port
        - data-store
    - engine:
        - data-store
    - observation-layer:
        - data-store
---

# Container

## What this is

A **Container** is any entity that instantiates the component structure of the [RelationalMachine](relational-machine.md):

| Component | Mathematical role | Container role |
|---|---|---|
| [RelationalMachineInterface](relational-machine-interface.md) | ι : U → T — patch inclusion foot | The exposed boundary where steps enter |
| [RelationalMachinePort](relational-machine-port.md) | (Σ, I) — step set with independence | The typed vocabulary of accepted inputs |
| [RelationalMachineSteppingMap](relational-machine-stepping-map.md) | γ_t : X(t) → X(s★t) — coalgebra map | The mechanism that advances carrier state |
| DataStore | H_t — fiber Heyting algebra at current history | Where state is held |
| [Engine](engine.md) | π_t = σ_t ∘ Δ_t — nucleus retraction | The mechanism that transforms state |
| Observation Layer | Γ — global sections functor | Where settled output exits |

These components are what make something separately operable.
A unit with a defined interface, a typed port, a stepping map to advance state, internal state storage, a mechanism for transforming state, and a defined output layer can operate independently.
A unit missing any of these components is not a Container — it is a component of one.
A Container MUST instantiate all components.
It MUST be separately operable — able to receive input, process it, and produce output without requiring another Container to complete the cycle.

## Derivation

The component structure is derived from the [RelationalMachine](relational-machine.md), which is itself derived from the mathematical structure of the relational universe.

A Container does not need to implement these components with the same technology.
It needs to instantiate the same structure: a typed input boundary, a way to advance state on arrival of a step, a place to hold state, a process to transform it, and a way out.

This is the basis for the C4 architecture diagram concept of "container" — a separately deployable/runnable unit — grounded in the relational machine rather than adopted as an external convention.

## Instances in this system

**[FlatfileAgentialResourceSystemLocale](flatfile-agential-resource-system-locale.md)** satisfies Container:
- Interface: `INBOX.md` — the exposed boundary; steps enter here as Messages
- Port: message types {FixNeeded, GapFound, Discovery, Coordination}
- SteppingMap: the improvement skill advancing locale state from t to s★t by writing files
- DataStore: the entity files — all H_t content is held in markdown files
- Engine: the improvement skill — applies the locale's nucleus operations (triage, derive, settle)
- Observation Layer: outbound messages and skill outputs — settled sections exit here

**[DistributedRelationalMachineRuntime](distributed-relational-machine-runtime.md)** satisfies Container at the service level:
- Interface: NATS JetStream — the exposed step intake boundary
- Port: the step types the JetStream subjects accept
- SteppingMap: the Dapr actor transition function advancing state on each message
- DataStore: rqlite — the fiber algebra tables
- Engine: Dapr virtual actors running LangGraph — the nucleus kernel
- Observation Layer: FastMCP servers — the settled section emitters

## In C4 diagrams

When drawing a C4 container diagram of any system built on the relational machine, each Container node represents an entity that satisfies this spec.
The components within each Container correspond to the mathematical roles above.

## Open questions

