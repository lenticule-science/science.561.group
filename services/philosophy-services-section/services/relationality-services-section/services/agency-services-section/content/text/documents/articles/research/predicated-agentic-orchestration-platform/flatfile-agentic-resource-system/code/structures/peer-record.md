---
name: peer-record
description: Peer record
type: definition
class: record
instantiates: [outpost-record, federation-graph]
depends-on: [sovereign-node, content-hash-addressing, identity-record, identity-key, federation-trust-bilattice-graded, fiber, witness]
see-also: [federation-envelope-record, merge-peer, admit-federation-envelope, bounded-vocabulary-handshake]
title: peer-record
---

# Peer record

The substrate-record holding one *federation peer* from this [sovereign node](../../architecture/sovereign-node/sovereign-node.md)'s perspective: the peer's identity, signing key, agreed bounded vocabulary, last-merged event ordinal, and trust-grade in the bilattice accessibility relation.
A `PeerRecord` is FARS's realization of the AgOP-level [outpost-record](../../../office/outpost/outpost-record/outpost-record.md) on the *remote-peer-side*; one entry in the [federation-graph](../../../agent/federation/federation-graph/federation-graph.md) corresponds to one `PeerRecord` at this node.

A `PeerRecord` is itself a substrate entity (per [agential self-generation](../../../agent/agential-self-generation/agential-self-generation.md) and [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md)): there is no out-of-band peer-table the federation discipline reads.
The peer's existence in this node's federation is *the existence of this `PeerRecord`*; revoking a peer is an edit on the record (or a retraction event); admitting a new peer is the creation of a new record.

## Required fields

Every conforming realization SHALL hold, for each `PeerRecord`:

### Identity

- **`peer-id`** — the canonical content-hash address (per [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md)) of the peer's [identity-record](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-record.md).
  Two nodes that admit the same peer (by content) record the same `peer-id`.
  The substrate-portable name of the peer.
- **`identity-record-cache`** — the content of the peer's identity-record at the time of admission (a fiber-shaped record carrying the peer's name, contact endpoints, signing-key, governance-claims).
  The cache is the locally-held copy of the peer's identity; refresh is per-peer policy.
- **`signing-key`** — the public key (or content-addressed reference) the peer uses to sign its outbound envelopes.
  Inbound envelopes' signatures (per [federation-envelope-record](federation-envelope-record.md)'s `signature.value`) SHALL verify against this key per [identity-key](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-key.md).
  Key rotation is recorded as a substrate edit; the prior key is retained for verifying historical envelopes.

### Agreed vocabulary

- **`agreed-vocabulary`** — list of predicate-ids (per [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md)) that this node admits from this peer per the most recent [bounded-vocabulary-handshake](../../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md).
  Empty when no handshake is recorded; an envelope from a peer with empty `agreed-vocabulary` is rejected at admission.
- **`vocabulary-mismatch-policy`** — one of `reject` / `bridge` / `quarantine` / `renegotiate`, declaring how this node responds when an inbound envelope cites a predicate outside `agreed-vocabulary`.
  Per [bounded-vocabulary-handshake](../../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md).
- **`last-handshake-witness-hash`** — content-hash of the witness recording the most recent vocabulary-handshake completion.
  Replay from genesis can rebuild the agreed-vocabulary by reading this witness.

### Federation state

