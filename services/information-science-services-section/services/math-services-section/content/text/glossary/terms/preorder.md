---
introduces: relation
description: "A reflexive and transitive relation on a set — the weakest structure supporting 'at least as much as' while allowing ties."
aliases: [quasi-order]
properties: reflexive, transitive
extends-to: partial-order
induces: equivalence-relation
quotient: partial-order
viewable-as: category
date-created: 2025-12-26
date-modified: 2026-03-29
id: preorder

---

A preorder on a [set](./set.md) S is a [binary relation](./binary-relation.md) $\leq$ that is [reflexive](./reflexive.md) ($a \leq a$ for all a) and [transitive](./transitive.md) ($a \leq b$ and $b \leq c$ imply $a \leq c$).

A preorder is the weakest structure that supports a notion of "at least as much as." It allows ties: elements a and b can satisfy both $a \leq b$ and $b \leq a$ without being equal. When ties are ruled out by adding [antisymmetry](./antisymmetric.md), the preorder becomes a [partial order](./partial-order.md).

Every preorder induces an [equivalence relation](./equivalence-relation.md): define $a \sim b$ when $a \leq b$ and $b \leq a$. This partitions S into equivalence classes of tied elements. The quotient of a preorder by this relation is a partial order — antisymmetry is gained by identifying tied elements. Every preorder is a partial order "up to ties."

Every preorder on S can be viewed as a thin [category](./category.md): objects are elements of S, and there is a morphism from a to b whenever $a \leq b$. Reflexivity provides identity morphisms. Transitivity provides composition. A partial order is a thin category where there is at most one morphism between any two objects. A preorder is a thin category where there can be morphisms in both directions between distinct objects — the ties.

In modal logic, Kripke frames for S4 are preorders: the accessibility relation is reflexive and transitive. The elements (possible worlds) are ordered by accessibility — later worlds see at least as much as earlier ones — and the modal operators (necessity, possibility) quantify over this order. Reflexivity gives the T axiom (what is necessary is true). Transitivity gives the 4 axiom (what is necessary is necessarily necessary).

## Includes and excludes

Relationality reads its order as inclusion: $a$ *includes* $b$ when $b \leq a$. Its counterpart, *excludes*, is disjointness in a bounded lattice: $a$ and $b$ exclude each other when $a \wedge b = \bot$. Exclusion is symmetric, and it is stable under inclusion: if $a \leq b$ and $b$ excludes $c$, then $a$ excludes $c$.
