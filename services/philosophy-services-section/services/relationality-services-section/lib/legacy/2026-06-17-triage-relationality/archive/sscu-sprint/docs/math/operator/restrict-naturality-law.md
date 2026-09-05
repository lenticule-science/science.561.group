---
title: Restrict Naturality Law
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



Witnesses naturality of restrictions with respect to pullbacks in the
hypertensor site.

## Definition
- Inputs: pullback square in [Hypertensor Site](../structure/hypertensor-site.md)
  with windows `U,V,U',V'` and a section over `U`.
- Output: equality of pulled-back restrictions stored in
  [Sheaf Restriction Algebra](../structure/sheaf-restriction-algebra.md).
- Behaviour: show `f^* ∘ res = res ∘ f^*` for the square.

## Invariants
- Commutation of pullback and restriction on the sheaf.
- Stability under refinement of the square.

## Proof
- Uses: sheaf naturality and base-change properties on the site.
- Produces: naturality witness.
- Shows that: restriction behaves naturally with site morphisms.
