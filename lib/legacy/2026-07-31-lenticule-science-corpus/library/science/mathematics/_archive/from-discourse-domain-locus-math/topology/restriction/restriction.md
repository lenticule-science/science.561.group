---

title: "Restriction"
description: "Restriction is the operation of moving data from a larger context to a smaller one — given a section s defined on U and an inclusion V ⊆ U, the restriction s|_V is the section obtained by \"forgetting\" the data outside V."
aliases:
  - "restriction"
  - "restriction map"
date-created: 2025-12-26
tags: []
---

Restriction is the operation of moving data from a larger context to a smaller one — given a section s defined on U and an inclusion V ⊆ U, the restriction s|_V is the section obtained by "forgetting" the data outside V.

In a [presheaf](../objects/presheaf.md) F on a category C, restriction is encoded by the functoriality: for each [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md) i: V → U in C, there is a restriction map F(i): F(U) → F(V). These maps must satisfy:
- F(id_U) = id_{F(U)} — restricting to the same context does nothing
- F(j ∘ i) = F(i) ∘ F(j) — restricting in two steps equals restricting in one (note the contravariance)

In classical topology, if F is a [presheaf](../objects/presheaf.md) of continuous functions on a space X, then restriction sends a function defined on an open set U to its restriction to a smaller open set V ⊆ U — literally evaluating the same function on fewer points.

Restriction is the "local" direction of [sheaf theory](../_index.md): it moves from global to local. The opposite direction — assembling local data into global data — is [gluing](./glue.md). The [sheaf condition](teaching/explanations/sheaf-condition.md) says these two directions are inverse: restriction decomposes global data into local data, and gluing reassembles it, recovering the original.

In the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe, restriction of operators to [fragments](../../../objects/universes/semiotic-universe/terms/fragment.md) is well-defined precisely for [fragment-preserving](../../../objects/universes/semiotic-universe/terms/fragment-preserving.md) operators: those whose output on a fragment stays within that fragment.
