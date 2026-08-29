---

name: virtual-machine-program
layer: program
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

Program-level VM that executes bytecode/runbook wiring plans over the computer
kernel carriers, providing scheduling and persistence.

## Definition
- Inputs: compiled wiring plan/bytecode expressed as a
  [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md)
  plus initial [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md).
- Execution: step the plan with [Evaluate Step](../../../computer/operator/evaluate-step.md),
  updating the evaluation state and respecting failure outputs.
- Persistence: checkpoint/resume via [Computer Storage](../../../computer/operator/storage.md)
  and [Computer Snapshot](../../../computer/structure/computer-snapshot.md).
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
