---
name: modal-reasoning-program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Runs modal reasoning (necessity/possibility) over earned recognitions. Extends
the logical reasoning program with modality-specific operators and constraints.

## Behaviour
- Load modal premises as [Computer Recognition](../../type/computer-recognition.md)
  with modal annotations.
- Apply evaluation steps that respect modal rules and topology/policy scopes via
  [Evaluate Step](../../operator/evaluate-step.md) over a
  [Computer Wiring Plan](../../type/computer-wiring-plan.md).
- Emit derived modal recognitions or [Computer Failure](../../type/computer-failure.md)
  if obligations fail.

## Invariants
- Modal conclusions are traceable to premises and respect modal rules.
- Policy and topology constraints are enforced.
- Failures are emitted as [`FailureCarrier`](docs/machine/structure/failure-carrier.md).

## Proof
Refines the documentation interpreter by specialising to modal reasoning wirings,
preserving kernel semantics and failure handling.
