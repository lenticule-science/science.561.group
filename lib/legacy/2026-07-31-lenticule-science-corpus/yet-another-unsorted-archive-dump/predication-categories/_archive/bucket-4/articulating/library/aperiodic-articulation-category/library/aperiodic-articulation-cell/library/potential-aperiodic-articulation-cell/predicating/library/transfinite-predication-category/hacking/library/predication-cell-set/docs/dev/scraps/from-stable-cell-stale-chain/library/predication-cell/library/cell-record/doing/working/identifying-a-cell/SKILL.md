---
name: identifying-a-cell
description: The morphism cell-record → cell-id assigning each cell-record its content-addressed identifier. The identifier is determined by the record's content alone — two records with the same coordinates, value, and transaction-id receive the same identifier; two records that differ in any field receive different identifiers (collision probability bounded by the cryptographic hash family used in the realization).
---

## What this transformer is

Identifying-a-cell is the function $\mathrm{id} : \mathrm{CellRecord} \to \mathrm{CellId}$ that sends each cell-record to its content-addressed identifier. The function depends only on the record's content. Identity-of-records-under-id pulls back to equality of records under canonical serialization: two records receive equal identifiers exactly when their canonical encodings coincide.

The categorical content: $\mathrm{id}$ is a monomorphism on records-up-to-canonical-equivalence — it embeds the equivalence-classes of canonically-equivalent records into the discrete set of identifiers. Composing with any later morphism that consumes records can be replaced by an identifier-keyed lookup, decoupling the value-flow from the record-flow.

## Realization on this platform

1. The script reads a cell-record from the input.
2. It validates the record against the cell-record JSON Schema using ajv 2020.
3. It serializes the record as canonical JSON — keys sorted lexicographically at every object level, no whitespace, no NaN/Infinity, UTF-8.
4. It computes the SHA-256 digest of the canonical-JSON byte string using the Node crypto module and returns the 64-character lowercase hex string.

SHA-256 is the cryptographic hash chosen for this realization; the categorical role of $\mathrm{id}$ does not depend on the hash family — any collision-resistant function on canonical-JSON bytes realizes the same morphism. The canonical-JSON discipline is the relevant invariant on the realization side: two records with the same logical content must serialize to the same bytes.

## Failure modes

- Schema-violating input throws `TypeError`.
- Non-finite numbers in the record throw `RangeError` (canonical JSON has no NaN or Infinity).
