---
title: Restrict Naturality Law
id: restrict-naturality-law
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Witnesses naturality of restrictions with respect to pullbacks in the hypertensor site.
---



Witnesses naturality of restrictions with respect to pullbacks in the
hypertensor site.

## Definition
- Inputs: pullback square in [Hypertensor Site](./hypertensor-site.md)
  with windows `U,V,U',V'` and a section over `U`.
- Output: equality of pulled-back restrictions stored in
  [Sheaf Restriction Algebra](./sheaf-restriction-algebra.md).
- Behaviour: show `f^* ∘ res = res ∘ f^*` for the square.

## Invariants
- Commutation of pullback and restriction on the sheaf.
- Stability under refinement of the square.

## Proof
- Uses: sheaf naturality and base-change properties on the site.
- Produces: naturality witness.
- Shows that: restriction behaves naturally with site morphisms.

## Earlier material

## Definition
- Inputs: pullback square in [Hypertensor Site](hypertensor-site.md)
  with windows `U,V,U',V'` and a section over `U`.
- Output: equality of pulled-back restrictions stored in
  [Sheaf Restriction Algebra](sheaf-restriction-algebra.md).
- Behaviour: show `f^* ∘ res = res ∘ f^*` for the square.
