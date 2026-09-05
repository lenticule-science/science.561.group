---
name: recognize-spec
role: operator
derived_from: computer/function/recognition
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



Normalises a program-level specification into a validated [Program Command](../type/program-command.md).

## Definition
- Inputs: program command spec (verb, targets, parameters).
- Outputs: validated [Program Command](../type/program-command.md) or
  [Computer Failure](../../type/computer-failure.md).
- Behaviour: checks syntax (verb/parameters present), resolves target
  references, applies policy/trace constraints; emits failure on
  invalid/forbidden specs.

## Invariants
- Layer-safe: commands respect layer/policy constraints.
- No state mutation on failure.
- Deterministic: same spec yields the same normalised command.

## Proof
- Derived from: [Computer Recognition](../../function/recognition.md).
- Shows that: program specs can be validated via computer recognition into
  reusable program-command carriers.
