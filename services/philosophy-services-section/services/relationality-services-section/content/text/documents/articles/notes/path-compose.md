---
title: Path Compose
id: path-compose
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Concatenates directed paths when endpoints match.
---



Concatenates directed paths when endpoints match.

## Definition
- Inputs: paths `p: x → y`, `q: y → z` in [Directed Path](./directed-path.md).
- Output: concatenated path `q ∘ p: x → z` modulo homotopy.

## Invariants
- Unital: composing with identity path yields the same class up to homotopy.
- Associative up to homotopy (associator earned in the directed path/groupoid
  structure).
- Directed: only composable when endpoints match in order.

## Proof
Uses the directed-path structure to define concatenation and the groupoid data
to supply associator/unit homotopies. Shows that: concatenation yields a
well-defined morphism in the directed path/fundamental groupoid.

## Earlier material

## Definition
- Inputs: paths `p: x → y`, `q: y → z` in [Directed Path](directed-path.md).
- Output: concatenated path `q ∘ p: x → z` modulo homotopy.
