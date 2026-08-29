---

title: "Union"
aliases:
  - "union"
  - "unions"
date-created: 2025-12-26
tags: []
defines:
  - "Union"
  - "unions"
---

The union of two [sets](../objects/set.md) is the set of everything that belongs to either one. If $A = \{1, 2, 3\}$ and $B = \{2, 3, 4, 5\}$, then $A \cup B = \{1, 2, 3, 4, 5\}$ — everything that is in $A$, in $B$, or in both. The [elements](teaching/explanations/element.md) that appear in both sets are not counted twice; they simply appear once in the union. Union is the "or" operation on sets: $x \in A \cup B$ means $x \in A$ or $x \in B$ (or both).

More generally, you can take the union of any family of sets. Given sets $\{A_i\}_{i \in I}$ indexed by some set $I$, the union $\bigcup_{i \in I} A_i = \{x : x \in A_i \text{ for some } i \in I\}$ collects everything that belongs to at least one set in the family. The family can be finite, countably infinite, or uncountably infinite — the definition works regardless.

Union satisfies several clean algebraic properties. It is commutative: $A \cup B = B \cup A$. It is associative: $(A \cup B) \cup C = A \cup (B \cup C)$. It is idempotent: $A \cup A = A$ (taking the union of a set with itself changes nothing). The empty set is the identity element: $A \cup \emptyset = A$ (adding nothing changes nothing). These properties make union an operation in the algebraic sense, and together with [intersection](./intersection.md) and complement, union gives the power set of any set the structure of a [Boolean algebra](../../teaching/explanations/boolean-algebra/index.md).

Union interacts with intersection through the distributive law: $A \cap (B \cup C) = (A \cap B) \cup (A \cap C)$, and with complement through De Morgan's laws: $(A \cup B)^c = A^c \cap B^c$. The complement of a union is the intersection of the complements — an element fails to be in either set if and only if it fails to be in the first *and* fails to be in the second.

In a [lattice](../../order/objects/lattice.md), union corresponds to [join](../../order/morphisms/join.md) — the least upper bound. In the lattice of subsets of a set, ordered by inclusion, the join of $A$ and $B$ is $A \cup B$: the smallest set containing both $A$ and $B$. In the [open sets](../../topology/concepts/open-set.md) of a [topological space](../../topology/objects/topological-space.md), arbitrary unions of open sets are open — this is one of the three topology axioms — and the join of open sets is their union. This unrestricted closure under union (contrasted with only finite closure under intersection) is what makes the open-set lattice a frame rather than a Boolean algebra.

In the [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md) $H$, join ($a \vee b$) is the semantic analogue of union: the weakest value that is at least as strong as both $a$ and $b$. In intuitionistic logic, disjunction ($\vee$) is interpreted as join — asserting "$a$ or $b$" requires producing evidence for at least one of the disjuncts.
