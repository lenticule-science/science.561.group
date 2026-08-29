---
title: "Deterministic Event Stream Record and Integrity Specification"
date-created: 2026-03-04T00:00:00
---
# Deterministic Event Stream Record and Integrity Specification
Version: 0.1.0 (Draft)
Status: Provisional / Normative Core
Scope: Local fragment (event stream serialization and integrity only)

---

## 1. Purpose and Non-Goals

This specification defines a deterministic, byte-stable representation for ordered event streams, together with canonicalization and cryptographic integrity semantics sufficient for replay, verification, and partial audit. It is designed to be implementation-agnostic, language-neutral, and reproducible across time.

**Non-goals** (explicitly out of scope):
- Transport protocols
- Storage formats beyond serialized records
- Compression
- Encryption
- Authentication or authorization
- User interface or replay visualization
- Real-time guarantees
- Wall-clock synchronization

Any mechanism not defined herein MUST NOT be assumed by conforming implementations.

---

## 2. Terminology and Conformance Language

The key words **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** are to be interpreted as described in RFC 2119.

A **conforming producer** generates records and integrity artifacts that satisfy all MUST requirements.
A **conforming verifier** validates records and integrity artifacts according to the rules herein and fails on any violation.

---

## 3. Event Stream Model

An **event stream** is a finite or infinite ordered sequence of **event records**.

Ordering is **semantic**, not derived from clocks. Any temporal fields are advisory unless explicitly bound by a verifier.

Each stream MAY contain multiple logical sources; ordering across sources is defined only by explicit sequence fields.

---

## 4. Event Record Structure

An **event record** is a JSON object with the following required fields:

- `seq` (integer, non-negative)
  - Monotonically increasing within a given `source_id`.
- `mono_ts` (number)
  - Monotonic time since an origin local to the process or device.
- `source_id` (string)
  - Stable identifier for the emitting source.
- `type` (string)
  - Event class identifier.
- `code` (string)
  - Subtype or action identifier.
- `payload` (object)
  - Self-describing event data.
- `algo` (string)
  - Algorithm and canonicalization identifier.

Optional fields MAY be present but MUST be explicitly defined by a registry entry.

Unknown fields MUST be preserved during canonicalization but MUST NOT affect semantic interpretation unless registered.

---

## 5. Canonicalization

All records MUST be canonicalized prior to hashing using a deterministic JSON canonicalization procedure.

Unless otherwise specified by `algo`, canonicalization is defined as:
- UTF-8 encoding
- JSON Canonicalization Scheme (RFC 8785)
- No NaN, Infinity, or -Infinity values
- No insignificant trailing zeros
- Deterministic key ordering
- No whitespace outside of JSON syntax

Canonicalization is **normative**. Hashes computed over non-canonical forms are invalid.

---

## 6. Integrity and Hashing

Integrity is defined over canonicalized record bytes.

Each record MAY produce:
- A per-record hash
- A rolling hash
- A Merkle root over a block of records

If a rolling or Merkle scheme is used, the exact construction MUST be specified by the `algo` field.

Verifiers MUST reject records whose integrity artifacts cannot be reproduced exactly.

---

## 7. Algorithm Identification (`algo`)

The `algo` field is mandatory and normative.

It MUST uniquely identify:
- Canonicalization procedure
- Hash function
- Hash chaining or Merkle construction (if any)
- Encoding of intermediate values

Without a recognized `algo`, a record is uninterpretable and MUST be rejected.

---

## 8. Registries

This specification relies on append-only registries for:
- Algorithm identifiers
- Reserved field names
- Event `type` and `code` namespaces (optional)

Registry entries MUST NOT be redefined or altered once published.

---

## 9. Validation and Failure Modes

A verifier MUST fail on:
- Canonicalization violations
- Hash mismatches
- Sequence monotonicity violations
- Missing or unrecognized mandatory fields
- Unsupported `algo` identifiers

Failure MUST be explicit and local; partial verification MAY be supported if integrity construction permits prefix verification.

---

## 10. Security Considerations

This specification provides integrity only.

It does not provide:
- Confidentiality
- Authenticity
- Non-repudiation

Implementations MUST NOT infer such properties without external mechanisms.

---

## 11. Versioning

This document follows semantic versioning:
- Patch versions clarify without altering meaning.
- Minor versions add optional capabilities.
- Major versions may redefine semantics.

Records MUST declare the version of this specification they conform to, either implicitly via `algo` or explicitly via a version field.

---

## 12. Open Questions (Non-Normative)

- Minimum required fields for interoperability
- Standard block sizing for Merkle constructions
- Registry governance and publication mechanism

These are intentionally unresolved in this version.
