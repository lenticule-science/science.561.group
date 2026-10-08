---
source: [session, reason, consolidate-now]
target: [session, witness]
name: close-session
description: "The morphism that closes a SessionRecord: given a session reference and a closure-reason, transition the session's lifecycle through active → closing → closed, finalize the session's working state, mark observations as candidates for cross-session consolidation, emit the session-closed event, and (optionally) trigger consolidation."
type: morphism
class: composed-operator
instantiates: [close-session]
depends-on: [session-record, three-tier-memory, apply-edit, emit-event, consolidate]
see-also: [open-session, resume-session, consolidate]
title: close-session
---


The morphism that closes a [`SessionRecord`](../objects/session-record.md): given a session reference and a closure-reason, transition the session's lifecycle through `active → closing → closed`, finalize the session's working state, mark observations as candidates for cross-session consolidation, emit the `session-closed` event, and (optionally) trigger consolidation.
After close, the session record is *immutable*; subsequent reads see the substrate-frozen state.

`close-session` is FARS's realization of AgOP's [close-session](../../../morphisms/close-session.md).
The morphism is what makes the session's lifecycle bounded — without it, sessions would either persist indefinitely as live runtime objects (violating [session-as-entity](../../entity/session-as-entity/session-as-entity.md)) or end implicitly when the runtime process dies (losing audit chain coherence).

## Signature

```
close-session(session; reason, consolidate-now) → (session, witness)
```

Inputs:

- **`session`** — reference to the [`SessionRecord`](../objects/session-record.md) to close.
  Must be in `open`, `active`, or `paused` state.
  Closing an already-`closed` session is a no-op (idempotent close); closing a session in `closing` is rejected (already mid-close).
- **`reason`** — closure reason (`completed`, `interrupted`, `escalated`, `failed`, `superseded`).
  Recorded in the closing event for audit.
- **`consolidate-now`** — boolean.
  If true, [`consolidate`](consolidate.md) is invoked immediately after close.
  If false (the default), consolidation is deferred to a subsequent batch run (typically by the heartbeat per [heartbeat-cycle](heartbeat-cycle.md)).

Outputs:

- **`session`** — the [`SessionRecord`](../objects/session-record.md) reference, with `state: closed` and `closed-at` populated.
- **`witness`** — [`Witness`](../objects/witness.md) recording the close: reason, working-state hash at close-time, observation-cursor at close-time, the resulting state hash.

## Operational semantics

`close-session` SHALL proceed:

1. **State check.** Read the session record.
  Verify `state` is `open`, `active`, or `paused`.
  If `closed`, return early (no-op).
  If `closing`, reject with `guard` diagnostic (concurrent close attempts).

2. **Transition to closing.** Per [`apply-edit`](apply-edit.md), edit the session record: `state: → closing`.
  Emit the state-transition event.
  The transition's payload includes the cited reason.

3. **Working-state finalization.** The session's `working-state` may contain content that should be promoted to durable substrate (a draft entity not yet committed, an in-progress edit) OR discarded (transient binding state for a runbook that didn't complete).
  Per the closure reason: `completed` triggers promotion; `interrupted` and `failed` typically discard (with the working state preserved in the event log for review); `escalated` and `superseded` may transfer working state to a successor session.

4. **Observation marking.** Mark the session's observation range (events from `opened-at` to `closing-at` on the `observation` channel) as *consolidation candidates*.
  The marking is a substrate event; it does NOT consolidate (that's [`consolidate`](consolidate.md)'s job), but it identifies the input range for the next consolidation pass.

5. **Transition to closed.** Per [`apply-edit`](apply-edit.md), edit the session record: `state: closing → closed`, populate `closed-at` with the current timestamp, populate `closure-reason`.
  Emit the state-transition event.

6. **Session-closed event.** Emit a `session-closed` event on the session's primary channel with `subject: session`, `actor: agent`, `payload: {reason, opened-at, closed-at, working-state-hash, observation-range, witness-chain-hash}`.
  This event marks the session as canonically over.

7. **Consolidate (if requested).** If `consolidate-now` is true, invoke [`consolidate`](consolidate.md) on the session's marked observation range.
  The consolidation produces instinct candidates per [consolidation-as-settlement](../../settlement/consolidation-as-settlement/consolidation-as-settlement.md).
  The consolidation's witness is appended to the session's witness chain.

## Normative invariants

- **Lifecycle-bounded.** A session that has been closed SHALL NOT transition out of `closed`.
  Closed sessions are immutable per [session-as-entity](../../entity/session-as-entity/session-as-entity.md).
- **Witness-emitted.** Every close SHALL emit a `session-closed` event.
  A session that "ends" without an emission has lost the substrate's audit chain.
- **State-finalized.** The session's working state at close-time SHALL be finalized — either committed to durable substrate or marked discarded with the discarded content preserved in the event log.
  Working state that disappears between close and replay is non-conformant.
- **Idempotent close.** Closing an already-`closed` session SHALL be a no-op returning the existing state.
  Subsequent close attempts produce no new events.
- **Reason-recorded.** The closure reason SHALL be in the session's record and in the `session-closed` event payload.
  Anonymous closures (no recorded reason) are non-conformant; the substrate's audit chain depends on knowing why each session ended.

## Failure modes

- **Session in `closing`.** Concurrent close attempts: reject the second close with `guard` diagnostic naming the in-flight close.
  The first close completes normally.
- **Working-state finalization failure.** A draft entity in working state can't be committed (per [`apply-edit`](apply-edit.md)'s validation).
  Per the closure reason: `completed` may downgrade to `interrupted` (the close completes, but the working state is preserved in the event log instead of promoted); `interrupted` admits the failure as part of normal closure.
- **Apply-edit failure on lifecycle transition.** The session record's edit fails (rare; per [`apply-edit`](apply-edit.md) failure modes).
  The close cannot complete; the session is stuck at `closing`.
  Repair catalog or manual operator action required.
- **Consolidation failure (if `consolidate-now`).** The consolidation run aborts.
  The session is closed; the consolidation is deferred to the next batch run.
  The session's `closed` state is unaffected.

## Position

`close-session` is the *bookend* to [`open-session`](open-session.md) (and continuation point for [`resume-session`](resume-session.md)).
Together, the three morphisms cover the session lifecycle in the substrate: born, possibly paused-and-resumed, eventually closed.
After close, the session enters the substrate's read-only history and can participate in cross-session analysis (via consolidation), federation (a peer substrate can examine the closed session), and audit (an investigator replays the session's events and verifies its outcome against its witness chain).

The morphism composes with [`apply-edit`](apply-edit.md), [`emit-event`](emit-event.md), [`consolidate`](consolidate.md), and the [`SessionRecord`](../objects/session-record.md)'s lifecycle predicates.
