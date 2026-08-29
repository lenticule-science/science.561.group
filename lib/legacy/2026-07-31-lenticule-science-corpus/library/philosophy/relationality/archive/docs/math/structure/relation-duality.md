---
title: Relation Duality Witness
id: relation-duality
role: structure
status: plan
derived_from:
- acts/relate
- acts/not-relate
- acts/witness
proof_refs: []
---


# Relation Duality Witness

Structure capturing the complementary pair `Relate` / `NotRelate` and their
two-sided witness.

## Components

- Positive relation witness (`Relate`).
- Negative relation witness (`NotRelate`).
- Composite witness (`Witness`) testifying to both.

## Proof

Sketch: `Relate` and `NotRelate` come from reflex recognition; their composite
is `Witness`, providing the duality datum used by later acts.
