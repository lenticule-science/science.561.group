---
title: "Conformance and Verification Specification"
date-created: 2026-03-04T00:00:00
---
# Conformance and Verification Specification
Version: 0.1.0 (Draft)
Status: Normative
Scope: Local fragment (producer and verifier obligations)

---

## 1. Purpose

This document defines what it means to **conform** to the Deterministic Event Stream Record specification.

It does not add new semantics. It makes existing semantics operational by specifying:
- Required checks
- Failure classifications
- Minimal compliance profiles

Without this document, independent implementations may satisfy the letter of the other specifications while diverging operationally.

---

## 2. Roles

This specification defines two normative roles:

- **Conforming Producer**
- **Conforming Verifier**

An implementation MAY implement both roles, but conformance is evaluated per role.

---

## 3. Conforming Producer Obligations

A conforming producer MUST:

1. Emit event records that satisfy the structural requirements of the Event Record Specification.
2. Ensure that all emitted records:
   - Are valid JSON objects
   - Are canonicalizable under the declared `algo`
3. Declare an `algo` identifier that:
   - Is recognized by the verifier
   - Fully specifies canonicalization and integrity semantics
4. Compute any included integrity artifacts exactly as defined by the declared `algo`.

A producer MUST NOT:
- Emit records that depend on undefined registry entries
- Emit integrity artifacts computed over non-canonical bytes
- Rely on verifier-side repair or coercion

Producers are not required to include integrity artifacts unless mandated by an application profile.

---

## 4. Conforming Verifier Obligations

A conforming verifier MUST implement the following verification pipeline, in order:

1. **Parsing**
   - Parse input as JSON
   - Fail if parsing fails

2. **Structural Validation**
   - Verify presence and type of all mandatory fields
   - Verify monotonicity constraints (`seq` per `source_id`)
   - Fail on any violation

3. **Canonicalization**
   - Canonicalize the record according to `CANONICALIZATION.md`
   - Fail if canonicalization fails

4. **Algorithm Resolution**
   - Resolve the declared `algo` identifier
   - Fail if `algo` is unknown or unsupported

5. **Integrity Verification**
   - Recompute required integrity artifacts
   - Compare results byte-for-byte
   - Fail on mismatch or omission

A verifier MUST perform these steps deterministically and without side effects.

---

## 5. Verification Profiles

This specification defines the following minimal verification profiles.

### 5.1 Basic Verifier (Required)

A Basic Verifier MUST:
- Perform parsing, structural validation, canonicalization, and algorithm resolution
- Recompute integrity artifacts only if present
- Enforce sequence monotonicity per `source_id`

This is the minimum level of conformance.

### 5.2 Strict Verifier (Optional)

A Strict Verifier MAY additionally:
- Require specific integrity artifacts (e.g., rolling hash)
- Enforce block completeness for Merkle constructions
- Reject records with unknown optional fields

Strictness MUST be explicit and configurable.

---

## 6. Failure Classification

Failures are classified as follows:

- **Structural Failure**
  - Missing or malformed required fields
  - Sequence violations

- **Canonicalization Failure**
  - Invalid JSON
  - Forbidden numeric values
  - Canonicalization rule violations

- **Algorithm Failure**
  - Unknown or ambiguous `algo`
  - Unsupported hash or construction

- **Integrity Failure**
  - Hash mismatch
  - Missing required integrity artifacts

Failure classification MUST be reported explicitly.

---

## 7. Failure Semantics

On failure, a verifier MUST:

- Halt verification at the first detected violation
- Report the failure class
- NOT attempt automatic repair or normalization

A verifier MAY support partial verification (e.g., prefix-only), but MUST clearly indicate the verification scope.

Silent failure or implicit coercion is forbidden.

---

## 8. Partial Verification

If an integrity construction supports prefix verification (e.g., rolling hash):

- A verifier MAY verify a prefix of a stream
- The verified prefix MUST be explicitly bounded
- No claims may be made about unverified suffixes

Partial verification MUST NOT be conflated with full stream verification.

---

## 9. Reporting Requirements

A conforming verifier SHOULD report:
- The highest verified record index or sequence
- The integrity artifacts checked
- The verification profile used

Reporting format is non-normative.

---

## 10. Version Compatibility

A verifier MUST:
- Reject records declaring incompatible major versions
- Accept patch-level clarifications
- Treat minor version extensions as optional unless required by policy

Version compatibility rules MUST be applied before semantic interpretation.

---

## 11. Non-Goals

This document does not define:
- Error message formats
- Logging or telemetry
- User-facing diagnostics
- Recovery strategies

These are implementation concerns.

---

## 12. Open Questions (Non-Normative)

- Whether to standardize error codes
- Whether to define machine-readable verification reports
- Whether to mandate integrity artifacts in the Basic Verifier profile

These are intentionally unresolved.
