---
component-of: container
within: relational-machine-runtime
specialization: persistence-component
holds: structured-state
indexed-for: engine-retrieval
readable-by: observation-layer
date-created: 2026-03-18
date-modified: 2026-03-19
---

# DataStore

## What this is

A **DataStore** is the persistence component within a [Runtime](relational-machine-runtime.md).
It holds [State](state.md) that survives between operations — between Engine invocations, between step extensions, between observer queries.

The DataStore is the memory of the Runtime.
Without it, every invocation of the Engine starts from nothing.
With it, each invocation builds on accumulated State.

## Role in the ExpertSystem pattern

The DataStore corresponds to the **knowledge base** in the [ExpertSystem](expert-system.md) pattern.
The [Engine](engine.md) applies operations to what the DataStore holds; the DataStore accumulates the results.

## What a DataStore is not

A DataStore is not the Engine.
The DataStore does not apply transformation operations.
It persists and serves — it does not compute.

A DataStore is not a static file store.
A static file store (such as the [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md)) may hold content, but it does not serve a running Engine.
The DataStore is the persistence layer of a live Runtime; it is designed to be read and written by the Engine during operation.

## Structure in the RelationalMachineRuntime

In a [RelationalMachineRuntime](relational-machine-runtime.md), the DataStore holds:

- **H_t** — the full fiber Heyting algebra at each history t
- **H*_t** — the settled subalgebra Im(π_t) at each history t
- **Restriction maps ρ: H_{t'} → H_t** — for all t ≤ t', connecting fibers across histories
- **Nucleus results** — cached outputs of σ_t and Δ_t

The DataStore is indexed by history t.
The Engine loads the fiber at the current history, applies normalization, and writes H*_t back.
The Observation Layer queries H*_t across histories to compute global sections.

A DataStore MUST persist State durably across Engine invocations.
It MUST allow indexed access so the Engine can load State at a specific index position.
It MUST expose a query interface to the Observation Layer.
It MUST maintain consistency across concurrent writes — writes from Engine workers at different histories MUST NOT corrupt each other.

## Open questions

