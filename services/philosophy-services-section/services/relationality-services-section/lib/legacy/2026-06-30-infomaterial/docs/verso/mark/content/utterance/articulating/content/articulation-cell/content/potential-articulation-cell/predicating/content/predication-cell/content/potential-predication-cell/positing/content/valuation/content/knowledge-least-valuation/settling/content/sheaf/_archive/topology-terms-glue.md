---
title: "Glue"
aliases:
  - "glue"
  - "gluing"
  - "gluing condition"
date-created: 2025-12-26
type: term
tags: []
defines:
  - "Glue"
  - "gluing"
  - "gluing condition"
---

Gluing is the operation of assembling compatible local data into a single global datum.

Given a [cover](./cover.md) {Uᵢ → U} and local sections sᵢ defined on each piece Uᵢ, the sections are compatible if they agree on overlaps: the [restriction](./restriction.md) of sᵢ to Uᵢ ∩ Uⱼ equals the restriction of sⱼ to Uᵢ ∩ Uⱼ for all pairs i, j. Gluing produces a global section s on U whose restriction to each Uᵢ recovers sᵢ.

The [sheaf condition](../../higher-topos-theory/terms/sheaf-condition.md) is precisely the requirement that gluing works: for every cover and every compatible family of local sections, there exists a unique global section that restricts to them. A [presheaf](./presheaf.md) that satisfies this condition is a [sheaf](./sheaf.md).

Two things can fail. The global section might not exist (the local data cannot be assembled), or it might not be unique (the local data can be assembled in more than one way). A sheaf is a [presheaf](./presheaf.md) where neither failure occurs — gluing is always possible and always unambiguous.

In the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe, gluing corresponds to the coherence requirement that locally valid [semiotic](../../../../linguistics/topics/semiotics/index.md) interpretations (those holding on individual [fragments](../../../objects/universes/semiotic-universe/terms/fragment.md)) combine into globally valid interpretations. The fragmentwise equality used in [fusion](../../../objects/universes/semiotic-universe/terms/fusion.md) depends on this: if two operators agree on all fragments, they agree globally, because the fragments cover the algebra.
