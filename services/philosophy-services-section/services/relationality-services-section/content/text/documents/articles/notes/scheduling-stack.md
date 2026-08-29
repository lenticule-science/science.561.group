---
title: Scheduling Structure
tags:
  - scheduling
  - execution
  - trace
depends_on:
  - theorem/internal/trace-infrastructure
  - theorem/internal/evaluation-engine
  - theorem/internal/distribution-stack
  - theorem/internal/module-wiring
# Scheduling Structure

The trace infrastructure, evaluation engine structure, distribution structure,
and wiring structure induce a scheduling structure: a set of tasks and a
dependency-respecting order in which they may be executed.

Formally, there exists a structure

```text
Schedule = (Tasks, Precedes)
```

such that:

1. **Tasks.**
   `Tasks` are finite units of work derived from earned acts (evaluation
   steps, flow operations, measurement updates) together with the trace
   positions and ports/channels they affect.

2. **Precedence relation.**
   `Precedes ⊆ Tasks × Tasks` captures dependency order:
   - a task must be preceded by any task that writes the trace or channels it
     reads from,
   - tasks whose effects commute (as guaranteed by normalization and
     concurrency theorems) need not be ordered relative to each other.

Any valid execution order is a linear extension of `Precedes`. For any finite
set of tasks derived from the earned acts, executing them in any order
consistent with `Precedes` yields the same observable result, subject to the
commutation laws already proven. This scheduling structure underpins runtime
queues and task dispatchers in the relational computer.
