---
type: morphism
class: agent-operator
realizes: [session]
depends-on: [session-record, memory-record, view-record]
see-also: [open-session, close-session]
title: Resume session
description: The operator that re-activates an interrupted session-record, reading the session's last-recorded state and producing an active session that can continue from where it left off.
---

# Resume session

The operator that re-activates an interrupted [session-record](../objects/session-record.md), reading the session's last-recorded state and producing an active session that can continue from where it left off.
Resume-session is what makes the [agent](teaching/explanations/agent.md) recover from interruption — the third condition of an [agentic system](../../../../artificial-intelligence/theories/agents/terms/agentic-system.md) that the substrate makes substrate-recordable.

## Signature

`resume-session(session) → (active-session-record, view-record, witness) | (rejection, witness)`

Inputs:

- **`session`** — reference to the [session-record](../objects/session-record.md) being resumed.
  Must be a session whose `ended-at` is absent (the session was never closed) but whose recent-activity is older than a declared resumability threshold (the session has been interrupted, not still-active).

Outputs:

- **`active-session-record`** — the session record with active state restored: an updated event-cursor (now pointing to the current event-log position), the view recomputed against current substrate state, the memory region's high-relevance records re-loaded.
- **`view-record`** — the recomputed [view-record](../../scope/view/view-record/view-record.md), reflecting the agent's authorization at the current substrate state (which may have changed since the session was interrupted).
- **`rejection`** — the session is not resumable: it was closed (use [open-session](open-session.md) for a new one), it has been retired, or its agent-record has been retired.
- **`witness`** — records the resume: session-id, the last-active-event-cursor, the new event-cursor, the resulting view, the substrate state at resume.

## Operational semantics

Resume-session proceeds in seven steps:

1. *Validate resumable.* Check that the session is not closed (`ended-at` absent), not retired, and the cited agent-record is still resident.
2. *Read prior state.* Read the session's last-recorded event-cursor and memory region.
  The event-cursor identifies which substrate events the session was last aware of.
3. *Compute substrate-delta.* Identify substrate events between the prior cursor and the current event-log position that are visible at the session's scope.
  These are events the session needs to "catch up on."
4. *Recompute view.* Construct a new [view-record](../../scope/view/view-record/view-record.md) by re-reading the agent's identity, the session's scope, the agent's current authorization (which may have changed via [enroll](../../office/enroll/enroll.md)/[revoke](../../governance/revoke/revoke.md) during the interruption), and any active mode.
  The view's available-operations and visible-entities reflect current state.
5. *Re-load memory.* The session's memory region is re-loaded: high-relevance recall records are re-promoted to active recall, the substrate's recency-update rule fires.
6. *Update session-record.* Insert an updated event-cursor predication; the session is now aware of the current substrate state.
7. *Witness emit.* Append the resume witness; subsequent operations in the session see the resumed state.

## Engineering invariants

- **Substrate-state-aware.** A resumed session sees the substrate as it currently is, not as it was at interruption.
  If the agent's authorization has been revoked during interruption, the resumed session reflects the revocation; if shapes have been edited, the resumed session uses the new shapes.
- **Memory-bounded.** The session's pre-interruption memory may be too large to fully re-load; the resume operation re-loads only high-relevance records, with the rest accessible by query if needed.
- **Witness-recorded.** Resume is a substrate event, witnessed.
  An audit can show "this session was resumed at this position from this prior state."
- **Idempotent on no-elapsed-state.** A resume on a session whose substrate-delta is empty (no substrate change since interruption) is a no-op-witness, the session continues without state recomputation.

## Failure modes

- **Session retired.** The session has been retired; resume is rejected.
  The agent must open a new session.
- **Agent retired.** The session's agent-record has been retired; resume is rejected.
  The session is effectively orphaned and may be force-closed by governance.
- **Authorization lost.** The agent's authorization to operate in the scope has been fully revoked during interruption; the resumed view shows no admissible operations.
  Resume succeeds technically (the witness is emitted), but the session can do nothing further until authorization is restored.

## Position in the platform

Resume-session is what makes interactive agent work resilient against interruption.
Without it, every interruption requires opening a new session, losing the memory region's content; with it, the agent picks up where it left off.
The discipline is what makes long-running multi-step work — runbook execution interrupted by network failure, agent attention temporarily diverted, scheduled tasks resumed at next heartbeat — substrate-coherent.
