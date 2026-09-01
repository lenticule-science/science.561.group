---
type: definition
class: substrate-entity
realizes: [identity-key, signature]
depends-on: [identity-key, signature, encryption, witness, hash-discipline]
see-also: [agent-record, federation-graph]
---

# Identity record

A **identity record** is the substrate-entity formal definition of an [identity key](teaching/explanations/identity-key.md) bound to a substrate entity. Each identity record carries the cryptographic-public-component of one key-pair, plus the metadata needed for the substrate's signature-verification, encryption-targeting, and key-rotation disciplines.

## Structural fields

- **`id`** — kebab-case identifier; canonical-form hash of the public-key bytes (so the record's id is content-derived).
- **`description`** — one-line summary (typically the holder entity's name and the key's purpose).
- **`holder`** — reference to the substrate entity this key is bound to (an [agent-record](theories/agential-orchestration-platform/objects/agent-record.md), a substrate-instance identity, a deployment record).
- **`scheme`** — the signature/encryption scheme the key participates in (e.g., `ed25519`, `x25519`, `rsa-4096`, `nacl-sealedbox`). Determines verification and encryption procedures.
- **`public-key-bytes`** — the public component, canonical-form-encoded.
- **`uses`** — declared usage flags: `signing`, `encryption`, `signing-and-encryption`. The substrate enforces that a `signing`-only key is not used for encryption and vice versa.
- **`created-at`** — substrate ordinal at which the key-pair was generated.
- **`valid-from`** — earliest ordinal at which signatures or encryptions under this key are admissible.
- **`valid-until`** — latest such ordinal. Absent for keys with no expiry; signatures past `valid-until` are rejected at verification.
- **`predecessor`** — optional reference to the prior identity-record this key replaces (for key rotation). The `predecessor` chain lets an auditor trace the holder's signing key over time.
- **`revocation-status`** — current revocation state: `active`, `revoked`, `compromised`. Once revoked, signatures under the key are rejected (including retroactively for keys marked `compromised`); encryption to the key may still be admissible per the substrate's policy.
- **`revoked-at`** — substrate ordinal of revocation, when applicable.
- **`closure-kind`** — `identity`.

## Invariants

- **Public-only.** The identity record carries only the public key. Private keys live at the holder's host and are never substrate content. A substrate-resident private key is a security violation.
- **Hash-equal to id.** The record's id is the canonical-form hash of the public-key-bytes. Two identity records with the same public key (e.g., the same key registered twice) are detected by id collision.
- **Holder-bound.** Every identity record cites a holder entity. Floating identity records without a holder are inadmissible — keys exist only as bindings to substrate entities.
- **Validity coherent with revocation.** A revoked key has `revoked-at <= valid-until` (or `valid-until` is updated on revocation). Validity periods must respect revocations.
- **Predecessor chain acyclic.** Key rotation produces a chain of identity-records; cycles in the chain are inadmissible.

## Operations

- *Generate.* Producing a new identity-record involves generating the key-pair at the holder's host, signing the public-key-bytes into the substrate, and recording the predecessor (if rotating). Generation is a substrate operation producing a witness; the private component is emitted to the holder's host through a controlled channel.
- *Rotate.* Producing a new identity-record with a `predecessor` pointing to the prior one. The old key remains valid for verification of historical signatures (depending on revocation status) but is no longer used for new signatures.
- *Revoke.* Setting `revocation-status` to `revoked` (or `compromised` for known-leaked keys). Revocation is a substrate event; future signatures under the key are rejected. For `compromised` revocations, prior signatures may also be re-evaluated as suspect per the substrate's policy.
- *Verify.* Given a signature and the signed content, look up the cited identity-record's public-key-bytes and verify according to the cited `scheme`. Verification respects validity periods and revocation status.
- *Encrypt-to.* Given content and a recipient identity-record, encrypt under the recipient's public key per the cited `scheme`. Only identity records with `uses` admitting encryption are valid recipients.

## Position in the substrate

Identity records are the substrate's *cryptographic-identity registry*. Without them, signature verification and encryption have no place to look up public keys; with them, the substrate's federation, audit, and confidentiality disciplines have a substrate-resident anchor. Per [agent-record](theories/agential-orchestration-platform/objects/agent-record.md), each agent's `identity-key` field references an identity-record; per [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md)'s identity registry, federated peer identities are also identity records.

The pattern composes with [signature](teaching/explanations/signature.md) (which verifies against identity-record public keys), with [encryption](teaching/explanations/encryption.md) (which encrypts to identity-record public keys), with [agent-record](theories/agential-orchestration-platform/objects/agent-record.md) (whose identity-key field points to an identity-record), and with the substrate's [hash-discipline](teaching/explanations/hash-discipline.md) (which makes the record's id content-derived).
