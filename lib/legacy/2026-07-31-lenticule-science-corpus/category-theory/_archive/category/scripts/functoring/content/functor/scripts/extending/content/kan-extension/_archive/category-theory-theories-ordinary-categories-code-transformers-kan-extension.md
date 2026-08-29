---

title: "Kan Extension"
description: "A Kan extension is the universal way to extend a [functor](./functor.md) along another [functor](./functor.md). Given [functors](./functor.md) F: C → D and K: C → E, the left Kan extension Lan_K(F): E → D is the \"best approximation\" of F that factors through K."
aliases:
  - "Kan extension"
  - "Kan extensions"
  - "left Kan extension"
  - "right Kan extension"
date-created: 2026-03-02T00:00:00
tags: []
defines:
  - "Kan Extension"
  - "Kan extensions"
  - "left Kan extension"
  - "right Kan extension"
---

A Kan extension is the universal way to extend a [functor](./functor.md) along another [functor](./functor.md). Given [functors](./functor.md) F: C → D and K: C → E, the left Kan extension Lan_K(F): E → D is the "best approximation" of F that factors through K.

The left Kan extension Lan_K(F) is characterized by a [natural transformation](./natural-transformation.md) η: F ⇒ Lan_K(F) ∘ K that is universal: for any other [functor](./functor.md) G: E → D with a [natural transformation](./natural-transformation.md) F ⇒ G ∘ K, there is a unique [natural transformation](./natural-transformation.md) Lan_K(F) ⇒ G making everything commute. The right Kan extension Ran_K(F) satisfies the dual universal [property](../../../../../../../humanities/theories/philosophy/terms/property.md).

Saunders Mac Lane described Kan extensions as the concept from which "all other [categorical] concepts can be derived." This is not hyperbole. Limits are right Kan extensions along the unique [functor](./functor.md) to the terminal category. Colimits are left Kan extensions along the same. [Adjunctions](../../../../topology/morphisms/adjunction.md) can be expressed as Kan extensions of the identity [functor](./functor.md). Sheafification is a left Kan extension.

When the left Kan extension exists pointwise (computed object-by-object as a colimit), it has an explicit formula:

Lan_K(F)(e) = colim_{(K(c)→e)} F(c)

taken over the comma category (K ↓ e). This computes the extension by gluing together all the values of F that K maps "near" e.

In the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe formalism, Kan extensions appear in the construction of sheaf semantics: the extension of local [semiotic](../../../../../linguistics/topics/semiotics/index.md) structure to global coherent interpretations is a left Kan extension along the inclusion of local fragments into the global site.
