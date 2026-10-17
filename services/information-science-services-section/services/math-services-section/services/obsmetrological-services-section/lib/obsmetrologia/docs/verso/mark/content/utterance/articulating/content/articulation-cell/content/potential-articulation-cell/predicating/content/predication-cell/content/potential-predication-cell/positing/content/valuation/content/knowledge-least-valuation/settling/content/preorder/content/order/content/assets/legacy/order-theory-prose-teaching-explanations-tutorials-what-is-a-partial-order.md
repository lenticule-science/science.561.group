---
title: "What Is a Partial Order?"
description: "An introduction to partial orders for readers who know what 'less than' means but haven't encountered the general concept."
date-created: 2026-03-30
introduces:
  - partial-order
  - preorder
depends-on: []
type: concept-introduction
status: current
---
You already know what "less than" means for numbers: 3 is less than 7, and 7 is less than 10, and therefore 3 is less than 10. You also know that nothing is less than itself in the strict sense, but everything is "less than or equal to" itself.

A partial order takes these intuitions and applies them to anything, not just numbers. A partial order on a set is a relation $\leq$ satisfying three conditions:

**Reflexive**: $a \leq a$ for everything. Everything is "at least as much as" itself.

**Transitive**: if $a \leq b$ and $b \leq c$, then $a \leq c$. The relation chains.

**Antisymmetric**: if $a \leq b$ and $b \leq a$, then $a = b$. The only way two things can be mutually "less than or equal" is if they are the same thing.

Numbers satisfy all three. But the point of a partial order is that NOT everything has to be comparable. With numbers, given any two, one is always less than or equal to the other. A partial order does not require this. Two elements can be **incomparable**: neither $a \leq b$ nor $b \leq a$.

Consider sets ordered by inclusion. $\{1, 2\} \subseteq \{1, 2, 3\}$, and $\{1, 2, 3\} \subseteq \{1, 2, 3, 4\}$, so $\{1, 2\} \subseteq \{1, 2, 3, 4\}$. Transitive. Every set is a subset of itself. Reflexive. If $A \subseteq B$ and $B \subseteq A$, then $A = B$. Antisymmetric. But $\{1, 2\}$ and $\{2, 3\}$? Neither is a subset of the other. Incomparable. This is what makes the order partial — not every pair is comparable.

A **total order** (like numbers) is a partial order where every pair IS comparable. A partial order is strictly more general: it allows incomparability.

Why does this matter? Because most interesting orderings are partial. "More specific than" on types: a Dog is more specific than an Animal, and a Poodle is more specific than a Dog, but Dog and Cat are incomparable. "More informative than" on epistemic states: knowing "true" is more informative than knowing nothing, but "true" and "false" are incomparable — they are different information, not more or less of it.

A [preorder](../objects/preorder.md) is even weaker: it drops antisymmetry. Two different things can be mutually "less than or equal." This is useful when distinct entities can be interchangeable without being identical — like two documents that cover exactly the same topics.

A partial order is the foundation for [lattices](../objects/lattice.md), where every pair of elements has a greatest lower bound and a least upper bound.
