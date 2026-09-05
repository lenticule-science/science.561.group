---
title: Module
role: structure
derived_from: math/operator/reindexing
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: objects in each [Fiber Category](../../math/structure/fiber-category.md) that remain invariant under the lifted reindexing action across the [Index Base](../../math/structure/index-base.md).
- Morphisms: fibre morphisms between such objects that commute with reindexing along every base morphism.
- Parameters: the reindexing operator and the underlying fibre categories.

## Invariants
- Reindexing-invariant: pulling a module along any base morphism yields an isomorphic module in the target fibre.
- Closed under composition and identities within each fibre, respecting the lifted reindexing functoriality.

## Proof
- Derived from: [Reindexing](../../math/operator/reindexing.md), using its functorial pullback behaviour as the constraint that defines invariance.
- Shows that: demanding objects/morphisms to be stable under reindexing produces a well-defined subcategory in each fibre, giving the module structure used by parametricity.
