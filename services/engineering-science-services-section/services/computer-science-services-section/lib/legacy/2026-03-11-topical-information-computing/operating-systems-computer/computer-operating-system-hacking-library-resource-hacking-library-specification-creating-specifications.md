---

title: "Creating Specifications"
date-created: 2026-03-06
date-modified: 2026-04-01
keywords:
  - specification
  - technology
description: "A normative scaffold for writing specifications: versioning, canonicalization, error semantics, conformance, and document hygiene."
---

This text describes how to write [specifications](../terms/specification.md) that are enforceable — versioned, canonicalizable, test-mapped, and deterministic.
It exists to make specs usable as contracts: readable by humans, actionable by agents, and checkable by tools.

## The specification as transformer

In the "contract as transformer" framing:

- **Inputs**: a spec artifact (Markdown/plaintext) and its declared versioning/stability metadata
- **Constraints**: normative language and hygiene rules; canonicalization; determinism; conformance mapping
- **Outputs**: a conformance matrix; executable tests/fixtures; machine-readable diagnostics for violations

## Normative scaffold

### A.1 Versioning (MUST)

- Version identifiers MUST follow `MAJOR.
  MINOR.
  PATCH` where:
  - MAJOR: backward-incompatible changes.
  - MINOR: backward-compatible feature additions.
  - PATCH: backward-compatible fixes and clarifications.
- Each spec artifact MUST declare `spec-id`, `version`, `release-date (UTC, YYYY-MM-DD)`, and `stability` in {draft, candidate, stable, deprecated}.
- Wire formats and behavior linked to a MAJOR version MUST remain stable within that MAJOR series.

### A.2 Canonicalization (MUST)

- Define a single canonical byte sequence for all serializable artifacts.
- Rules MUST specify:
  - Field ordering and omission rules.
  - String normalization (Unicode NFC), whitespace policy, and number formatting.
  - Deterministic map/dict ordering.
  - Binary encoding and endianness.
- A reference function `CANON(x) -> bytes` MUST be specified and testable (golden vectors).

### A.3 Error Semantics (MUST)

- Errors MUST use a stable schema with fields:
  - `code` (stable, machine-readable), `name`, `severity` in {info, warn, error, fatal},
  - `where` (component/module), `when` (UTC timestamp), `correlation-id`,
  - `fault` (producer/consumer), `retryable` (bool), `data` (opaque).
- Define error classes:
  - Input/validation, Canonicalization, Version/feature, State/consistency, I/O/transport, Security/authz.
- Each algorithm step MUST specify which errors it can emit and under what preconditions.
- Ambiguities MUST be errors (not "unspecified behavior").

### A.4 Conformance (MUST/SHOULD)

- Provide a conformance matrix listing each normative "MUST/SHOULD/MAY" and the actor(s) it binds (producer, consumer, intermediary, validator).
- Publish an executable conformance suite with:
  - Golden inputs/outputs, negative cases, fuzz corpus seeds, and determinism checks.
- Implementations MUST declare a `conformance-profile` referencing matrix rows and test IDs.

### A.5 Upgrade Path (SHOULD)

- Specify negotiated capabilities:
  - Feature flags, version ranges, and fallback behavior.
- Define deprecation windows:
  - Announcement, availability of dual-stack behavior, removal.
- Specify migration tools/artifacts:
  - Translators, shims, and data backfills with idempotency guarantees.

### A.6 Security and Privacy Notes (MUST)

- Enumerate attacker models and trust boundaries.
- State confidentiality/integrity expectations for canonical bytes on the wire and at rest.
- Specify required mitigations (authn/authz, replay protection, input limits, timing channels).
- Define data retention and minimization requirements.

### A.7 Interop and Determinism (MUST)

- All observable outputs for the same canonical inputs MUST be bit-for-bit identical across conforming implementations.
- Randomness MUST be explicitly parameterized and seeded via inputs; otherwise it is forbidden in normative algorithms.

### A.8 Registries and Extension Points (MAY/SHOULD)

- If extension points exist, define:
  - Registration policy, review process, collision handling, and permanence.
- Each registry entry MUST include: identifier, status, spec reference, and security notes.

### A.9 Formal Artifacts (SHOULD)

- Provide machine-readable schemas (e.g., JSON Schema/ASN.
  1/IDL) and reference TCK hooks.
- Include pseudo-code that is executable or trivially transpilable.

### A.10 Document Hygiene (MUST)

- Each "MUST/SHOULD/MAY" statement is normative and test-mapped (link to conformance ID).
- All examples MUST indicate whether they are normative (golden) or informative (illustrative).
- The spec MUST include a glossary and an explicit non-normative "Rationale" annex.
