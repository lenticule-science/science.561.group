---
name: federation-envelope-record
description: Federation envelope record
type: definition
class: record
instantiates: [federation-envelope, reification]
depends-on: [content-hash-addressing, signature, identity-record, peer-record, witness, canonical-form, algebra-as-protocol]
see-also: [emit-federation-envelope, admit-federation-envelope, merge-peer, event]
title: federation-envelope-record
---

# Federation envelope record

The substrate-record holding one federation message at the [flatfile](../../flatfile/flatfile.md) substrate: the envelope a [sovereign node](../../architecture/sovereign-node/sovereign-node.md) emits when it has substrate content to send to a peer, and the envelope a sovereign node admits when a peer has substrate content for it.
A `FederationEnvelopeRecord` is FARS's instantiation of the parent-theory [federation-envelope](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-envelope.md) at the flatfile substrate; it is the *only* shape in which substrate content crosses a sovereign-node boundary.

A `FederationEnvelopeRecord` is itself a substrate entity at *both ends*.
The sender records it before transmission (the envelope's own canonical hash is what the sender cites in its outbound `federation-envelope`-channel event); the receiver records it after admission (the envelope is reified per [reification](../../../../teaching/explanations/reification.md) into the receiver's substrate, and the admission emits a `federation-envelope` event citing the envelope's hash).
This dual-recording is what makes federation events first-class substrate entries on both sides per [event-sourcing](teaching/explanations/event-sourcing.md).

## Required fields

Every conforming realization SHALL hold, for each `FederationEnvelopeRecord`:

### Identity and routing

- **`envelope-id`** — the canonical content-hash (per [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md)) of the envelope's payload-and-metadata.
  Two byte-equivalent envelopes have the same `envelope-id`; deduplication at admission is by this hash.
- **`from-peer-id`** — the `peer-id` of the sending [peer-record](peer-record.md).
  On the sender's side, this is the sender's own identity-record content-hash; on the receiver's side, this is the matched peer-record's `peer-id`.
- **`to-peer-id`** — the `peer-id` of the intended receiver.
  Multi-recipient envelopes are not admitted at this level; an envelope addressed to multiple peers is encoded as multiple envelopes (one per recipient), each with its own `envelope-id`.
- **`ordinal`** — the sender-assigned monotonic ordinal for envelopes from `from-peer-id` to `to-peer-id`.
  The receiver's [peer-record](peer-record.md) tracks `last-merged-ordinal` against this field; envelopes with ordinals less-than-or-equal to `last-merged-ordinal` are dedup'd at admission.

### Payload

- **`payload.kind`** — one of `vocabulary-manifest`, `vocabulary-agreement`, `cells`, `request-operand`, `operand-response`, `retraction`.
  The kind determines the payload's schema; per [bounded-vocabulary-handshake](../../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md), the handshake kinds are admissible *before* `agreed-vocabulary` is non-empty; `cells` and `operand-response` are admissible only after.
- **`payload.content`** — the structured content per the kind:
  - For `cells` (the load-bearing case): a canonical-JSON array of substrate cells per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md), each carrying `entity`, `cell-key`, `value` (one of $\{\bot, t, f, \top\}$), and `provenance`.
  - For `vocabulary-manifest` / `vocabulary-agreement`: per [bounded-vocabulary-handshake](../../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md)'s manifest schema.
  - For `request-operand`: a list of content-hashes the receiver lacks and is requesting from the sender.
  - For `operand-response`: the requested operand bytes plus their content-hashes.
  - For `retraction`: an `envelope-id` (or list) being retracted, plus a closure-rule-recorded reason.
- **`payload.operator`** — for `cells` envelopes, the substrate operator that produced the cells (one of `compose`, `settle`, `apply-edit`, `respond`, etc. per the FARS morphism vocabulary).
  For non-`cells` kinds, the field MAY be absent.
- **`payload.operand-content-hashes`** — for `cells` envelopes, the content-hashes of the operands the operator was applied to.
  Per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md), these let the receiver re-derive the cells locally if it holds the operands.
- **`payload.rule-system-version`** — for `cells` envelopes derived from a `settle`, the canonical hash of the closure-rule system the sender ran.
  The receiver records this in the resulting cells' provenance so the version-skew is auditable.

### Authentication

- **`signature.value`** — the cryptographic signature of the envelope's canonical-form bytes (excluding the signature itself), produced under the sender's [identity-key](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-key.md).
  Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), a valid signature binds the envelope's content to the sender's identity-record.
