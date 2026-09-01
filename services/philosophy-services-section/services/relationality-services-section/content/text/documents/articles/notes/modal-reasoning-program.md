---
title: Modal Reasoning Program
id: modal-reasoning-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---



Runs modal reasoning (necessity/possibility) over earned recognitions. Extends
the logical reasoning program with modality-specific operators and constraints.

## Behaviour
- Load modal premises as [Computer Recognition](./computer-recognition.md)
  with modal annotations.
- Apply evaluation steps that respect modal rules and topology/policy scopes via
  [Evaluate Step](./evaluate-step.md) over a
  [Computer Wiring Plan](./computer-wiring-plan.md).
- Emit derived modal recognitions or [Computer Failure](./computer-failure.md)
  if obligations fail.

## Invariants
- Modal conclusions are traceable to premises and respect modal rules.
- Policy and topology constraints are enforced.
- Failures are emitted as [`FailureCarrier`](./failure-carrier.md).

## Proof
Refines the documentation interpreter by specialising to modal reasoning wirings,
preserving kernel semantics and failure handling.
