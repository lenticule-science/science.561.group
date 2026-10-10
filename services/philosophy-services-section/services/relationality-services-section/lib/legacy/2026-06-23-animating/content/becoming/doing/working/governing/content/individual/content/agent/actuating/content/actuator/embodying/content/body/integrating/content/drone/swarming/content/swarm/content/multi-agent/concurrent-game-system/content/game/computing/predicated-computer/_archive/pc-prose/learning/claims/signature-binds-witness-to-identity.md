---
type: theorem
class: engineering-claim
status: proved
depends-on: [sign, verify-signature, signature, identity-record, hash-discipline, witness, hash-injectivity-under-canonical-form]
see-also: [federation-convergence, settlement-determinism]
---

# A valid signature binds a witness to its producing identity

**Claim.** Let $w$ be a [witness](../objects/witness.md) carrying a [signature](teaching/explanations/signature.md) $\sigma$ that [verify-signature](../morphisms/verify-signature.md) returns `valid` against the cited [identity record](../objects/identity-record.md) $I$. Then:

1. **Attribution.** The witness $w$ was produced by the holder of $I$'s private key at some ordinal at-or-before the signature's recorded timestamp.
2. **Integrity.** The witness's content is byte-identical to the content the signature was computed over. No bit of the witness has been altered between signing and verification.
3. **Non-repudiation.** Per the assumed unforgeability of the signature scheme, no entity without access to $I$'s private key can produce a $\sigma$ that verifies against $I$.

The three properties together are the substrate's *binding* of substrate content to substrate-cryptographic-identity.

## Why this holds

The argument combines [hash-injectivity](hash-injectivity-under-canonical-form.md), the cryptographic properties of the signature scheme, and the substrate's identity-record discipline.

**Part 1: Attribution follows from sign's host-side privacy.** Per [sign](../morphisms/sign.md), the signature value is produced at the holder's host environment using the private key. The substrate never possesses the private key (per [identity-key](teaching/explanations/identity-key.md)); the only way for $\sigma$ to be produced is for an entity with access to the private key to have run the signing computation. Verification's `valid` outcome means the signature value cryptographically derives from the private key paired with $I$'s public key. So the holder of the private key produced $\sigma$ at some ordinal where they had access.

**Part 2: Integrity follows from hash-injectivity.** The signature is over the canonical-form hash of the content (per [sign](../morphisms/sign.md) Step 1). Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), distinct canonical content produces distinct hashes. Verify-signature recomputes the content's canonical-form hash and compares against the signature's recorded hash; mismatch returns `content-hash-mismatch`. A `valid` outcome therefore means the recomputed hash equals the signing hash, which (modulo hash collision) means the content is byte-identical (after canonicalization) to the content signed.

**Part 3: Non-repudiation follows from signature unforgeability.** Standard cryptographic-signature schemes (Ed25519, RSA, etc.) provide existential unforgeability under chosen-message attack: producing a signature over arbitrary content that verifies under a public key is computationally infeasible without the corresponding private key. So an entity that produces a $\sigma$ verifying against $I$ has access to $I$'s private key, period. The substrate's identity discipline (per [identity-record](../objects/identity-record.md)) is to bind each private key to one holder entity; therefore $w$'s production is attributable to that holder.

## Scope of binding

The binding is to the *holder of the private key* at the time of signing, not necessarily to any particular human. For:

- **Human-held keys**: the binding is to the human (or institution) that holds the key. Audit chains attribute to the human.
- **Service-held keys**: the binding is to the service principal. Audit chains attribute to the service.
- **Compromised keys**: signatures produced after a compromise may have been made by an attacker with access to the leaked key. The substrate's revocation discipline (per [identity-record](../objects/identity-record.md)) marks compromised keys; signatures by compromised keys past the compromise time are admissibility-suspect per the substrate's policy.

## Engineering consequence

The binding is what makes the substrate's audit chain *non-repudiable*: an entity cannot later deny having produced a witness when the witness's signature verifies against their identity-record. Per [federation-convergence](../theorems/federation-convergence.md), federated witnesses arriving at a peer substrate are admissible only when verification returns `valid`; non-repudiable attribution propagates across the federation.

The binding is also what makes substrate auditability *meaningful*: an auditor can attribute every state change in the event log to a specific identity. Per [settlement-determinism](../theorems/settlement-determinism.md), the event log + rule-system version determine the substrate's state; combined with signed witnesses, the chain answers both "what happened" and "who did it."

## What the theorem rules out

- A substrate that admits witnesses without verifying their signatures has lost the binding. Such a substrate's audit chain is attributable only on faith; an auditor cannot detect a forged witness.
- A substrate that allows two entities to share a private key has lost per-entity attribution. Witnesses signed by the shared key bind to "the holder of this key" but not to any specific entity. The substrate's identity-record discipline forbids this — each identity-record's holder field is a single entity.
- A substrate using a signature scheme without existential unforgeability (e.g., a simple hash-keyed-MAC where keys are substrate-resident) has lost non-repudiation. The substrate's discipline is to use cryptographic-grade signatures with off-substrate private keys.

## What the theorem requires

- The substrate's identity records are admitted with public-key-bytes that match the host's private keys (per [identity-record](../objects/identity-record.md) generation discipline).
- The signature scheme provides existential unforgeability under chosen-message attack (standard for Ed25519, RSA-PSS, ECDSA).
- The hash function is collision-resistant (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)).
- The substrate verifies signatures on every witness crossing trust boundaries (per [verify-signature](../morphisms/verify-signature.md)).
- The substrate's revocation discipline correctly handles compromised keys per [identity-record](../objects/identity-record.md).
