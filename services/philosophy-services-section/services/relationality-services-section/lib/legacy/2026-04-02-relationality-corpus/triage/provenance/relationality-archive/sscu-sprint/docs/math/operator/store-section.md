---
name: store-section
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Math-level operator mirroring machine store: encodes a section for persistence.

## Definition
- Inputs: a [Hypertensor Section](../structure/hypertensor-section.md) and
  [Section Encoding Schema](../structure/section-encoding-schema.md).
- Output: section with attached encoding (or emitted encoding payload).
- Behaviour: serialize per schema; update hashes/digests.

## Invariants
- Round-trip fidelity with load.
- Deterministic encoding.

## Proof
- Uses: encoding schema.
- Produces: encoded section payload.
- Shows that: storing a section is well-defined for persistence.
