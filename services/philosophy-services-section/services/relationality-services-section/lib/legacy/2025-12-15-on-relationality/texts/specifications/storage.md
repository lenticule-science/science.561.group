---
title: Relational Storage Simulation
tags:
  - simulation
  - storage
  - persistence
depends_on:
  - theorem/internal/relational-storage
---
# Specification (Relational Storage Simulation)

Implements the snapshot semantics described in **Theorem (Relational Storage)**.

## State representation

- **Snapshot object.**  
  Stores (a) intake-normalized observations, (b) baseline tail estimate, and
  (c) list of fixed recognitions/invariants.

- **Context archive.**  
  Persistent map from snapshot IDs to serialized contexts (renewal frames).

## Inputs

1. Observation payload produced by the intake stack.
2. Baseline data (`BaselineLimit` estimate).
3. Fixed recognition metadata.

## Procedures

1. **Save.**  
   - Validate payload via intake stack.  
   - Record baseline limit snapshot.  
   - Serialize context frames; store under new snapshot ID.
2. **Load.**  
   - Fetch snapshot by ID.  
   - Rebuild context via `RetraceContext`.  
   - Reattach baseline tail and fixed recognitions.

## Invariants

- Loaded snapshot must equal the original after renewal/retrace cycle.
- Fixed recognitions should remain reachable (`Reach`).

## Outputs

- Snapshot IDs + metadata.
- Logs of load/save operations for auditing.
