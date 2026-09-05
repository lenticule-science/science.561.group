---
type: concept
class: substrate-spec
depends-on: [reification, federation-graph, hash-discipline, canonical-form, signature, signature-binds-witness-to-identity, identity-key, federation-trust-bilattice-graded]
see-also: [federation-bridge, federation-as-substrate-join, transport]
---

# Federation envelope

The substrate's *transport-independent wire format for a federated message*: the canonical-JSON envelope that wraps a substrate cell-admission, query, or response when it crosses a substrate boundary. In the substrate's hyperdoctrine setting, the federation envelope is not just metadata — it is *the substrate-side reification of an admission across a [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md) edge*, with the envelope's structure determined by the [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) data the federation needs to evaluate $\Box_R$ at the receiver.

A federation envelope is what the federation transport (Matrix, libp2p, plain HTTP, etc.) carries; the transport's own envelope (Matrix event, libp2p stream frame, HTTP request) wraps the substrate envelope as its payload. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), federation peers verify the envelope's signature against their accessibility-relation data; admission proceeds only when the modal validity check passes.

## Why this concept exists

`federation-graph.md` describes the federation as a multi-observer system / quantale-enriched sheaf. `federation-bridge.md` describes how vocabularies translate at substrate boundaries. But neither specifies *the wire format* of a federated message — what fields the envelope carries, what their canonical encoding is, how the receiver verifies it. Without this spec, federation interoperability is impossible — two implementations using different envelope structures can't federate even if they agree on the higher-level discipline.

This concept fills the gap with a transport-independent envelope spec. Per [doctrine-fidelity-via-faithful-interfacer-functor](../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), specific transports (Matrix, etc.) are interfacers that wrap this envelope; per the spec, all interfacers carry the same substrate-level data.

## Envelope structure

A federation envelope's canonical-JSON shape:

```json
{
  "kind": "federation-envelope",
  "version": "v1",
  "sender": {
    "identity-record-hash": "<hex-sha256>",
    "substrate-id": "<hex-sha256>"
  },
  "recipient": {
    "identity-record-hash": "<hex-sha256>",
    "substrate-id": "<hex-sha256>"
  },
  "payload": {
    "kind": "<admission | query | response | retraction | ...>",
    "content": <canonical-JSON of the payload>,
    "content-hash": "<hex-sha256>"
  },
  "ordinal": <non-negative integer>,
  "declared-time": "<ISO 8601 UTC timestamp>",
  "signature": {
    "scheme": "Ed25519",
    "signing-key-hash": "<hex-sha256>",
    "value": "<base64 of signature bytes>"
  }
}
```

Per [canonical-form-via-settling-quiescence](../theorems/canonical-form-via-settling-quiescence.md), keys are sorted lexicographically; per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the envelope's identity is its canonical-JSON SHA-256.

### Sender / recipient

