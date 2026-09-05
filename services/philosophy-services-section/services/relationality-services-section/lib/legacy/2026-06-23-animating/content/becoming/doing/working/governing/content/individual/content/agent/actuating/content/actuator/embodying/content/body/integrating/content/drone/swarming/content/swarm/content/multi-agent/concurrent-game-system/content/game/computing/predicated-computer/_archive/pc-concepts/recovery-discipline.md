---
type: concept
class: persistence-discipline
depends-on: [event-log, snapshot, snapshot-replay-fidelity, settlement-via-closure-2-monad, bootstrap-content, bootstrap-determinism, hash-injectivity-under-canonical-form, work-item, work-graph]
see-also: [backup-discipline, recovery-via-event-log-replay-determinism, two-store-coherence]
---

# Recovery discipline

The substrate's *restart-and-resume protocol* — the substrate operations that bring a substrate process back to operational state after termination (planned shutdown, crash, host restart, container reschedule). Where [backup-discipline](backup-discipline.md) covers off-site historical copies for disaster recovery, recovery covers the *normal-restart* path: the substrate's process dies and comes back, work-in-flight at the moment of death needs to be handled cleanly.

In the substrate's hyperdoctrine setting, recovery is *event-log replay to closure-fixed-point with explicit handling of in-flight transactions and dispatches*. Per [recovery-via-event-log-replay-determinism](../theorems/recovery-via-event-log-replay-determinism.md), the recovered substrate state is bytewise-deterministic — same event log, same closure-rule-system, same recovered state.

## Why this concept exists

PredComp has [snapshot](../objects/snapshot.md) (point-in-time substrate state cache), [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md) (replay produces byte-identical state), [event-log](../objects/event-log.md) (the authoritative source), [bootstrap-content](bootstrap-content.md) (initial substrate state), and [backup-discipline](backup-discipline.md) (disaster-recovery copies). What's missing is the *restart* discipline: when the process dies, what does the substrate do when it comes back?

Most production systems handle this with ad-hoc code (load DB connection, replay last events, hope the in-flight work is OK). The substrate's discipline is to make recovery a structurally-determined operation, with provable correctness per [recovery-via-event-log-replay-determinism](../theorems/recovery-via-event-log-replay-determinism.md).

## Recovery scenarios

The substrate's recovery discipline handles:

- **Clean shutdown** — the process received SIGTERM, finished in-flight work, wrote a final snapshot, exited. On restart, load the snapshot.
- **Crash** — the process died unexpectedly mid-operation. Snapshot may be stale; in-flight work was interrupted. Recovery must reconstruct correct state.
- **Host restart** — the entire host (VM, container, machine) restarted. Substrate process is fresh; snapshot and event-log persist on durable storage.
- **Migration** — the substrate process is being moved to a different host. Source host has the substrate's state; destination needs to receive and resume. (Effectively a clean shutdown + fresh start with state transfer.)

Each scenario uses the same recovery protocol; differences are at the start (what state was preserved) and end (whether the substrate continues from where it stopped or starts fresh).

## The recovery protocol

When a substrate process starts, it follows this protocol:

### Phase 1: Identify the substrate identity

Read the host-local identity-record (per [identity-key-custody](identity-key-custody.md)) to determine "which substrate is this?" If no identity-record exists, this is a *fresh substrate* — proceed to [bootstrap-content](bootstrap-content.md) instead of recovery.

### Phase 2: Load the most recent snapshot

Query the substrate-content store for the most recent valid [snapshot](../objects/snapshot.md). The snapshot's metadata declares the ordinal it captured.

If no snapshot exists (first run, or snapshots cleared), the recovery starts from event-ordinal 0.

### Phase 3: Verify snapshot integrity

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the snapshot's canonical-form hash is part of its metadata. Recompute the hash; if mismatch, the snapshot is corrupted — discard, fall through to event-log-only recovery.

Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), a valid snapshot replays byte-identically; per [backup-as-cohomology-preservation](../theorems/backup-as-cohomology-preservation.md), the snapshot preserves the substrate's cohomology classes.

### Phase 4: Replay events from snapshot ordinal forward

Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the substrate's settled state is the closure 2-monad's iteration on the seed (snapshot) plus all admitted events since. The recovery process:

1. Load the snapshot's canonical form into the working store.
2. Read events from the event-log starting at the snapshot's ordinal + 1.
3. For each event, apply admission per the substrate's discipline (verify signature, check accessibility, run closure rules).
4. Iterate until end of event-log.

Per [recovery-via-event-log-replay-determinism](../theorems/recovery-via-event-log-replay-determinism.md), this produces bytewise-identical state to the substrate's pre-termination state at the last event-log entry.

### Phase 5: Handle in-flight work

