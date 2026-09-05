---
form: research
title: Parametric Context Runtime
tags:
  - architecture
  - parametric
depends-on:
  - specifications/parametric-semantics
  - specifications/policy
  - specifications/measurement-fabric
  - specifications/traceability-graph
  - specifications/topology-integration# Parametric Context Runtime Architecture

Runs relational programs uniformly across many contexts (tenants, environments)
using the parametric semantics guarantees.

From the system’s point of view, the **parametric context runtime is the head
I/O surface** of the universal relational computer: every external interaction
is presented as “run this relational program under this `ParametricContext` and
return updated context plus recognitions.”

## Dependencies

- **Parametric Semantics Simulation**: supplies indexed category, effect/coeffect,
  and abstraction theorem.
- **Relational Runtime** (`docs/app/arch/runtime.md`) for executing relational
  programs once context is chosen, via the internal judgment calculus
  specification.
- **Policy Simulation**: enforces tenant/context isolation rules.
- **Measurement Fabric Simulation**: reports context-level metrics (latency,
  divergence).
- **Traceability & Knowledge Service**: tracks which acts/specs justify each
  fiber/context deployment.
- **Topology Integration Simulation**: constrains how contexts map onto strata
  and ensures separation matches the earned topology.

## Components

1. **Context Manager.**  
   Maintains indexed fibres for each tenant/context, handles reindexing according
   to the parametric spec.

2. **Parametric Interpreter.**  
   Runs programs uniformly by respecting the effect/coeffect rules; ensures
   parametric relations hold across contexts.

3. **Isolation & Trace Layer.**  
   Uses policy hooks to keep contexts separate while sharing code and records
   traceability references for each configuration change.

4. **Monitoring & Telemetry.**  
   Emits observables when parametricity is violated (e.g., contexts diverge) via
   the measurement fabric, triggering alarms in monitoring/audit systems.

## Invariants

- Programs behave identically across contexts (abstraction theorem).
- Reindexing functors commute with the runtime’s scheduling/concurrency layers.
- Telemetry/trace logs exist for every context change, enabling audits and
  compliance checks.

## Realisation in the implementation

The implementation follows the acts → theorems → specifications → architecture
stack:

- **Acts.**  
  Acts such as `build-evaluation-context`, `context-flow`, `context-nucleus`,
  and `context-dynamics` live under `docs/math/acts/` and are
  implemented as single‑act handlers in `app/rewriter/acts/`. Together with
  the trace and witness acts, they form the “instruction set” for context
  evolution.

- **Theorems / specifications.**  
  The parametric semantics and simply-typed lambda calculus specifications define the state
  representations (`Context`, `ContextFiber`, `ParametricContext`,
  `TypeAST`, `TermAST`, etc.) and invariants (abstraction theorem,
  subject reduction, measurement fabric constraints). These are realised as
  Pydantic carriers in `app/schemas/`.

- **Runbooks (wiring).**  
  YAML runbooks under `runbooks/library/` (e.g. `parametric-stlc.yaml`)
  wire acts into concrete simulations:
  `build-evaluation-context` to seed a `ParametricContext`, followed by typing
  or measurement acts that consume and update that context. Runbooks are the
  only place subsystems compose.

- **Runtime (FastAPI + rewriter).**  
  FastAPI endpoints never embed domain logic directly; they select and execute
  runbooks via the `RewriterEngine` (`app/rewriter/engine.py`), passing
  untyped inputs at the edge and receiving updated `ParametricContext` plus
  TracePoints and audit/measurement events. Policy middleware checks requests
  against regimes materialised by acts such as `govern-regime` before a
  runbook executes.

Thus the parametric context runtime is not an ad‑hoc service but the explicit
realisation of the parametric semantics and runtime specifications: a thin,
typed shell around a relational instruction set (acts), wired through runbooks,
with `ParametricContext` as the canonical external interface.
