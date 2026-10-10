---
type: theorem
class: engineering-claim
status: proved
depends-on: [encrypt-region, decrypt-region, encryption, settlement-determinism, snapshot-replay-fidelity, federation-convergence]
see-also: [hash-injectivity-under-canonical-form, signature-binds-witness-to-identity]
---

# Encrypted regions are replay-equivalent to their plaintext under recipient identity

**Claim.** Let $R$ be a substrate region encrypted under recipients $\{I_1, \ldots, I_n\}$ via [encrypt-region](../morphisms/encrypt-region.md), producing encrypted-region $\tilde R$. Then for any substrate $S$ whose identity-records include some $I_j$ with valid decrypt access:

1. **Replay-equivalence.** $S$'s [replay](../morphisms/replay.md) of $\tilde R$ produces the same predication settling as $S$'s replay of the unencrypted $R$. The substrate's [settlement-determinism](settlement-determinism.md) is preserved across encryption.
2. **Federation-convergence preservation.** Two substrates $S_1$ and $S_2$ both with valid recipient identity-records, exchanging $\tilde R$ via federation, converge to the same predication settling — the same convergence claim as [federation-convergence](federation-convergence.md), now with encrypted transport.
3. **Non-recipient indistinguishability.** A substrate without a valid recipient identity-record cannot decrypt $\tilde R$. The substrate sees the encrypted-region as opaque ciphertext; per [encryption](teaching/explanations/encryption.md), it can store, hash, federate-on, and snapshot $\tilde R$ but cannot read its plaintext content.

## Why this holds

The argument combines the substrate's encryption discipline with [settlement-determinism](settlement-determinism.md) and [snapshot-replay-fidelity](snapshot-replay-fidelity.md).

**Part 1: Decryption recovers byte-identical plaintext.** Per [decrypt-region](../morphisms/decrypt-region.md), decrypting $\tilde R$ at a recipient produces the canonical-form plaintext bytes — byte-identical to the bytes [encrypt-region](../morphisms/encrypt-region.md) consumed. This is what the encryption scheme guarantees (correctness of the cipher: $D_k(E_k(m)) = m$).

**Part 2: Replay over decrypted plaintext is identical to replay over original plaintext.** Per [settlement-determinism](settlement-determinism.md), the substrate's settling is a deterministic function of `(event log, closure-rule system)`. The replay of $\tilde R$ proceeds: the substrate decrypts $\tilde R$ to recover the canonical-form plaintext bytes, then runs the substrate's normal replay over those bytes. Since decryption recovers byte-identical plaintext (Part 1), and replay is deterministic on the plaintext (settlement-determinism), the resulting settling equals the settling produced by replaying the original unencrypted $R$.

**Part 3: Federation-convergence carries through.** Per [federation-convergence](federation-convergence.md), two substrates exchanging the same set of writes converge to the same settling. When the writes are encrypted-in-transit:
- Both substrates must be valid recipients (Part 1 applies to both).
- The encrypted-region's *plaintext* hash (used for federation deduplication, per [encrypt-region](../morphisms/encrypt-region.md)'s canonical-form-of-plaintext discipline) is the same on both sides.
- Each substrate decrypts to the same plaintext (correctness of cipher).
- Each substrate then runs its closure operator over the same plaintext (settlement-determinism).
- Both converge to $\mathrm{cl}_p(\bigvee_k U)$ — the same federated state.

So encryption-in-transit doesn't break federation-convergence, provided the recipient list includes both substrates.

**Part 4: Non-recipient substrate sees opaque ciphertext.** Per [encryption](teaching/explanations/encryption.md), the encrypted-region's substrate-side identity is the *ciphertext* canonical-form hash for storage purposes, while federation-deduplication is on the *plaintext* hash (which is computed at encryption-time and recorded on the encrypted-region record, but only readable to recipients). A non-recipient substrate can store $\tilde R$ as canonical-ciphertext bytes and federate $\tilde R$ to other substrates (the encrypted-region itself is content), but it cannot access the plaintext — its substrate's settling proceeds without the encrypted plaintext's contribution.

## Engineering consequence

The theorem is what makes the substrate's encryption discipline *cost-free with respect to determinism, federation, and replay*. Encryption restricts visibility but does not change what the substrate *computes*; the math properties of the substrate are preserved through encryption modulo recipient access.

Three engineering uses follow:

- **Selective federation.** A substrate can federate sensitive content only to peers with valid recipient identity-records. Non-recipient peers receive the ciphertext (for forwarding, storage, audit trails) but cannot read the content. The substrate's federation graph and the encryption recipient list are jointly the substrate's confidentiality policy.
- **Encrypted backups.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), an encrypted snapshot is replayable to a recipient substrate with byte-identical fidelity to an unencrypted snapshot. Backups can be encrypted-at-rest (using a backup-recipient identity-record) and decrypted only on restore.
- **Multi-tenancy.** A substrate hosting content for multiple tenants encrypts each tenant's content under that tenant's identity. The substrate's audit and settlement work proceeds per tenant; cross-tenant content access requires explicit recipient-list updates (substrate-content edits).

## What the theorem rules out

- A substrate that uses an encryption scheme without correctness ($D_k(E_k(m)) \neq m$ for some $k, m$) breaks Part 1 and the entire theorem fails. Standard cryptographic schemes (XChaCha20-Poly1305, AES-GCM, age) provide correctness; broken or buggy implementations don't.
- A substrate that encrypts content non-deterministically without recording the per-invocation randomness violates federation-deduplication (the same plaintext under the same recipient list produces different ciphertext-hashes). The substrate's response is to use either deterministic schemes or to record the plaintext-hash separately as the federation-dedup key.
- A substrate that loses recipient identity-records loses access to its own past encrypted content. The substrate's discipline is to retain identity-records across the lifetime of any encrypted content they decrypt.

## What the theorem requires

- The encryption scheme provides cryptographic correctness ($D_k(E_k(m)) = m$).
- Recipient identity-records are admitted with valid decryption-capable public-key-bytes.
- The substrate uses canonical-form-of-plaintext hashing for federation-deduplication of encrypted regions.
- Per [settlement-determinism](settlement-determinism.md), the substrate's replay over decrypted plaintext is deterministic.
- Per [identity-record](../objects/identity-record.md), the recipient's private key is accessible to the recipient host environment for decrypt-region invocations.
