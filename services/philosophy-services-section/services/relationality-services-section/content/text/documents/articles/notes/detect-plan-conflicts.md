---
title: Detect Plan Conflicts
id: detect-plan-conflicts
role: operator
status: someday
derived_from: computer/function/evaluate-step
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Analyzes a program wiring plan for overlaps or constraint violations.

## Definition
- Inputs: [Program Wiring Plan](./program-wiring-plan.md).
- Outputs: success (no conflicts) or [Computer Failure](./computer-failure.md)
  describing conflicts.
- Behaviour: checks typing, dependency ordering, and policy/trace constraints;
  emits failure if conflicts are found.

## Invariants
- No state mutation; diagnostics only.
- Deterministic for a given plan.
- Failure modes: type mismatch, unsatisfied dependencies, policy/trace
  constraint violations, cycles.

## Proof
- Derived from: [Computer Evaluate Step](./evaluate-step.md).
- Shows that: conflict detection can be performed as an evaluation step yielding
  explicit failures without altering state.
