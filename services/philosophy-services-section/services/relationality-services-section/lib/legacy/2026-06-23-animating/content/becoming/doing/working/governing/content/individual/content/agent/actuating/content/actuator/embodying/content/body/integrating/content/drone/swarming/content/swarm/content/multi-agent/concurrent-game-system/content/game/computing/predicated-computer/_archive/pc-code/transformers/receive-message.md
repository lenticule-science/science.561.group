---
type: morphism
class: networking-operation
realizes: [transport, federation-as-substrate-join]
depends-on: [transport-record, connection, reification, verify-signature, admit, hash-discipline]
see-also: [send-message, federation-handshake]
---

# Receive message

The substrate operation that admits an incoming [reified message](teaching/explanations/reification.md) from a [transport](teaching/explanations/transport.md), verifies it, and routes it into the substrate's normal admission discipline. Receive-message is the substrate's primary incoming-byte operator at the federation boundary.

## Signature

`receive-message(transport-record-id, raw-bytes, sender-endpoint) → receive-witness`

Inputs:

- **`transport-record-id`** — reference to the [transport record](../objects/transport-record.md) the bytes arrived on.
- **`raw-bytes`** — the bytes received from the wire.
- **`sender-endpoint`** — the sender's endpoint identifier (which connection, which peer the bytes came from).

Outputs:

- **`receive-witness`** — a witness recording the receive operation: the message's canonical-form hash, the transport-record-id, the sender-endpoint, the verification result, and the admission outcome.

## Operational semantics

Receive-message proceeds in seven steps:

1. Verify the transport-record is active and admits incoming bytes from the sender-endpoint.
2. Per [decrypt-region](decrypt-region.md), if the bytes are substrate-level-encrypted, decrypt using the local recipient identity-record. Refuse if not a recipient.
3. Parse the bytes as a canonical-form-serialized reified message. Per [reification](teaching/explanations/reification.md), the parse produces the message's structural fields including its claimed sender identity-record-id.
4. Per [verify-signature](verify-signature.md), verify the message's signature against the cited sender's identity-record. Refuse with an invalid-signature witness if verification doesn't return `valid`.
5. Per [hash-discipline](teaching/explanations/hash-discipline.md), check whether the message's canonical-form hash is already in the substrate's known-message-set (federation deduplication). If duplicate, no further action — the receive is a no-op for substrate state, recorded as a duplicate-witness.
6. Per [admit](admit.md), pass the verified, deduplicated message through the substrate's admission discipline (port validation, shape conformance, constraint evaluation). Per [closure-rule-application](closure-rule-application.md), the admitted message contributes to the substrate's [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md), advancing the predication settling.
7. Emit the receive-witness recording the operation's outcome.

Per [settlement-determinism](../theorems/settlement-determinism.md), receive-message's substrate-state effect is determined by the message content and the substrate's rule-system version; two receive-message calls with the same canonical-form-message produce the same effect. Per [federation-convergence](../theorems/federation-convergence.md), the convergence to $\mathrm{cl}_p(\bigvee_k U)$ holds across receivers regardless of arrival order.

## Engineering invariants

- **Signature-verified before admission.** Per [verify-signature](verify-signature.md), no message is admitted without verified signature. Forged or tampered messages are rejected at the boundary.
- **Deduplicated by canonical-form hash.** Per [federation-convergence](../theorems/federation-convergence.md)'s order-independence, repeated delivery is safe — the substrate detects duplicates and treats them as no-ops.
- **Witness-emitted regardless of outcome.** Every receive produces a witness, whether the message was admitted, deduplicated, refused, or failed verification. The witness chain records all incoming traffic for audit.
- **Reads-free per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md) for verification + dedup.** The signature-verification, decryption, and dedup-check stages are reads (they don't change substrate state). Only the admission step is a state-changing operation.

## Failure modes

- **Invalid-signature.** The message's signature doesn't verify against the cited sender. Refuse; emit invalid-signature witness; no admission. The substrate may also flag the sender for elevated scrutiny per its security policy.
- **Decryption failure.** The bytes are encrypted to a recipient the substrate doesn't have decrypt access for. Refuse; emit not-recipient witness.
- **Parse failure.** The bytes don't conform to the canonical-form structure. Refuse; emit malformed-message witness.
- **Admission failure.** The message conforms but the substrate's admission discipline (port validation, shape conformance) refuses (e.g., the message claims a port the recipient doesn't expose). Emit admission-refusal witness.
- **Duplicate.** The message's hash is already in the substrate's known-message-set. No state change; emit duplicate witness.

## Position in the substrate

Receive-message is the operator that *terminates* incoming federation traffic. Per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md), the substrate's federation discipline routes incoming bytes through receive-message into the substrate's normal admission. The substrate's invariants (settlement-determinism, federation-convergence, audit-trail completeness) hold for incoming federation traffic because every receive produces a verified, deduplicated, witnessed admission.

The pattern composes with [transport-record](../objects/transport-record.md), [verify-signature](verify-signature.md), [decrypt-region](decrypt-region.md), [reification](teaching/explanations/reification.md), [admit](admit.md), and [send-message](send-message.md) (the inverse operation at the sender).
