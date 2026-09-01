---
title: Logical Reasoning Program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Runs logical reasoning tasks over earned recognitions. Wires evaluation and
recognition operators to derive conclusions under policy and traceability.

## Behaviour
- Load premises as [Computer Recognition](../../type/computer-recognition.md).
- Apply evaluation steps (proof search/normalisation) within the earned logic
  via [Evaluate Step](../../operator/evaluate-step.md) over a
  [Computer Wiring Plan](../../type/computer-wiring-plan.md).
- Emit derived recognitions or [Computer Failure](../../type/computer-failure.md)
  if obligations are unmet.

## Invariants
- Reasoning uses only earned operators; conclusions are traceable to premises.
- Policy and topology constraints are respected.
- Failures are emitted as [Computer Failure](../../type/computer-failure.md).

## Proof
Refines the [Computer Kernel](../../type/documentation-interpreter.md) by
specialising to reasoning wirings; proof shows preservation of kernel semantics
and correct failure handling.
