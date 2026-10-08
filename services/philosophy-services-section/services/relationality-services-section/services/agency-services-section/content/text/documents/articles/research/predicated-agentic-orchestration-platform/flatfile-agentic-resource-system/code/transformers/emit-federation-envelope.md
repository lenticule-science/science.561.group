---
source: [peer-record, payload-spec]
target: [envelope, witness]
name: emit-federation-envelope
description: "The morphism that constructs and signs a FederationEnvelopeRecord for outbound delivery to a peer, reifies the envelope into the local substrate, and emits the corresponding federation-envelope-emitted event."
type: morphism
class: operator
instantiates: [send-message, reification]
depends-on: [federation-envelope-record, peer-record, signature, witness, emit-event, canonical-form, algebra-as-protocol]
see-also: [admit-federation-envelope, merge-peer, replay-from-peer]
title: emit-federation-envelope
---


The morphism that constructs and signs a [`FederationEnvelopeRecord`](../objects/federation-envelope-record.md) for outbound delivery to a [peer](../structures/peer-record.md), reifies the envelope into the local substrate, and emits the corresponding `federation-envelope-emitted` event.
`emit-federation-envelope` is FARS's instantiation of the parent-theory [send-message](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/send-message.md) operator at the federation boundary; per [reification](../../../../teaching/explanations/reification.md), the outbound envelope is a substrate entity at the sender *before* it is dispatched onto any transport.

The morphism's job is to produce a wire-ready envelope whose admission at the peer is well-defined per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md): the envelope carries algebra-as-payload (operator + operand-content-hashes + cells), the sender's signature, and the witness chain rooted at the local substrate state from which the cells were extracted.

## Signature

```
emit-federation-envelope(peer-record, payload-spec) → (envelope, witness)
```

Inputs:

- **`peer-record`** — the [`PeerRecord`](../structures/peer-record.md) of the recipient peer.
  The peer-record's `agreed-vocabulary`, `signing-key`, and `last-emitted-ordinal` are read; the peer-record itself may be edited (to advance `last-emitted-ordinal`) as a side-effect.
