---
name: admit-federation-envelope
description: "The morphism that receives an inbound FederationEnvelopeRecord, verifies its signature against the matched PeerRecord, checks vocabulary conformance, deduplicates by envelope-id, reifies the envelope into the local substrate, emits the federation-envelope-admitted event, and (for cells envelopes) hands off to merge-peer."
title: admit-federation-envelope
---

The morphism that receives an inbound [`FederationEnvelopeRecord`](../objects/federation-envelope-record.md), verifies its signature against the matched [`PeerRecord`](../structures/peer-record.md), checks vocabulary conformance, deduplicates by `envelope-id`, reifies the envelope into the local substrate, emits the `federation-envelope-admitted` event, and (for `cells` envelopes) hands off to [`merge-peer`](merge-peer.md).
`admit-federation-envelope` is FARS's instantiation of the parent-theory [receive-message](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/receive-message.md) operator at the federation boundary.

The morphism is the *gatekeeper*: every check that determines whether the envelope's content is admitted into the substrate happens here, before any cell touches the local fiber.
Per [sovereign-node](../../architecture/sovereign-node/sovereign-node.md), the receiver owns the admission decision; this operator is where the receiver's discipline is applied.

## Signature

```
admit-federation-envelope(envelope-bytes, transport-record) → (admission-result, witness)
```

Inputs:

- **`envelope-bytes`** — the canonical-JSON bytes of an inbound `FederationEnvelopeRecord` as received from the transport.
  The bytes are not yet a substrate entity; the operator's first job is to parse them into a candidate envelope-record and decide whether to reify it.
- **`transport-record`** — the [transport-record](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/transport-record.md) the envelope arrived on.
  Used to record provenance and (per receiver policy) to apply transport-grade trust adjustments per [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md).

Outputs:

- **`admission-result`** — one of `admitted` (envelope is now substrate state, merge has run for `cells` envelopes), `rejected` (envelope refused, diagnostic event emitted), `quarantined` (envelope reified into a quarantine sub-region pending governance review), `deduplicated` (envelope's `envelope-id` is already in the substrate; no new state).
- **`witness`** — the [`Witness`](../objects/witness.md) for the admission.
  The witness's `input_hashes` cite the substrate state pre-admission and the envelope's bytes; `output_hash` cites the envelope's `envelope-id` (or, for `rejected`, the diagnostic event's hash).

## Operational semantics

`admit-federation-envelope` SHALL proceed:

1. **Parse.** Parse `envelope-bytes` as canonical-JSON into a candidate `FederationEnvelopeRecord`.
  If parsing fails, emit a `guard`-channel diagnostic of `action: malformed-federation-envelope` citing the transport-record; return `rejected`.
2. **Resolve peer-record.** Look up the [`PeerRecord`](../structures/peer-record.md) by `envelope.from-peer-id`.
  If no peer-record exists, apply the local `unknown-peer-policy` (per peer-record discipline): typical policies are `reject` (drop the envelope, emit a `guard`-channel diagnostic of `action: unknown-peer-attempted-federation`), `quarantine` (reify into `<root>/.fars/federation/quarantine/<peer-id>/<envelope-id>.json` for governance review), or `auto-create-peer-record-with-bottom-trust` (create a peer-record with `trust-grade: ⊥` and proceed to step 3 — the cells will be admitted with $\bot$-trust, surfacing for governance).
3. **Verify signature.** Recompute the canonical-JSON of the envelope's bytes-excluding-signature; verify `envelope.signature.value` against the peer-record's `signing-key` (or against a key the peer-record's history records as having been valid at `envelope.emitted-at`).
  If verification fails, emit a `guard`-channel diagnostic of `action: federation-envelope-signature-invalid`; return `rejected`.
  Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), an unverified envelope SHALL NOT be admitted as substrate state.
4. **Verify envelope-id.** Recompute `envelope.envelope-id` from canonical-JSON-of-content; if it does not match the envelope's claimed `envelope-id`, emit a `guard`-channel diagnostic of `action: federation-envelope-hash-mismatch`; return `rejected`.
  (Per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), a mismatch indicates either tampering, a non-canonical sender, or a canonicalization-discipline incompatibility.)
5. **Deduplicate.** Look up the envelope-id in the local substrate's federation-envelopes index.
  If already present, emit a `federation-envelope-deduplicated` event citing the envelope-id and return `deduplicated`.
  The substrate is not changed.
6. **Vocabulary check.** For `payload.kind: cells`, for each cell, verify the predicate is in `peer-record.agreed-vocabulary`.
  If any predicate is not, apply `peer-record.vocabulary-mismatch-policy`:
   - **`reject`**: emit a `guard`-channel diagnostic of `action: federation-envelope-vocabulary-violation` citing the unknown predicates; return `rejected`.
     The envelope is not reified.
   - **`bridge`**: look up [federation-bridge](../../../agent/federation/federation-bridge/federation-bridge.md) entities mapping the unknown predicates to known ones; apply the bridges to produce a cells-with-bridge-provenance fiber; proceed to step 7 with the bridged cells.
   - **`quarantine`**: reify the envelope into `<root>/.fars/federation/quarantine/<peer-id>/<envelope-id>.json`; emit `federation-envelope-quarantined` event; return `quarantined`.
     Governance review per [governance-decision-modal-decidability](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md) decides whether to extend `agreed-vocabulary` and re-admit.
   - **`renegotiate`**: emit a `vocabulary-renegotiation-requested` event citing the unknown predicates; reify the envelope into quarantine pending the renegotiation; return `quarantined`.
     For non-`cells` kinds (handshake, retraction, request-operand, operand-response), the vocabulary check is bypassed; those kinds are admissible regardless of `agreed-vocabulary` content.
