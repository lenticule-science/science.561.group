---
title: Concurrency Structure
tags:
  - concurrency
  - commutation
  - flow
depends_on:
  - commute-flow-and-nucleus
  - distribute-flow
  - flow-index-implication
  - theorem/internal/scheduling-stack
# Concurrency Structure

The commutation and distribution acts, together with the scheduling structure,
induce a concurrency structure: a way to identify which tasks may be executed
in parallel without changing observable results.

Formally, there exists a structure

```text
Concurrency = (Tasks, Precedes, Commute, Parallel)
```

such that:

1. **Tasks and precedence.**  
   `Tasks` and `Precedes` are as in the scheduling structure: tasks with a
   dependency relation derived from trace, wiring, and distribution.

2. **Commutation relation.**  
   `Commute ⊆ Tasks × Tasks` is induced by `CommuteFlowAndNucleus`,
   `DistributeFlow`, and `FlowIndexImplication`: it relates tasks whose
   underlying flow/nucleus operations commute or distribute safely.

3. **Parallel sets.**  
   `Parallel` assigns to each finite set of tasks a partition into subsets
   that:
   - are pairwise commuting within each subset according to `Commute`, and
   - are consistent with `Precedes` (no subset violates dependency order).

Executing tasks in parallel within each subset and respecting the precedence
relation yields the same observable outcome as any deterministic sequential
execution consistent with `Precedes`. This concurrency structure is the
mathematical guarantee for safe parallel execution.
