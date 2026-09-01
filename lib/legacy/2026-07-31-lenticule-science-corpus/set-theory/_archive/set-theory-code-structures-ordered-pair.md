---

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

An ordered pair $(a, b)$ is a pair of objects where order matters. The pair $(3, 5)$ is different from $(5, 3)$. This is the entire point: a plain set $\{3, 5\}$ is the same as $\{5, 3\}$ — sets do not track order — but an ordered pair does. The first component and the second component are distinguished positions, and swapping them produces a different pair (unless both components are equal).

Two ordered pairs are equal if and only if their components match position by position: $(a, b) = (c, d)$ if and only if $a = c$ and $b = d$. This equality condition is the defining property of ordered pairs, and it is what makes them useful for representing relationships between objects.

In [set](./set.md) theory, ordered pairs must be built from sets, because set theory has no primitive notion of "order." Kazimierz Kuratowski gave the standard construction in 1921: $(a, b) = \{\{a\}, \{a, b\}\}$. This encoding looks peculiar — it represents the pair as a set of sets — but it works: from the axioms of set theory, you can prove that $\{\{a\}, \{a, b\}\} = \{\{c\}, \{c, d\}\}$ if and only if $a = c$ and $b = d$. The construction is not the only possible one (Norbert Wiener gave an earlier but more cumbersome version in 1914), but Kuratowski's is the simplest and has become standard.

The Cartesian product $A \times B$ is the set of all ordered pairs $(a, b)$ with $a \in A$ and $b \in B$. If $A$ has 3 [elements](teaching/explanations/element.md) and $B$ has 4, then $A \times B$ has $3 \times 4 = 12$ ordered pairs. The Cartesian product $\mathbb{R} \times \mathbb{R} = \mathbb{R}^2$ is the plane: each point is an ordered pair of real numbers $(x, y)$, and the order distinguishes the horizontal coordinate from the vertical coordinate.

Ordered pairs are the building blocks of binary relations and functions. A binary relation from $A$ to $B$ is a [subset](./subset.md) of $A \times B$ — a collection of ordered pairs specifying which elements of $A$ are related to which elements of $B$. The relation "less than" on $\{1, 2, 3\}$ is the set $\{(1, 2), (1, 3), (2, 3)\}$. A function $f: A \to B$ is a binary relation where each element of $A$ appears as the first component of exactly one pair — every input has exactly one output. Without ordered pairs, there would be no functions, and without functions, most of mathematics could not be stated.

Ordered $n$-tuples $(a_1, a_2, \ldots, a_n)$ extend the idea to any finite length. A triple is an ordered pair where one component is itself a pair: $(a, b, c) = ((a, b), c)$. This nesting lets you build tuples of any length from pairs alone — the pair is the universal building block for ordered sequences.

In a [category](../../categories/theories/ordinary-categories/objects/category.md), the Cartesian product generalizes to the categorical product, defined by a universal property (a pair of projection morphisms satisfying a uniqueness condition) rather than by element-level construction. The set-theoretic and categorical definitions agree in **Set** and can diverge in other categories, where "elements" may not be available.
