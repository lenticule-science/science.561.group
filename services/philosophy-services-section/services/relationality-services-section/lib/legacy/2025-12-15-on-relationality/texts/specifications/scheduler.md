---
title: Scheduling Simulation
tags:
  - simulation
  - scheduling
  - execution
depends_on:
  - theorem/internal/scheduling-stack
---
# Specification (Scheduling Simulation)

Implements the scheduling guarantees of **Theorem (Scheduling Stack)**.

## State representation

- **Task graph.**  
  Nodes are trace/evaluation tasks; edges encode dependencies (from module wiring).

- **Queues.**  
  Ready queue for runnable tasks; waiting set for those blocked on dependencies.

## Inputs

1. List of tasks extracted from evaluation/flow/measurement modules.
2. Dependency edges derived from the trace spine + module wiring.

## Procedures

1. **Enqueue tasks.**  
   Insert tasks whose dependencies are satisfied into the ready queue.
2. **Dispatch.**  
   Pop from ready queue; execute the corresponding operation (reduction, measurement, etc.).
3. **Update dependencies.**  
   After completion, mark downstream tasks as ready when all parents finish.
4. **Failure handling.**  
   If a task fails invariant checks, log and pause dependents until resolved.

## Invariants

- Execution order must respect dependency graph.
- Scheduler must ensure trace spine coherence (no skipping steps).

## Outputs

- Execution logs with start/end times.
- Warnings for invariant violations or dependency cycles.
