---
type: morphism
class: cryptographic-operation
realizes: [encryption]
depends-on: [identity-record, encryption, canonical-form]
see-also: [encrypt-region, replay]
---

# Decrypt region

The substrate operation that recovers the canonical-form plaintext of an encrypted substrate region using a recipient's [identity record](../objects/identity-record.md). Decrypt-region is the inverse of [encrypt-region](encrypt-region.md) for substrates whose identity-records have decrypt access.

## Signature

`decrypt-region(encrypted-region, identity-record-id) → region | refusal`

Inputs:

- **`encrypted-region`** — the encrypted-region record produced by [encrypt-region](encrypt-region.md).
- **`identity-record-id`** — the recipient's identity-record reference. The recipient's host environment must possess the corresponding private key.

Outputs:

- **`region`** — the decrypted region, canonical-form-serialized as in the original. The decrypted content's canonical-form hash equals the pre-encryption plaintext's hash (the substrate's federation-deduplication identity).
- **`refusal`** — when decryption fails, a refusal record carrying the failure reason.

## Operational semantics

Decrypt-region proceeds in four steps:

1. Verify the cited identity-record-id is in the encrypted-region's recipient list. Not in the list → refuse with `not-recipient`.
2. Resolve the identity-record's public-key-bytes (so the substrate knows which private key to ask the host for).
3. Send the encrypted bytes to the recipient's host environment, which uses the private key to perform the decryption per the cited scheme.
4. Verify the decrypted bytes are valid canonical-form (matching the pre-encryption hash if the substrate has it). Mismatch → refuse with `decryption-output-not-canonical`.

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), decrypt-region is structurally a *read* — it does not advance the substrate's predication settling, does not emit a state-changing witness, does not consume settlement fuel. The decryption operation itself crosses the substrate's boundary to the host environment, but the result is read-only on the substrate side.

## Engineering invariants

- **Recipient-list-bound.** A substrate not in the encrypted-region's recipient list cannot decrypt. The substrate verifies recipient-list membership before attempting decryption.
- **Private-key-not-substrate.** The private key never enters substrate content. Per [encryption](teaching/explanations/encryption.md), decryption crosses to the host environment where the private key lives.
- **Plaintext-hash-checkable.** The decrypted plaintext's canonical-form hash equals the pre-encryption plaintext's hash. The substrate may verify this if the plaintext hash is independently known (from a federation-deduplication index, from a prior unencrypted version of the same content).
- **Reads-free per cost-discipline.** Decrypt is a substrate read on the encrypted-region's data; per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), it produces no substrate-state advance.

## Failure modes

- **`not-recipient`**: the cited identity-record-id is not in the encrypted-region's recipient list. The substrate cannot decrypt; the caller may need to request re-encryption from a substrate that can.
- **`host-private-key-inaccessible`**: the host's key-management subsystem cannot provide the private key. Treated as a host-failure; the operation can be retried.
- **`decryption-output-not-canonical`**: the decrypted bytes are not valid canonical-form. Indicates either a corrupted ciphertext, a tampered encrypted-region, or a wrong-key decryption attempt that succeeded in producing bytes but not valid bytes. Treated as a security event.
- **`unsupported-scheme`**: the substrate's deployment does not include the cited scheme's implementation. The operation cannot complete.

## Position in the substrate

Decrypt-region is the operator that *restores visibility* of encrypted substrate content for authorized recipients. Per [replay](replay.md), replaying a substrate that has admitted encrypted regions involves decrypting the regions whose recipients include the replaying substrate; regions encrypted to other recipients remain ciphertext throughout the replay. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), an encrypted snapshot is replay-fidelitous to a substrate with a valid recipient identity-record; to a non-recipient substrate, the snapshot is byte-identical-on-ciphertext but its plaintext content is inaccessible.
