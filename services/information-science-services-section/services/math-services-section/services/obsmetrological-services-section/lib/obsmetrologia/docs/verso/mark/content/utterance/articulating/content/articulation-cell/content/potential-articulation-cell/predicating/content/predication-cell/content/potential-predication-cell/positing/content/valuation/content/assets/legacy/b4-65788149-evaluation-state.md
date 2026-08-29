---
title: Evaluation State
id: evaluation-state
role: structure
status: plan
proof_refs:
- task-precedence
- wiring-plan
- failure-carrier
- snapshot
- evaluation-context-stack
- binding-environment
- hypertensor-section
- recognition
fields:
- name: plan_ref
  type: wiring-plan
  description: active wiring plan being executed.
- name: ready_queue
  type: trace
  description: steps ready to fire (dependencies satisfied) as traced ids.
- name: bindings
  type: binding-environment
  description: name/port bindings to earned carriers/recognitions.
- name: context_stack
  type: evaluation-context-stack
  description: nested evaluation contexts for sections/recognitions.
- name: in_flight
  type: recognition
  description: current step id and inputs as a recognition or null when idle.
- name: failure_slot
  type: failure-carrier
  description: failure record or null.
- name: provenance
  type: trace
  description: `{execution_id, actor, timestamp, trace}` for this evaluation.
---

Evaluation state carrying the potential wiring plan, ready queue, bindings over
earned carriers, context frames over sections/recognitions, and provenance
needed to drive single-step evaluation in the hypertensor topos.

## Definition
- `execution_id`: UUID for this evaluation run.
- `plan_ref`: identifier of the potential [Wiring Plan](wiring-plan.md).
- `ready_queue`: ordered list of plan step ids whose dependencies are satisfied (traced).
- `bindings`: [Binding Environment](binding-environment.md) mapping port ids to
  earned carrier instances/recognitions.
- `context_stack`: [Evaluation Context Stack](evaluation-context-stack.md) for
  section-level evaluation.
- `in_flight`: `{step_id, inputs}` as a [Recognition](recognition.md) or null when idle.
- `failure_slot`: [FailureCarrier](failure-carrier.md) or null.
- `timestamp`: ISO-8601 UTC timestamp of last update.
- `provenance`: `{actor, origin, trace}` recording who/what advanced the state.
- `integrity_hash`: SHA-256 over canonical JSON of the above fields.

## Invariants
- Acyclic order: every step in `ready_queue` has all predecessors bound; no step id appears twice.
- Type coherence: every `bindings` entry matches the port's declared carrier type; only failures occupy `failure_slot`.
- Context coherence: `context_stack` frames are consistent with current section/recognition evaluation; pushes/pops maintain stack invariants.
- Determinism: selecting the head of `ready_queue` and applying the referenced operator yields a unique successor state or a failure.
- Provenance: execution id/timestamps are updated on each transition; failures
  move into `failure_slot`, not hidden in state.

## Proof
- Uses: [task-precedence](../operator/task-precedence.md) to order steps from a
  [Wiring Plan](wiring-plan.md); [Binding Environment](binding-environment.md)
  and [Evaluation Context Stack](evaluation-context-stack.md) to evaluate
  sections/recognitions; [Failure Carrier](failure-carrier.md) and [Snapshot](snapshot.md)
  to surface errors and persist state.
- Shows that: carrying the plan, queue, typed bindings, and context frames
  suffices to encode a single-step evaluation state; scheduling invariants
  follow from precedence and explicit bindings.
