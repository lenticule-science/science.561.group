---
title: "Job Orchestrator"
aliases:
  - "Job Orchestrator"
  - "job orchestrator"
keywords:
  - architecture
  - orchestration
depends_on:
  - specifications/scheduler
  - specifications/concurrency
  - specifications/modality-tower
  - specifications/testing
  - specifications/topology-integration
  - specifications/measurement-fabric
  - specifications/traceability-graph
---
# Job Orchestrator Architecture

The job orchestrator coordinates multi-step workflows (pipelines, modal towers,
batch jobs) on top of the runtime.

## Dependencies

- **Scheduling Simulation**: base queue/dispatch logic.
- **Concurrency Simulation**: safe parallelism for commuting steps.
- **Modality Tower Simulation**: complex workflows that involve stacked modal
  operations.
- **Testing Harness Simulation**: verifies jobs before deployment.
- **Topology Integration Simulation**: constrains placement/order using tower
  and sheaf artifacts.
- **Measurement Fabric Simulation**: observation bus for telemetry/SLIs emitted
  by jobs.
- **Traceability & Knowledge Service**: ensures every workflow cites the earned
  acts/specs that justify its dependencies.

## Components

1. **Workflow Compiler.**
   Translates job specs (YAML/DSL) into task graphs respecting trace order and
   modal sequences.

2. **Planner.**
   Determines dependency edges, concurrency groups, required modules, and
   imports topology constraints to annotate each task with placement/ordering
   rules plus traceability IDs for each dependency.

3. **Executor.**
   Uses scheduler/concurrency specs to run tasks. Integrates with runtime,
   storage, topology integration service (for constraint acknowledgements), and
   measurement fabric emitters.

4. **Verifier.**
   Optionally runs tests from the testing harness before/after execution.

5. **Telemetry Reporter.**
   Streams job-level SLIs/SLOs through the measurement fabric so monitoring and
   policy modules can react to latency/error trends.

## Data Flow

1. User submits job spec -> compiler builds task graph.
2. Planner annotates tasks with dependencies, modules, and modal contexts.
3. Planner attaches topology constraints; jobs that violate them are rejected or
   escalated.
4. Executor schedules tasks, leveraging concurrency where allowed, while
   verifying constraint acknowledgements from runtime/storage modules.
5. Measurement reporters emit telemetry for each stage; monitoring/policy
   consume the data.
6. Results are stored/audited with traceability proofs; optional tests ensure
   correctness.

## Invariants

- Task graphs must align with earned dependencies, topology constraints, and
  traceability references (no out-of-order steps).
- Modal towers must be applied in the documented order.
- Failures roll back or mark the job for inspection, with measurement-fabric
  telemetry preserved for analysis.
