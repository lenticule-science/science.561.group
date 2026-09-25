---
description: "A set whose elements all belong to another set — the basic containment relation between sets."
aliases: [subsets]
contained-in: set
ordered-by: inclusion
collection: power-set
enables: binary-relation, partial-order
date-created: 2025-12-26
date-modified: 2026-03-29
id: subset

type: page
---

A subset of a [set](./set.md) $S$ is a set whose [elements](./element.md) all belong to $S$. The set $\{2, 4\}$ is a subset of $\{1, 2, 3, 4, 5\}$ because every element of the first set belongs to the second. Written $A \subseteq S$: for every $x$, if $x \in A$ then $x \in S$. Every set is a subset of itself ($S \subseteq S$), and the empty set is a subset of every set ($\emptyset \subseteq S$ for all $S$), because the condition "every element of $\emptyset$ belongs to $S$" is vacuously true — there are no elements of $\emptyset$ to check.

A common confusion: subset is not the same as element. The number 3 is an *element* of $\{1, 2, 3\}$. The set $\{3\}$ is a *subset* of $\{1, 2, 3\}$. An element belongs *to* a set ($3 \in \{1, 2, 3\}$); a subset is contained *within* a set ($\{3\} \subseteq \{1, 2, 3\}$). These are different relations. The number 3 is not a subset of anything (it is a number, not a set — at least in ordinary mathematical discourse). The set $\{3\}$ is not an element of $\{1, 2, 3\}$ (unless the number 3 happens to equal the set $\{3\}$, which in standard ZFC it does not).

The collection of all subsets of $S$ is the power set $\mathcal{P}(S)$. If $S$ has $n$ elements, $\mathcal{P}(S)$ has $2^n$ elements — each element of $S$ is independently either in or out of a given subset, giving 2 choices per element. The power set of $\{a, b\}$ has $4$ elements: $\emptyset$, $\{a\}$, $\{b\}$, $\{a, b\}$.

The subset relation $\subseteq$ defines a [partial order](./partial-order.md) on $\mathcal{P}(S)$. It is reflexive ($A \subseteq A$), antisymmetric (if $A \subseteq B$ and $B \subseteq A$ then $A = B$), and transitive (if $A \subseteq B$ and $B \subseteq C$ then $A \subseteq C$). Under this ordering, the power set is a [lattice](./lattice.md): the [meet](./meet.md) (greatest lower bound) of two subsets is their [intersection](./intersection.md), and the [join](./join.md) (least upper bound) is their [union](./union.md). Every subset has a complement $S \setminus A = \{x \in S : x \notin A\}$, making $\mathcal{P}(S)$ a Boolean algebra — the canonical example of one.

Subset is also the concept that connects sets to relations and functions. A [binary relation](./binary-relation.md) from $A$ to $B$ is defined as a subset of the Cartesian product $A \times B$. A relation *is* a subset of a product: the set of [ordered pairs](./ordered-pair.md) for which the relation holds. A function is a relation where each element of the domain appears in exactly one pair. Without the concept of subset, you cannot define relations, and without relations, you cannot define functions.

In a [category](./category.md), subsets generalize to subobjects: a subobject of an object $A$ is an equivalence class of monomorphisms (injective morphisms) into $A$. Each subset of $S$ corresponds to a characteristic function $S \to \{0, 1\}$ that answers yes or no for each element. In categories beyond **Set**, this characteristic function targets a richer object — the subobject classifier $\Omega$ — which may carry truth values beyond just true and false, modeling the internal logic of the category.

## Additional material from the Google Drive library

A subset of a [set](./set.md) S is a set A whose [elements](./element.md) all belong to S. Written $A \subseteq S$: for every x, if $x \in A$ then $x \in S$. Every set is a subset of itself. The empty set is a subset of every set.

Subset is not the same as [element](./element.md). The number 3 is an element of {1, 2, 3}. The set {3} is a subset of {1, 2, 3}. An element belongs to a set; a subset is contained within a set. These are different relations — $3 \in \{1, 2, 3\}$ but $3 \not\subseteq \{1, 2, 3\}$, and $\{3\} \subseteq \{1, 2, 3\}$ but $\{3\} \notin \{1, 2, 3\}$ (unless 3 itself happens to be the set {3}).

The collection of all subsets of S is the power set $\mathcal{P}(S)$. If S has n elements, $\mathcal{P}(S)$ has $2^n$ elements. The power set is ordered by inclusion: $A \subseteq B$ defines a [partial order](./partial-order.md) on $\mathcal{P}(S)$. Under this ordering, [intersection](./intersection.md) is the [meet](./meet.md) (greatest lower bound) and [union](./union.md) is the [join](./join.md) (least upper bound). Every subset has a complement $S \setminus A$, making $\mathcal{P}(S)$ a Boolean algebra.

