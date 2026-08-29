---
title: Evaluate Computer Step
id: evaluate-step
role: One-step evaluator over a wiring plan with explicit failure logging.
status: plan
inputs:
- id: evaluation-state
  name: state
- id: wiring-plan
  name: plan
- id: trace
  name: trace
outputs:
- id: evaluation-state
  name: state'
- id: failure-algebra
  name: failure
transformation:
- return
- value
proof_refs: []
---


# Evaluate Computer Step

Single-step evaluator over an earned [Evaluation State](./evaluation-state.md)
following a [Wiring Plan](./wiring-plan.md), with failures recorded in
the [Failure Algebra](./failure-algebra.md).

## Definition
- Inputs: evaluation state containing ready queue, bindings, wiring-plan handle,
  and trace cursor; the wiring plan; the current trace.
- Outputs: updated evaluation state or failure element.
- Behaviour:
  1. Read the head task from the ready queue using the wiring plan’s
     topological order.
  2. Collect inputs by looking up bound carriers on incoming ports; if a port
     is unbound or type-mismatched, emit failure (missing-input/type-mismatch).
  3. Dispatch to the referenced earned operator (recognition, storage,
     wiring, or judgement evaluation) passing the collected carriers.
  4. Update bindings with the outputs, advance the trace cursor, and enqueue
     newly-ready tasks; on operator failure, record the failure in the failure
     algebra and leave bindings unchanged.

## Invariants
- Subject reduction/progress preserved by using only earned operators.
- On failure, no state mutation of bindings; failure is logged in the failure
  algebra with trace provenance.
- Deterministic: same wiring plan, inputs, and trace yield nucleus-equivalent
  successor state.

## Proof
- Uses: [Wiring Plan](./wiring-plan.md) for ordering, earned
  evaluation operators for computation, and [Failure Algebra](./failure-algebra.md)
  for error accumulation.
- Shows that: one-step evaluation following the wiring plan preserves typing
  and either advances the evaluation state or records a failure without
  mutating bindings.
