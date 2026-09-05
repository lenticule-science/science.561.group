---
form: research
title: Relational Runtime
tags:
  - architecture
  - runtime
depends-on:
  - theorem/internal/evaluation-engine
  - theorem/internal/judgment-calculus-structure
  - specifications/judgment-calculus
  - specifications/wiring
  - specifications/scheduler
  - specifications/concurrency
  - specifications/policy
  - specifications/measurement-fabric
  - specifications/topology-integration# Relational Runtime Architecture

The runtime executes relational programs (e.g., simply-typed lambda calculus terms and runbooks) while
respecting policies, concurrency, and scheduling constraints, and while
evolving the global informational state carried by the hypertensor sheaf. This
module depends on:

- **Judgment Calculus Simulation** (`specifications/judgment-calculus.md`):
  defines the internal judgment calculus (syntax, typing, substitution, and
  evaluation operators) that the evaluator realises.
- **Wiring and Runbook Simulation** (`specifications/wiring.md`): defines the
  port, connection, and runbook structures and functions that all program
  composition must use.
- **Scheduling Simulation** (`specifications/scheduler.md`): provides queues and
  dependency-aware dispatch.
- **Concurrency Simulation** (`specifications/concurrency.md`): allows tasks that
  commute to run in parallel safely.
- **Policy Simulation** (`specifications/policy.md`): enforces discipline/filter
  rules before executing actions.
- **Measurement Fabric Simulation** (`specifications/measurement-fabric.md`):
  normalizes observables emitted by runtime modules and distributes aggregates.
- **Topology Integration Simulation** (`specifications/topology-integration.md`):
  supplies placement/order constraints derived from towers and sheaf semantics.

## Components

1. **Evaluator.**  
   Implements the internal judgment calculus evaluation per the spec: parses
   terms, checks types, and produces reduction tasks as applications of the
   evaluation-structure and evaluation-engine theorems.

2. **Task Scheduler.**  
   Uses the scheduling spec to queue reductions/measurements and ensure trace
   order.

3. **Concurrency Layer.**  
   Executes commuting tasks in parallel. Integrates with the scheduler to avoid
   races.

4. **Policy Gate.**  
   Checks each task against the policy registry (discipline/filter rules) before
   dispatch.

5. **Topology Constraint Adapter.**  
   Imports constraint bundles from the topology integration service and ensures
   evaluation tasks obey placement/order restrictions (e.g., honoring tower
   levels or data locality hints).

6. **Measurement & Trace Emitters.**  
   Stream trace/observable data into the measurement fabric using registered
   schemas and attach traceability IDs so monitoring, resource manager, and
   policy consoles receive realtime state with provenance.

## Data Flow

1. Source terms enter via intake/interface layers (not shown here).
2. Evaluator generates tasks and submits them to the scheduler.
3. Scheduler enforces dependency order, handing runnable tasks to the concurrency
   layer.
4. Concurrency layer executes tasks, invoking the evaluator or other modules as
   needed.
5. Results are sent to persistence/measurement stacks for downstream modules,
   with telemetry mirrored through the measurement fabric.
6. Topology constraints are periodically refreshed; incompatibilities cause
   schedulers to pause affected tasks until the integration service issues new
   bundles; traceability references are updated alongside.

## Realisation in the implementation

The runtime implementation follows the acts → internal theorems →
specifications → architecture stack and is constrained so that no ad hoc
behaviour can appear outside that chain.

- **Acts (instruction set).**  
  The runtime never invents new instructions. It only invokes earned acts from
  `docs/math/acts/`, each realised as a single handler under
  `app/rewriter/acts/` and registered in `app/rewriter/act_bindings.py`. Each
  handler implements exactly one act, on finite carriers, without orchestrating
  multi-step flows by itself.

- **Internal theorems (evaluation structures and operators).**  
  Internal theorems such as `evaluation-engine` and
  `judgment-calculus-structure` define:
  - the evaluation state structure (`EvalState`),
  - the step operator (`step : EvalState -> EvalState`),
  - and the normalization operator (`normalize : EvalState -> EvalState`).
  The runtime must be an instantiation of these operators; any new runtime
  behaviour must be justified by new internal theorems rather than direct code.

- **Specifications (types and functions).**  
  Specifications under `docs/app/spec/` (simply-typed lambda simulation,
  scheduler, concurrency, policy, measurement fabric, topology integration)
  define the concrete types and functions that instantiate the internal
  structures. In the codebase these appear as Pydantic models and pure
  functions in `app/schemas/` and `app/rewriter/`.

- **Runbooks (wiring only).**  
  Composition is expressed only in YAML runbooks under
  `runbooks/library/`, each of which instantiates the `Runbook` carrier from
  the wiring spec. Each runbook is a finite directed acyclic graph that:
  - names acts,
  - binds them to ports and carrier types,
  - and wires their inputs and outputs via `Connection` values.
  Neither FastAPI endpoints nor handlers may “reach around” runbooks to
  orchestrate additional flows.

- **Runtime shell (FastAPI + rewriter engine).**  
  The runtime service in `app/main.py` and `app/rewriter/engine.py` is a thin
  shell:
  - FastAPI endpoints accept untyped JSON at the boundary, coerce it into
    Pydantic carriers defined in specs, and select a runbook to execute.
  - `RewriterEngine` executes the runbook as a sequence of act applications,
    using the evaluation-engine and scheduling structures.
  - Policy middleware (`app/policy/`) and measurement hooks
    (`app/measurement/`) enforce the policy and measurement specs around each
    step.

## Invariants

- All executed tasks are instances of earned acts and satisfy policy checks,
  topology constraints, and trace order.
- Parallel execution matches the sequential semantics given by the evaluation
  and concurrency specifications and respects measurement-fabric backpressure.
- Every observable emitted has a registered schema and traceability reference;
  missing schemas block task completion until fixed.
- No runtime path may introduce behaviour that is not describable as:
  internal theorem structure/operator → specification type/function →
  act application wired by a runbook.

## Outputs

- Reduction logs (for storage and audit), expressed as recognitions and
  measurement events.
- Observables for measurement and introspection modules, with complete
  traceability to the acts and specifications that produced them.
