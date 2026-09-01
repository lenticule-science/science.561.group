---
title: Sheaf Restriction Algebra
id: sheaf-restriction-algebra
role: structure
status: plan
proof_refs: []
---



Algebraic laws for restriction maps of the hypertensor sheaf: functoriality and
naturality with respect to the hypertensor site.

## Definition
- Carrier: restriction maps of [Hypertensor Sheaf](hypertensor-sheaf.md) over
  [Hypertensor Site](hypertensor-site.md).
- Structure: identities on each window; composition along chains of inclusions.

## Invariants
- Functoriality: `res_U^U = id`; `res_W^U = res_W^V ∘ res_V^U` for inclusions
  `W→V→U`.
- Naturality: restriction commutes with pullbacks along site morphisms.

## Proof
- Uses: sheaf axioms on the hypertensor site to derive restriction laws.
- Shows that: restrictions form a functor from the site to sets/sections with
  naturality under site morphisms.
