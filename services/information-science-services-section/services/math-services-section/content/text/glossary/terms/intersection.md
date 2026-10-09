---
name: "Intersection"
description: "The intersection of two [sets](./set.md) is the set of everything that belongs to both. If $A = {1, 2, 3, 4}$ and $B = {3, 4, 5, 6}$, then $A cap B = {3, 4}$ — only the [elements](./element.md) that appear in $A$ *and* in $B$. Intersection is the \"and\" operation on sets: $x in A cap B$ means $x in A$ and $x in B$."
aliases:
  - "intersection"
  - "intersections"
date-created: 2025-12-26
tags: []
---

The intersection of two [sets](./set.md) is the set of everything that belongs to both. If $A = \{1, 2, 3, 4\}$ and $B = \{3, 4, 5, 6\}$, then $A \cap B = \{3, 4\}$ — only the [elements](./element.md) that appear in $A$ *and* in $B$. Intersection is the "and" operation on sets: $x \in A \cap B$ means $x \in A$ and $x \in B$.

If two sets share no elements, their intersection is the empty set: $\{1, 2\} \cap \{3, 4\} = \emptyset$. Such sets are called disjoint. If one set is contained in another ($A \subseteq B$), their intersection is the smaller set: $A \cap B = A$.

More generally, the intersection of any family of sets $\{A_i\}_{i \in I}$ is $\bigcap_{i \in I} A_i = \{x : x \in A_i \text{ for all } i \in I\}$ — the collection of elements that belong to every set in the family. The intersection gets smaller (or stays the same) as you add more sets to the family, because each additional set imposes another membership requirement.

Intersection is commutative ($A \cap B = B \cap A$), associative ($(A \cap B) \cap C = A \cap (B \cap C)$), and idempotent ($A \cap A = A$). It distributes over [union](./union.md): $A \cap (B \cup C) = (A \cap B) \cup (A \cap C)$. De Morgan's laws relate intersection to complement: $(A \cap B)^c = A^c \cup B^c$ — failing to be in both sets means failing to be in at least one. Together with union and complement, intersection gives the power set of any set the structure of a [Boolean algebra](./boolean-algebra.md).

In a [lattice](./lattice.md), intersection corresponds to [meet](./meet.md) — the greatest lower bound. In the lattice of subsets ordered by inclusion, the meet of $A$ and $B$ is $A \cap B$: the largest set contained in both.

In the [open sets](./open-set.md) of a [topological space](./topological-space.md), intersection behaves asymmetrically compared to union. Arbitrary unions of open sets are always open, but only *finite* intersections are guaranteed open. The intersection of infinitely many open sets can fail to be open: $\bigcap_{n=1}^{\infty} (-1/n, 1/n) = \{0\}$, a single point, which is not open in $\mathbb{R}$. This asymmetry — unrestricted unions, restricted intersections — is what makes the open-set lattice a frame rather than a Boolean algebra, and it is the structural signature of topology.

In the [Heyting algebra](./heyting-algebra.md) $H$, meet ($a \wedge b$) is the semantic analogue of intersection: the strongest value entailed by both $a$ and $b$. The [Heyting implication](./heyting-implication.md) is defined through meet by the residuation law: $c \leq (a \to b)$ if and only if $c \wedge a \leq b$. This adjunction between meet and implication is the algebraic heart of intuitionistic logic.

## Additional material from the Google Drive library

The intersection of two [sets](./set.md) A and B, written A ∩ B, is the set of [elements](./element.md) belonging to both A and B: A ∩ B = {x : x ∈ A and x ∈ B}. More generally, the intersection of a family {Aᵢ}ᵢ∈I is ⋂ᵢ Aᵢ = {x : x ∈ Aᵢ for all i ∈ I}.

Intersection is commutative, associative, and idempotent. It distributes over [union](./union.md): A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C). Together with union and complement, intersection gives the power set of any set the structure of a [Boolean algebra](./boolean-algebra.md).

In a [lattice](./lattice.md), intersection corresponds to [meet](./meet.md) (greatest lower bound). In the [open sets](./open-set.md) of a [topological space](./topological-space.md), only finite intersections are guaranteed to be open — this asymmetry between union and intersection is what makes the open-set [lattice](./lattice.md) a frame rather than a [Boolean algebra](./boolean-algebra.md). In the [Heyting algebra](./heyting-algebra.md) H, meet (a ∧ b) is the semantic analogue of intersection: the strongest value entailed by both a and b. The [Heyting implication](./heyting-implication.md) is defined through meet by the residuation law: c ≤ (a → b) if and only if c ∧ a ≤ b.
