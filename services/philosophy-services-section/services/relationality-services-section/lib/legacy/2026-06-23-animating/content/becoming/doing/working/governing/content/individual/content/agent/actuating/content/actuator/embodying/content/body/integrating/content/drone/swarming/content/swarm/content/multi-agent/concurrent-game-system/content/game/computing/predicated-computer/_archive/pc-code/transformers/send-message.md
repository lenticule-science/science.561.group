---
type: morphism
class: networking-operation
realizes: [transport, federation-as-substrate-join]
depends-on: [transport-record, connection, reification, witness, hash-discipline]
see-also: [receive-message, federation-handshake]
---

# Send message

The substrate operation that transmits a [reified message](teaching/explanations/reification.md) across a [transport](teaching/explanations/transport.md) to a peer substrate's recipient endpoint. Send-message is the substrate's primary outgoing-byte operator at the federation boundary.

## Signature

`send-message(reified-message, transport-record-id, recipient-endpoint) → send-witness`

Inputs:

- **`reified-message`** — the canonical-form-serialized message (per [reification](teaching/explanations/reification.md)) to transmit.
- **`transport-record-id`** — reference to the [transport record](../objects/transport-record.md) to use.
- **`recipient-endpoint`** — the recipient's endpoint identifier (a URL, a queue topic, a peer-substrate identity, etc.) within the cited transport.

Outputs:

- **`send-witness`** — a witness recording the send operation: the message's canonical-form hash, the transport-record-id, the recipient-endpoint, and the send result (delivered, queued, failed).

## Operational semantics

Send-message proceeds in five steps:

1. Verify the cited transport-record is active and admits the recipient-endpoint. Per [transport-record](../objects/transport-record.md), unsupported endpoints are rejected.
2. Optionally, encrypt the message under the recipient's identity-record per [encrypt-region](encrypt-region.md), if the federation policy requires substrate-level encryption-in-transit.
3. Open or reuse a [connection](teaching/explanations/connection.md) on the transport to the recipient-endpoint. Connection-opening involves a [federation-handshake](theories/agential-orchestration-platform/morphisms/federation-handshake.md) on first contact.
4. Transmit the canonical-form bytes through the connection. The transport's reliability properties determine retry behavior; per [transport-record](../objects/transport-record.md), the reliability-policy is substrate-recorded.
5. Emit the send-witness recording the operation. The witness contributes to the substrate's audit chain; a sent message that didn't successfully deliver produces a `failed` witness with diagnostic detail.

Per [federation-convergence](../theorems/federation-convergence.md), the message's eventual delivery is what matters for substrate convergence; the send-message operation is responsible for *initiating* delivery, with retry and recovery handled by the transport's reliability layer plus substrate-level retry policies.

## Engineering invariants

- **Canonical-form-bytes-only.** The wire bytes are the message's canonical-form serialization; per [hash-discipline](teaching/explanations/hash-discipline.md), the recipient verifies the hash on arrival.
- **Idempotent on canonical-hash.** Two send-message calls with the same reified-message-hash to the same recipient produce a witness chain that the recipient deduplicates per [federation-convergence](../theorems/federation-convergence.md). The substrate's at-least-once retry behavior is safe.
- **Transport-bound.** Send fails if the transport is down, the recipient is unreachable, or the recipient rejects the message. The substrate's federation policy determines retry vs. escalation.
- **Witness-emitted.** Every send produces a witness, regardless of delivery success. The witness records the send attempt; success / failure is the witness's content.

## Failure modes

- **Transport unavailable.** The cited transport is down or the recipient is unreachable. Send produces a `failed` witness; the substrate's retry policy decides whether to enqueue for later send.
- **Recipient rejects message.** The recipient's substrate refuses the message (signature failure, content validation failure, rate limit). Send records the rejection; the sender's policy decides whether the rejection is recoverable.
- **Encryption failure.** When substrate-level encryption is required and the recipient's identity-record is missing or expired, encrypt-region fails before send. The send-witness records the encryption failure.
- **Backpressure.** The transport-record's `backpressure-policy` triggers when the recipient is too slow. `drop-oldest` and `drop-newest` produce drop-witnesses; `block-sender` defers send until the recipient catches up; `disconnect` tears down the connection.

## Position in the substrate

Send-message is the operator that *initiates* outgoing federation traffic. Per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md), the substrate's federation discipline rests on bytes crossing substrate boundaries; send-message is where those bytes leave. Per [federation-convergence](../theorems/federation-convergence.md), eventual delivery + closure-merge commutation produces convergence; send-message contributes the eventual-delivery side.

The pattern composes with [reification](teaching/explanations/reification.md) (which produces the message bytes), [transport-record](../objects/transport-record.md) (the configuration), [connection](teaching/explanations/connection.md) (the live channel), [encrypt-region](encrypt-region.md) (optional substrate-level encryption), and [receive-message](receive-message.md) (the inverse operation at the recipient).
