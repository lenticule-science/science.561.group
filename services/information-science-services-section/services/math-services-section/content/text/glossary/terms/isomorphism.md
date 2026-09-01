---
introduces: categorical-component
description: "A morphism with a two-sided inverse — the categorical notion of 'same structure, possibly different presentation.'"
aliases: [isomorphisms, isomorphic]
is-a: morphism
has: inverse
condition: round-trip-is-identity
set-analog: bijection
self-case: automorphism
weakens-to: equivalence
date-created: 2025-12-26
date-modified: 2026-03-29
id: isomorphism

---

An isomorphism is a [morphism](./morphism.md) $f : A \to B$ that has a two-sided inverse: a morphism $g : B \to A$ such that $g \circ f = \mathrm{id}_A$ and $f \circ g = \mathrm{id}_B$. You can go there and come back and end up where you started, in both directions.

Two [objects](./object.md) connected by an isomorphism are isomorphic. They are structurally identical from the perspective of the [category](./category.md). Every property expressible in categorical terms is preserved by isomorphism. This makes isomorphism the correct notion of "sameness" in category theory: not literal equality of objects, but the existence of a structure-preserving correspondence that can be undone.

What an isomorphism looks like depends on the category. In Set, isomorphisms are bijections — [functions](./function.md) that are both injective and surjective. In Top, they are homeomorphisms — continuous maps with continuous inverses. In Grp, they are group isomorphisms — homomorphisms that are bijections. In a [partial order](./partial-order.md) viewed as a category, a morphism from a to b exists only when $a \leq b$, so an isomorphism between a and b requires both $a \leq b$ and $b \leq a$ — by [antisymmetry](./antisymmetric.md), that means $a = b$. In a partial order, isomorphism reduces to equality.

An automorphism is an isomorphism from an object to itself: $f : A \to A$ with a two-sided inverse. The collection of automorphisms of A forms a group under [composition](./composition.md), called the automorphism group Aut(A). The automorphism group measures the internal symmetry of an object — the ways it can be rearranged and still look the same.

Equivalence is a weaker notion that generalizes isomorphism. A categorical equivalence has an inverse only up to [natural transformation](./natural-transformation.md) — the round trip does not land exactly where you started but somewhere naturally isomorphic to it. In higher category theory, these weaker notions replace strict isomorphism as the appropriate notion of sameness, because strict isomorphism is too rigid to capture the structure of categories with higher morphisms.
