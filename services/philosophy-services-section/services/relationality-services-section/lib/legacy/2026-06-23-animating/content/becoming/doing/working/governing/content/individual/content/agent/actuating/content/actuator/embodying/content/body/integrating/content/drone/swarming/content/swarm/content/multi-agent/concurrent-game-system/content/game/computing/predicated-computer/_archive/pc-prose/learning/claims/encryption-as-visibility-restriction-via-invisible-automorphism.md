---
type: theorem
class: engineering-claim
status: proved
depends-on: [encryption, identity-key, settling-fiber-groupoid, invisible-automorphism-subgroup, visible-settling-fiber-groupoid, settling-associated-sheaf, hash-injectivity-under-canonical-form]
see-also: [audit-content-via-inconsistency-sheaf-cohomology, federation-trust-bilattice-graded, trust-boundary-modal-validity]
---

# Encryption restricts visibility via the invisible automorphism subgroup

**Claim.** For any substrate region $R$ encrypted under recipient identity-keys $K_1, \dots, K_n$, and any substrate $S$ federating with the encrypting substrate:

- If $S$ holds at least one $K_i$ (is a recipient), the encrypted region's contents act on $S$'s [settling-associated sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) and contribute to $S$'s cohomology — $S$ sees the region as fully *visible* in the substrate's structural sense.
- If $S$ holds no $K_i$ (is a non-recipient), the encrypted region's contents are in the [invisible automorphism subgroup](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md) $N(v)$ of $S$'s settling — they act trivially on $S$'s settling-associated sheaf and contribute nothing to $S$'s cohomology. $S$ sees only the encrypted-bytes wrapper, structurally indistinguishable (cohomologically) from any other ciphertext-of-the-same-shape.

The substrate-side encryption discipline is thereby *the operational realization of the visibility partition* in [visible-settling-fiber-groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/visible-settling-fiber-groupoid.md): recipient substrates work in the visible quotient on the encrypted region; non-recipient substrates see only the invisible-automorphism part.

## Why this holds

Per [invisible-automorphism-subgroup](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md), the invisible automorphism subgroup $N(v)$ of a settling $v$ comprises automorphisms that act trivially on the settling-associated sheaf $\mathcal{F}_U$ — i.e., they fix every cohomologically-relevant cell. Per [visible-settling-fiber-groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/visible-settling-fiber-groupoid.md), the visible quotient is where cohomology lives; the invisible part is the cosmetically-distinct-but-cohomologically-equal substructure.

Encryption operationalizes this for substrate cell-content:

**Part 1: Recipient substrates compute on the visible part.** A recipient $S$ holding key $K_i$ can decrypt the region $R$ to its plaintext value $v_R$. The plaintext acts on $S$'s settling-associated sheaf normally — its cells contribute to $S$'s $H^0$ (cell counts), it can produce $H^1$ obstructions (CRDT-coordination), it composes with $S$'s closure operator. Per the visible-settling-fiber-groupoid framing, $S$ sees the encrypted region as a fully-visible 0-cell of the settling-fiber groupoid.