- **`last-merged-ordinal`** — the highest sender-side event ordinal (per [federation-envelope-record](federation-envelope-record.md)'s `ordinal` field) this node has admitted from the peer.
  The next inbound envelope from the peer is expected to carry an ordinal greater than this; envelopes with ordinals less-than-or-equal are admissible per content-hash dedup but produce no new substrate state.
  Used by [`replay-from-peer`](../transformers/replay-from-peer.md) to request only new content.
- **`last-emitted-ordinal`** — the highest local-side event ordinal at which an outbound envelope was sent to this peer.
- **`pending-outbound`** — list of envelope content-hashes queued for delivery to this peer (when the peer is unreachable).
  Per [sovereign-node](../../architecture/sovereign-node/sovereign-node.md)'s partition tolerance, the queue lives on the local substrate and drains on peer reachability.

### Trust grade

- **`trust-grade`** — the bilattice value (per [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md)) recording this node's trust assessment of the peer.
  One of $\{\bot, t, f, \top\}$:
  - $t$ — peer admitted; envelopes accepted under the agreed vocabulary.
  - $f$ — peer rejected; all envelopes dropped at admission, recorded as `guard`-channel diagnostics.
  - $\bot$ — peer unknown; envelopes admitted only under explicit `unknown-peer-policy` (typically: quarantine).
  - $\top$ — peer contested; this node's governance has recorded conflicting decisions on the peer.
    Envelopes admitted with $\top$-cells in their provenance, surfacing the contestation downstream.
- **`trust-grade-witness-chain`** — content-hash references to the witnesses recording every change to `trust-grade`.
  The provenance of the current value.

### Transport binding

- **`transport-records`** — list of references to [transport-record](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/transport-record.md) entities declaring the addresses (HTTP URL, libp2p multiaddr, filesystem inbox path, etc.) this node uses to reach the peer.
  Per [transport-tolerance-of-federation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/transport-tolerance-of-federation.md), multiple transports per peer are admissible; the federation engine picks among them per local policy (latency, reliability, current network state).

## Invariants

- **Substrate entity.** A `PeerRecord` SHALL be a substrate entity.
  Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the federation discipline reads only substrate-resident peer records; an out-of-band peer table violates the discipline.
- **Hash-stable peer-id.** The `peer-id` SHALL be the canonical content-hash of the peer's identity-record.
  Two nodes with the same peer-id refer to the same peer; a peer whose identity-record changes (per content) is structurally a *different peer* — the prior peer-record is retained for replay; a new peer-record is created.
- **Signature-verifying.** Every inbound envelope claiming to be from this peer SHALL verify against this peer-record's `signing-key` (or a delegation chain rooted at it).
  Failed verification is a `guard`-channel diagnostic event; the envelope is not admitted.
- **Vocabulary-bounded.** Inbound envelopes citing predicates outside `agreed-vocabulary` are subject to `vocabulary-mismatch-policy`; the peer-record's policy is the load-bearing decision, not a global default.
- **Trust-grade-witnessed.** Every change to `trust-grade` SHALL emit a witness recorded in `trust-grade-witness-chain`.
  A trust-grade change without a witness is a substrate-invisible edit and SHALL be rejected.
- **Ordinal-monotonic.** `last-merged-ordinal` SHALL never decrease (per [event-sourcing](teaching/explanations/event-sourcing.md)'s append-only discipline).
  A peer that resends an envelope with an older ordinal is admissible (dedup'd by content-hash) but does not lower the recorded ordinal.

## What a `PeerRecord` is not

- **Not a session.** A `PeerRecord` persists across federation links; sessions are bounded interactions between this node and the peer (one connection, one delivery batch).
  A peer has many sessions over its lifetime; each session may be its own substrate entity if the realization carries [`SessionRecord`](session-record.md) for federation peers.
- **Not the peer's substrate.** A `PeerRecord` is *this node's record of the peer*.
  It does not contain the peer's full substrate content — only the metadata required to verify and admit the peer's envelopes.
  Content the peer has sent and this node has admitted is normal substrate content, indexed by entity address, not stored under the peer-record.
- **Not a connection.** Network-level connections (TCP sockets, HTTP keep-alives, WebSocket sessions) are transport state, not substrate state.
  The peer-record carries `transport-records` declaring how to *reach* the peer; the actual connection lifecycle is below the substrate.
- **Not the peer's outpost record.** AgOP's [outpost-record](../../../office/outpost/outpost-record/outpost-record.md) describes an outpost from its *own* perspective (its inbox, its emit-policies, its routing rules).
  A `PeerRecord` describes another node's outpost from *this* node's perspective.
  The two are dual; a federation link involves both — this node's outpost-record (declaring its capacity to receive) and a peer-record (declaring this node's view of the remote peer).

## Position

`PeerRecord` is FARS's *one-entity-per-peer* substrate record.
Every federation envelope that arrives at this node is matched against a peer-record at admission ([`admit-federation-envelope`](../transformers/admit-federation-envelope.md)); every envelope this node emits is addressed to a peer-record.
The federation-graph (per AgOP's [federation-graph](../../../agent/federation/federation-graph/federation-graph.md)) is the typed projection of all this node's peer-records — its nodes are this node and the peers, its edges are this node's peer-records.

The record composes with [`OutpostRecord`](../../../office/outpost/outpost-record/outpost-record.md) (this node's own receiving capacity), with [federation-envelope-record](federation-envelope-record.md) (the unit of traffic between this node and the peer), with [identity-record](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-record.md) (the peer's identity, content-hash-cited from peer-id), with [transport-record](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/transport-record.md) (the carrier addresses for envelopes), and with [`Witness`](witness.md) (every change to trust-grade or agreed-vocabulary emits one).
