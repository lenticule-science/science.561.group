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

Program-level checker that runs semantic validation/witnessing passes as wiring
plans over the computer kernel.

## Definition
- Inputs: artefacts (docs/code) recognised into a [Computer Wiring Plan](../../../../../documents/articles/notes/computer-wiring-plan.md)
  and bound into a [Computer Evaluation State](../../../../../documents/articles/notes/computer-evaluation-state.md).
- Execution: run semantic checks (typing, invariants, linkage) by stepping the
  plan with [Evaluate Step](../../../../../documents/articles/notes/evaluate-step.md);
  use [Recognition](../../../../relationality-2/ai-generated-relationality/relationality-slop-2026-03-04/phenomena/recognition.md) to validate
  witnesses/constraints.
- Persistence: checkpoint checker state/reports via [Computer Storage](../../../../../documents/articles/notes/storage.md)
  and [Computer Snapshot](../../../../../documents/articles/notes/computer-snapshot.md).
- Outputs: updated wiring plan/evaluation state and failure carriers for
  semantic violations.

## Invariants
- Completeness: checks cover all artefacts in the plan; no unchecked nodes.
- Determinism: given the same inputs, the checker yields the same results.
- Failure purity: violations reported as [Computer Failure](../../../../../documents/articles/notes/computer-failure.md);
  no state mutation on failure.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: encoding semantic checks as wiring plans executed via computer
  operators yields a checker that preserves kernel semantics while validating
  program/doc artefacts.
