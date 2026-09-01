---
title: Comonad Fiber
id: comonad-fiber
role: structure
status: plan
derived_from: math/structure/fixed-fiber-category
proof_refs: []
---



## Definition
- Carrier: for each fixed context, the fibre category from [Fixed Fiber Category](./fixed-fiber-category.md) equipped with a pointwise comonad induced by the fixed flow (parameter).
- Morphisms: fibre morphisms that commute with the comonad counit and comultiplication in each fixed context.
- Parameters: a fixed-profile flow supplying the comonad structure across fibres.

## Invariants
- Functorial in contexts: reindexing between fixed fibres (defined separately) preserves the comonad action.
- Comonad laws (counit and coassociativity) hold pointwise in every fibre, inherited from the fixed-profile flow.

## Proof
- Derived from: [Fixed Fiber Category](./fixed-fiber-category.md), adding the parameter of a fixed-profile flow to equip each fibre with a comonad.
- Shows that: each fixed fibre supports a coherent comonad action, giving an indexed comonad over the fixed-profile fibres.