- **`signature.key-id`** — the content-hash of the signing key (or its delegation chain root).
  The receiver looks up `from-peer-id`'s peer-record's `signing-key`; the signature SHALL verify against the key the peer-record currently holds (or against a key the peer-record's history shows).
- **`signature.scheme`** — the signature scheme identifier (e.g., `ed25519`, `secp256k1`).
  Realizations SHALL declare a default scheme; envelopes carrying other schemes are admissible per receiver policy.

### Witness chain

- **`sender-witness-hash`** — the content-hash of the [`Witness`](witness.md) the sender produced when emitting the envelope (per [`emit-federation-envelope`](../transformers/emit-federation-envelope.md)).
  The witness's `output_hash` is the `envelope-id`; the witness's `input_hashes` cite the substrate state the envelope's content was extracted from.
- **`upstream-witness-hashes`** — the witness chain leading from the sender's substrate state to the cells in this envelope (the witness that produced the operands cited in `payload.operand-content-hashes`, the witness for the settle that produced the cells if `payload.operator: settle`).
  Optional but recommended; per [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md), cells admitted with a complete witness chain accumulate stronger trust evidence than cells admitted without.

### Substrate position

- **`stored-at-path`** — the receiver-side substrate path where this envelope-record was reified.
  By convention, `<root>/.fars/federation/<from-peer-id>/<envelope-id>.json` for inbound; `<root>/.fars/federation/outbound/<to-peer-id>/<envelope-id>.json` for outbound.
  The path is presentation; the `envelope-id` is the substrate-portable identity.
- **`emitted-at`** / **`admitted-at`** — ISO 8601 timestamps for the sender's emission and the receiver's admission.
  Distinct: an envelope may be emitted at $t_1$ and admitted at $t_2 \gg t_1$ if delivery was delayed.

## Invariants

- **Substrate-recorded on both sides.** A `FederationEnvelopeRecord` SHALL be recorded as a substrate entity at *both* ends.
  Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), federation traffic that exists only on the wire is substrate-invisible and SHALL NOT be admitted as substrate state on either side.
- **Hash-stable.** The `envelope-id` SHALL be the canonical content-hash of the envelope's bytes (excluding the `envelope-id` field itself, the `stored-at-path`, and the `admitted-at` timestamp).
  Two byte-equivalent envelopes from the same sender have the same `envelope-id`.
- **Signature-required.** Every `FederationEnvelopeRecord` SHALL carry a verifiable signature.
  An envelope without a signature is a substrate-invisible message and SHALL be rejected at admission.
  (Exception: handshake-phase envelopes MAY carry an unsigned `vocabulary-manifest` if the peer-record's `signing-key` is not yet recorded — but the resulting agreed-vocabulary is provisional until a signed `vocabulary-agreement` is exchanged.)
- **Vocabulary-bounded.** For `cells` envelopes, every cell's predicate SHALL be in the receiver's `agreed-vocabulary` for the sender (per [peer-record](peer-record.md)) — or the receiver's `vocabulary-mismatch-policy` SHALL be applied.
  An admission that silently accepts unknown predicates violates the discipline.
- **Replay-deterministic.** Given the receiver's substrate state immediately before admission and the envelope's canonical bytes, [`merge-peer`](../transformers/merge-peer.md) SHALL produce the same post-admission substrate state on every replay.
  This is the precondition for the receiver's event log to be replay-coherent across federation envelopes per [event-sourcing](teaching/explanations/event-sourcing.md).
- **Append-only after admission.** Once admitted and reified into the receiver's substrate, the envelope-record's content SHALL NOT be edited.
  Corrections come via a new `retraction` envelope from the original sender citing the original `envelope-id`.

## What a `FederationEnvelopeRecord` is not

- **Not an `Event`.** An [`Event`](event.md) is the substrate's local-history record of a substrate-mutating action.
  A `FederationEnvelopeRecord` is a wire-format payload exchanged between sovereign nodes.
  The two are coupled: when an envelope is emitted, an event of `action: federation-envelope-emitted` is appended; when an envelope is admitted, an event of `action: federation-envelope-admitted` is appended.
  The events cite the envelope's `envelope-id`; the envelope is the payload, the events are the local-history entries.
- **Not a network packet.** The envelope is a substrate-level record; how it is serialized for transport (multiple TCP packets, multipart-MIME, chunked HTTP body, libp2p stream) is below the substrate.
  Per [transport-tolerance-of-federation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/transport-tolerance-of-federation.md), the carrier does not affect convergence.
- **Not a session.** A session may exchange many envelopes; an envelope is a single substrate-level transaction.
  Realizations MAY group envelopes into sessions for transport efficiency; the substrate semantics work envelope-by-envelope.
- **Not a fiber-merge result.** The envelope carries cells that *will be* merged into the receiver's substrate via [`merge-peer`](../transformers/merge-peer.md); the envelope itself is not the post-merge state.
  The merge produces *new* substrate state; the envelope is the input.
- **Not an arbitrary message format.** Per [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md), the envelope's payload structure is fixed: it carries algebra operators applied to content-hashed operands producing typed cells.
  Realizations MAY add metadata fields under a clearly-distinguished namespace; they MAY NOT alter the payload's algebra-as-protocol shape.

## Position

`FederationEnvelopeRecord` is FARS's *unit of federation traffic*.
Every federation operation at the FARS substrate involves one or more envelopes: [`emit-federation-envelope`](../transformers/emit-federation-envelope.md) produces one; [`admit-federation-envelope`](../transformers/admit-federation-envelope.md) consumes one; [`merge-peer`](../transformers/merge-peer.md) admits a batch of admitted envelopes' cells into the local fiber; [`replay-from-peer`](../transformers/replay-from-peer.md) fetches a peer's missing envelopes and admits them in ordinal order.

The record composes with [peer-record](peer-record.md) (the envelope's `from-peer-id` and `to-peer-id` resolve to peer-records), with [`Witness`](witness.md) (the envelope cites its sender-witness and admits witness-attached cells), with [`Event`](event.md) (emission and admission each emit one), with [identity-key](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/identity-key.md) (the signature's key), and with [content-addressed-store](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/content-addressed-store.md) (the envelope's `payload.operand-content-hashes` resolve through the substrate's content-addressed lookup).
