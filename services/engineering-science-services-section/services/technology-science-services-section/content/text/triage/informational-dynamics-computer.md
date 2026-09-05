---
title: "Relational Information Dynamics Computer"
aliases:
  - "Relational Information Dynamics Computer"
  - "relational information dynamics computer"
keywords:
  - architecture
  - information-engine
depends_on:
  - specifications/information-engine
  - specifications/measurement-fabric
  - specifications/quasicrystalline-hypertensor-sheaf
  - specifications/quasicrystalline-hypertensor-sheaf-dynamics
  - specifications/markov-dynamics
  - specifications/knowledge-graph
  - specifications/storage
  - specifications/network
  - specifications/policy
---

This document describes the **Relational Information Dynamics Computer**: a
relational information engine over a quasicrystalline hypertensor sheaf
(`specifications/information-engine.md`), together with the services that
expose it to users and external systems.

At the core, the computer realises a **relational informational dynamics
engine** over this hypertensor sheaf. The rest of this document fixes the
machine model used by all other texts.

## 1. Instruction set (acts)

- The **instruction set** of the computer is the catalogue of acts in
  `docs/math/content/acts/`.  Each act page:
  - records the recognition that forced the act (Story),
  - names its `top`/`bottom` witnesses (its immediate dependencies),
  - and gives a proof sketch for why the act is earned.
- In the runtime, each act is realised by a **single rewrite handler** under
  `app/rewriter/acts/`:
  - the handler takes a finite carrier (payload) as input,
  - produces outputs and optional recognitions,
  - and never orchestrates multi-step flows on its own.
- `ACT_BINDINGS` ties these acts to their handlers and, where applicable, to
  Pydantic carrier types.

## 2. State model (hypertensor sheaf and recognitions)

- The **global state** of the computer is carried by a quasicrystalline
  hypertensor sheaf as described by the universal-state theorems.  In the
  runtime this appears as:
  - Trace/context fibres with recognitions (TracePoints) and provenance,
  - profile towers (`ProfileTower` and `ProfileLevel`) over fibres,
  - lattice windows and sheaf sections (`LatticeWindow`, `LatticeSite`,
    `SheafSection`) representing finite `(window, towers)` carriers.
- All persistent information is stored as:
  - **recognitions** (TracePoints) with act references and metadata,
  - and **sections** of the hypertensor sheaf or their views (towers, windows,
    sections embedded in recognitions).
- Internal theorems (universal state, sheaf sections, universal dynamics)
  explain how acts act locally on these carriers and how finite sections glue
  into the global state.

## 3. Execution model (runbooks and rewriter)

- Programs are expressed as **runbooks**:
  - YAML or in-memory `RunbookCreate` values under `runbooks/library/` and
    tests in `tests/test_runbook_*.py`.
  - Each runbook is a finite directed acyclic graph of steps; each step names
    one or more acts plus its input/output wiring.
- The **RewriterEngine** (`app/rewriter/engine.py`) is the execution engine:
  - it resolves dependencies into an execution plan,
  - builds an `ExecutionContext` for each step (trace id, inputs, DB handles,
    measurement fabric, known acts),
  - dispatches each act to its handler,
  - and records outputs and recognitions.
- **Traces** are special recognitions and runbooks that record execution
  histories:
  - trace and judgement-triad acts link recognitions to trace fibres and step
    order,
  - the traceability service and runbooks like `traceability-view.yaml` expose
    these histories as structured data.

## 4. Interfaces (I/O surfaces)

- **HTTP/OpenAPI** (via `app/main.py`):
  - exposes endpoints such as `/api/runbooks`, `/api/runbooks/{id}/execute`,
    `/api/intake/validate`, and `/api/runbooks/validate`,
  - each endpoint either:
    - runs a specific runbook (e.g., intake, universal-state towers,
      information probes), or
    - returns data produced by runbooks (e.g., recognitions, sections,
      traceability views).
- **MCP server** (`app/mcp_server.py`):
  - provides tools for model clients to:
    - list acts and handlers,
    - read documentation texts,
    - validate and execute runbooks,
    - query recognitions and traceability views.
- Future interfaces (e.g. RDF/linked data, ActivityPub) are treated as
  projections of recognitions and sheaf sections into external formats; they
  may not introduce new state or semantics.

## 5. Surrounding services

Around the core engine, the computer includes:

- **Relational Runtime** – executes parametric programs and runbooks, routing
  all state changes through earned acts and the information engine.
- **Measurement Fabric** – aggregates observables and telemetry across
  modules, enforcing measurement invariants.
- **Hypertensor Analytics Service** – provides analysis and exploration of
  hypertensor/sheaf sections.
- **Traceability & Knowledge Service** – presents recognitions, edges, and
  sheaf sections as a navigable knowledge graph.
- **Relational Storage and Network Services** – persist recognitions and
  manage distributed deployment, using the storage/network specs.
- **Policy & Audit Console** – applies policy specs to recognitions and
  runbooks, recording complete audit trails.

Each of these services is defined in its own architecture document under
`texts/computer-architecture/` and depends on the relevant specifications
listed above.  They are all thin layers over the instruction set,
state model, and execution model described here.

## 6. Invariants

Across the whole computer, the following invariants must hold:

- All persistent state is represented as recognitions and sections of the
  hypertensor sheaf (towers, sheaf sections, or their views).
- Every state change arises from executing runbooks built from earned acts,
  respecting the measurement, Markov, and flow–nucleus invariants.
- All architecture components reference specifications, which in turn realise
  theorems over acts, ensuring the entire stack is mathematically traceable.

This architecture document serves as the top-level node: lower-level
architecture modules, specifications, theorems, and acts must all eventually
be used, directly or indirectly, by the Relational Information Dynamics
Computer.
