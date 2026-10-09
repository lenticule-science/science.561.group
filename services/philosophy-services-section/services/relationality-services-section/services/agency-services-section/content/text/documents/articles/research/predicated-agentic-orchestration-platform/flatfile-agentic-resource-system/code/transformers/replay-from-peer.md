---
source: [peer-record, from-ordinal?, to-ordinal?]
target: [replay-result, witness]
name: replay-from-peer
description: "The morphism that requests, admits, and merges a contiguous range of federation envelopes from a peer — typically every envelope from peer-record.last-merged-ordinal + 1 through the peer's current head, in order."
type: morphism
class: composed-operator
depends-on: [peer-record, federation-envelope-record, admit-federation-envelope, merge-peer, event-sourcing, witness, federation-convergence]
see-also: [emit-federation-envelope, merge-peer]
title: replay-from-peer
---


The morphism that requests, admits, and merges a contiguous range of [federation envelopes](../objects/federation-envelope-record.md) from a [peer](../structures/peer-record.md) — typically every envelope from `peer-record.last-merged-ordinal + 1` through the peer's current head, in order.
`replay-from-peer` is the FARS realization of the parent-theory's *catch-up after partition* discipline: when this node has been disconnected from a peer (network partition, scheduled downtime, fresh node-pair federation initialization), the morphism brings the local substrate up to consistency with what the peer's substrate has emitted to this peer's address.

The morphism is a composition over existing primitives — it does not introduce new substrate semantics.
Per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), admitting a peer's envelopes in any order produces the same final state as admitting them in the sender-emit order; per [event-sourcing](teaching/explanations/event-sourcing.md), replay is deterministic; per [`admit-federation-envelope`](admit-federation-envelope.md)'s deduplication, replaying envelopes already admitted is a no-op on substrate state.

## Signature

```
replay-from-peer(peer-record, from-ordinal?, to-ordinal?) → (replay-result, witness)
```

Inputs:

- **`peer-record`** — the [`PeerRecord`](../structures/peer-record.md) of the peer to replay from.
- **`from-ordinal`** (optional) — the ordinal to start from.
  Defaults to `peer-record.last-merged-ordinal + 1` (the first not-yet-admitted envelope from this peer).
- **`to-ordinal`** (optional) — the ordinal to stop at (inclusive).
  Defaults to the peer's current head ordinal as reported by the peer's response to a `request-replay-range` envelope.

Outputs:

- **`replay-result`** — a structure recording: the count of envelopes admitted, the count deduplicated, the count rejected (with reasons), the count quarantined, the final `peer-record.last-merged-ordinal`, and the substrate's pre/post fiber-state hash for each affected entity.
- **`witness`** — the composite [`Witness`](../objects/witness.md) for the replay.
  The witness chain includes one admission witness per envelope and one merge witness per `cells` envelope; the composite witness is the audit-chain a downstream operator can cite when tracing how the local substrate caught up to the peer's state.

## Operational semantics

`replay-from-peer` SHALL proceed:

1. **Determine range.** If `from-ordinal` is unspecified, set it to `peer-record.last-merged-ordinal + 1`.
  If `to-ordinal` is unspecified, emit a `request-replay-range` envelope to the peer (a `payload.kind: request-replay-range` envelope with the requested `from-ordinal`); the peer's response carries its current head ordinal for this address.
  Set `to-ordinal` accordingly.
2. **Request envelope range.** Emit a `request-envelope-range` envelope to the peer specifying `[from-ordinal, to-ordinal]`.
  Per [transport-tolerance-of-federation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/transport-tolerance-of-federation.md), the request and response may flow over any transport; the peer's response is one or more `envelope-batch` envelopes carrying the requested range's envelopes.
3. **Per envelope in the response, in ordinal order:**
   1. Invoke [`admit-federation-envelope`](admit-federation-envelope.md) with the envelope's bytes.
   2. Record the admission outcome in the per-envelope counters.
     For `admitted` outcomes on `cells` envelopes, [`merge-peer`](merge-peer.md) was invoked as part of admission; the merge outcome is also recorded.
   3. If the admission outcome is `rejected` for a fatal reason (signature invalid, hash mismatch), emit a `replay-aborted-due-to-fatal-rejection` event citing the failing envelope's claimed ordinal and the reason; halt the replay.
     Per [sovereign-node](../../architecture/sovereign-node/sovereign-node.md)'s authority discipline, fatal rejections during replay are surfaced for governance review rather than silently skipped.
   4. If the admission outcome is `rejected` for a recoverable reason (peer's signing key has rotated and the new key is not yet recorded; vocabulary mismatch), emit a `replay-recoverable-rejection` event and continue with the next envelope.
     The follow-up actions (record the new key, run a vocabulary handshake) are governance-decided per [governance-decision-modal-decidability](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md).
4. **Update peer-record.** Set `peer-record.last-merged-ordinal := max(peer-record.last-merged-ordinal, highest-admitted-ordinal-in-range)`.
  Per [`apply-edit`](apply-edit.md), this is its own substrate edit.
5. **Emit replay event.** Call [`emit-event`](emit-event.md) with an event of `action: replay-from-peer`, `subject: peer-record.peer-id`, `actor: <local-federation-engine-agent-id>`, `channel: federation`, `origin: replay-from-peer-operator`, `payload: replay-result`.
  The replay event records the catch-up as a single substrate event for the audit log; the per-envelope events recorded during admission carry the per-envelope detail.
6. **Return.** The replay-result and witness are returned to the caller.
  Per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), the local substrate is now at-or-beyond the state the peer's emitted envelopes through `to-ordinal` have committed to.