- **`payload-spec`** — a structure declaring what the envelope SHALL carry: the `kind` (one of the kinds per [federation-envelope-record](../objects/federation-envelope-record.md)'s `payload.kind`), and the kind-specific contents.
  For `cells` envelopes: the local entity-addresses or fiber-hashes whose content to extract, plus the operator-name to record.
  For `vocabulary-manifest` / `vocabulary-agreement`: per [bounded-vocabulary-handshake](../../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md).
  For `request-operand` / `operand-response` / `retraction`: the kind-specific payload.

Outputs:

- **`envelope`** — the constructed `FederationEnvelopeRecord`, signed and ready for transport.
  The caller hands the envelope's bytes to the realization's transport layer; the envelope itself is now in the local substrate at `<root>/.fars/federation/outbound/<to-peer-id>/<envelope-id>.json`.
- **`witness`** — the [`Witness`](../objects/witness.md) for the emission.
  The witness's `output_hash` is the `envelope-id`; the witness's `input_hashes` cite the substrate state the cells were extracted from (and the upstream witnesses for the cells if they were derived by a prior settle).

## Operational semantics

`emit-federation-envelope` SHALL proceed:

1. **Vocabulary check.** For `payload.kind: cells`, verify every cell's predicate is in `peer-record.agreed-vocabulary`.
  If not, abort with a `vocabulary-mismatch-on-emit` diagnostic (the sender's discipline is symmetric to the receiver's; emitting predicates outside the agreed vocabulary would invite the peer's `reject` policy).
  For handshake kinds, this check is skipped.
2. **Extract cells.** For `cells` envelopes, read the local fiber for each named entity per [`load`](load.md) and [`interpret`](interpret.md), then project to the cells the payload-spec names.
  Compute each cell's content-hash provenance — the hash of the source [`Note`](../objects/note.md) (or fiber, for derived cells) the cell was extracted from.
  Record `payload.operand-content-hashes` as the set of hashes the receiver would need to re-derive these cells locally.
3. **Build payload.** Serialize the payload per its kind into canonical-JSON (per [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md)'s canonicalization).
  Include `payload.operator`, `payload.rule-system-version` (the receiver's audit will cite this when admitting), and the cell array (or kind-specific content).
4. **Assign ordinal.** Set `envelope.ordinal := peer-record.last-emitted-ordinal + 1`.
  Per [federation-envelope-record](../objects/federation-envelope-record.md)'s ordinal discipline, ordinals are monotonic per `(from-peer-id, to-peer-id)` pair.
5. **Compute envelope-id.** Compute the canonical content-hash over the canonical-JSON of the envelope's bytes-excluding-the-id-and-signature.
  Per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), this hash is byte-stable across conformant FARS realizations.
6. **Sign.** Compute `signature.value` over the canonical-JSON bytes (excluding the signature itself) under the local sovereign node's [identity-key](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-key.md).
  Record `signature.key-id` (the content-hash of the signing key) and `signature.scheme`.
7. **Reify into the substrate.** Write the envelope's canonical-JSON to `<root>/.fars/federation/outbound/<to-peer-id>/<envelope-id>.json`.
  Per [event-sourcing](teaching/explanations/event-sourcing.md)'s file-first discipline, the file write precedes the event emission.
8. **Construct witness.** Build the [`Witness`](../objects/witness.md) with `operator: "emit-federation-envelope"`, `input_hashes` citing each operand's content-hash and the local substrate's hash, `output_hash` set to the envelope's `envelope-id`, `rule_system_version` recording the local rule-system version active at emission, and the timestamp.
9. **Emit event.** Call [`emit-event`](emit-event.md) with an event of `action: federation-envelope-emitted`, `subject: peer-record.peer-id`, `actor: <local-federation-engine-agent-id>`, `channel: federation`, `origin: emit-federation-envelope-operator`, `payload: {envelope-id, ordinal, payload-kind, sender-witness-hash}`.
  The witness from `emit-event` and the witness from this operator together form the audit chain.
10. **Update peer-record.** Set `peer-record.last-emitted-ordinal := envelope.ordinal`.
  Per [`apply-edit`](apply-edit.md), this is its own substrate edit emitting its own event.
11. **Queue (if peer unreachable).** If the peer's transport-record's reachability is currently $f$ (peer offline), append `envelope-id` to `peer-record.pending-outbound`.
  Per [sovereign-node](../../architecture/sovereign-node/sovereign-node.md)'s partition-tolerance, queued envelopes drain on peer reachability without retransmission penalty.
12. **Hand off to transport.** Pass the envelope's bytes to the realization's transport layer.
  The transport's success or failure is *not* part of `emit-federation-envelope`'s contract; the envelope is now substrate state regardless of whether the transport delivered.

## Normative invariants

- **Atomic substrate-write.** The envelope SHALL appear in the substrate atomically: a partially-written envelope is detected on next read by re-hashing and rejected.
  Realizations using a temp-write-then-rename pattern satisfy this discipline.
- **Hash-stable.** Two `emit-federation-envelope` calls with byte-equivalent payload-specs against the same peer-record (at the same ordinal) SHALL produce envelopes with identical `envelope-id`s.
  Per [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md), this is what makes envelope deduplication at the receiver well-defined.
- **Signature-binding.** The signature SHALL bind the envelope's bytes to the local sovereign node's identity.
  Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), the receiver's verification of this signature against the peer-record's `signing-key` is the warrant for admitting the envelope as authentically-from-this-sender.
- **Vocabulary-respecting.** A `cells` envelope SHALL NOT carry predicates outside the peer-record's `agreed-vocabulary`.
  Sending unagreed predicates is a discipline violation per [bounded-vocabulary-handshake](../../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md).
- **Witness-emitting.** Every emission SHALL produce a `Witness` whose chain leads back to the substrate state from which the cells were extracted.
  The witness is what the receiver's `admit-federation-envelope` cites in its admission witness.
- **Event-emitting.** Every emission SHALL append a `federation-envelope-emitted` event.
  Per [event-sourcing](teaching/explanations/event-sourcing.md), federation traffic that is not in the local event log is substrate-invisible.

## Failure modes

- **Vocabulary mismatch.** Aborts as above with `vocabulary-mismatch-on-emit`.
  The substrate is unchanged; no envelope is created.
- **Identity-key unavailable.** The sovereign node's signing key is not accessible (key-store permissions, key-rotation in progress).
  Abort with `signing-key-unavailable`; surface as a `guard`-channel diagnostic.
- **Filesystem write failure.** The envelope file cannot be written.
  Abort; the substrate is unchanged.
  (The temp-write-then-rename pattern ensures no partial file is observed.)
- **Operand-extraction failure.** A cited entity-address has no fiber (deleted between payload-spec construction and extraction).
  Abort with `operand-not-found`; surface as a `guard`-channel diagnostic.
- **Ordinal collision.** Concurrent emissions to the same peer race for the same ordinal.
  Realizations SHALL serialize ordinal-assignment per peer-record (a per-peer mutex or equivalent); a detected collision is a coherence-violation diagnostic.

## What `emit-federation-envelope` is not

- **Not a transport-layer send.** The morphism produces a substrate-resident envelope and an event; how the envelope's bytes traverse the network is below the substrate.
  Per [transport-tolerance-of-federation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/transport-tolerance-of-federation.md), the carrier is interchangeable.
- **Not a guarantee of delivery.** The envelope is in the substrate after emission; it has not necessarily reached the peer.
  Delivery is the transport's concern; substrate-level acknowledgment of delivery is the peer's `federation-envelope-admitted` event reaching back, which is itself a separate envelope.
- **Not a closure-rule firing.** Cells emitted in an envelope are extracted from the *current* fiber state; emitting them does not re-settle the local substrate.
  If a peer's admission of the envelope causes the peer's substrate to settle in a way that warrants a return envelope, the return envelope is a separate `emit-federation-envelope` invocation at the peer.

## Position

`emit-federation-envelope` is the *outbound* primitive of FARS federation.
It is paired with [`admit-federation-envelope`](admit-federation-envelope.md) on the inbound side; together with [`merge-peer`](merge-peer.md) and [`replay-from-peer`](replay-from-peer.md), they constitute the FARS federation morphism quartet.

The morphism composes with [`emit-event`](emit-event.md) (which it invokes for the federation-envelope-emitted event), with [`apply-edit`](apply-edit.md) (which it invokes for the peer-record update), with [signature](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/signature.md) (which it produces), with [identity-key](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-key.md) (which it reads), and with [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md) (which it applies to compute the `envelope-id`).
