---

introduces: category
description: "A collection of objects, morphisms between them, and a composition operation satisfying associativity and identity laws — the basic organizational unit of abstract mathematics."
aliases: [categories]
made-of: [object, morphism, composition]
laws: [associativity, identity]
examples: [set, group, topological-space, partial-order]
generalizes: [partial-order, monoid, group]
morphisms-between: functor
specialization: algebraic-structure
date-created: 2025-12-26
date-modified: 2026-03-30
---

A category C consists of a collection of [objects](teaching/explanations/object.md), a collection of [morphisms](../morphisms/morphism.md) between objects, and a [composition](../morphisms/composition.md) operation satisfying two laws.

For every pair of objects A and B, there is a collection Hom(A, B) of morphisms from A to B. For every composable pair $f : A \to B$ and $g : B \to C$, there is a composite $g \circ f : A \to C$. For every object A, there is an [identity morphism](../morphisms/identity-morphism.md) $\mathrm{id}_A : A \to A$. These satisfy:

- **Associativity**: $h \circ (g \circ f) = (h \circ g) \circ f$ for all composable triples.
- **Unit laws**: $f \circ \mathrm{id}_A = f$ and $\mathrm{id}_B \circ f = f$ for every $f : A \to B$.

That is the entire definition. Objects, morphisms, composition, two laws. Everything else in category theory is built from this.

A category studies objects through their morphisms rather than through their internal structure. Two objects that are [isomorphic](../morphisms/isomorphism.md) — connected by invertible morphisms in both directions — are interchangeable for all categorical purposes. What an object IS is what it does, measured by its morphisms to and from other objects.

Standard examples: Set ([sets](../../../../sets/objects/set.md) and functions), Grp (groups and homomorphisms), Top (topological spaces and continuous maps), Vect (vector spaces and linear maps). Each captures a mathematical domain by specifying what its objects are and what structure-preserving maps between them look like.

A [partial order](../../../../order/objects/partial-order.md) is a category where there is at most one morphism between any two objects. The morphism from a to b exists when $a \leq b$. Composition is transitivity. Identity morphisms are reflexivity. This is called a thin category — the simplest nontrivial example, and the bridge between order theory and category theory.