`identity-record-hash` references the [identity-record](../objects/identity-record.md) of the entity sending or receiving. `substrate-id` is the substrate the entity belongs to (typically the identity-record's home substrate). Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the receiver's accessibility cell is indexed by `(sender.identity-record-hash, sender.substrate-id)`.

### Payload

The `payload` object carries the substrate operation:

- `kind` identifies the operation type. Common kinds: `admission` (a cell or batch of cells to admit), `query` (a pattern query), `response` (the result of a prior query, citing the query's hash), `retraction` (per [retraction](../morphisms/retraction.md), explicit retraction of a prior admission), `gossip` (per [federation-convergence](../theorems/federation-convergence.md), proactive sharing of a settled state).
- `content` is the canonical-JSON of the operation's data.
- `content-hash` is the canonical-form SHA-256 of `content` — duplicated at the envelope level for fast verification without re-hashing the payload.

### Ordinal and time

`ordinal` is the sender's substrate-local event ordinal at emission (per [time-and-event-ordinals](time-and-event-ordinals.md)). The receiver's ordinal will differ; the envelope's ordinal records the sender's perspective only.

`declared-time` is the sender's wall-clock claim at emission — substrate content per [time-and-event-ordinals](time-and-event-ordinals.md).

### Signature

The `signature` object provides per-envelope signature attribution. The signature is over the canonical-JSON of the envelope *minus the signature field itself* (the standard pattern: serialize, hash, sign, then attach signature). Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the receiver verifies the signature against the sender's identity-record's public key; failure rejects the envelope at admission.

`signing-key-hash` references the specific key used (relevant when the sender has rotated keys per [identity-key-custody](identity-key-custody.md)).

## Verification at receipt

When the receiver substrate gets a federation envelope (regardless of transport):

1. Parse the canonical-JSON.
2. Verify the envelope's structure (all required fields present, types correct).
3. Verify the `payload.content-hash` matches the hash of `payload.content`.
4. Verify the `signature.value` against `sender.identity-record-hash`'s public key.
5. Verify the sender's accessibility (per [trust-boundary-modal-validity](../theorems/trust-boundary-modal-validity.md)) — is the sender admitted in the receiver's federation-graph?
6. Per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), evaluate $\Box_R$ at the receiver's world.
7. If admission criteria pass, dispatch the payload to the appropriate substrate operation (admit, query, etc.).
8. If admission criteria fail, record a witness of the rejection per [witness](witness.md).

Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), repeated rejections from a single sender produce $\top$-cells in the inconsistency sheaf — surfacing potential attack patterns.

## Transport binding

Specific federation transports wrap the envelope as their payload. Examples:

- **Matrix.** A Matrix room event with `type: "m.predicated.envelope"` and `content` set to the envelope's canonical-JSON.
- **libp2p.** A libp2p stream protocol `/predicated/federation/1.0.0` carrying length-prefixed envelopes.
- **HTTP.** A POST to `/federation/inbox` with `Content-Type: application/predicated.envelope+json` and the envelope as the body.
- **AMQP.** A message on a `federation-envelopes` topic with the envelope as the body.
- **Filesystem.** A file in `peers/<peer-substrate-id>/inbox/` containing the canonical-JSON.

Each transport is an [interfacer](interfacer.md) wrapping the envelope. Per [doctrine-fidelity-via-faithful-interfacer-functor](../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the interfacer is faithful — same envelope produces the same wrapped form regardless of transport. Per the substrate's federation discipline, the substrate's federation logic operates on envelopes, not transport wrappers.

## What the spec rules out

- **Envelopes without signatures.** Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), unsigned envelopes have no attribution; the substrate refuses them at the boundary.
- **Envelopes whose payload-hash doesn't match.** The `payload.content-hash` must equal the hash of `payload.content` — mismatch indicates tampering or implementation error.
- **Envelopes from unknown senders.** Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the substrate's discipline may admit $\bot$-trust senders (uninformed) with explicit policy, but unknown senders cannot bypass the accessibility check.
- **Replay of old envelopes.** The substrate's discipline includes replay-attack defense — per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), an envelope's hash is unique; the substrate refuses to admit envelopes whose hash has been seen before (within the policy's deduplication window).
- **Cross-version envelopes without translation.** An envelope's `version` field identifies its format. A receiver running a different version must explicitly support backward-translation; per [doctrine-fidelity-via-faithful-interfacer-functor](../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the translation interfacer must be faithful.

## Position

The federation envelope is the substrate's *interoperability primitive*. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the substrate's federation logic operates on envelope structure; per this spec, the envelope structure is canonical. Two implementations sharing the envelope spec can federate regardless of transport choice; transports are deployment parameters, the envelope is substrate-level.

The envelope composes with [signature](signature.md) (signature attribution per envelope), with [identity-key-custody](identity-key-custody.md) (the signing key's custody discipline), with [reification](reification.md) (the envelope itself is a reified message at the federation boundary), and with [federation-bridge](../objects/federation-bridge.md) (vocabulary translation operates on envelope payloads).
