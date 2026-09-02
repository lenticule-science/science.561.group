---
title: Relational Runtime
tags:
  - architecture
  - runtime
depends_on:
  - specifications/stlc
  - specifications/scheduler
  - specifications/concurrency
  - specifications/policy
  - specifications/measurement-fabric
  - specifications/topology-integration
---
# Relational Runtime Architecture

The runtime executes relational programs (e.g., STLC terms and runbooks) while
respecting policies, concurrency, and scheduling constraints, and while
evolving the global informational state carried by the hypertensor sheaf. This
module depends on:

- **Simply-Typed Lambda Simulation** (`specifications/stlc.md`): defines syntax,
  typing, and evaluation procedures for the language.
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
   Implements STLC evaluation per the spec: parses terms, checks types, and
   produces reduction tasks.

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

## Invariants

- All executed tasks must satisfy policy checks, topology constraints, and trace
  order.
- Parallel execution must match sequential semantics (per concurrency spec) and
  respect measurement-fabric backpressure.
- Every observable emitted has a registered schema and traceability reference;
  missing schemas block task completion until fixed.

## Outputs

- Reduction logs (for storage/audit).
- Observables for measurement/introspection modules.
