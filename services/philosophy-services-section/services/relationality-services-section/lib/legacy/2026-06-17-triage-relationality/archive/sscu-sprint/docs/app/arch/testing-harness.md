---
form: research
title: Testing Harness
tags:
  - architecture
  - testing
depends-on:
  - specifications/testing
  - specifications/judgment-calculus
  - specifications/scheduler
  - specifications/measurement-fabric
  - specifications/topology-integration
  - specifications/traceability-graph# Testing Harness Architecture

Provides automated CI/CD testing for relational modules.

## Dependencies

- **Testing Harness Simulation**: test definitions, execution, assertion logic.
- **Judgment Calculus Simulation**: to generate and check core typing and
  evaluation traces for the internal calculus.
- **Scheduling Simulation**: to run tests deterministically (or in parallel when
  safe).
- **Measurement Fabric Simulation**: captures test telemetry (duration, failure
  rates) across the fabric.
- **Topology Integration Simulation**: constrains where tests execute (per
  stratum/region) and ensures coverage of all placements.
- **Traceability & Knowledge Service**: links each test case/run to the
  acts/specs it justifies.

## Components

1. **Test Repository.**  
   Stores test cases (trace fragments + expectations) under version control.

2. **Runner Service.**  
   Compiles tests using the simply-typed lambda calculus spec, queues them via scheduler, and executes
   against modules (runtime, storage, etc.).

3. **Assertion & Trace Engine.**  
   Uses testing spec to compare observables, record pass/fail results, capture
   snapshots on failure, and emit traceability IDs referencing the acts/specs
   validated.

4. **Reporting UI.**  
   Displays test runs, streams metrics via the measurement fabric, applies
   topology filters, and integrates with monitoring/audit/traceability systems.

## Workflow

1. Developer submits change → CI triggers runner.  
2. Tests compile/execute; topology integration selects placement; concurrency
   layer used where operations commute.  
3. Failures produce snapshots for debugging; results stored in storage/audit
   services along with traceability references and measurement metrics.

## Invariants

- Tests must not mutate production data (run against dedicated snapshots) and
  must respect topology placements.
- Results must be reproducible (trace spine preserved) and carry telemetry +
  traceability metadata.
