---
type: morphism
class: composed-operator
realizes: [runbook]
depends-on: [runbook-record, runbook-pause]
see-also: [runbook-execution, resume-session]
title: Runbook resume
description: The operator that reactivates a paused runbook execution from its substrate-recorded checkpoint, continuing from the next step.
---

# Runbook resume

The operator that reactivates a paused [runbook](teaching/explanations/runbook.md) execution from its substrate-recorded checkpoint, continuing from the next step.
Runbook-resume is the counterpart to [runbook-pause](../runbook-pause/runbook-pause.md): together they implement substrate-level safe interruption-and-continuation of multi-step procedures.

## Signature

`runbook-resume(paused-execution-record, agent, session) → (active-execution, witness) | (rejection, witness)`

Inputs:

- **`paused-execution-record`** — reference to the substrate entity recording the pause.
  Must be substrate-resident.
- **`agent`** — reference to the agent resuming the runbook.
  Must be authorized to operate on the runbook's scope; need not be the original pausing agent (with appropriate authorization).
- **`session`** — reference to the [session-record](../objects/session-record.md) the resume occurs within.

Outputs:

- **`active-execution`** — the runbook in active execution again, with state restored from the paused record.
  The next step will fire on the next [tick-advance](../../tick/tick-advance/tick-advance.md) or skill-invocation.
- **`rejection`** — resume is not admissible: the resuming agent lacks authorization, the paused-execution record has been retired, the runbook-record version is no longer compatible, or the substrate has changed in ways that invalidate the paused state.
- **`witness`** — records the resume: paused-execution-id, resuming agent, session, the new active-execution state, the substrate state at resume.

## Operational semantics

Runbook-resume proceeds in seven steps:

1. *Validate paused-execution.* Check that the cited record exists, is in paused state, and has not been retired.
  Failures abort.
2. *Validate runbook-record version.* Verify that the runbook-record cited by the paused-execution still exists at a compatible version.
  If the runbook has been edited in incompatible ways during the pause, resume may fail (or be admissible only with governance approval, per substrate policy).
3. *Validate authorization.* Check that the resuming agent is authorized to operate on the runbook's scope and to invoke the next step.
  Authorization changes during the pause may require re-checking; per the substrate's discipline, resume's admissibility is checked at resume time, not at pause time.
4. *Read accumulated state.* Read the canonical-hash-referenced accumulated state from the [content-addressed store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/content-addressed-store.md) via [GetCell](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/get-cell.md).
  Per the substrate's content-addressing, the state is byte-identical to what was recorded at pause.
5. *Re-bind runbook execution.* Restore the runbook execution's state: the accumulated bindings are re-loaded, the current step is set to the next-after-pause step.
6. *Insert active-execution predication.* Update the session-record's active-runbook predication to the resumed execution; retire the paused-execution record's pause predication (the pause is now resolved).
7. *Witness emit.* Append the resume witness to the event log; the next step will fire on the next session operation.

## Engineering invariants

- **Determinism of resumed state.** Per [content-addressed-store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/content-addressed-store.md) discipline, the accumulated state read at resume is byte-identical to what was recorded at pause.
  The runbook's continuation is deterministic given the same state and the same substrate content.
- **Authorization re-checked.** Authorization is verified at resume, not assumed from pause.
  Authorization changes during the pause are reflected.
- **Witness chain continuity.** The witness chain bridges pause and resume: the pause witness cites the accumulated-state hash; the resume witness cites the same hash; an auditor can follow the chain through the interruption.
- **Substrate-version-aware.** If the runbook-record has been edited during the pause, the resume operation may detect the change and either abort or proceed with the new version (per substrate policy).

## Failure modes

- **Authorization revoked.** The resuming agent (or the original-pausing agent, if the policy is "only-original-may-resume") has lost authorization.
  Resume aborts; the paused-execution remains, awaiting authorized resume or governance-decision.
- **Substrate content gone.** The paused-execution's referenced state hash no longer resolves (the cell was retired in error, or the substrate has been compacted in ways that lost it).
  Resume aborts; the paused-execution is recorded as broken.
- **Runbook-record incompatibly changed.** The runbook has been edited in ways that invalidate the paused state.
  Per substrate policy, resume aborts or proceeds with governance approval.

## Position in the platform

Runbook-resume is the substrate-level *recover-from-interruption primitive* for runbooks.
Per [agential-self-generation](../../agent/agential-self-generation/agential-self-generation.md), the runbook execution is itself substrate-recorded; pause and resume are the substrate's discipline for making the recording survive interruption.
The pattern is what makes the platform's multi-step work resilient to network failures, scheduling delays, and governance-imposed pauses.
