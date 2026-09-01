---
id: ordered-pair
description: "A pair of objects where order matters — the building block of Cartesian products, binary relations, and functions."
aliases: [ordered pairs]
made-of: element, element
equality: first-components-match, second-components-match
construction: kuratowski-definition
enables: binary-relation, function, cartesian-product
generalizes-to: tuple
date-created: 2025-12-26
date-modified: 2026-03-29
---

An ordered pair $(a, b)$ is a pair of objects where order matters: $(a, b) \neq (b, a)$ unless $a = b$. Two ordered pairs are equal if and only if their first components agree and their second components agree: $(a, b) = (c, d)$ if and only if $a = c$ and $b = d$.

Order is the whole point. The pair $(3, 5)$ is different from $(5, 3)$. A plain set {3, 5} is the same as {5, 3} — sets have no order. An ordered pair records which came first and which came second.

In [set](./set.md) theory, ordered pairs are constructed from sets using the Kuratowski definition: $(a, b) = \{\{a\}, \{a, b\}\}$. This encoding ensures the order condition holds using only the axioms of set theory. The construction looks odd but it works: you can prove from it that $(a, b) = (c, d)$ if and only if $a = c$ and $b = d$.

The Cartesian product $A \times B$ is the [set](./set.md) of all ordered pairs $(a, b)$ with $a \in A$ and $b \in B$. If A has 3 [elements](./element.md) and B has 4, then $A \times B$ has 12 ordered pairs.

Ordered pairs are the building blocks of [binary relations](./binary-relation.md) and functions. A binary relation on $A \times B$ is a [subset](./subset.md) of $A \times B$ — a collection of ordered pairs specifying which elements are related. A function $f : A \to B$ is a binary relation where each element of A appears in exactly one pair.

Ordered n-tuples $(a_1, a_2, \ldots, a_n)$ extend the idea to any finite length. A triple is an ordered pair where one component is itself an ordered pair: $(a, b, c) = ((a, b), c)$. This nesting lets you build tuples of any length from pairs alone.

In a [category](../../categories/domains/ordinary-categories/terms/category.md), the Cartesian product generalizes to the categorical product, defined by a universal property rather than by element-level construction. The ordered pair generalizes to a pair of projection morphisms. The set-theoretic and categorical definitions agree in Set and diverge in other categories.
