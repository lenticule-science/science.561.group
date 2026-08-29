---
title: Identify Path
id: path-identity
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Identify Path

Provides the identity (constant) path at a recognition/context.

## Definition
- Inputs: a point/recognition `x` in the
  [Recognition Carrier](./recognition.md).
- Outputs: identity path `id_x: x → x` in
  [Directed Path](./directed-path.md).

## Invariants
- Unit: for any path `p: x → y`, `p ∘ id_x = p` and `id_y ∘ p = p` up to
  homotopy; unitors established in the directed path/groupoid structure.

## Proof
Uses the directed-path structure to form constant paths and the groupoid data
to supply unit homotopies. Shows that identity paths act as units for path
composition in the directed path/fundamental groupoid.
