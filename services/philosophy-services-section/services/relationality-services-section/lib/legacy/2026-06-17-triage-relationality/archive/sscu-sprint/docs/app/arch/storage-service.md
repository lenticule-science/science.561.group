---
form: research
title: Relational Storage Service
tags:
  - architecture
  - storage
depends-on:
  - specifications/storage
  - specifications/replication
  - specifications/policy
  - specifications/audit
  - specifications/measurement-fabric
  - specifications/topology-integration
  - specifications/traceability-graph# Relational Storage Service Architecture

This service manages snapshots, replication, and policy-compliant access to
stored recognitions.

## Dependencies

- **Relational Storage Simulation**: defines snapshot save/load semantics.
- **Replication Simulation**: ensures replicated stores converge.
- **Policy Simulation**: restricts who can read/write snapshots.
- **Audit Simulation**: records provenance for all storage operations.
- **Measurement Fabric Simulation**: standardizes telemetry (latency, durability
  metrics) emitted by the storage layer.
- **Topology Integration Simulation**: dictates where datasets may reside based
  on strata/tower constraints.
- **Traceability & Knowledge Service**: ensures every snapshot/load references
  the earned acts supporting it.

## Components

1. **Snapshot Manager.**  
   Implements the `save` and `load` operators from the storage spec:
   - uses intake and persistence stacks to build `SnapContent`,
   - maintains the mapping `SnapId → SnapContent` in the underlying store.

2. **Replica Controller.**  
   Maintains replicas via the replication spec: applies updates to replicated
   `SnapContent` records and checks convergence.

3. **Policy/Access Layer.**  
   Ensures requests meet discipline/filter rules before touching data and
   records traceability references for every operation.

4. **Topology Placement Manager.**  
   Interprets topology constraints, ensuring snapshots live on admissible
   strata and coordinating with runtime/replication to migrate data when
   constraints change.

5. **Audit & Telemetry.**  
   Records operations, linking to snapshots/modules, and exports storage
   metrics via the measurement fabric to monitoring/policy consumers.

## Data Flow

1. Runtime modules request snapshots (save or load).  
2. Policy layer authenticates and authorizes.  
3. Snapshot manager reads/writes data; replica controller propagates updates.  
4. Placement manager checks topology constraints; migrations occur if needed.  
5. Audit/telemetry components log the operation and emit metrics.

## Invariants

- Snapshots must round-trip via load/save.  
- All replicas stay consistent and respect topology placement rules.  
- Every operation is logged, policy-compliant, and observable via measurement
  fabric schemas.
