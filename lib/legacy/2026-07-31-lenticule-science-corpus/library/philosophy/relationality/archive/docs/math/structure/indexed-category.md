---
title: Indexed Category
id: indexed-category
role: structure
status: plan
proof_refs: []
---



## Definition
- Base: [Index Base](index-base.md) supplies contexts and their morphisms.
- Fibres: [Fiber Category](fiber-category.md) gives a category of recognised judgements over each base context.
- Reindexing: [Reindexing](../operator/reindexing.md) maps each base morphism to a functor between the corresponding fibres.
- Structure: assembles these into a functor `IndexBaseᵒᵖ → Cat`, yielding the indexed category of contextual judgements.

## Invariants
- Reindexing preserves fibre identities and composition, making each base morphism act functorially on fibres.
- Base-change coherence is inherited from the functoriality of reindexing:
  pullbacks along composed base morphisms agree with iterated pullbacks.

## Proof
- Uses: [Index Base](index-base.md) as the domain category, [Fiber Category](fiber-category.md) for each fibre, and [Reindexing](../operator/reindexing.md) to transport along base morphisms.
- Shows that: these pieces satisfy the definition of an indexed category—every context has a fibre category and every base morphism induces a functor between fibres—forming a contravariant functor into `Cat`.
