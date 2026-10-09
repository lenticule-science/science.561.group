---
title: Semantics Checker Program
kind: structure
layer: program
status: someday
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
derives-from: computer/structure/computer-kernel
produced-by: []
description: Program-level checker that runs semantic validation/witnessing passes as wiring plans over the computer kernel.
---

Program-level checker that runs semantic validation/witnessing passes as wiring
plans over the computer kernel.

## Definition
- Inputs: artefacts (docs/code) recognised into a [Computer Wiring Plan](../computer-wiring-plan.md)
  and bound into a [Computer Evaluation State](../computer-evaluation-state.md).
- Execution: run semantic checks (typing, invariants, linkage) by stepping the
  plan with [Evaluate Step](../evaluate-step.md);
  use [Recognition](../../../../glossary/concepts/phenomena-recognition.md) to validate
  witnesses/constraints.
- Persistence: checkpoint checker state/reports via [Computer Storage](../storage.md)
  and [Computer Snapshot](../computer-snapshot.md).
- Outputs: updated wiring plan/evaluation state and failure carriers for
  semantic violations.

## Invariants
- Completeness: checks cover all artefacts in the plan; no unchecked nodes.
- Determinism: given the same inputs, the checker yields the same results.
- Failure purity: violations reported as [Computer Failure](../computer-failure.md);
  no state mutation on failure.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: encoding semantic checks as wiring plans executed via computer
  operators yields a checker that preserves kernel semantics while validating
  program/doc artefacts.
