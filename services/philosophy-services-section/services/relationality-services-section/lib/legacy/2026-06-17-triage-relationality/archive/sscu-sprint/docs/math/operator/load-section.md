---
title: Load Section
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



Math-level operator mirroring machine load: materialises a section from encoded
data.

## Definition
- Inputs: encoded section per [Section Encoding Schema](../structure/section-encoding-schema.md).
- Output: [Hypertensor Section](../structure/hypertensor-section.md) in memory.
- Behaviour: decode the payload, validate against schema, and instantiate section.

## Invariants
- Fidelity: decoded section matches encoding.
- Safety: invalid encodings yield failure (via failure algebra).

## Proof
- Uses: encoding schema to decode safely.
- Produces: section or failure.
- Shows that: loading a section is well-defined at the math level.
