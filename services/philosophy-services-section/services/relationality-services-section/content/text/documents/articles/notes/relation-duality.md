---
title: Relation Duality Witness
id: relation-duality
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/relate
  - acts/not-relate
  - acts/witness
description: Structure capturing the complementary pair Relate / NotRelate and their two-sided witness.
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