## Normative invariants

- **Idempotent.** `replay-from-peer` over the same range twice produces no further substrate state change after the first run.
  Per [`admit-federation-envelope`](admit-federation-envelope.md)'s deduplication and [`merge-peer`](merge-peer.md)'s idempotence, the second run dedup's every envelope.
- **Ordinal-monotonic.** `peer-record.last-merged-ordinal` is non-decreasing across replays.
  A replay of a range ending at an ordinal less-than-or-equal to the current `last-merged-ordinal` is a no-op on the peer-record.
- **Convergence-yielding.** After successful replay through `to-ordinal`, the local substrate's state for all entities the peer's envelopes asserted on is *at-least-as-informed* as the peer's substrate's state for the same entities at the peer's `to-ordinal` snapshot.
  Per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), this is the substrate-level guarantee the parent theorem makes; `replay-from-peer` is the operator that realizes it for missed envelopes.
- **Halt on fatal rejection.** A signature-invalid or hash-mismatch envelope mid-range halts the replay rather than skipping forward.
  The half-done replay is recorded with `replay-aborted` event; resumption is governance-decided.
- **Witness-emitting.** Every replay emits a composite witness whose chain leads back to every admitted envelope's sender-witness, providing an end-to-end audit chain.

## Failure modes

- **Peer unreachable.** The transport cannot deliver the `request-envelope-range` envelope.
  The replay aborts with `peer-unreachable`; the operator returns no admissions and the substrate is unchanged.
  Retry is the caller's responsibility.
- **Peer responds with non-monotonic ordinals.** The peer's response carries envelopes whose ordinals are not in strict monotonic sequence (gaps; duplicates with different content).
  Per [federation-envelope-record](../objects/federation-envelope-record.md)'s ordinal discipline, this is a peer-side coherence violation; the replay halts with `peer-coherence-violation` and emits a `peer-trust-grade-degradation` event suggesting governance review of the peer-record's `trust-grade`.
- **Local substrate write-failure mid-replay.** A filesystem write fails partway through the range.
  Each envelope's reification is atomic per `admit-federation-envelope`; partial replays leave coherent substrate state.
  The replay aborts with the local error; the caller may resume from `peer-record.last-merged-ordinal + 1` once the local condition clears.
- **Vocabulary drift mid-range.** The peer's envelopes mid-range carry predicates outside the agreed vocabulary.
  Per the vocabulary-mismatch-policy, individual envelopes may be quarantined; the replay continues.
  The quarantined envelopes are admissible later (after a vocabulary renegotiation) without re-running the full replay.

## What `replay-from-peer` is not

- **Not a state-transfer operation.** The morphism does not transfer the peer's full substrate state.
  It transfers a contiguous range of *envelopes* the peer has sent to this address.
  The local substrate's resulting state is determined by the receiver's settle, not by the sender's state.
- **Not a snapshot mechanism.** The morphism replays envelopes from the event log; it does not transfer or apply substrate snapshots.
  Snapshot-based catch-up is a separate (much heavier) operation that may be a follow-up morphism if the envelope-range proves impractically large.
- **Not transactional across envelopes.** Each envelope's admission is its own substrate transaction.
  A replay that admits 100 envelopes successfully and then fails on the 101st leaves the substrate in a state with 100 admissions reflected; it does not roll back.
- **Not a peer-pull.** The morphism *does* request a range from the peer (the peer's cooperation is required), but the substrate semantics are the same as if the envelopes had arrived organically through normal `admit-federation-envelope` calls.
  The "replay" framing is from the *receiver's* perspective: the receiver is replaying the peer's envelope log into its own substrate.

## Position

`replay-from-peer` is the *catch-up* primitive of FARS federation.
It is invoked when a partition heals (the local node detects the peer is reachable again and `last-merged-ordinal < peer-head`), when a fresh peer-record is added (initial sync), or when governance directs a replay (e.g., to incorporate envelopes that were quarantined and have now been admissibility-cleared).

The morphism composes with [`admit-federation-envelope`](admit-federation-envelope.md) (which it invokes per envelope), with [`merge-peer`](merge-peer.md) (transitively via admission for `cells` envelopes), with [`emit-federation-envelope`](emit-federation-envelope.md) (for the request envelopes it sends), with [peer-record](../structures/peer-record.md) (which it updates), and with [event-sourcing](teaching/explanations/event-sourcing.md) (every step is in the local event log).