7. **Reify into the substrate.** Write the envelope's canonical-JSON to `<root>/.fars/federation/<from-peer-id>/<envelope-id>.json`.
  Per [event-sourcing](teaching/explanations/event-sourcing.md)'s file-first discipline, the file write precedes the event emission.
8. **Emit admission event.** Call [`emit-event`](emit-event.md) with an event of `action: federation-envelope-admitted`, `subject: peer-record.peer-id`, `actor: <local-federation-engine-agent-id>`, `channel: federation`, `origin: admit-federation-envelope-operator`, `payload: {envelope-id, ordinal, payload-kind, sender-witness-hash, peer-trust-grade-at-admission, transport-record-id}`.
9. **Dispatch by kind.**
   - **`cells`**: invoke [`merge-peer`](merge-peer.md) with the envelope and the peer-record.
     Return `admitted`.
   - **`vocabulary-manifest` / `vocabulary-agreement`**: dispatch to the bounded-vocabulary-handshake operator (per [bounded-vocabulary-handshake](../../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md)) which updates `peer-record.agreed-vocabulary` and `last-handshake-witness-hash`.
     Return `admitted`.
   - **`request-operand`**: dispatch to the operand-server operator which (per receiver policy) emits an `operand-response` envelope back to the peer with the requested operands.
     Return `admitted`.
   - **`operand-response`**: write the responded operands to the local content-addressed store; if any operands were prerequisites for previously-quarantined envelopes, re-attempt admission of those envelopes.
     Return `admitted`.
   - **`retraction`**: locate the cited envelope-id; if found and not already retracted, emit a `federation-envelope-retracted` event; the receiver's substrate state is *not* automatically rolled back — retraction is a substrate-visible signal that downstream closure rules and governance can act on per their own discipline.
     Return `admitted`.
10. **Return.** The composite witness chain (parse witness ⤳ signature-verification witness ⤳ admission witness ⤳ kind-dispatch witness) is the audit chain a downstream operator can cite when explaining why this envelope's content is in the substrate.

## Normative invariants

- **Signature-required.** No envelope is admitted without a verified signature against a recorded peer-record key.
  Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), unsigned admission would break the federation discipline's authentication chain.
- **Hash-deduplicating.** Re-admission of an envelope by `envelope-id` is a no-op on substrate state.
  Per [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md), this is the precondition for transport-layer retries to be safe.
- **Vocabulary-bounded.** No `cells` envelope's content is admitted with predicates outside the agreed vocabulary except via an explicit policy (`bridge`, `quarantine`).
  Silent admission is forbidden.
- **Substrate-recording on every outcome.** Every admission attempt — admitted, rejected, quarantined, deduplicated — produces a substrate event.
  Per [event-sourcing](teaching/explanations/event-sourcing.md), the federation-event-stream is the audit-chain for the federation discipline.
- **Trust-grade-respecting.** Cells admitted from a peer-record with `trust-grade: ⊥` are admitted with $\bot$-grade provenance; cells from `trust-grade: f` peers are admitted only under the `unknown-peer-policy` exception; cells from `trust-grade: t` peers carry full peer-attribution.
  Per [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md), the trust-grade is the bilattice value attached to the cells' provenance, not a binary admit/reject decision.

## Failure modes

Listed inline at each step.
Distinct from rejection: a parse failure produces no envelope-record (the bytes are not substrate state); a signature failure produces a diagnostic event but no envelope-record reification; a vocabulary failure produces either a diagnostic event (reject), a bridged cells admission (bridge), or a quarantined envelope-record (quarantine/renegotiate).
The substrate is left in a coherent state regardless of failure path.

## What `admit-federation-envelope` is not

- **Not [`merge-peer`](merge-peer.md).** Admission verifies and reifies; merge composes-and-settles.
  The two are distinct: a `vocabulary-agreement` envelope is admitted but does not invoke `merge-peer` (it has no cells); a `cells` envelope is admitted *and* invokes `merge-peer`; an envelope rejected at admission never reaches `merge-peer`.
- **Not a transport-layer receive.** The transport delivers bytes; this morphism decides whether those bytes become substrate state.
  A realization that admits envelopes whenever the transport delivers them — without going through this operator — has lost the federation discipline.
- **Not a single-pass operation for quarantined envelopes.** A quarantined envelope's eventual admission (after governance review extends the agreed vocabulary, or a bridge is added) is a *re-invocation* of `admit-federation-envelope`, not a continuation of the original.
  Each invocation is its own substrate event.
- **Not a content-validation operator.** The morphism verifies signature, hash, and vocabulary-membership; it does not re-verify the *truth* of the cells (that is the substrate's settle-and-governance discipline at the cells, not the envelope's admission).
  A cells envelope whose content settles to $\top$ at the receiver was correctly admitted; the contestation is substrate content for governance, not an admission failure.

## Position

`admit-federation-envelope` is the *inbound* primitive of FARS federation.
It is paired with [`emit-federation-envelope`](emit-federation-envelope.md) on the outbound side; it precedes [`merge-peer`](merge-peer.md) for `cells` envelopes; it is invoked once per envelope by [`replay-from-peer`](replay-from-peer.md).

The morphism composes with [`emit-event`](emit-event.md) (which it invokes for the admission event), with [signature](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/signature.md) (which it verifies), with [content-hash-addressing](../../flatfile/content-hash-addressing/content-hash-addressing.md) (which it uses for envelope-id verification and deduplication), with [bounded-vocabulary-handshake](../../bounded-vocabulary-handshake/bounded-vocabulary-handshake.md) (which it enforces), and with [federation-trust-bilattice-graded](../../../../../theorems/federation-trust-bilattice-graded.md) (which it reads from the peer-record to attach trust-grade provenance).
