---
type: concept
class: discipline
depends-on: [canonical-form, predication-fiber-algebra, jung-rivieccio-duality, paired-priestley-space, settling-quiescence]
see-also: [witness, determinism, hash-injectivity-under-canonical-form, canonical-form-via-settling-quiescence]
---

# Hash discipline

The discipline that the *identity* of a piece of content in the [predicated computer](../objects/predicated-computer.md) is the SHA-256 digest of its [canonical-form](canonical-form.md) byte-encoding. In the substrate's hyperdoctrine setting, this is not just a programming convention — it is *the substrate-side computational presentation of [Jung-Rivieccio duality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/jung-rivieccio-duality.md)*: the canonical form encodes a substrate value's [paired Priestley dual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paired-priestley-space.md), and the SHA-256 hash is a finite fingerprint of that dual presentation. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the resulting hash function is injective up to the duality: two values with the same hash are dual-equivalent, hence cellwise-equal in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md).

Every cache key, every cross-reference between predications, every before-hash and after-hash in a [witness](witness.md) entry is such a digest. Two contents with the same hash are the same content; two with different hashes are different.

## Why this works structurally

The discipline removes a class of bugs in which "the same data" appears in two slightly different forms (different key order, different whitespace, different number representation) and is treated as different by the system. With canonical form locked and the hash computed only from canonical bytes, the equality test on content reduces to integer equality of digests — a cheap, total, host-independent operation.

The structural reason this is *correct* (not just convenient): per [canonical-form](canonical-form.md), the canonical form is the substrate-side enumeration of points in the value's Priestley dual. Per [jung-rivieccio-duality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/jung-rivieccio-duality.md), the duality is a contravariant *equivalence* of categories — distinct fiber-algebra values have distinct duals. The canonical form is therefore a faithful representation of the value, and the SHA-256 hash is a faithful (collision-resistant) fingerprint of the canonical form. The chain *value $\to$ Priestley dual $\to$ canonical form $\to$ hash* is injective at every step.

## Three engineering consequences

- **Caches are by-content.** An operator applied at the same operand — where "same" means same canonical hash — is computed once per execution, regardless of how many times the operand appears in the input. The cache is a map from canonical hash to result, populated during operator execution and discarded at the end (or persisted to the [event log](../objects/event-log.md), depending on operator policy).
- **Cross-references are content-addressed.** A predication that refers to another section refers to it by canonical hash, not by name or by position. This is what makes a section self-contained: an auditor in possession of the section bytes and the hashes it cites can resolve every reference. Per the duality, the hash uniquely determines the dual point — the auditor can locate the referenced value in any substrate that has it.
- **The witness chain is verifiable bytewise.** Each witness entry's hashes are SHA-256 digests an auditor can compute independently. The chain's integrity is checked by recomputing each hash from the canonical bytes and comparing with the witness; no semantic understanding is required.

## Hash composition mirrors fiber composition

When two substrate values $v_1, v_2 \in A_p$ are combined via a fiber operation (e.g., $\vee_k$, $\wedge_t$, $\odot$), the canonical form of the result is determined by the canonical forms of the inputs and the operation. The hash of the result is *not* a function of the input hashes (the hash is one-way), but it is *deterministic* given the inputs — replaying the operation on the same input hashes produces the same output hash. Per [settlement-determinism](../theorems/settlement-determinism.md), this is exactly the substrate's replay-equivalence guarantee.

## Position in the substrate

The discipline applies uniformly to predication content, to repair-log entries, to operator inputs and outputs, and to the substrate's own machinery — closure rules, shapes, operation specifications. It is the substrate's commitment to *content rather than reference* as the meaning-bearing unit.

A predicated computer that maintains the discipline is one whose content has a global, host-independent identity rooted in the value-domain's Priestley duality; a predicated computer that does not is one whose audit and federation guarantees are compromised exactly where the discipline lapses.
