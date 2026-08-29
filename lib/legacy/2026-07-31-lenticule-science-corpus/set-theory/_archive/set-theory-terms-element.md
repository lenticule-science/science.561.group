---
id: element
description: "An object that belongs to a set — the primitive relationship in set theory from which all other concepts are built."
defines: element
aliases: [member, elements]
belongs-to: set
primitive-relation: membership
enables: ordered-pair
date-created: 2025-12-26
date-modified: 2026-03-29
---

An element of a [set](./set.md) S is an object that belongs to S, written $x \in S$. The membership relation $\in$ is the primitive notion of set theory: all other concepts — [subset](./subset.md), [function](../../../terms/function.md), [binary relation](./binary-relation.md) — are defined through it. If x does not belong to S, we write $x \notin S$.

Membership is a yes-or-no question. For any object x and any set S, either $x \in S$ or $x \notin S$. There is no partial membership, no degree of belonging. This definiteness is what makes a set a set — without it, the collection is not well-defined.

Elements may themselves be sets. In ZFC set theory, everything is a set, so the elements of {1, 2, 3} are themselves sets (0 = $\emptyset$, 1 = {$\emptyset$}, 2 = {$\emptyset$, {$\emptyset$}}). The element-set distinction is one of role, not of kind: the same object can be an element of one set and a set containing other elements. The number 3 is an element of the set {1, 2, 3} and also a set containing three elements.

An [ordered pair](./ordered-pair.md) is built from elements. A [binary relation](./binary-relation.md) is a set of ordered pairs. A function is a relation where each element of the domain appears in exactly one pair. The chain from element to function passes through ordered pair and relation — each step builds on membership.

In a [category](../../categories/domains/ordinary-categories/terms/category.md), an element of an object A is a morphism from the terminal object 1 to A. This generalized element perspective extends the concept beyond sets: instead of asking "does x belong to A?" you ask "is there an arrow from 1 to A that picks out x?" In Set, these are the same question. In other categories, the generalized version is the one that works.
