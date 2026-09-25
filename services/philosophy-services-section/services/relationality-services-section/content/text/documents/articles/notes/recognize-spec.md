---
title: Recognize Spec
id: recognize-spec
role: operator
status: someday
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: computer/function/recognition
description: Normalises a program-level specification into a validated Program Command.
---



Normalises a program-level specification into a validated [Program Command](./program-command.md).

## Definition
- Inputs: program command spec (verb, targets, parameters).
- Outputs: validated [Program Command](./program-command.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour: checks syntax (verb/parameters present), resolves target
  references, applies policy/trace constraints; emits failure on
  invalid/forbidden specs.

## Invariants
- Layer-safe: commands respect layer/policy constraints.
- No state mutation on failure.
- Deterministic: same spec yields the same normalised command.

## Proof
- Derived from: [Computer Recognition](./recognition.md).
- Shows that: program specs can be validated via computer recognition into
  reusable program-command carriers.

## Earlier material

Normalises a program-level specification into a validated [Program Command](program-command.md).

## Definition
- Inputs: program command spec (verb, targets, parameters).
- Outputs: validated [Program Command](program-command.md) or
  [Computer Failure](computer-failure.md).
- Behaviour: checks syntax (verb/parameters present), resolves target
  references, applies policy/trace constraints; emits failure on
  invalid/forbidden specs.

## Proof
- Derived from: [Computer Recognition](../../../../function/recognition.md).
- Shows that: program specs can be validated via computer recognition into
  reusable program-command carriers.
