---
name: negating
description: Apply a bilattice's unary negation ~ to a bilattice-value. Antitone in the truth order, monotone in the knowledge order, involutive.
---

## Requirements

- A `bilattice-value` instance conforming to [the bilattice-value JSON Schema](../../../../../bilattice-value/bilattice-value.schema.json) — an object `{ bilattice, value }` where `bilattice` conforms to [the bilattice JSON Schema](../../../../bilattice.schema.json) and `value` is an element of `bilattice.carrier`.
- The embedded `bilattice` must carry a `negating` table mapping each carrier element to a carrier element.

## Steps

1. Validate the input against [the bilattice-value JSON Schema](../../../../../bilattice-value/bilattice-value.schema.json) using `ajv` (structural shape: required fields, types, conformance of `bilattice` to its own schema).
2. Check the carrier-membership predicate `value ∈ bilattice.carrier`. Reject if violated.
3. Check that `bilattice.negating` is present and defines a carrier element for `value`. Reject if violated.
4. Return `{ bilattice, value: bilattice.negating[value] }` — a new `bilattice-value` in the same `bilattice` whose `value` is the negation table's image of the input.

## Outcomes

- The caller receives a `bilattice-value` of the same shape as the input.
- The skill performs no file or substrate writes; it is a pure function on the negation table.
- Schema-violating, carrier-membership-violating, or missing-negation-table inputs throw.
- Iterated application is involutive on the bilattice's negation (mathematical fact, not enforced by this skill).
