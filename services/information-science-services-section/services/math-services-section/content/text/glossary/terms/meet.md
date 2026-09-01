---
introduces: order-element
description: "The greatest lower bound of two elements in a partial order — the largest thing below both."
aliases: [greatest-lower-bound, infimum, glb]
operation-on: partial-order
dual-of: join
logic-analog: conjunction
set-analog: intersection
adjoint-to: heyting-implication
date-created: 2025-12-26
date-modified: 2026-03-29
id: meet

---

The meet of two elements a and b in a [partial order](./partial-order.md) is their greatest lower bound: the largest element c such that $c \leq a$ and $c \leq b$.

Formally, $a \wedge b = c$ requires two conditions: first, c is a lower bound — $c \leq a$ and $c \leq b$. Second, c is the greatest such — for any d with $d \leq a$ and $d \leq b$, we have $d \leq c$. The meet is unique when it exists, because if two elements are both greatest lower bounds, antisymmetry forces them to be equal.

The meet may not exist in an arbitrary poset. Two elements might have lower bounds but no greatest one, or no lower bounds at all. When every pair has a meet, the poset is a meet-semilattice. When every pair has both a meet and a [join](./join.md), the poset is a [lattice](./lattice.md).

Meet corresponds to conjunction ("and") in logic. If the elements of the partial order are propositions ordered by entailment, then $a \wedge b$ is the strongest proposition entailed by both a and b. In [Set](./set.md), the meet of two [subsets](./subset.md) is their [intersection](./intersection.md). In a topology, the meet of two open sets is their intersection.

The Heyting implication is defined through meet by the residuation law: $c \leq (a \to b)$ if and only if $c \wedge a \leq b$. This says: "c implies a → b" is the same as "c together with a entails b." Meet and implication constrain each other — implication is right adjoint to meet. This adjunction is what makes a [lattice](./lattice.md) into a Heyting algebra.

Meet generalizes from pairs to arbitrary collections. The meet of a set $S$ of elements is the greatest lower bound of all of $S$ simultaneously — the largest element below everything in $S$. A lattice where arbitrary meets exist (not just pairwise) is a complete lattice.
