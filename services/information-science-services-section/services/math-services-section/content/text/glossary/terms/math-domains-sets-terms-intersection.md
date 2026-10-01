---
name: "Intersection"
type: "term"
date-created: 2025-12-26
---

The intersection of two [sets](set.md) is the set of everything that belongs to both. If A={1,2,3,4}A = \{1, 2, 3, 4\} and B={3,4,5,6}B = \{3, 4, 5, 6\}, then A∩B={3,4}A \cap B = \{3, 4\} — only the [elements](element.md) that appear in $A$ *and* in $B$. Intersection is the &ldquo;and&rdquo; operation on sets: $x \in A \cap B$ means $x \in A$ and $x \in B$.

If two sets share no elements, their intersection is the empty set: {1,2}∩{3,4}=∅\{1, 2\} \cap \{3, 4\} = \emptyset. Such sets are called disjoint. If one set is contained in another ($A \subseteq B$), their intersection is the smaller set: $A \cap B = A$.

More generally, the intersection of any family of sets {Ai}i∈I\{A_i\}_{i \in I} is ⋂i∈IAi={x:x∈Ai for all i∈I}\bigcap_{i \in I} A_i = \{x : x \in A_i \text{ for all } i \in I\} — the collection of elements that belong to every set in the family. The intersection gets smaller (or stays the same) as you add more sets to the family, because each additional set imposes another membership requirement.

Intersection is commutative ($A \cap B = B \cap A$), associative ((A∩B)∩C=A∩(B∩C)(A \cap B) \cap C = A \cap (B \cap C)), and idempotent ($A \cap A = A$). It distributes over [union](union.md): $A \cap (B \cup C) = (A \cap B) \cup (A \cap C)$. De Morgan&rsquo;s laws relate intersection to complement: $(A \cap B)^c = A^c \cup B^c$ — failing to be in both sets means failing to be in at least one. Together with union and complement, intersection gives the power set of any set the structure of a [Boolean algebra](../../documents/articles/research/2026/07/concepts/boolean-algebra/index.md).

In a [lattice](../../documents/articles/research/2026/07/31/posets/terms/lattice.md), intersection corresponds to [meet](../../documents/articles/research/2026/07/31/posets/terms/meet.md) — the greatest lower bound. In the lattice of subsets ordered by inclusion, the meet of $A$ and $B$ is $A \cap B$: the largest set contained in both.

In the [open sets](open-set.md) of a [topological space](topological-space.md), intersection behaves asymmetrically compared to union. Arbitrary unions of open sets are always open, but only *finite* intersections are guaranteed open. The intersection of infinitely many open sets can fail to be open: ⋂n=1∞(−1/n,1/n)={0}\bigcap_{n=1}^{\infty} (-1/n, 1/n) = \{0\}, a single point, which is not open in $\mathbb{R}$. This asymmetry — unrestricted unions, restricted intersections — is what makes the open-set lattice a frame rather than a Boolean algebra, and it is the structural signature of topology.

In the [Heyting algebra](../../documents/articles/research/2026/07/concepts/heyting-algebra/index.md) $H$, meet ($a \wedge b$) is the semantic analogue of intersection: the strongest value entailed by both $a$ and $b$. The [Heyting implication](heyting-implication.md) is defined through meet by the residuation law: $c \leq (a \to b)$ if and only if $c \wedge a \leq b$. This adjunction between meet and implication is the algebraic heart of intuitionistic logic.
