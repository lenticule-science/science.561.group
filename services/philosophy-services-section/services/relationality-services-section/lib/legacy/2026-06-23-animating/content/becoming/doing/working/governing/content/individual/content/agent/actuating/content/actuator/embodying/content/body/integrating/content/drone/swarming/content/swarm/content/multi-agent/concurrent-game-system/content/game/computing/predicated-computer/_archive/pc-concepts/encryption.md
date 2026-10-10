---
type: concept
class: cryptographic-confidentiality
depends-on: [identity-key, hash-discipline, scope, predication-fiber-algebra, visible-settling-fiber-groupoid, invisible-automorphism-subgroup, settling-fiber-groupoid]
see-also: [signature, federation-as-substrate-join, encryption-as-visibility-restriction-via-invisible-automorphism]
---

# Encryption

The substrate's mechanism for *confidentiality* — restricting which entities can read the contents of a substrate region. In the substrate's hyperdoctrine setting, encryption is not just bytewise concealment — it is *the substrate-side instance of moving content into the [invisible automorphism subgroup](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md) of the [settling fiber groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-fiber-groupoid.md) for non-recipient observers*. Per [encryption-as-visibility-restriction-via-invisible-automorphism](../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md), encryption operationalizes the visibility partition: encrypted content acts on cohomological invariants only for substrates whose identity-records admit decryption; for non-recipient substrates, the encrypted region's content collapses into the invisible-automorphism quotient — observable only via its cohomologically-trivial wrapper.

Encryption is distinct from [signature](signature.md) (which provides attribution) and from [authorization](theories/agential-orchestration-platform/concepts/authorization.md) (which restricts permitted operations); encryption restricts *visibility*, not action.

## Hyperdoctrinal grounding

Per [settling-fiber-groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-fiber-groupoid.md), the substrate's settlings live in a 2-category whose 0-cells are predication settlings, 1-cells are biequivalences, and (per [settling-automorphism 1-truncation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-automorphism-1-truncation.md)) 2-cells are identities. Per [invisible-automorphism-subgroup](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md), each settling has a normal subgroup $N(v)$ of *invisible* automorphisms — automorphisms that act trivially on the [settling-associated sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) and hence on every cohomological invariant. Per [visible-settling-fiber-groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/visible-settling-fiber-groupoid.md), the visible quotient is the moduli on which cohomology lives; the invisible part is the cosmetically-distinct-but-cohomologically-equal substructure.

Encryption is structurally the operationalization of this distinction:

- **For a recipient substrate** (one whose identity-record admits decryption), the encrypted region is a fully-visible part of its settling — the substrate computes cohomology, applies closure rules, federates as if the content were plaintext.
- **For a non-recipient substrate** (one whose identity-record does *not* admit decryption), the encrypted region is in the *invisible* part of the settling — the substrate sees the encrypted bytes as a constant ciphertext-shaped wrapper, but cannot derive any cohomological invariant from the contained content. Per [invisible-automorphism-subgroup](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md), the wrapper acts trivially on the settling-associated sheaf — non-recipient substrates' cohomology is unaffected by the encrypted region's contents.

Per [encryption-as-visibility-restriction-via-invisible-automorphism](../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md), this is not metaphor — encryption is a substrate operation that explicitly partitions the predication graph into recipient-visible and non-recipient-visible regions, with the latter falling into the substrate's structural notion of cohomologically-invisible content.

## What the discipline does

A region of the substrate is *encrypted-at-rest* when its canonical-form bytes, as stored, are encrypted under one or more recipient [identity keys](identity-key.md). The substrate stores ciphertext; reading the region requires possession of a private key authorized to decrypt. The substrate's [predication-graph store](../objects/predication-graph-store.md) may interleave encrypted and plaintext regions; the per-region encryption status is itself a substrate predication.

A region is *encrypted-in-transit* when, on crossing a substrate boundary (federation, replication, snapshot transport), its bytes are encrypted under a recipient identity key. The receiving substrate decrypts on admission; the decryption is a substrate operation producing a witness. Encryption-in-transit is the substrate's discipline for messages whose content should be readable by the recipient substrate but not by intermediaries.

## Encryption interacts with the substrate's other disciplines in three structural ways

- **Encryption preserves [hash-discipline](hash-discipline.md) via canonical-form-of-ciphertext.** The encrypted region's canonical-form hash is computed over the ciphertext bytes, not the plaintext. Two encryptions of the same plaintext under the same key produce the same ciphertext hash (when the encryption scheme is deterministic) or different hashes (when randomized) — the substrate's response is to require deterministic encryption for content that needs federation-deduplication. Per [encryption-as-visibility-restriction-via-invisible-automorphism](../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md), the ciphertext hash uniquely identifies the encrypted region across substrates regardless of plaintext-decryption ability.
- **Encryption interacts with [federation-convergence](../theorems/federation-convergence.md) by scope.** Encrypted regions can be federated only to substrates whose identity keys are admitted as recipients. A federation-bridge translating between two substrates with different recipient lists must re-encrypt at the boundary; per [doctrine-fidelity-via-faithful-interfacer-functor](../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the re-encryption must be doctrine-fidel on the predications it carries.
- **Encryption is regime-orthogonal.** The four-regime classification (per [regime-classification-for-substrate](../theorems/regime-classification-for-substrate.md)) is unaffected by encryption. Per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), encryption doesn't change the base $B$. An encrypted closure-rule application produces the same ordinal contribution as a plaintext one; encryption affects what's *readable*, not what's *settled*.

## Why "invisible automorphism" is the right grounding

A naive view: encryption is just byte-scrambling, separate from the substrate's structure. But that view doesn't explain (a) why federation can route encrypted content without decrypting it (the substrate must reason about the encrypted region's place without seeing the contents), (b) why hash-discipline still applies to encrypted regions (content-addressing must work on the ciphertext), or (c) why two non-recipient substrates can federate their views of the same encrypted region without conflict.

The hyperdoctrinal answer: per [encryption-as-visibility-restriction-via-invisible-automorphism](../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md), encrypted regions occupy the *invisible* part of the substrate's structure for non-recipients. Per [invisible-automorphism-subgroup](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md), invisible content acts trivially on the cohomology — federation, replication, and reasoning all proceed on the visible part, treating the invisible part as a constant. This is exactly what an encryption discipline needs:

- The ciphertext is visible to all substrates (federation can route it).
- The plaintext is visible only to recipients (the cohomological content depends on having decryption ability).
- Non-recipients can structurally ignore the contents (the invisible content acts trivially on their cohomology).

## Position

The substrate does not commit to a particular encryption scheme. Common choices: NaCl/libsodium (Ed25519 + Curve25519 for asymmetric, XChaCha20-Poly1305 for symmetric), age (modern file encryption with multiple recipient support), AWS KMS / cloud-managed-keys for substrates running in cloud environments. The choice is a deployment parameter; the substrate-level commitment is to *some* deterministic-or-acceptably-random encryption scheme that respects hash-discipline and federation-convergence.

Per [self-representation](self-representation.md), the substrate's *encryption policy* — which regions are encrypted, under which keys, by which scheme — is itself substrate content. An auditor with sufficient authorization can query "what is the encryption status of this region?" and "who are the admitted recipients?" without decrypting the region's content. Per [encryption-as-visibility-restriction-via-invisible-automorphism](../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md), this query operates on the visible part — recipient lists, encryption-scheme identifiers, ciphertext hashes — without crossing into the invisible part.
