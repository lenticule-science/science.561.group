---
title: Scheduling Simulation
keywords:
  - simulation
  - scheduling
  - execution
depends-on:
  - system/structure/task-carrier
  - system/operator/task-precedence
  - math/operator/task-commutation
  - system/operator/task-parallelization
description: Implements the scheduling guarantees of Theorem (Scheduling Stack).
---

Implements the scheduling guarantees of **Theorem (Scheduling Stack)**.

## Types

- **Task (`Task`).**
  A carrier for scheduling units:
  - references a `Step` in a `Runbook`,
  - may include additional metadata (priority, cost estimates).

- **Task graph (`TaskGraph`).**
  A directed acyclic graph whose nodes are `Task` values and edges encode
  dependencies derived from wiring and trace structure.

## Functions

Implementations must provide:

- **Task extraction.**

  ```text
  extract_tasks : Runbook → TaskGraph
  ```

  - maps each `Step` in a runbook to a `Task`,
  - derives dependency edges from wiring and kernel-machine semantics
    (see [Relational Machine Kernel](./kernel.md)).

- **Scheduling.**

  ```text
  schedule : TaskGraph → list[Task]
  ```

  - returns a linearisation of tasks that respects the dependency relation and
  trace spine coherence.

## Invariants

- Execution order must respect the dependency graph and trace spine.
- The scheduler must not introduce cycles or reorder tasks in a way that
  breaks kernel-machine invariants
  (see [Relational Machine Kernel](./kernel.md)).

## Outputs

- Execution plans (ordered task lists).
- Logs or diagnostics for dependency cycles or invariant violations.
