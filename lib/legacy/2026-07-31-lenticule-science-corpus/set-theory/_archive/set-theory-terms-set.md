---
id: set
description: "A collection of distinct objects with a definite membership criterion — the foundational object of mathematics."
aliases: [sets]
contains: element
operations: union, intersection, complement, cartesian-product, power-set
enables: binary-relation, function, ordered-pair, subset
foundation-for: category
date-created: 2025-12-26
date-modified: 2026-03-29
---

A set is a collection of distinct objects, called [elements](./element.md), with a definite membership criterion: for any candidate object, either it belongs to the set or it does not. Sets are specified by listing their elements ({1, 2, 3}) or by a property ({x : x is even}). Two sets are equal if and only if they have the same elements — a set is determined entirely by its membership, not by how it is described.

The axioms of set theory (Zermelo-Fraenkel with Choice, ZFC) regulate which collections count as sets, avoiding paradoxes like Russell's (the set of all sets not containing themselves). Without these axioms, unrestricted set formation leads to contradictions — the set of all sets not containing themselves both contains and does not contain itself.

The basic operations build new sets from existing ones. The [union](./union.md) $A \cup B$ collects everything in either set. The [intersection](./intersection.md) $A \cap B$ collects everything in both. The complement $A^c$ collects everything not in A. The Cartesian product $A \times B$ collects all [ordered pairs](./ordered-pair.md) $(a, b)$ with $a \in A$ and $b \in B$. The power set $\mathcal{P}(A)$ collects all [subsets](./subset.md) of A.

Sets are the standard foundation for mathematics. A [binary relation](./binary-relation.md) is a [subset](./subset.md) of a Cartesian product. A function is a relation where each input has exactly one output. Numbers are constructed from sets — zero is the empty set $\emptyset$, one is $\{\emptyset\}$, two is $\{\emptyset, \{\emptyset\}\}$, and so on.

The [category](../../categories/domains/ordinary-categories/terms/category.md) Set has sets as objects and functions as morphisms. Composition of functions is composition of morphisms. The identity function is the identity morphism. Set is the category that most other mathematical categories generalize — groups are sets with extra structure, topological spaces are sets with extra structure, and the category-theoretic definitions of product, coproduct, and exponential all generalize the set-theoretic Cartesian product, disjoint union, and function set.
