---
title: Replication Simulation
tags:
  - simulation
  - replication
depends_on:
  - theorem/internal/replication-stack
---
# Specification (Replication Simulation)

Builds a prototype replication system consistent with the replication stack.

## State representation

- **Replica set.**  
  Collection of snapshot stores plus metadata (IDs, state).

- **Update log.**  
  Ordered log of operations to apply to replicas.

## Inputs

1. Snapshots from the storage spec.
2. Operations to apply (intake events, evaluation results, etc.).

## Procedures

1. **Log update.**  
   Append each operation to the update log.
2. **Distribute.**  
   Send updates to all replicas via distribution channels.
3. **Apply.**  
   Each replica applies updates using concurrency rules (commuting operations).
4. **Consistency check.**  
   Periodically compare replicas; if divergence occurs, rebuild from canonical
   snapshot.

## Invariants

- All replicas must converge to the same state (per commutation laws).
- Update log ordering must respect dependency graph.

## Outputs

- Replica status (healthy, lagging, divergent).
- Logs for applied updates and repair operations.
