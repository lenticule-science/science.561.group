---
type: morphism
class: cryptographic-operation
realizes: [encryption]
depends-on: [identity-record, encryption, canonical-form, scope]
see-also: [decrypt-region, federation-as-substrate-join]
---

# Encrypt region

The substrate operation that produces a ciphertext serialization of a substrate region under one or more recipient [identity records](../objects/identity-record.md)' public keys. Encrypt-region is the substrate's primary confidentiality operator.

## Signature

`encrypt-region(region, recipients, scheme) → encrypted-region`

Inputs:

- **`region`** — references to the substrate region being encrypted: a [scope](teaching/explanations/scope.md), a [sublocale](../objects/application-sublocale.md), a [snapshot](../objects/snapshot.md), or any region with a canonical-form serialization.
- **`recipients`** — one or more identity-record references whose holders should be able to decrypt. The substrate supports multi-recipient encryption schemes (NaCl sealed-box per recipient, age recipient stanzas).
- **`scheme`** — the encryption scheme to use: `xchacha20-poly1305-sealed`, `age-recipient-stanzas`, `aws-kms-envelope`, etc.

Outputs:

- **`encrypted-region`** — the encrypted serialization, plus metadata: the recipient list, the scheme, the canonical-form hash of the *ciphertext* (per [encryption](teaching/explanations/encryption.md), not the plaintext), and a creation timestamp.

## Operational semantics

Encrypt-region proceeds in four steps:

1. Canonical-form-serialize the region per [canonicalize](canonicalize.md) — same plaintext bytes regardless of in-memory representation.
2. For each recipient identity-record, retrieve the public-key-bytes and verify the record permits encryption (`uses` includes `encryption`).
3. Apply the cited scheme to encrypt the canonical-form bytes for the recipient list. The result is the ciphertext.
4. Assemble the encrypted-region record with the ciphertext, recipient list, scheme, and ciphertext hash. Return.

Per [settlement-determinism](../theorems/settlement-determinism.md), encrypt-region is deterministic when the scheme is deterministic; for randomized schemes (typical for encryption to provide semantic security), each invocation produces a different ciphertext but encrypts the same plaintext. The substrate's response: federation-deduplication on encrypted regions uses the *plaintext* hash (computed before encryption, retained as the region's substrate-side identity), not the ciphertext hash.

## Engineering invariants

- **Canonical-form-of-plaintext discipline.** The plaintext is canonical-form-serialized before encryption; same plaintext → same encryption input. This is what makes federated-encrypted regions deduplicatable on plaintext content.
- **Recipient public keys are substrate-resident.** Encryption requires the recipient identity-record to be admitted; encrypting to an unknown recipient fails.
- **Scheme-determinate.** The encryption scheme determines the ciphertext format and the decryption procedure. Two substrates federating encrypted regions must agree on the schemes their identity-records support.
- **Witness-emitted.** Encrypt-region produces a witness recording the inputs (region hash, recipient list, scheme) and the output (ciphertext hash). The witness is itself unencrypted substrate content; per [encryption](teaching/explanations/encryption.md), the *encryption policy* is substrate content even when the encrypted *content* is not.

## Failure modes

- **Recipient identity-record missing.** Encrypt-region fails with `unknown-recipient`. The substrate may not have admitted the recipient yet.
- **Recipient identity-record doesn't permit encryption.** A signing-only identity-record cannot be a recipient. Encrypt-region fails with `recipient-not-encryption-key`.
- **Scheme not supported on this substrate.** The substrate's deployment may not include the cited scheme's implementation. Fails with `unsupported-scheme`.

## Position in the substrate

Encrypt-region is the operator that *restricts visibility* of substrate content. Per [federation-convergence](../theorems/federation-convergence.md), federated regions can be encrypted-in-transit; per [snapshot](../objects/snapshot.md), snapshots can be encrypted-at-rest; per [scope-as-predication](teaching/explanations/scope-as-predication.md), per-scope encryption policies are substrate content. The substrate's other guarantees (replay, audit, federation) hold for encrypted regions modulo the recipients having decrypt access.
