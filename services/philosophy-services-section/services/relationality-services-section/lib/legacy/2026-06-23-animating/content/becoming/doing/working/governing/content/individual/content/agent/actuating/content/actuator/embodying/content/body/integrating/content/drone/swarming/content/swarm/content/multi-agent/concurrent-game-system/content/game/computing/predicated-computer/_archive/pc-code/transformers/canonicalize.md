---
type: morphism
class: substrate-primitive
realizes: [canonical-form]
depends-on: [canonical-form]
see-also: [compute-hash, put-cell]
---

# Canonicalize

The operator that converts a substrate object's bytes into the unique canonical-form representation of its content. Canonicalize is the substrate's primitive for producing the byte-string that hashes to the object's identity; every operation that needs an object's hash, every cross-reference, every cache key, every witness entry depends on a prior canonicalize.

## Signature

`canonicalize(input-bytes) → canonical-bytes | error`

Input:

- **`input-bytes`** — the byte sequence representing a substrate object: typically JSON, possibly with arbitrary key ordering, whitespace, number formatting, escape choices.

Output:

- **`canonical-bytes`** — the unique canonical-form serialization per [canonical-form](teaching/explanations/canonical-form.md) rules: lexicographically sorted keys (in JSON), declared array order preserved, minimal-form numbers, minimal-form string escapes, UTF-8 with no BOM, no whitespace outside string values.
- **`error`** — input is not parseable into the substrate's schema, or the input violates a schema constraint that canonicalization cannot resolve.

## Operational semantics

Canonicalize proceeds in five steps:

1. *Parse.* Validate the input is well-formed (UTF-8 JSON, satisfying the substrate's cell schema). Failures abort.
2. *Sort keys.* Recursively sort all object keys lexicographically by codepoint order.
3. *Normalize values.* Apply per-type canonicalization: numbers to shortest-round-trip decimal form; strings with minimal-form JSON escapes; declared-order arrays untouched in semantic order; Booleans only where the carrier admits them.
4. *Apply ordering constraints.* Per [canonical-form](teaching/explanations/canonical-form.md), preserve semantic ordering on arrays the producer declared as ordered (sections in section-order, repair-log entries in chronological order, evidence-arrays in causal order). Re-sorting these arrays is a violation.
5. *Encode.* Emit the result as UTF-8 bytes with no BOM and no whitespace outside string values.

## Engineering invariants

- **Total.** Every well-formed input produces exactly one canonical output; equality of inputs is equality of outputs.
- **Idempotent.** `canonicalize(canonicalize(x)) = canonicalize(x)`. The canonical form is a fixed point.
- **Schema-validated.** The output passes the substrate's cell-schema validation; canonicalize is not just a formatting operation but a schema-enforcing one.
- **Deterministic across hosts.** Two implementations of canonicalize produce byte-identical output on byte-identical input. Per [determinism](teaching/explanations/determinism.md).

## Failure modes

- **Parse error.** Input is not valid UTF-8 JSON or fails the substrate's cell schema. Canonicalize returns an error; the substrate's audit records the rejection.
- **Schema violation.** Input is parseable but violates a constraint canonicalization cannot resolve (e.g., a forbidden top-level key). Returned as a schema violation error.

## Position in the substrate

Canonicalize is the substrate's *make-this-content-content-addressable* primitive. The output is what [compute-hash](compute-hash.md) computes the hash of; the hash is what [put-cell](put-cell.md) writes the file under; the file's identity is the hash. The chain of canonicalize → hash → put-cell is the substrate's complete persistence pipeline.

Operators throughout the substrate canonicalize before hashing, comparing, persisting, transmitting, or witnessing. Skipping the canonicalize step is the substrate's number-one source of byte-level non-determinism: two operators that build "the same" object differently produce different bytes, different hashes, different witness entries, breaking the substrate's audit chain.