**Part 2: Non-recipient substrates see only the invisible part.** A non-recipient $S'$ without any $K_i$ cannot decrypt $R$. $S'$ holds the ciphertext bytes $c_R$ but cannot derive the plaintext value. The ciphertext acts on $S'$'s settling-associated sheaf as a *constant wrapper* — it contributes one cell (the ciphertext itself) to $S'$'s $H^0$, but the wrapper's contents (the plaintext predications) don't appear in $S'$'s cohomology. The wrapper is structurally an automorphism of $S'$'s settling that acts trivially on the cohomologically-relevant content — i.e., it lies in $N(v_{S'})$.

Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the ciphertext has its own canonical hash distinct from the plaintext's hash. Per [federation-convergence](federation-convergence.md), federated substrates can route, deduplicate, and verify the ciphertext via its canonical hash without needing to decrypt — federation operates on the visible-to-everyone wrapper, while plaintext content stays in the invisible part for non-recipients.

**Part 3: The visibility partition is well-defined per recipient.** Per [identity-key](teaching/explanations/identity-key.md), each substrate's identity-records determine which keys it holds. The set of recipients of region $R$ is therefore a substrate-content predication; queryable, auditable, governance-controlled. Per [governance-decision-modal-decidability](governance-decision-modal-decidability.md), admitting a new recipient (widening visibility) is a decidable modal operation.

## Engineering consequence

- **Federation routes encrypted content without decrypting.** Per the invisible-automorphism framing, intermediaries can deduplicate, route, and verify-signature on encrypted regions via the ciphertext's canonical hash. Per [federation-convergence](federation-convergence.md), the federation discipline applies to the wrapper; per the theorem, the wrapper-only operations don't require decryption.
- **Non-recipient cohomology is unaffected by encrypted content.** A non-recipient substrate's cohomological computations (CRDT-coordination, settlement-determinism, federation-trust) are not affected by what an encrypted region contains. The encrypted content is in $N(v)$ — invisible to those computations.
- **Re-encryption preserves the invisibility partition.** A federation-bridge re-encrypting a region for different recipients moves the visibility partition; the new recipient set determines who sees the region as visible. Per [doctrine-fidelity-via-faithful-interfacer-functor](doctrine-fidelity-via-faithful-interfacer-functor.md), the re-encryption must be faithful on the predications it carries.
- **Decryption is a substrate operation.** Per [witness](teaching/explanations/witness.md), decrypting an encrypted region produces a witness recording the decryption event. The witness reveals which substrate decrypted with which key — auditable per the substrate's audit discipline.
- **Audit can detect attempted decryption without success.** A non-recipient substrate that attempts decryption produces a no-op witness (the operation fails because no key matches). Per [audit-content-via-inconsistency-sheaf-cohomology](audit-content-via-inconsistency-sheaf-cohomology.md), repeated failed decryptions appear in the inconsistency sheaf as $\top$-cells, surfacing potential attack patterns.

## What the theorem rules out

- **Encryption that doesn't preserve the visibility partition.** An "encryption" scheme where non-recipient substrates can derive cohomological content from the encrypted region (e.g., chosen-ciphertext leakage) is not implementing the invisible-automorphism framing. The substrate's discipline is to use cryptographically-secure encryption schemes whose ciphertext is structurally a constant for non-recipients.
- **Encrypted content with non-trivial structural side-channels.** A scheme where the ciphertext's *length* or *structure* leaks plaintext information cohomologically would put the encrypted region in a non-trivial part of the cohomology — violating the invisible-automorphism property. The substrate's discipline is to use length-padded, structure-randomized encryption schemes.
- **Federation that requires decryption to route.** A federation discipline that needs to read plaintext to deduplicate or route is incompatible with the invisible-automorphism framing — non-recipient intermediaries would need access to the visible part. The substrate's discipline is to use canonical-hash-based deduplication on ciphertext, per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md).

## What the theorem requires

- The encryption scheme is cryptographically secure (existential unforgeability, IND-CCA2 or similar).
- The substrate's recipient list for each encrypted region is recorded as substrate content (per [self-representation](teaching/explanations/self-representation.md)).
- Identity-keys are bound to specific substrates (per [identity-key](teaching/explanations/identity-key.md)).
- Canonical-form hashes are computed over ciphertext for federation purposes (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)).

## Position

This theorem grounds the substrate's encryption discipline in the predication-categories' visibility-quotient framework. Together with [audit-content-via-inconsistency-sheaf-cohomology](audit-content-via-inconsistency-sheaf-cohomology.md) and [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), it places the substrate's privacy-and-trust discipline in the same structural foundation as the substrate's content discipline. Encryption is a visibility partition; audit detects $\top$-cells in the inconsistency sheaf; federation trust is bilattice-graded accessibility. Three engineering surfaces of the same predication-categorical machinery.
