---
title: "Registry Specification"
date-created: 2026-03-04T00:00:00
---
Version: 0.1.0 (Draft)
Status: Normative
Scope: Local fragment (identifier governance and evolution)

---

## 1. Purpose

This document defines the governance, structure, and interpretation rules for all registries referenced by the Deterministic Event Stream specifications.

Registries do not add semantics. They *stabilize reference*. They ensure that identifiers used in records, algorithms, and verification have shared meaning across time and implementations.

Any identifier without a registry definition is undefined and MUST NOT be relied upon.

---

## 2. Registry Model

A registry is a **derived artifact**, not a primitive.

It depends on:
- Immutable identifiers
- Append-only publication
- Explicit versioning discipline

Registries are authoritative sources of meaning for identifiers referenced elsewhere in the specifications.

---

## 3. Registry Types

This specification defines the following registries:

### 3.1 Algorithm Identifier Registry (`algo`)

Defines:
- Canonicalization procedure
- Hash function
- Integrity construction
- All concatenation, initialization, and block rules

### 3.2 Reserved Field Registry

Defines:
- Field names with specified semantics
- Field types and constraints
- Whether fields are mandatory or optional

### 3.3 Namespace Registries (Optional)

Defines:
- Event `type` namespaces
- Event `code` namespaces
- Semantic domains for payload interpretation

Namespace registries are optional and application-scoped, but when present, they MUST follow the rules herein.

---

## 4. Registry Entries

Each registry entry MUST include:

- `id` (string)
  - Globally unique within the registry
- `status` (enum)
  - `active`, `deprecated`, or `reserved`
- `version` (string)
  - Semantic version identifier
- `definition` (text)
  - Complete, unambiguous description
- `introduced_in` (spec version)
- `supersedes` (optional list of ids)

Registry entries MUST be self-contained.

---

## 5. Immutability and Evolution

Registries are **append-only**.

Once published:
- An entry MUST NOT be modified
- An entry MUST NOT be removed
- An entry MAY be deprecated

Deprecation:
- Does not invalidate existing records
- Signals that new records SHOULD NOT use the identifier
- MUST NOT change semantics retroactively

Breaking changes require:
- A new identifier
- A new registry entry

---

## 6. Algorithm Registry Requirements

For `algo` entries specifically, the definition MUST fully specify:

- Canonicalization procedure or reference
- Hash function (including output size)
- Integrity construction (per-record, rolling, Merkle)
- Initialization rules
- Concatenation rules
- Block sizing and padding rules (if applicable)
- Domain separation or prefixes (if any)

Partial specification is forbidden.

If any ambiguity exists, the identifier is invalid.

---

## 7. Identifier Naming Rules

Identifiers MUST:
- Be ASCII strings
- Be stable and human-readable
- Avoid semantic overloading

Identifiers SHOULD:
- Encode major structural choices (e.g., `JCS-SHA256-ROLLING-V1`)
- Include an explicit version suffix

Identifiers MUST NOT:
- Rely on implicit defaults
- Change meaning across versions

---

## 8. Implementation Obligations

A conforming implementation MUST:
- Recognize only identifiers defined in registries it supports
- Reject unknown mandatory identifiers
- Preserve unknown optional identifiers without interpretation

An implementation MUST NOT:
- Guess semantics for unknown identifiers
- Partially implement a registry entry

---

## 9. Registry Publication

Registries MUST be:
- Published as versioned, immutable documents
- Publicly accessible
- Content-addressable or otherwise integrity-protected

Registry distribution mechanism is out of scope, but registry *contents* are normative.

---

## 10. Version Compatibility

Registry entries are versioned independently of the core specification.

An implementation MAY:
- Support a subset of registry entries
- Explicitly declare supported identifiers

An implementation MUST:
- Reject identifiers it does not support
- Not silently downgrade or reinterpret identifiers

---

## 11. Non-Goals

This document does not define:
- Registry hosting infrastructure
- Approval or governance bodies
- Access control
- Automated update mechanisms

These are external concerns.

---

## 12. Open Questions (Non-Normative)

- Whether to standardize machine-readable registry formats
- Whether to mandate cryptographic signatures on registries
- Whether to define a global namespace authority

These are intentionally unresolved.
