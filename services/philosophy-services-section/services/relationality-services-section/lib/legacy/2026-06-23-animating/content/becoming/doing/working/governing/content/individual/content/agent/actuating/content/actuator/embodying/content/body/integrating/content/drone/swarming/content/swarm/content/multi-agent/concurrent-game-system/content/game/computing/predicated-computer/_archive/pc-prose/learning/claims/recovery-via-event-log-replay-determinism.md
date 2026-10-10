---
type: theorem
class: engineering-claim
status: proved
depends-on: [recovery-discipline, event-log, snapshot, snapshot-replay-fidelity, settlement-determinism, settlement-via-closure-2-monad, hash-injectivity-under-canonical-form, bootstrap-determinism, transaction-atomicity-via-closure-idempotence, substrate-runtime-as-closure-driven-settling]
see-also: [modal-restriction-as-substrate-authorization-primitive, two-store-coherence]
---

# Substrate recovery is bytewise-deterministic event-log replay

**Claim.** For any substrate process restart following the [recovery-discipline](teaching/explanations/recovery-discipline.md) protocol, the recovered substrate state is *bytewise-identical* to the substrate's pre-termination state at the last fully-admitted event in the event-log. Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md) the snapshot replays bytewise; per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md) the closure 2-monad iteration is deterministic; per [bootstrap-determinism](bootstrap-determinism.md) the bootstrap-and-replay chain is fully deterministic; per [substrate-runtime-as-closure-driven-settling](substrate-runtime-as-closure-driven-settling.md) the runtime is one closure 2-monad iteration covering all sub-fibrations. Composing these: recovery is structurally deterministic on the entire substrate runtime — content state, transaction state, scheduling state, federation state, recovered together bytewise.

## Why this holds

Per [recovery-discipline](teaching/explanations/recovery-discipline.md), the recovery protocol is:

1. Load the most recent valid snapshot.
2. Replay events from snapshot ordinal forward to event-log tail.
3. Handle in-flight work per [transaction-atomicity-via-closure-idempotence](transaction-atomicity-via-closure-idempotence.md) and the resumption discipline.
4. Emit recovery-attestation witness.

Each step is structurally deterministic:

**Step 1: Snapshot loading is byte-identical.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), a valid snapshot loads to byte-identical substrate-content state. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the snapshot's canonical-form hash uniquely identifies the loaded state.

**Step 2: Event replay is deterministic.** Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the closure 2-monad iteration is a function of `(seed, event-log, closure-rule-system)`. Per [settlement-determinism](settlement-determinism.md), same inputs produce same outputs. Per [bootstrap-determinism](bootstrap-determinism.md), the same event-log replayed under the same closure-rule-system produces the same settled state regardless of host.

For each event $e_i$ in the log past the snapshot:
- Verify $e_i$'s signature per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md).
- Check accessibility per [trust-boundary-modal-validity](trust-boundary-modal-validity.md).
- Apply admission to the working state via the substrate's closure rules.
- Update working state to the new closure-fixed-point.

Per the closure 2-monad's lax-idempotence, the iteration converges; per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), the iteration is $\leq_k$-monotone. The recovered state is byte-identical across hosts.

**Step 3: In-flight work handling is deterministic.** Per [transaction-atomicity-via-closure-idempotence](transaction-atomicity-via-closure-idempotence.md), a transaction's commit-witness is in the event-log iff the transaction committed; a transaction without commit-witness is structurally aborted on recovery. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), in-flight work-items get the same hash on resumption — re-dispatch is idempotent.

**Step 4: Recovery-attestation witness is deterministic.** Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the attestation's canonical-form hash is a function of its content (substrate-id, recovered-from-snapshot, events-replayed, etc.) — same content, same hash.

Combining all four steps: the recovered substrate's full state — content, transactions, scheduling, federation — is bytewise-identical to the substrate's state at its last pre-termination event. Per [substrate-runtime-as-closure-driven-settling](substrate-runtime-as-closure-driven-settling.md), this covers the entire runtime, not just the content layer.

