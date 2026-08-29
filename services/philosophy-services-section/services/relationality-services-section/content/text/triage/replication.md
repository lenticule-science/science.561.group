---
title: Replication Simulation
keywords:
  - simulation
  - replication
layer: spec
status: plan
depends_on:
  - theorem/internal/replication-stack
---
# Replication Simulation

This specification instantiates the **Replication Structure**: it provides
carriers and procedures for maintaining multiple replicas of snapshots in sync
using storage, distribution, and concurrency structures.

## State representation

- **Replica set.**  
  A collection of replica carriers, each storing a snapshot and metadata (IDs,
  state, applied update log).

- **Update log.**  
  An ordered log of operations to apply to replicas, aligned with the
  distribution and scheduling structures.

## Inputs

1. Snapshots from the storage spec.
2. Operations to apply (intake events, evaluation results, etc.).

## Procedures

1. **Log update.**  
   Append each operation to the update log and, via distribution, route it
   toward all replicas.
2. **Apply.**  
   At each replica, apply updates using concurrency rules (commuting
   operations, respecting the precedence relation).
3. **Consistency check and resolve.**  
   Periodically compare replicas; if divergence occurs, use the canonical
   snapshot and update logs to rebuild or reconcile replicas via the resolve
   operator.

## Invariants

- All replicas must converge to equivalent states (per commutation and
  replication laws).
- Update log ordering at each replica must respect the dependency graph.

## Outputs

- Replica status (healthy, lagging, divergent).
- Logs for applied updates and repair operations.
