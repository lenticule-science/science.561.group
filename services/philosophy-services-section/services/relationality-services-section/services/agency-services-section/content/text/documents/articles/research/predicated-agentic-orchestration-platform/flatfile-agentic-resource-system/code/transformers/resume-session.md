---
source: [session, agent]
target: [session, witness]
name: resume-session
description: "The morphism that resumes an existing SessionRecord: given a session reference and (optionally) an agent reference, validate the session's resumability, transition the session's lifecycle from paused (or closing for late resumption) back to active, re-bind the realization's compute resources to the substrate-resident session, and emit the session-resumed event."
type: morphism
class: composed-operator
instantiates: [resume-session]
depends-on: [session-record, agent-record, three-tier-memory, apply-edit, emit-event]
see-also: [open-session, close-session, invoke-skill]
title: resume-session
---


The morphism that resumes an existing [`SessionRecord`](../objects/session-record.md): given a session reference and (optionally) an agent reference, validate the session's resumability, transition the session's lifecycle from `paused` (or `closing` for late resumption) back to `active`, re-bind the realization's compute resources to the substrate-resident session, and emit the `session-resumed` event.

`resume-session` is FARS's realization of AgOP's [resume-session](../../../morphisms/resume-session.md).
The morphism makes session continuation a *substrate-driven operation*: the substrate has the session's full state in its event chain, and resumption reads that state rather than reconstructing context from runtime memory.

A resumed session is *the same session* — the session record's name does not change, the witness chain continues from the prior session events, the office's investiture is unchanged.
Resumption is *not* opening a new session that mimics the old; it is continuing the same substrate entity.

## Signature

```
resume-session(session; agent) → (session, witness)
```

Inputs:

- **`session`** — reference to the [`SessionRecord`](../objects/session-record.md) to resume.
  Must exist in the substrate; must be in `paused` or `closing` state (resuming a `closed` session is non-conformant — closed sessions are immutable per [session-as-entity](../../entity/session-as-entity/session-as-entity.md)).
- **`agent`** — optional reference to the [`AgentRecord`](../objects/agent-record.md) resuming the session.
  If null, the session's recorded `agent` field is used (most common case).
  If non-null, MAY differ from the session's recorded agent for *agent substitution* — admissible only when the office's installation discipline allows substitution AND the new agent is admissible per the office's `bearer` predicate.

Outputs:

- **`session`** — the [`SessionRecord`](../objects/session-record.md) reference, with `state` updated to `active`.
  The handle the realization re-binds to compute resources.
- **`witness`** — [`Witness`](../objects/witness.md) recording the resumption: session, resuming agent, reason if non-null, the resulting state hash.

## Operational semantics

`resume-session` SHALL proceed:

1. **Resumability check.** Read the session record from the substrate.
  Verify `state` is `paused` or `closing`.
  Verify the cited `closure-rule-system` version is still in the substrate's registry (sessions whose pinned rule-system version has been retired CANNOT resume — they would lose replay determinism).
  Verify the office's installation is still active (a session whose office has been retired cannot resume; the closure machinery would have no scope-bound rule system to apply).
  Failures produce a `guard` diagnostic; the resume is rejected.

2. **Agent re-binding (if substitution).** If `agent` is non-null and differs from `session.agent`: per the office's installation discipline, verify substitution is admissible.
  The substitution itself is a substrate edit — emit an `agent-substitution` event on the office's primary channel before continuing.
  The session's `agent` field is updated; the substitution event is part of the session's witness chain.

3. **Always-loaded re-render.** The session's `always-loaded` fiber MAY have changed since the session was paused (the office's fiber may have been edited; a closure rule may have fired on the office; new skills may have been added to the office's constructors).
  Re-compose the always-loaded from the current office and agent fibers.
  The new always-loaded MAY contain cells the old one did not; the session's working memory is updated with the new always-loaded content.

4. **State transition.** Per [`apply-edit`](apply-edit.md), edit the session record: `state: paused → active` (or `closing → active` for late resumption).
  The state-transition event is recorded.

5. **Resumed event.** Emit a `session-resumed` event on the session's primary channel with `subject: session`, `actor: agent`, `payload: {previous-state, always-loaded-hash, observation-cursor-position}`.

6. **Return.** Return the `(session, witness)` pair.
  The realization re-binds compute resources; the session is now active.

## Normative invariants

- **Substrate-state-driven.** Resumption SHALL be driven by the substrate's session record, not by runtime state.
  A realization that loses runtime state but has the substrate intact SHALL be able to resume the session.
- **Same-session-identity.** A resumed session is the same session entity.
  The session's name, opened-at, agent (modulo authorized substitution), office, scope, and pinned rule-system version SHALL be unchanged.
- **Witness-continuous.** The resumed session's witness chain SHALL be continuous with the pre-pause chain.
  The `session-resumed` event cites the prior `session-paused` (or `session-closing`) event by hash; replay reproduces the full lifecycle.
- **Rule-system-stable.** The session's pinned rule-system version SHALL NOT change at resumption.
  A session whose pinned version has been retired from the substrate cannot resume; the substrate's coherence guarantees fail.
- **Agent-substitution-witnessed.** If a resumed session's agent differs from the original, the substitution SHALL produce its own substrate event before the resume event.
  Silent agent-substitution is non-conformant.

## Failure modes

- **Session not in resumable state** (already `closed`, or `state: open` (never paused)).
  Resume is rejected with `guard` diagnostic.
- **Rule-system retired.** The cited rule-system version is no longer in the substrate's registry.
  Resume is rejected; the session is *stuck* at its paused state and can only be closed without further work.
- **Office retired.** The session's office is no longer installed.
  Per the resume-discipline, the session cannot resume under an unscoped or non-installed office.
  Either the office is re-installed (admin operation), the session is closed, or the substrate's repair catalog is invoked.
- **Agent substitution unauthorized.** The new agent is not admissible per the office's `bearer` predicate or the office's installation discipline.
  Resume is rejected.
- **Always-loaded $\top$ on re-compose.** The current office fiber and agent fiber compose to a contradicting always-loaded.
  Per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md), the substrate-visible contradiction MAY admit (under `force`) or block (default).

## Position

`resume-session` is what makes [session-as-entity](../../entity/session-as-entity/session-as-entity.md)'s "save/resume is explicit, not implicit" operational at FARS scale.
Sessions don't have to complete in one runtime; they don't have to fit one process's lifetime; they don't have to be re-created from scratch on continuation.
The substrate carries enough to resume; the morphism makes that resumption coherent.

The morphism composes with [`open-session`](open-session.md) (its open-counterpart), [`close-session`](close-session.md) (the alternative continuation), and the substrate's [`apply-edit`](apply-edit.md) and [`emit-event`](emit-event.md) for the lifecycle transitions.