## Engineering consequence

- **Cross-host recovery reproducibility.** A substrate's event-log distributed to a fresh host produces a functionally-identical substrate after recovery. The substrate's audit, federation, and conformance properties hold across hosts from the moment of recovery completion.
- **Recovery from any historical point.** The substrate can replay from any past ordinal (not just the most recent snapshot) to reach a past state. Per the theorem, the past state is bytewise reproducible — useful for debugging, forensic analysis, time-travel queries.
- **Snapshot frequency tunes recovery time without affecting correctness.** Per [scott-continuity-as-checkpointability](scott-continuity-as-checkpointability.md), snapshots can be taken at $\omega$-bounds; the substrate's discipline is to take them frequently enough that recovery time stays bounded. The choice of snapshot frequency doesn't affect *what* the recovered state is, only *how fast* recovery completes.
- **Federation peers can audit recovery.** Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), federation peers see the recovering substrate as $\bot$ during downtime, then verify the recovery-attestation witness when the substrate returns. Per the theorem, peers can independently verify the substrate replayed its event-log correctly.
- **Recovery is testable.** A conformance test can compare a recovered substrate's state hash to an expected hash (computed from the same event-log under the same closure-rule-system). Per the theorem, equality is the correctness criterion.

## What the theorem rules out

- **Recovery that depends on host-side state.** A recovery that requires reading non-substrate-content (config files, environment variables, host-local caches, system time) for correctness produces non-deterministic results. Per the theorem, recovery is event-log-determined; non-event-log inputs are non-conformant.
- **Recovery with hidden runtime initialization.** A substrate that initializes runtime state (worker pools, network connections, agent contexts) in non-deterministic order during recovery violates the substrate's settlement-determinism. Per the theorem, all runtime state is closure-rule-derived from substrate content, not initialized ad-hoc.
- **Recovery that diverges from pre-termination state.** A substrate whose recovered state differs from its pre-termination state (modulo the corrected handling of in-flight work per [transaction-atomicity-via-closure-idempotence](transaction-atomicity-via-closure-idempotence.md)) is non-conformant. Per the theorem, the only legitimate divergence is in-flight transactions that lacked a commit-witness — those abort on recovery.
- **Recovery without attestation.** A recovery that doesn't emit a recovery-attestation witness leaves the audit chain with a gap. Per [witness-chain-as-proof-object](witness-chain-as-proof-object.md), the audit chain must be complete.

## What the theorem requires

- The recovery follows the [recovery-discipline](teaching/explanations/recovery-discipline.md) protocol.
- The substrate implements the closure 2-monad correctly per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md).
- The event-log is durable (per [event-log](../objects/event-log.md), writes are fsync'd before considered complete).
- Snapshots are atomically written (write-then-rename or equivalent).
- The substrate's value-domain, canonical-form, hash discipline, and bootstrap content match across the original and recovering substrate (typically same identity, same closure-rule-system version).

## Position

This theorem completes the substrate's *deterministic-runtime trilogy*:

- [bootstrap-determinism](bootstrap-determinism.md) — fresh-substrate bootstrap is deterministic.
- [settlement-determinism](settlement-determinism.md) — operating-substrate settlement is deterministic.
- This theorem — substrate-restart recovery is deterministic.

Together with [substrate-runtime-as-closure-driven-settling](substrate-runtime-as-closure-driven-settling.md) (the runtime is one closure 2-monad iteration), the substrate's full lifecycle — bootstrap → operate → terminate → recover → operate → ... — is structurally deterministic at every stage. A substrate's full state at any ordinal is provably reproducible from its event-log and closure-rule-system, regardless of when, where, or how many times it's been restarted.

This is the substrate's structural answer to "the system that you can kill and bring back without losing anything important" — where "without losing anything important" is interpreted strictly: the recovered state is *bytewise-identical*, not merely "approximately equivalent." The substrate's structural disciplines compose to make this not a hopeful claim but a theorem.
