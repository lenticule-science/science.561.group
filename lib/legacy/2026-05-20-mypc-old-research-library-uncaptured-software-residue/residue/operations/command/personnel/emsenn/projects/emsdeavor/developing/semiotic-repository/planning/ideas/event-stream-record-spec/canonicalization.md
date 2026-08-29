---
title: "Canonicalization Specification"
date-created: 2026-03-04T00:00:00
---
# Canonicalization Specification
Version: 0.1.0 (Draft)
Status: Normative
Scope: Local fragment (byte-level canonical form for event records)

---

## 1. Purpose

This document defines the exact canonical byte representation used for hashing and integrity verification of event records.

Canonicalization is **normative and mandatory**. Any hash, signature, Merkle construction, or integrity artifact defined elsewhere is computed **only** over canonicalized bytes as defined here.

If two implementations produce different byte sequences from the same logical record, at least one is non-conforming.

---

## 2. Canonicalization Model

Canonicalization is a **derived operator**, not primitive.

It depends on:
- UTF-8 text encoding
- A deterministic JSON serialization
- A closed set of allowed scalar values

Canonicalization is **pure**: it has no side effects and no dependence on environment, locale, or runtime.

---

## 3. Input Domain

The input to canonicalization MUST be a JSON value that is:
- A JSON object at the top level
- Fully materialized (no streaming or lazy evaluation)
- Free of implementation-specific extensions

The following JSON scalar values are **forbidden**:
- NaN
- Infinity
- -Infinity

If present, canonicalization MUST fail.

---

## 4. Canonical JSON Form

Unless overridden by the `algo` field, canonicalization MUST follow the JSON Canonicalization Scheme as defined in RFC 8785, with the following constraints made explicit:

### 4.1 Character Encoding
- UTF-8 encoding only
- No byte order mark (BOM)
- All characters MUST be representable in Unicode

### 4.2 Object Member Ordering
- Object keys MUST be ordered lexicographically by Unicode code point
- Ordering is total and deterministic

### 4.3 Whitespace
- No insignificant whitespace is permitted
- Only JSON-required structural characters MAY appear

### 4.4 Numbers
- Numbers MUST be represented in their shortest decimal form
- No leading zeros (except for zero itself)
- No trailing decimal point
- No exponent unless required
- Negative zero (`-0`) is forbidden

If a number cannot be rendered without ambiguity, canonicalization MUST fail.

### 4.5 Strings
- Strings MUST use JSON string encoding
- Escape sequences MUST be minimized
- Characters that can be represented literally MUST NOT be escaped

### 4.6 Arrays
- Array ordering is preserved
- No reordering or normalization is permitted

---

## 5. Field Preservation Rules

Canonicalization MUST preserve:
- All object members, including unknown or unregistered fields
- Exact structural nesting
- Exact array ordering

Canonicalization MUST NOT:
- Drop fields
- Rename fields
- Coerce types
- Apply semantic interpretation

Canonicalization is syntactic, not semantic.

---

## 6. Failure Semantics

Canonicalization MUST fail if:
- Input is not valid JSON
- Forbidden numeric values are present
- UTF-8 encoding is invalid
- Any rule in Section 4 is violated

Failure MUST be explicit and MUST prevent downstream hashing or verification.

---

## 7. Byte Output

The output of canonicalization is:
- A sequence of UTF-8 encoded bytes
- With no trailing newline
- With no additional framing or length prefix

This byte sequence is the **sole valid input** to integrity algorithms.

---

## 8. Interaction with `algo`

The `algo` field MAY specify:
- An alternative canonicalization procedure
- Additional constraints or profiles

If `algo` specifies canonicalization behavior, it MUST do so completely and unambiguously.

In the absence of such specification, this document is authoritative.

---

## 9. Security and Stability Considerations

Canonicalization stability is a security property.

Any change to these rules:
- Alters hash outputs
- Invalidates existing integrity artifacts

Therefore:
- Changes require a new `algo` identifier
- Silent modification is forbidden

---

## 10. Open Questions (Non-Normative)

- Whether to forbid extremely large integers
- Whether to constrain maximum nesting depth
- Whether to define a canonical float-to-decimal algorithm explicitly

These are intentionally unresolved in this version.
