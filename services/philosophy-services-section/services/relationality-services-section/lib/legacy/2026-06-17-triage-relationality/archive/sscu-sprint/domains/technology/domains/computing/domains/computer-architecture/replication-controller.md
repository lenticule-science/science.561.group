---
title: "Replication Controller"
introduces: specification
in-domain: science/relationality/technology/computing/computer-architecture
part-of: relational-computer
computer-system-type: local
readiness: specced
description: "Manages replica membership, failover, and repair."
aliases:
  - "Replication Controller"
  - "replication controller"
tags:
  - architecture
  - replication
depends-on:
  - specifications/replication
  - specifications/scheduler
  - specifications/policy
  - specifications/measurement-fabric
  - specifications/topology-integration
  - specifications/traceability-graph# Replication Controller Architecture

Manages replica membership, failover, and repair.

## Dependencies

- **Replication Simulation**: core replication logic.
- **Scheduling Simulation**: schedules background sync jobs.
- **Policy Simulation**: restricts who can operate on replicas.
- **Measurement Fabric Simulation**: structured telemetry for lag, latency, and
  repair metrics.
- **Topology Integration Simulation**: ensures replicas obey stratum placement
  rules and coverage constraints.
- **Traceability & Knowledge Service**: documents the acts/specs behind replica
  placement/membership decisions.

## Components

1. **Membership Manager.**  
   Tracks replica nodes, health, and roles (primary/secondary).

2. **Sync Engine.**  
   Applies update logs to replicas using replication spec; scheduled tasks handle
   periodic verification.

3. **Topology Planner.**  
   Fetches placement constraints, ensuring replica sets span required strata and
   triggering rebalancing when constraints change.

4. **Failover Coordinator.**  
   Promotes new primaries when nodes fail; ensures consistency before transitions
   and re-validates topology/coverage obligations.

5. **Policy/Audit/Telemetry Hooks.**  
   Logs administrative actions, enforces permissions, and publishes metrics via
   the measurement fabric.

## Data Flow

1. Storage service emits updates → sync engine propagates them.
2. Topology planner checks placement; if violations occur, new replicas are
   provisioned before continuing.
3. Health checks detect lagging replicas → scheduler runs catch-up jobs and
   telemetry records SLA impact.
4. Failovers update routing tables in the network controller after verifying new
   placements.

## Invariants

- Replicas converge (per replication spec) and satisfy topology placement rules.
- Failover never violates policy rules or loses committed snapshots.
- Telemetry captures lag/failover metrics using measurement fabric schemas.
