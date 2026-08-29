---
title: "Presheaf"
aliases:
  - "presheaf"
  - "presheaves"
date-created: 2025-12-26
type: term
tags: []
defines:
  - "Presheaf"
  - "presheaves"
---

A presheaf on a category C is a contravariant [functor](../../../objects/categories/ordinary-categories/terms/functor.md) F: C^op → Set. It assigns a set F(U) of "sections" to each object U and a [restriction](./restriction.md) map F(U) → F(V) to each [morphism](../../../objects/categories/ordinary-categories/terms/morphism.md) V → U, preserving composition and identity.

A presheaf is the most general way to assign data to the objects of a category in a way that is compatible with the category's structure. The restriction maps express how data on a larger object restricts to data on a smaller one.

Not every presheaf is a [sheaf](./sheaf.md). A presheaf becomes a sheaf when it satisfies the [sheaf condition](../../higher-topos-theory/terms/sheaf-condition.md): compatible local data on a [cover](./cover.md) [glues](./glue.md) uniquely to global data. A presheaf that fails the [sheaf condition](../../higher-topos-theory/terms/sheaf-condition.md) has either gaps (local data that cannot be assembled) or redundancy (global data that is not determined by its local restrictions).

The category of presheaves on C (written [C^op, Set] or PSh(C)) is always a topos — it has all the structure needed for internal logic. The sheaves form a subcategory, and sheafification is the left adjoint to the inclusion: it is the "best approximation" of a presheaf by a sheaf, obtained by forcing the gluing condition.

In the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe, the interpretation of syntactic operators as semantic endomorphisms can be viewed as a presheaf: each [fragment](../../../objects/universes/semiotic-universe/terms/fragment.md) receives a set of operators, and restriction maps express how operators on a larger fragment restrict to smaller ones.
