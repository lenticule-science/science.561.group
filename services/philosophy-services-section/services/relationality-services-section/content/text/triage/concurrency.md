---
title: Concurrency Simulation
keywords:
  - simulation
  - concurrency
layer: spec
status: plan
depends_on:
  - math/operator/task-commutation
  - system/operator/task-parallelization
---
# Concurrency Simulation

This specification instantiates the **Concurrency Structure**: it provides
concrete carriers and procedures for grouping commuting tasks and executing
them in parallel while preserving observable behaviour.

## Types

- **Precedence relation (`Precedes`).**  
  A relation on `Task` values (from the scheduling spec) as induced by the
  concurrency theorem.

- **Commutation relation (`Commutes`).**  
  A relation on `Task` values indicating when two tasks may be executed in
  parallel without changing the observable result.

## Functions

Implementations must provide:

- **Grouping.**

  ```text
  group_commuting : TaskGraph → list[list[Task]]
  ```

  - partitions tasks into subsets such that:
    - tasks within each subset commute according to `Commutes`,
    - no precedence constraints are violated.

## Invariants

- Only tasks proven to commute (under `Commutes`) may be executed in parallel.
- Parallel execution of grouped tasks yields the same observable result as any
  deterministic sequential execution consistent with `Precedes`.

## Outputs

- Execution traces showing parallelism and grouping.
- Metrics for speedup vs. a sequential baseline.
