---
title: "Resource Manager"
aliases:
  - "Resource Manager"
  - "resource manager"
keywords:
  - architecture
  - resource
depends_on:
  - specifications/measurement-algebra
  - specifications/policy
  - specifications/scheduler
  - specifications/measurement-fabric
  - specifications/topology-integration
  - specifications/traceability-graph
---
# Resource Manager Architecture

Controls quotas, fairness, and throttling using measurement data and policy.

## Dependencies

- **Measurement Algebra**: provides metrics (CPU time, entropy change, etc.).
- **Policy Simulation**: defines quotas/limits per module or tenant.
- **Scheduling Simulation**: enforces throttling via task prioritization.
- **Measurement Fabric Simulation**: supplies a unified telemetry bus and schema
  registry for usage metrics.
- **Topology Integration Simulation**: indicates placement/affinity constraints
  that inform resource quotas.
- **Traceability & Knowledge Service**: ensures quota/policy decisions cite the
  earned acts supporting them.

## Components

1. **Metric Collector.**  
   Aggregates observables from modules via the measurement fabric, ensuring all
   metrics conform to registered schemas.

2. **Quota Engine.**  
   Compares usage against policy-defined quotas; issues throttles or boosts.

3. **Scheduler Hook.**  
   Communicates with the scheduler to adjust priorities or suspend tasks when
   limits are exceeded, factoring in topology constraints (e.g., ensuring tower
   levels remain provisioned).

4. **Reporting.**  
   Surfaces resource dashboards and alerts to operators.

## Invariants

- Resource decisions must be policy-compliant.
- Scheduler actions must maintain trace order (no starvation/intended fairness).
