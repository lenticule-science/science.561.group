---
name: relation-duality
role: structure
derived_from:
- acts/relate
- acts/not-relate
- acts/witness
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Structure capturing the complementary pair `Relate` / `NotRelate` and their
two-sided witness.

## Components

- Positive relation witness (`Relate`).
- Negative relation witness (`NotRelate`).
- Composite witness (`Witness`) testifying to both.

## Proof

Sketch: `Relate` and `NotRelate` come from reflex recognition; their composite
is `Witness`, providing the duality datum used by later acts.
