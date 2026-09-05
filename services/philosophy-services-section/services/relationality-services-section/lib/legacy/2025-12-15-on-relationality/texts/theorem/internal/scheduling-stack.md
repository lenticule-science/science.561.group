---
title: Scheduling Stack
tags:
  - scheduling
  - execution
  - trace
depends_on:
  - theorem/internal/trace-infrastructure
  - theorem/internal/evaluation-engine
  - theorem/internal/distribution-stack
  - theorem/internal/module-wiring
---
# Theorem (Scheduling Stack)

This theorem asserts that the calculus already witnesses a safe execution
schedule: tasks (evaluation steps, flow operations, measurement updates) can be
queued and processed in any order consistent with the trace spine and module
dependencies.

1. **Trace discipline.**  
   `Trace Infrastructure` records the order in which steps may occur.  Any task
   scheduled must correspond to a location in the trace spine.

2. **Evaluation tasks.**  
   `Evaluation Engine` ensures that when a task reduces a term, the context is
   updated consistently, so a scheduler can treat each reduction as an atomic
   job.

3. **Module coordination.**  
   The `Distribution Stack` and `Module Wiring` theorems show how outputs of one
   task become inputs to another.  As long as the scheduler respects these
   dependencies, the overall execution is sound.

Therefore the relational calculus has a scheduling stack: any finite set of tasks
derived from the earned acts can be executed in dependency order, and the result
will be independent of the specific schedule chosen (subject to the
commutation laws already proven).  This underpins any runtime/queue
implementation in the relational computer.
