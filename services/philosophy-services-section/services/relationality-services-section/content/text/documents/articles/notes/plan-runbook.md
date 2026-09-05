---
title: Plan Runbook
id: plan-runbook
role: operator
status: someday
derived_from: computer/function/wiring
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Builds or refreshes a program wiring plan from validated commands and session state.

## Definition
- Inputs: [Program Command](./program-command.md) stream and
  [Program Session](./program-session.md).
- Outputs: [Program Wiring Plan](./program-wiring-plan.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour: composes commands into an acyclic wiring plan over computer
  operators/carriers; emits failure when wiring/typing/ordering constraints are
  violated.

## Invariants
- Acyclic, well-typed plan respecting command constraints.
- Failure purity: on failure, prior session/plan unchanged.
- Deterministic: given the same command stream/session, yields the same plan or
  the same failure.
- Failure modes: type errors (port/carrier mismatch), cycles, missing targets,
  policy violations.

## Proof
- Derived from: [Computer Wiring](./wiring.md).
- Shows that: building runbooks from commands via computer wiring yields a
  reusable planning step for programs, with explicit failure handling.
