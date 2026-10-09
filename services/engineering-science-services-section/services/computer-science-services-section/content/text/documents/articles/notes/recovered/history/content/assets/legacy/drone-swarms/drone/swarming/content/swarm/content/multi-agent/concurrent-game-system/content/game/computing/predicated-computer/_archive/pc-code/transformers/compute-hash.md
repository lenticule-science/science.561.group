---
type: morphism
class: substrate-primitive
realizes: [hash-discipline]
depends-on: [canonicalize, hash-discipline]
see-also: [put-cell, has-cell]
---

# Compute hash

The operator that produces the canonical content-hash for a substrate object. Compute-hash is the substrate's primitive for assigning content-derived identity: the operator takes canonical-form bytes and returns the SHA-256 digest as a 64-character lowercase hexadecimal string.

## Signature

`compute-hash(canonical-bytes) → content-hash`

Input:

- **`canonical-bytes`** — bytes already passed through [canonicalize](canonicalize.md). The operator does not validate canonicality; the caller is responsible. (Implementations may, in safety-conscious modes, re-canonicalize and verify; in performance-conscious modes they accept the canonical bytes as given.)

Output:

- **`content-hash`** — the lowercase hexadecimal SHA-256 digest of the canonical-bytes; exactly 64 characters from `[0-9a-f]`.

## Operational semantics

Compute-hash is a single step:

1. *Apply SHA-256.* Run the SHA-256 algorithm on the input bytes, producing a 256-bit digest. Encode the digest as 64 lowercase hexadecimal characters.

The operation is pure: no substrate state is read or written.

## Engineering invariants

- **Pure.** Compute-hash has no side effects; it does not read or modify substrate state, does not consult external services, does not depend on wall-clock or environment.
- **Deterministic across hosts.** Two implementations on byte-identical input produce identical digests. SHA-256's standardization is what makes this admissible.
- **Collision-resistant in practice.** SHA-256's cryptographic properties make collisions infeasible to construct. The substrate's identity-by-hash discipline rests on this.
- **Independent of canonicalize.** The output depends only on the input bytes. If the caller passed non-canonical bytes, the output is the hash of those non-canonical bytes; that hash is meaningless for substrate identity but is computed as requested.

## Why SHA-256 specifically

The substrate commits to SHA-256 by default. Implementations may extend with versioned alternatives (SHA-3, BLAKE2, etc.), but the discipline is that:

- Cell-id format is exactly 64 lowercase hex characters (per the standard).
- Mixed-algorithm hashes within a single substrate are not admissible without versioned cell-id formats.
- A future alternative is admissible only as a substrate version increment.

Particular substrates may choose otherwise (for a substrate optimized for low-power devices, BLAKE3 might be preferred); the structural claim is that *whatever algorithm is chosen, it is locked at the substrate-version level*.

## Position in the substrate

Compute-hash is the substrate's *content-addressing arithmetic*. Together with [canonicalize](canonicalize.md) it produces the cell-id: canonicalize first, then compute-hash. The result is the substrate's identity for the content. Every store, every cross-reference, every witness, every federation handshake uses the result.

The discipline is what makes content-addressing meaningful across hosts and across time: a cell-id computed today on one host is the same as a cell-id computed tomorrow on another host for the same canonical content. Without compute-hash being deterministic and standardized, content-addressing collapses to host-local naming.
