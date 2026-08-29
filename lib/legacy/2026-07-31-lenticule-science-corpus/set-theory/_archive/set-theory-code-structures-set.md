---

description: "A collection of distinct objects with a definite membership criterion — the foundational object of mathematics."
defines: set
aliases: [sets]
contains: element
operations: union, intersection, complement, cartesian-product, power-set
enables: binary-relation, function, ordered-pair, subset
foundation-for: category
date-created: 2025-12-26
date-modified: 2026-03-29
---

A set is a collection of distinct objects, called [elements](teaching/explanations/element.md), with a definite membership criterion: for any candidate object, either it belongs to the set or it does not. There is no middle ground, no partial membership, no ambiguity. The set of even numbers contains 4 and does not contain 7, and that is all there is to say about 4 and 7's relationship to it.

Sets can be specified in two ways: by listing their elements ($\{1, 2, 3\}$) or by stating a property ($\{x : x \text{ is even}\}$). Two sets are equal if and only if they have the same elements. The set $\{1, 2, 3\}$ and the set $\{3, 1, 2\}$ are the same set — order does not matter, and neither does how the set is described. This principle, called extensionality, is fundamental: a set is nothing more and nothing less than its members.

The concept seems simple enough that it should need no axioms, and for most of the history of mathematics it had none. Georg Cantor developed set theory informally in the 1870s and 1880s, treating sets as self-evident collections. But in 1901, Bertrand Russell showed that unrestricted set formation leads to contradiction. Consider the set of all sets that do not contain themselves. Does it contain itself? If it does, then by its own definition it does not. If it does not, then by its own definition it does. This paradox — Russell's paradox — demonstrated that not every collection described by a property can be a set.

Ernst Zermelo responded in 1908 with an axiomatic system that restricts which collections count as sets, and Abraham Fraenkel and Thoralf Skolem refined it in the 1920s. The resulting system, Zermelo-Fraenkel set theory with the Axiom of Choice (ZFC), is the standard foundation for mathematics today. Its axioms govern how sets can be formed: you can take [subsets](./subset.md) of existing sets, form [unions](../morphisms/union.md) and power sets, and replace elements according to definite rules — but you cannot simply conjure a set into existence from an arbitrary property. The axioms are permissive enough to build all of ordinary mathematics, and restrictive enough to avoid known paradoxes.

The basic operations build new sets from existing ones. The [union](../morphisms/union.md) $A \cup B$ collects everything in either set. The [intersection](../morphisms/intersection.md) $A \cap B$ collects everything in both. The complement $A^c$ collects everything not in $A$. The Cartesian product $A \times B$ collects all [ordered pairs](./ordered-pair.md) $(a, b)$ with $a \in A$ and $b \in B$ — this is how you represent relationships between sets. The power set $\mathcal{P}(A)$ collects all subsets of $A$; it is always strictly larger than $A$ itself, a fact that Cantor used to show there are different sizes of infinity.

Nearly everything in mathematics can be built from sets. A binary relation is a [subset](./subset.md) of a Cartesian product. A function is a relation where each input has exactly one output. The natural numbers are constructed from sets using the von Neumann encoding: zero is the empty set $\emptyset$, one is $\{\emptyset\}$, two is $\{\emptyset, \{\emptyset\}\}$, and each successive number is the set of all preceding numbers. The integers, rationals, reals, and complex numbers are then built in stages from the naturals.

The [category](../../categories/theories/ordinary-categories/objects/category.md) **Set** has sets as objects and functions as morphisms. It is the category that most other mathematical categories generalize: groups are sets with extra algebraic structure, topological spaces are sets with extra geometric structure, and the category-theoretic notions of product, coproduct, and exponential generalize the set-theoretic Cartesian product, disjoint union, and function set.
