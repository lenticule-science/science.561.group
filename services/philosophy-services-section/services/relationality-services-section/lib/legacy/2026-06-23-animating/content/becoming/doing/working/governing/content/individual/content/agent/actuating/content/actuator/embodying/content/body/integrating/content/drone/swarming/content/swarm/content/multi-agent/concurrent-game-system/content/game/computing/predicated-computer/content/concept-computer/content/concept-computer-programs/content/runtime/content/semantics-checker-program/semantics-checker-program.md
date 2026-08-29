---
title: Semantics Checker Program
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-kernel
uses:
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-evaluation-state
  - computer/structure/computer-snapshot
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
produces:
  - computer/structure/computer-wiring-plan
used_by: []
produced_by: []
---
# Semantics Checker Program

Program-level checker that runs semantic validation/witnessing passes as wiring
plans over the computer kernel.

## Definition
- Inputs: artefacts (docs/code) recognised into a [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md)
  and bound into a [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md).
- Execution: run semantic checks (typing, invariants, linkage) by stepping the
  plan with [Evaluate Step](../../../computer/operator/evaluate-step.md);
  use [Recognition](../../../computer/operator/recognition.md) to validate
  witnesses/constraints.
- Persistence: checkpoint checker state/reports via [Computer Storage](../../../computer/operator/storage.md)
  and [Computer Snapshot](../../../computer/structure/computer-snapshot.md).
- Outputs: updated wiring plan/evaluation state and failure carriers for
  semantic violations.

## Invariants
- Completeness: checks cover all artefacts in the plan; no unchecked nodes.
- Determinism: given the same inputs, the checker yields the same results.
- Failure purity: violations reported as [Computer Failure](../../../computer/structure/computer-failure.md);
  no state mutation on failure.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: encoding semantic checks as wiring plans executed via computer
  operators yields a checker that preserves kernel semantics while validating
  program/doc artefacts.
