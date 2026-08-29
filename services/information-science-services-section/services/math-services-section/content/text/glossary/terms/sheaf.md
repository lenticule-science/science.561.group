---
title: "Sheaf"
description: "A sheaf is a [presheaf](./presheaf.md) — an assignment of data to each object of a [site](./site.md) — that satisfies the [sheaf condition](./sheaf-condition.md): compatible local data can be uniquely glued into global data."
aliases:
  - "sheaf"
  - "sheaves"
date-created: 2025-12-26
tags: []
defines:
  - "Sheaf"
  - "sheaves"
type: term
---

A sheaf is a [presheaf](./presheaf.md) — an assignment of data to each object of a [site](./site.md) — that satisfies the [sheaf condition](./sheaf-condition.md): compatible local data can be uniquely glued into global data.

A [presheaf](./presheaf.md) F on a category C assigns a set F(U) to each object U and a restriction map F(U) → F(V) for each [morphism](./morphism.md) V → U, preserving composition and identity. When C is equipped with a Grothendieck topology (making it a site), the [sheaf condition](./sheaf-condition.md) asks that for every covering family {Uᵢ → U}, the natural map

F(U) → equalizer( ∏ᵢ F(Uᵢ) ⇉ ∏ᵢ,ⱼ F(Uᵢ ×_U Uⱼ) )

is an [isomorphism](./isomorphism.md). This says: a global section over U is exactly a compatible family of local sections over the cover, with no ambiguity.

The prototypical example is continuous functions on a topological space: a continuous function on an open set U is determined by its values on any open cover of U, and continuous functions defined on overlapping opens that agree on their intersection glue to a continuous function on the union.

Sheaves on a site form a Grothendieck topos — a category with an internal logic (intuitionistic, not necessarily Boolean) and enough structure to do mathematics internally. The category of sheaves remembers the site's notion of "local" through its [subobject classifier](./subobject-classifier.md) and [Lawvere-Tierney topology](./lawvere-tierney-topology.md).

In the semiotic universe, the [sheaf condition](./sheaf-condition.md) on fragments ensures that interpretations defined locally (on individual fragments) cohere globally — fragmentwise reasoning is valid precisely because the semiotic universe's closure structure satisfies descent.
