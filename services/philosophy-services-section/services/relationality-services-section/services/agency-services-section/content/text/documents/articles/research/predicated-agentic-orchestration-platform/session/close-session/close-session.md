---
type: morphism
class: agent-operator
realizes: [session]
depends-on: [session-record, memory-record]
see-also: [open-session, resume-session]
title: Close session
description: The operator that ends an agent's session-record, finalizes its content, and transitions it from active to closed.
---

# Close session

The operator that ends an [agent](teaching/explanations/agent.md)'s [session-record](../objects/session-record.md), finalizes its content, and transitions it from active to closed.
Close-session is the substrate-level end-of-interaction primitive.

## Signature

`close-session(session, reason) → (closed-session-record, witness)`

Inputs:

- **`session`** — reference to the [session-record](../objects/session-record.md) being closed.
- **`reason`** — predications declaring why the session is being closed: agent-initiated, work-completed, runbook-finished, timeout, governance-mandated, error.

Outputs:

- **`closed-session-record`** — the session-record with `ended-at` set; subsequent reads of the session see the closed state.
- **`witness`** — records the close: session-id, ended-at, reason, the session's accumulated witness chain.

## Operational semantics

Close-session proceeds in six steps:

1. *Validate session is open.* Check that the session's `ended-at` is absent.
  Closing an already-closed session is a substrate violation; the operation rejects.
2. *Run pre-close skills.* Any closure rules associated with session-close fire: cleanup behaviors, pending-work-flush, summary-emission, audit-record-creation.
  Per the substrate's discipline, pre-close work is itself substrate operations, witnessed.
3. *Compact memory.* Per [memory-record](../../memory/memory-record/memory-record.md) compaction discipline, the session's memory region is processed: low-relevance recall records are retired; high-relevance records are summarized into a smaller canonical form for cross-session retention.
  The compaction's witness cites both originals and summaries.
4. *Finalize witness chain.* The session-record's `witness-chain` derived view is materialized as a final witness predication, content-addressed for cross-session reference.
5. *Set ended-at.* Insert the `ended-at` predication on the session-record.
  Per the substrate's append-only discipline, this is a substrate event.
6. *Witness emit.* Append the close-session witness to the [event log](../../../objects/event-log.md).

## Engineering invariants

- **Idempotent on already-closed sessions.** A close-session called on a session whose `ended-at` is already set is a no-op-witness (recorded but not state-changing).
  The substrate's discipline is that double-closes are visible but harmless.
- **Memory compaction is part of close.** Per the substrate's resource discipline, sessions that don't compact at close accumulate memory regions indefinitely.
  The compaction is a substrate operation, witnessed.
- **Closed session is read-only.** After close, the session-record admits no new predications.
  Operations that would write to a closed session abort; the rejection is witnessed.
- **Witness-chain canonicalized.** The final witness chain is content-hashed; the hash becomes the session's canonical reference for cross-session and federation purposes.

## Failure modes

- **Pre-close skills fail.** A pre-close skill aborts (e.g., a pending-work-flush cannot complete because the target inbox is unavailable).
  The substrate's policy: either the close proceeds with the failure recorded in the witness, or the close is paused pending resolution.
  Per session-close-policy declarations.
- **Memory compaction fails.** The compaction operator cannot reduce the memory region without losing required content; the close proceeds without compaction; the session retains its full memory for later post-process.

## Position in the platform

Close-session is the substrate-level *end-of-interaction artifact-finalization*.
Without it, sessions accumulate without cleanup, the substrate's resource use grows monotonically, and the audit's "what did this session do?" question requires inferring the end from absence-of-recent-activity.
With it, every session has a definite end, a finalized witness chain, a compacted memory region, and a canonical hash for cross-session reference.
