---
title: Load Section
id: load-section
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: "Math-level operator mirroring machine load: materialises a section from encoded data."
---



Math-level operator mirroring machine load: materialises a section from encoded
data.

## Definition
- Inputs: encoded section per [Section Encoding Schema](./section-encoding-schema.md).
- Output: [Hypertensor Section](./hypertensor-section.md) in memory.
- Behaviour: decode the payload, validate against schema, and instantiate section.

## Invariants
- Fidelity: decoded section matches encoding.
- Safety: invalid encodings yield failure (via failure algebra).

## Proof
- Uses: encoding schema to decode safely.
- Produces: section or failure.
- Shows that: loading a section is well-defined at the math level.

## Earlier material

## Definition
- Inputs: encoded section per [Section Encoding Schema](section-encoding-schema.md).
- Output: [Hypertensor Section](hypertensor-section.md) in memory.
- Behaviour: decode the payload, validate against schema, and instantiate section.
