---
type: theorem
class: engineering-claim
status: proved
depends-on: [hash-discipline, canonical-form, predication-valuation]
see-also: [signature-binds-witness-to-identity, federation-convergence, cross-peer-trajectory-ordering-is-content-addressed, settlement-determinism]
---

# Substrate content's canonical hash is injective up to canonicalization

**Claim.** Two substrate-content artifacts (predications, reified messages, event-log entries, snapshots) that produce the same canonical hash are byte-identical after canonicalization. Conversely, two artifacts whose canonical-form serializations differ produce different hashes (assuming a collision-resistant hash function). The canonical hash is therefore a content identity for substrate artifacts modulo declared canonicalization rules.

For [predication valuations](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) specifically, this means that hash equality of two substrates' settled state implies value equality cellwise in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md): the substrate's hash is the engineering procedure for checking that two valuations are the same mathematical object.

## Why this holds

The argument is short.

**Part 1: Canonicalization is deterministic.** Per [canonical-form](teaching/explanations/canonical-form.md), the substrate's canonical-form discipline produces a byte-deterministic serialization of substrate content: same content yields same bytes, regardless of in-memory representation, regardless of host implementation, regardless of which fields were inserted in which order. Two artifacts with the same substrate content produce the same canonical-form serialization. For predication valuations, "same content" means cellwise-equal values in the fiber algebra; the canonical-form fixes a representation order on cells and a representation for each value in $\mathbf{L}^\bowtie$.

**Part 2: Hashing is collision-resistant on bytes.** Per [hash-discipline](teaching/explanations/hash-discipline.md), the substrate's hash function is a cryptographic hash (SHA-256 or equivalent) applied to canonical-form bytes. Cryptographic hashes are collision-resistant: producing two distinct byte strings with the same hash is computationally infeasible. Two artifacts whose canonical-form bytes differ produce hashes that differ with overwhelming probability.

Combining: same content → same canonical bytes → same hash; different canonical bytes → different hash (modulo the hash's collision resistance). The canonical hash is therefore an injection from canonical-form-equivalence classes of substrate content to hash values.

## Engineering consequence

The canonical hash is a *content identifier*: a fingerprint of substrate content that is stable across implementations, replicas, time, and host runtimes. Several engineering disciplines depend on this:

- **Content-addressed storage.** Per [content-addressed-store](../objects/content-addressed-store.md), substrate cells are referenced by their canonical hash. Two cells with the same hash are byte-identical; reference equality is content equality.
- **Idempotent message admission.** Per [reification](teaching/explanations/reification.md), reified messages are content-addressed. Admitting the same message twice produces no duplicate effect; the substrate's admission discipline detects the duplicate by hash-equality.
- **Replay-equivalence verification.** Per [source-of-truth](teaching/explanations/source-of-truth.md), two substrates with the same event log produce the same predication settling. Verifying this is computing the canonical hash of each substrate's working valuation and comparing; injectivity makes the comparison decisive.
- **Federation deduplication.** Per [federation-convergence](federation-convergence.md), substrates exchanging events deduplicate by hash. Injectivity ensures that hash-equality means content-equality, so deduplication does not silently drop different-content events that happen to hash the same. Combined with closure-merge commutation, this is what gives substrate-level CRDT convergence.
- **Canonical total order on cells.** The hash function's range carries a total order (lexicographic on the byte string). Composed with canonical-form-then-hash, this lifts to a total order on canonical-form-equivalence classes of substrate content that is *peer-independent*: two substrates ordering the same set of cells by canonical hash produce the same sequence. Per [cross-peer-trajectory-ordering-is-content-addressed](cross-peer-trajectory-ordering-is-content-addressed.md), federation tie-breaks (concurrent writes to the same cell, equally-ranked candidates in a fold, equally-prioritized scheduler queue items) resolve by canonical-hash order — the substrate need not coordinate to agree on tie-breaks, because the order is structural in the hash.
- **Witness-chain integrity.** Per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md), a witness's signature is over its canonical-form hash. Hash-injectivity is what makes signature verification *content-binding*: a signature over hash $h$ binds to whichever canonical content produces $h$, and injectivity guarantees that content is unique.
- **Snapshot equivalence.** Per [snapshot](../objects/snapshot.md), two snapshots with the same canonical hash represent the same substrate state. The substrate's snapshot-equality check is hash comparison; injectivity makes the comparison decisive.

## What the theorem rules out

A substrate that hashes pre-canonicalization bytes (raw JSON with arbitrary field ordering, raw markdown with unstable whitespace) loses injectivity: two artifacts with the same content but different serializations hash differently. The substrate's response is to canonicalize before hashing — every hash operation reads canonical-form bytes, never raw input. Implementations that hash raw bytes accumulate spurious hash differences and break content-addressed disciplines downstream.

A substrate whose canonical-form is incomplete — fields whose serialization is implementation-dependent (locale-sensitive number formatting, time-zone-sensitive timestamps without explicit zone) — also loses injectivity. The substrate's discipline is to make canonical-form deterministic across implementations; any implementation-dependent serialization is a violation.

## What the theorem requires

- Canonical-form is deterministic (per [canonical-form](teaching/explanations/canonical-form.md)) on the predication-valuation's representation.
- The hash function is collision-resistant.
- Substrate operations hash canonical-form bytes, never raw bytes.
- Canonical-form rules cover all field types the substrate admits (no implementation-dependent serialization), including the residuated lattice $\mathbf{L}$'s value representations and the entity / predicate / cell ordering conventions.

Standard cryptographic-hash properties (collision resistance, preimage resistance) follow from the hash function's design; SHA-256 is the typical choice in substrate implementations. The substrate's canonical-form discipline is its own engineering content; the discipline is what the substrate's engineering establishes.

## Position

This theorem is the substrate's deepest load-bearing identity claim: more disciplines depend on it than on any other engineering theorem in the predicated-computing theory. Content-addressed storage, idempotent admission, federation deduplication, replay-equivalence verification, witness signing, snapshot equality, and federation tie-break ordering are seven *distinct* substrate disciplines that all reduce to "compare canonical hashes" — a single primitive whose correctness is exactly what this theorem establishes. Together with [canonical-form](teaching/explanations/canonical-form.md) (which fixes the deterministic byte representation) and [hash-discipline](teaching/explanations/hash-discipline.md) (which fixes the cryptographic hash function), the theorem closes the substrate's content-identity question: "are these two artifacts the same?" is decidable in constant time after canonicalization, and the answer is binding under the substrate's full discipline stack.
