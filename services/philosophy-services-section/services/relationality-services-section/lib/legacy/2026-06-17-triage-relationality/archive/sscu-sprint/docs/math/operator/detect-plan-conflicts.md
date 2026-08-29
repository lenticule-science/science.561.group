---
title: Detect Plan Conflicts
role: operator
derived_from: computer/function/evaluate-step
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Analyzes a program wiring plan for overlaps or constraint violations.

## Definition
- Inputs: [Program Wiring Plan](../type/program-wiring-plan.md).
- Outputs: success (no conflicts) or [Computer Failure](../../type/computer-failure.md)
  describing conflicts.
- Behaviour: checks typing, dependency ordering, and policy/trace constraints;
  emits failure if conflicts are found.

## Invariants
- No state mutation; diagnostics only.
- Deterministic for a given plan.
- Failure modes: type mismatch, unsatisfied dependencies, policy/trace
  constraint violations, cycles.

## Proof
- Derived from: [Computer Evaluate Step](../../function/evaluate-step.md).
- Shows that: conflict detection can be performed as an evaluation step yielding
  explicit failures without altering state.
