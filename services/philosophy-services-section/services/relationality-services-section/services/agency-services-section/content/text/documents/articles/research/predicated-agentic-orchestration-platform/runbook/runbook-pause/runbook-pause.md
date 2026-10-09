---
type: morphism
class: composed-operator
realizes: [runbook]
depends-on: [runbook-record, runbook-execution]
see-also: [runbook-resume, escalation]
title: Runbook pause
description: The operator that suspends an in-flight runbook execution at a checkpoint, preserving the runbook's accumulated state for later resumption.
---

# Runbook pause

The operator that suspends an in-flight [runbook](teaching/explanations/runbook.md) execution at a checkpoint, preserving the runbook's accumulated state for later resumption.
Runbook-pause is the substrate-level discipline for safely interrupting multi-step procedures.

## Signature

`runbook-pause(runbook-execution, reason) → (paused-execution-record, witness)`

Inputs:

- **`runbook-execution`** — reference to the in-flight runbook execution.
  The execution is identified by the [session](teaching/explanations/session.md) and the runbook-record being executed.
- **`reason`** — predications declaring why the runbook is being paused: agent-requested interruption, awaiting external input, awaiting governance-decision, external dependency unavailable, scheduled timeout.

Outputs:

- **`paused-execution-record`** — a substrate entity recording the pause: the runbook-record, the current step, the accumulated state at the pause-point, the reason.
  The runbook is now substrate-resident in a paused state, ready for resumption.
- **`witness`** — records the pause: runbook-id, step-position, pause-reason, the substrate state at pause.

## Operational semantics

Runbook-pause proceeds in five steps:

1. *Confirm pausable position.* Check that the runbook is at a step-boundary (between steps), not inside an atomic step.
  Pausing inside an atomic step is not admissible — atomic steps must complete or fail; the runbook framework only permits pause between them.
2. *Capture accumulated state.* Read the runbook's accumulated state — the bindings produced by completed steps, the current step's input values.
  Persist the state via [PutCell](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/put-cell.md) into the [content-addressed store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/content-addressed-store.md); the state's content-hash becomes part of the paused-execution record.
3. *Insert paused-execution record.* Create the substrate entity recording the pause; cite the runbook-record, the step-position (which step was about to fire), the accumulated-state hash, the reason, and the time.
4. *Update session.* The agent's [session-record](../objects/session-record.md) is updated: the active runbook-execution reference is replaced with a paused-execution reference.
  The agent's [view](../../scope/view/view.md) is regenerated.
5. *Witness emit.* Append the pause witness to the [event log](../../../objects/event-log.md).

## Engineering invariants

- **Step-boundary only.** Pauses are admissible only between steps.
  Per the runbook framework, atomic steps are themselves substrate transactions that complete or fail; pausing mid-atomic-step is not safe and not admissible.
- **Accumulated-state-preserved.** The paused execution carries the full accumulated state via canonical-hash reference.
  [Runbook-resume](../runbook-resume/runbook-resume.md) reads the state by content-hash; the substrate's deterministic-replay rests on this.
- **Witness-recorded.** The pause witness records the pause-reason; the substrate's audit can show why a runbook paused.
- **Resumable in any session.** The paused-execution record is substrate-resident, not session-bound.
  Per the substrate's discipline, a paused runbook can be resumed in a different session, by a different agent (with appropriate authorization), or after substrate restart.

## Failure modes

- **In atomic step.** The current step is in progress; pause is rejected.
  The agent must let the step complete (or fail), then pause.
- **Authorization lost.** The agent's authorization to operate on this runbook has been revoked; pause is rejected (or, at substrate policy, succeeds with the paused-execution record marked for governance review).

## Position in the platform

Runbook-pause is the substrate-level *safe interrupt primitive*.
Without it, long-running runbook executions are vulnerable to interruption: a network failure mid-execution leaves the runbook in an undefined state.
With it, runbooks have substrate-recorded checkpoints; interruption produces a substrate entity, not an undefined state.
