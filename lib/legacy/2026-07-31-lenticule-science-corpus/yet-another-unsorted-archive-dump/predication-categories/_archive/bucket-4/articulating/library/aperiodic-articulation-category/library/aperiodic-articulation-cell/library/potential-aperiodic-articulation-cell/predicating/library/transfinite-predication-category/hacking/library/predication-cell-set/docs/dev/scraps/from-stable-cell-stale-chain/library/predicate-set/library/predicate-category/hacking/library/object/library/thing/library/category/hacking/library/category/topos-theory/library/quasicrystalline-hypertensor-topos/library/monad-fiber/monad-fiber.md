---
title: Monad Fiber
id: monad-fiber
role: structure
status: plan
derived_from: math/structure/fixed-fiber-category
proof_refs: []
---


# Monad Fiber

## Definition
- Carrier: for each fixed context, the fibre category from [Fixed Fiber Category](../../math/structure/fixed-fiber-category.md) equipped with a pointwise monad action induced by the fixed-profile nucleus (parameter).
- Morphisms: fibre morphisms that commute with the monad unit and multiplication in each fixed context.
- Parameters: a fixed-profile nucleus supplying the monad structure across fibres.

## Invariants
- Functorial in contexts: reindexing between fixed fibres (defined separately) preserves the monad action.
- Monad laws (unit and associativity) hold pointwise in every fibre, inherited from the fixed-profile nucleus.

## Proof
- Derived from: [Fixed Fiber Category](../../math/structure/fixed-fiber-category.md), adding the parameter of a fixed-profile nucleus to equip each fibre with a monad.
- Shows that: each fixed fibre supports a coherent monad action, giving an indexed monad over the fixed-profile fibres.
