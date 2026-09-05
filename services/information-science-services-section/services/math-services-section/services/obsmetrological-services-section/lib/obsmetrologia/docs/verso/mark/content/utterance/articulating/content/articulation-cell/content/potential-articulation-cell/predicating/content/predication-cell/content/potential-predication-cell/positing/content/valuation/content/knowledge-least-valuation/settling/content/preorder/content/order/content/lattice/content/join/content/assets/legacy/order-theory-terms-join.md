---
id: join
description: "The least upper bound of two elements in a partial order — the smallest thing above both."
aliases: [least-upper-bound, supremum, lub]
operation-on: partial-order
dual-of: meet
logic-analog: disjunction
set-analog: union
date-created: 2025-12-26
date-modified: 2026-03-29
---

The join of two elements a and b in a [partial order](./partial-order.md) is their least upper bound: the smallest element c such that $a \leq c$ and $b \leq c$.

Formally, $a \vee b = c$ requires two conditions: first, c is an upper bound — $a \leq c$ and $b \leq c$. Second, c is the least such — for any d with $a \leq d$ and $b \leq d$, we have $c \leq d$. The join is unique when it exists, by the same antisymmetry argument as for [meet](./meet.md).

The join may not exist in an arbitrary poset. When every pair has a join, the poset is a join-semilattice. When every pair has both a join and a meet, the poset is a [lattice](./lattice.md).

Join corresponds to disjunction ("or") in logic. If the elements of the partial order are propositions ordered by entailment, then $a \vee b$ is the weakest proposition that entails both a and b. In [Set](../sets/terms/set.md), the join of two [subsets](../sets/terms/subset.md) is their [union](../sets/terms/union.md). In a topology, the join of any collection of open sets is their union.

Meet and join are dual. Every statement about meets becomes a statement about joins if you reverse the ordering. The meet is the greatest lower bound; the join is the least upper bound. Meet corresponds to conjunction; join corresponds to disjunction. Meet corresponds to intersection; join corresponds to union. This duality runs through all of order theory and category theory — it is the simplest instance of the general principle that reversing all arrows produces a valid dual structure.

Join generalizes from pairs to arbitrary collections. The join of a set $S$ of elements is the least upper bound of all of $S$ simultaneously — the smallest element above everything in $S$. A lattice where arbitrary joins exist is a complete lattice. In a complete lattice, arbitrary meets also exist — completeness for joins implies completeness for meets.
