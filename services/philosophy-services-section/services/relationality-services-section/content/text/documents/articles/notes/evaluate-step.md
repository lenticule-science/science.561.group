---
title: Machine Evaluation Step
kind: operator
layer: machine
status: plan
derived_from:
  - system/operator/task-precedence
uses:
  - machine/structure/evaluation-state
  - machine/structure/failure-carrier
produces:
  - machine/structure/evaluation-state
  - machine/structure/failure-carrier
---
# Machine Evaluation Step

Performs a single machine-level evaluation step over
[EvaluationState](./evaluation-state.md). In addition to
its normal result, it may emit a
[`FailureCarrier`](./failure-carrier.md) when the primitive
reduction or normalisation obligations are not met.

## Failure mode

- **EvaluationFailure** — reduction undefined for the current state, or
  normalisation preconditions violated, emitted as
  [`FailureCarrier`](./failure-carrier.md).

## Behaviour

- On success: advance [EvaluationState](./evaluation-state.md)
  (details to be derived from the system task/evaluation operators).
- On failure: emit [`FailureCarrier`](./failure-carrier.md)
  with origin, arguments, and diagnostics; halt dependent runbook tasks.

## Proof

Sketch: refine `system/operator/task-precedence` into the machine evaluation
step by restricting to earned machine carriers and showing that for every
admissible system step, the machine step either advances consistently or
returns `FailureCarrier` when preconditions (earned invariants/normalisation
obligations) are violated.