In-flight at termination time:
- **Pending transactions** — not yet committed. Per [transaction](transaction.md) and [transaction-atomicity-via-closure-idempotence](../theorems/transaction-atomicity-via-closure-idempotence.md), transactions are atomic — recovery either replays them to commit (if the commit-witness was admitted) or treats them as aborted (if no commit-witness was reached).
- **Pending dispatches** — work-items that were `dispatched` but didn't reach `completed` or `failed`. Recovery transitions them back to `feasible` for re-dispatch (idempotent per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md) — the same work-item gets the same id).
- **Pending settlement wavefronts** — closure-rule applications that started but didn't complete. Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the closure 2-monad's iteration is idempotent; resuming from where the wavefront left off (or restarting from the snapshot's ordinal) reaches the same fixed-point.

### Phase 6: Resume operation

Once recovery completes, the substrate is operational. Per [bootstrap-content](bootstrap-content.md)'s bootstrap-attestation-witness pattern, recovery emits a *recovery-attestation* witness:

```json
{
  "kind": "recovery-attestation",
  "substrate-id": "<substrate id>",
  "recovery-from-snapshot-ordinal": <ordinal>,
  "events-replayed": <count>,
  "in-flight-handled": {
    "transactions-committed": <count>,
    "transactions-aborted": <count>,
    "dispatches-resumed": <count>
  },
  "completion-time": "<ISO 8601 UTC>",
  "signature": {<substrate signature>}
}
```

Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the recovery-attestation is the audit-record that recovery occurred.

## Crash-time guarantees

For crash recovery to work cleanly:

- **The event-log's writes are durable before the operation considers itself complete.** Per [event-log](../objects/event-log.md), the write-discipline is fsync-style — the OS confirms the write reached durable storage before the substrate proceeds.
- **Snapshots are written atomically.** A snapshot is either fully on disk or not at all — no partial-snapshot states. Implementations use rename-after-write or similar.
- **Dispatch-state changes are event-log-recorded.** When a work-item transitions to `dispatched`, that transition is an event in the log. Per [recovery-via-event-log-replay-determinism](../theorems/recovery-via-event-log-replay-determinism.md), recovery sees the transition.

Per [two-store-coherence](two-store-coherence.md), the event-log is the durability source; the working store is reconstructible from it. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), snapshots accelerate recovery without compromising determinism.

## Cross-substrate recovery coordination

For multi-substrate federations, one substrate's recovery doesn't affect peers — per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), peers see the recovering substrate as $\bot$ (uninformed) during downtime, then back to whatever trust grade was previously established once it announces availability.

In-flight federation envelopes at the moment of crash:

- Envelopes the recovering substrate sent but didn't get acknowledgment for: peers may have received them. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), re-sending is idempotent (same envelope hash, peer deduplicates).
- Envelopes the recovering substrate received but didn't fully process: replayed via the event-log, processed normally.

## Recovery-time and SLO

Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), recovery time has a Lawvere-quantale cost = `(snapshot-load-time) + (events-since-snapshot × per-event-replay-cost) + (dispatch-resumption-time)`. The substrate's discipline is to:

- Snapshot frequently enough that `events-since-snapshot` stays bounded (e.g., snapshot every 10K events or every hour, whichever first).
- Per [scott-continuity-as-checkpointability](../theorems/scott-continuity-as-checkpointability.md), Scott-continuous-regime substrates can checkpoint at $\omega$-bounds; recovery doesn't have to replay arbitrarily-long streams.

## What the discipline rules out

- **Recovery that depends on host-side state.** A "recovered" substrate that requires reading non-substrate-content (config files, environment variables, host-local caches) for correctness is not really recovering — the recovered state isn't determined by the event-log. Per [recovery-via-event-log-replay-determinism](../theorems/recovery-via-event-log-replay-determinism.md), recovery is event-log-determined.
- **Skipping in-flight work.** A recovery that ignores work that was in-flight at crash time (treating it as completed without verification, or just dropping it) violates the substrate's atomicity disciplines. Per [transaction-atomicity-via-closure-idempotence](../theorems/transaction-atomicity-via-closure-idempotence.md), in-flight transactions must be either committed or aborted with witness.
- **Recovery without a recovery-attestation witness.** A recovery that doesn't produce a witness leaves the audit chain with a gap — auditors can't tell when (or whether) recovery happened. Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), recovery is a substrate operation, fully witnessed.
- **Resuming dispatches without checking idempotence.** A recovery that re-dispatches in-flight work without per-work-item idempotence may produce duplicate effects. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), work-items are content-addressed; the substrate's discipline is to use this for idempotent resumption.

## Position

Recovery is the substrate's *restart-resume primitive*, complementary to [backup-discipline](backup-discipline.md) (off-site historical copies) and [snapshot](../objects/snapshot.md) (point-in-time caches). Per [recovery-via-event-log-replay-determinism](../theorems/recovery-via-event-log-replay-determinism.md), the recovered state is structurally bytewise-determined by the event-log. Per [bootstrap-determinism](../theorems/bootstrap-determinism.md), the recovery-and-bootstrap chain is fully deterministic — a substrate process can be killed, started fresh on different hardware, and reach the same state by replaying its event-log.

The concept composes with [event-log](../objects/event-log.md), [snapshot](../objects/snapshot.md), [backup-discipline](backup-discipline.md), [transaction-atomicity-via-closure-idempotence](../theorems/transaction-atomicity-via-closure-idempotence.md), [bootstrap-content](bootstrap-content.md), [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), and [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md).
