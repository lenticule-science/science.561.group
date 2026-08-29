---
title: "Integrity and Hashing Specification"
date-created: 2026-03-04T00:00:00
---
# Integrity and Hashing Specification
Version: 0.1.0 (Draft)
Status: Normative
Scope: Local fragment (cryptographic integrity over canonicalized event streams)

---

## 1. Purpose

This document defines the integrity mechanisms applicable to canonicalized event records.

Integrity, in this specification, means **byte-exact reproducibility** of cryptographic artifacts from canonicalized input. No claims are made about authenticity, identity, or trust without external mechanisms.

All integrity constructions defined here operate **only** over the canonical byte output defined in `CANONICALIZATION.md`.

---

## 2. Integrity Model

Integrity is a **derived structure**, not primitive.

It depends on:
- Canonicalized byte sequences
- A cryptographic hash function
- An explicit composition rule (per-record, rolling, or Merkle)

No integrity mechanism is implicit. All constructions MUST be declared via the `algo` field.

---

## 3. Hash Primitives

An integrity construction MUST specify a cryptographic hash function with the following properties:
- Deterministic
- Fixed-length output
- Collision-resistant under standard assumptions

Hash inputs are byte sequences only. Textual or structured inputs are forbidden at this stage.

The default hash function, unless overridden by `algo`, is **SHA-256**.

---

## 4. Per-Record Hash

A **per-record hash** is computed as:

H_i = HASH( C_i )

yaml
Copy code

Where:
- `C_i` is the canonical byte sequence of record `i`
- `HASH` is the hash function specified by `algo`

Per-record hashes:
- Are local to a single record
- Provide no ordering guarantees
- MAY be omitted if another construction subsumes them

---

## 5. Rolling Hash Construction

A **rolling hash** binds records into an ordered chain.

### 5.1 Definition

For record `i`, the rolling hash is defined as:

R_0 = HASH( C_0 )
R_i = HASH( R_{i-1} || C_i )

yaml
Copy code

Where `||` denotes byte concatenation.

### 5.2 Properties

- Order-sensitive
- Prefix-verifiable
- Any modification to a record or its position invalidates all subsequent hashes

### 5.3 Requirements

- The initial value (`R_0`) MUST be defined explicitly
- No implicit salt or domain separation is permitted unless specified by `algo`
- Byte concatenation MUST be unambiguous (fixed-length hash outputs satisfy this)

---

## 6. Merkle Tree Construction

A **Merkle construction** binds a finite block of records.

### 6.1 Leaves

Each leaf hash is defined as:

L_i = HASH( C_i )

csharp
Copy code

### 6.2 Internal Nodes

Internal nodes are computed as:

N = HASH( left || right )

yaml
Copy code

If a level has an odd number of nodes, the final node MAY be:
- Promoted unchanged, or
- Duplicated and hashed with itself

The chosen rule MUST be specified by `algo`.

### 6.3 Root

The Merkle root uniquely commits to:
- Record contents
- Record ordering within the block

### 6.4 Block Semantics

- Block boundaries MUST be explicit
- No record may belong to multiple blocks unless duplicated intentionally
- Merkle constructions are not inherently streaming; they are block-scoped

---

## 7. Declaring Integrity Artifacts

Records MAY include integrity artifacts such as:
- `record_hash`
- `rolling_hash`
- `merkle_root`

If present:
- Their computation MUST exactly follow the declared `algo`
- Verifiers MUST recompute and compare byte-for-byte

Artifacts are advisory unless a verifier is configured to require them.

---

## 8. Algorithm Binding (`algo`)

The `algo` identifier MUST fully specify:
- Hash function
- Rolling vs Merkle vs per-record semantics
- Concatenation rules
- Block sizing (if applicable)
- Any domain separation or prefixes

Partial specification is forbidden.

If two implementations interpret an `algo` differently, the `algo` is invalid.

---

## 9. Verification Semantics

A verifier MUST:
- Canonicalize records
- Recompute integrity artifacts
- Compare results exactly

Verification MAY be:
- Prefix-limited (rolling hash)
- Block-limited (Merkle root)

Verification MUST fail on the first detected inconsistency unless explicitly configured otherwise.

---

## 10. Failure Modes

Integrity verification MUST fail if:
- Canonicalization fails
- Hash outputs differ
- Ordering assumptions are violated
- Required integrity artifacts are missing
- `algo` is unknown or unsupported

Failures are local and non-recoverable without external intervention.

---

## 11. Security Considerations

This specification assumes:
- Hash functions behave as modeled
- Canonicalization is stable and correct

It does NOT protect against:
- Key substitution
- Replay attacks
- Malicious but hash-consistent streams

Such properties require additional layers not defined here.

---

## 12. Open Questions (Non-Normative)

- Whether to require domain separation tags by default
- Standard block sizes for Merkle constructions
- Mixed rolling + Merkle hybrid constructions

These are intentionally unresolved.