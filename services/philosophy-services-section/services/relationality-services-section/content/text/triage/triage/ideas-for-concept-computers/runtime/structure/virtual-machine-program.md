---
title: Virtual Machine Program
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-kernel
uses:
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-evaluation-state
  - computer/structure/computer-snapshot
  - computer/operator/evaluate-step
  - computer/operator/storage
produces:
  - computer/structure/computer-wiring-plan
used_by: []
produced_by: []
---
# Virtual Machine Program

Program-level VM that executes bytecode/runbook wiring plans over the computer
kernel carriers, providing scheduling and persistence.

## Definition
- Inputs: compiled wiring plan/bytecode expressed as a
  [Computer Wiring Plan](../../../../../documents/articles/notes/computer-wiring-plan.md)
  plus initial [Computer Evaluation State](../../../../../documents/articles/notes/computer-evaluation-state.md).
- Execution: step the plan with [Evaluate Step](../../../../../documents/articles/notes/evaluate-step.md),
  updating the evaluation state and respecting failure outputs.
- Persistence: checkpoint/resume via [Computer Storage](../../../../../documents/articles/notes/storage.md)
  and [Computer Snapshot](../../../../../documents/articles/notes/computer-snapshot.md).
- Outputs: updated wiring plan (e.g., with dynamic bindings) and evaluation
  state/failure carriers.

## Invariants
- Acyclic, well-typed plans only; enforces plan validity before execution.
- Subject reduction/progress inherited from computer evaluation.
- Crash safety: checkpoints preserve state; failures leave state unchanged.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: executing wiring plans via computer operators yields a VM that
  respects kernel semantics and exposes only computer carriers.
