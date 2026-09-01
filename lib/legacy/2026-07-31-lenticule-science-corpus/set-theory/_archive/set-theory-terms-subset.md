---
id: subset
description: "A set whose elements all belong to another set — the basic containment relation between sets."
aliases: [subsets]
contained-in: set
ordered-by: inclusion
collection: power-set
enables: binary-relation, partial-order
date-created: 2025-12-26
date-modified: 2026-03-29
---

A subset of a [set](./set.md) S is a set A whose [elements](./element.md) all belong to S. Written $A \subseteq S$: for every x, if $x \in A$ then $x \in S$. Every set is a subset of itself. The empty set is a subset of every set.

Subset is not the same as [element](./element.md). The number 3 is an element of {1, 2, 3}. The set {3} is a subset of {1, 2, 3}. An element belongs to a set; a subset is contained within a set. These are different relations — $3 \in \{1, 2, 3\}$ but $3 \not\subseteq \{1, 2, 3\}$, and $\{3\} \subseteq \{1, 2, 3\}$ but $\{3\} \notin \{1, 2, 3\}$ (unless 3 itself happens to be the set {3}).

The collection of all subsets of S is the power set $\mathcal{P}(S)$. If S has n elements, $\mathcal{P}(S)$ has $2^n$ elements. The power set is ordered by inclusion: $A \subseteq B$ defines a [partial order](../order/terms/partial-order.md) on $\mathcal{P}(S)$. Under this ordering, [intersection](./intersection.md) is the [meet](../order/terms/meet.md) (greatest lower bound) and [union](./union.md) is the [join](../order/terms/join.md) (least upper bound). Every subset has a complement $S \setminus A$, making $\mathcal{P}(S)$ a Boolean algebra.

A [binary relation](./binary-relation.md) from A to B is defined as a subset of $A \times B$. So subset is the concept that connects sets to relations: a relation IS a subset of a product. This makes subset one of the load-bearing concepts in the chain from sets to categories — without it, you cannot define relations, and without relations, you cannot define functions.

In a [category](../categories/domains/ordinary-categories/terms/category.md), subsets generalize to subobjects: a subobject of an object A is an equivalence class of monomorphisms into A. Each subset of S corresponds to a characteristic [function](../../terms/function.md) $S \to \{0, 1\}$ that says yes or no for each element. In categories beyond Set, this characteristic function targets a richer object — the subobject classifier — which may have more values than just true and false.
