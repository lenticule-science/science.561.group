---
title: Stabilize Plan
id: stabilize-plan
role: operator
status: someday
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: computer/function/evaluate-step
description: Adjusts a program wiring plan to resolve conflicts and maintain invariants.
---



Adjusts a program wiring plan to resolve conflicts and maintain invariants.

## Definition
- Inputs: [Program Wiring Plan](./program-wiring-plan.md).
- Outputs: updated [Program Wiring Plan](./program-wiring-plan.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour: rewrites the plan (reorder, adjust edges) to satisfy typing,
  dependency, and policy constraints; emits failure if stabilization cannot
  be achieved.

## Invariants
- Resulting plan remains acyclic/well-typed.
- Failure purity: on failure, original plan remains unchanged.
- Failure modes: unresolved conflicts, policy violations, attempts to introduce
  cycles or type errors.

## Proof
- Derived from: [Computer Evaluate Step](./evaluate-step.md).
- Shows that: stabilising plans via evaluation yields a corrected plan or
  explicit failure, preserving kernel semantics.

## Earlier material

## Definition
- Inputs: [Program Wiring Plan](program-wiring-plan.md).
- Outputs: updated [Program Wiring Plan](program-wiring-plan.md) or
  [Computer Failure](computer-failure.md).
- Behaviour: rewrites the plan (reorder, adjust edges) to satisfy typing,
  dependency, and policy constraints; emits failure if stabilization cannot
  be achieved.

## Proof
- Derived from: [Computer Evaluate Step](evaluate-step.md).
- Shows that: stabilising plans via evaluation yields a corrected plan or
  explicit failure, preserving kernel semantics.