A [binary relation](./binary-relation.md) from A to B is defined as a subset of $A \times B$. So subset is the concept that connects sets to relations: a relation IS a subset of a product. This makes subset one of the load-bearing concepts in the chain from sets to categories — without it, you cannot define relations, and without relations, you cannot define functions.

In a [category](./category.md), subsets generalize to subobjects: a subobject of an object A is an equivalence class of monomorphisms into A. Each subset of S corresponds to a characteristic [function](./function.md) $S \to \{0, 1\}$ that says yes or no for each element. In categories beyond Set, this characteristic function targets a richer object — the subobject classifier — which may have more values than just true and false.

## Earlier material

A set whose elements all belong to another set — the basic containment relation between sets.

A subset of a [set](set.md) S is a set A whose [elements](element.md) all belong to S. Written $A \subseteq S$: for every x, if $x \in A$ then $x \in S$. Every set is a subset of itself. The empty set is a subset of every set.

Subset is not the same as [element](element.md). The number 3 is an element of {1, 2, 3}. The set {3} is a subset of {1, 2, 3}. An element belongs to a set; a subset is contained within a set. These are different relations — 3∈{1,2,3}3 \in \{1, 2, 3\} but 3⊈{1,2,3}3 \not\subseteq \{1, 2, 3\}, and {3}⊆{1,2,3}\{3\} \subseteq \{1, 2, 3\} but {3}∉{1,2,3}\{3\} \notin \{1, 2, 3\} (unless 3 itself happens to be the set {3}).

The collection of all subsets of S is the power set $\mathcal{P}(S)$. If S has n elements, $\mathcal{P}(S)$ has 2n2^n elements. The power set is ordered by inclusion: $A \subseteq B$ defines a [partial order](partial-order.md) on $\mathcal{P}(S)$. Under this ordering, [intersection](intersection.md) is the [meet](../../documents/articles/research/2026/07/31/lenticule-import/order/terms/meet.md) (greatest lower bound) and [union](union.md) is the [join](../../documents/articles/research/2026/07/31/lenticule-import/order/terms/join.md) (least upper bound). Every subset has a complement $S \setminus A$, making $\mathcal{P}(S)$ a Boolean algebra.

A subset of a [set](set.md) $S$ is a set whose [elements](element.md) all belong to $S$. The set {2,4}\{2, 4\} is a subset of {1,2,3,4,5}\{1, 2, 3, 4, 5\} because every element of the first set belongs to the second. Written $A \subseteq S$: for every $x$, if $x \in A$ then $x \in S$. Every set is a subset of itself ($S \subseteq S$), and the empty set is a subset of every set ($\emptyset \subseteq S$ for all $S$), because the condition &ldquo;every element of $\emptyset$ belongs to SS&rdquo; is vacuously true — there are no elements of $\emptyset$ to check.

The collection of all subsets of $S$ is the power set $\mathcal{P}(S)$. If $S$ has $n$ elements, $\mathcal{P}(S)$ has 2n2^n elements — each element of $S$ is independently either in or out of a given subset, giving 2 choices per element. The power set of {a,b}\{a, b\} has 44 elements: $\emptyset$, {a}\{a\}, {b}\{b\}, {a,b}\{a, b\}.

The subset relation $\subseteq$ defines a [partial order](partial-order.md) on $\mathcal{P}(S)$. It is reflexive ($A \subseteq A$), antisymmetric (if $A \subseteq B$ and $B \subseteq A$ then A=BA = B), and transitive (if $A \subseteq B$ and $B \subseteq C$ then $A \subseteq C$). Under this ordering, the power set is a [lattice](../../documents/articles/research/2026/07/31/posets/terms/lattice.md): the [meet](../../documents/articles/research/2026/07/31/lenticule-import/order/terms/meet.md) (greatest lower bound) of two subsets is their [intersection](intersection.md), and the [join](../../documents/articles/research/2026/07/31/lenticule-import/order/terms/join.md) (least upper bound) is their [union](union.md). Every subset has a complement S∖A={x∈S:x∉A}S \setminus A = \{x \in S : x \notin A\}, making $\mathcal{P}(S)$ a Boolean algebra — the canonical example of one.

In a [category](../../documents/articles/research/2026/07/31/lenticule-import/categories/domains/ordinary-categories/terms/category.md), subsets generalize to subobjects: a subobject of an object $A$ is an equivalence class of monomorphisms (injective morphisms) into $A$. Each subset of $S$ corresponds to a characteristic function S→{0,1}S \to \{0, 1\} that answers yes or no for each element. In categories beyond **Set**, this characteristic function targets a richer object — the subobject classifier $\Omega$ — which may carry truth values beyond just true and false, modeling the internal logic of the category.
