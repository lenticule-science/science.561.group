---

description: "A rule that assigns to each element of one set exactly one element of another set."
defines: function
aliases: [map, mapping]
domain: set
codomain: set
maps: element, element
composes-with: function
specializes: relation
contrasts-with: operation
date-created: 2026-03-18
date-modified: 2026-03-29
---

A function from a set A to a set B is a rule that assigns to each element of A exactly one element of B. Written $f : A \to B$. The set A is the domain — what the function accepts. The set B is the codomain — where the output lives. For every $a \in A$, there is exactly one $b \in B$ such that $f(a) = b$. Exactness is the defining constraint: every input gets an output, and that output is unique.

A function is a special kind of [relation](../../../humanities/theories/philosophy/terms/relation.md). A relation between A and B is any subset of $A \times B$ — any collection of pairs. A function is a relation where each element of A appears in exactly one pair. Every function is a relation. Most relations are not functions.

Functions compose. If $f : A \to B$ and $g : B \to C$, the composition $g \circ f : A \to C$ sends each $a$ to $g(f(a))$. Composition is associative: $h \circ (g \circ f) = (h \circ g) \circ f$. Every set A has an identity function $\mathrm{id}_A : A \to A$ sending each element to itself. Identity is neutral under composition: $f \circ \mathrm{id}_A = f$ and $\mathrm{id}_B \circ f = f$.

A function is not an [operation](./operation.md). An operation maps a set into itself: $\omega : A^n \to A$. A function maps between sets that may be different. The distinction is between internal transformation (operation) and external mapping (function). Both are present in any nontrivial algebraic structure — the operations give a set its internal structure, and the functions relate it to other sets.

A function can be injective (different inputs always give different outputs), surjective (every element of the codomain is hit), or bijective (both). A bijection has an inverse: a function $f^{-1} : B \to A$ such that $f^{-1} \circ f = \mathrm{id}_A$ and $f \circ f^{-1} = \mathrm{id}_B$.

In the category Set, sets are objects and functions are morphisms. Composition of functions is composition of morphisms. The identity function is the identity morphism. This is the standard example of a [category](theories/categories/theories/ordinary-categories/objects/category.md) — and the reason category theory generalizes set-theoretic reasoning.
