---
title: "Lattices"
aliases:
  - "Lattices"
  - "lattices"
date-created: 2025-12-26
type: lesson
authors:
  - emsenn
keywords:
  - OrderTheory
requires:
  - /mathematics/objects/posets/curricula/orders.md
teaches:
  - "Lattices"
---

## What this lesson covers

This lesson introduces [lattices](../terms/lattice.md): [partially ordered](../terms/partial-order.md) sets where every pair of elements has a greatest lower bound (meet) and a least upper bound (join). By the end, you will be able to determine whether a poset is a [lattice](../terms/lattice.md), compute meets and joins, and recognize bounded and complete [lattices](../terms/lattice.md).

## Why it matters

A [partial order](../terms/partial-order.md) lets you say "this is below that," but it does not guarantee you can combine two elements. Given two topics in a library — say *Modal Logic* and *Set Theory* — a [partial order](../terms/partial-order.md) under "is more specific than" tells you they are both below *Mathematics*. But is there a most specific topic that encompasses both? Is there a most general topic that both encompass?

A [lattice](../terms/lattice.md) guarantees these exist. For every pair of elements, there is a *best* common upper bound (their join) and a *best* common lower bound (their meet). This means you can always combine and intersect — you can always ask "what do these have in common?" (meet) and "what covers both of these?" (join).

Lattices are the stepping stone to [Heyting Algebras](./heyting-algebras.md), which add a notion of implication — and thus a logic — to the [lattice](../terms/lattice.md) structure. Without meets and joins, there is no implication. Without a [lattice](../terms/lattice.md), there is no [Heyting algebra](../../../concepts/heyting-algebra/index.md). The entire chain from [partial orders](../terms/partial-order.md) through [closure operators](../../../concepts/closure-operator/index.md) depends on this structure.

## Prerequisites

- [Partial Orders](./orders.md): the three axioms (reflexive, antisymmetric, transitive), Hasse diagrams, comparability and incomparability. You should be comfortable checking whether a relation is a [partial order](../terms/partial-order.md) and drawing its Hasse diagram.

## Core concepts

### Bounds

Given elements $a$ and $b$ in a poset $(S, \leq)$:

- An element $\ell$ is a **lower bound** of $\{a, b\}$ if $\ell \leq a$ and $\ell \leq b$.
- An element $u$ is an **upper bound** of $\{a, b\}$ if $a \leq u$ and $b \leq u$.

There may be many lower bounds and many upper bounds — or none at all.

*Example.* In the divisibility order on $\{1, 2, 3, 6\}$: the lower bounds of $\{2, 3\}$ are just $\{1\}$ (since $1$ divides both $2$ and $3$). The upper bounds of $\{2, 3\}$ are just $\{6\}$ (since both $2$ and $3$ divide $6$).

### Meet and join

The **meet** of $a$ and $b$, written $a \wedge b$, is the **greatest** lower bound — the lower bound that is above all other lower bounds. Formally, $a \wedge b = \ell$ where:
- $\ell \leq a$ and $\ell \leq b$ (it is a lower bound), and
- for every lower bound $\ell'$ of $\{a, b\}$, $\ell' \leq \ell$ (it is the greatest such).

The **join** of $a$ and $b$, written $a \vee b$, is the **least** upper bound — the upper bound that is below all other upper bounds.

If the meet or join does not exist for some pair, the poset is not a lattice.

### Lattice

A **lattice** is a poset where every pair of elements has a meet and a join. Equivalently, the operations $\wedge$ and $\vee$ are defined for all pairs and satisfy:

- **Commutative**: $a \wedge b = b \wedge a$ and $a \vee b = b \vee a$.
- **Associative**: $(a \wedge b) \wedge c = a \wedge (b \wedge c)$ and likewise for $\vee$.
- **Absorption**: $a \wedge (a \vee b) = a$ and $a \vee (a \wedge b) = a$.
- **Idempotent**: $a \wedge a = a$ and $a \vee a = a$.

These are not additional axioms — they follow from the definition of meet and join as greatest lower bound and least upper bound.

### Bounded lattice

A **bounded lattice** is a lattice with a greatest element $\top$ (top) and a least element $\bot$ (bottom), satisfying:

- $\bot \leq a \leq \top$ for every $a$.
- $a \wedge \top = a$ and $a \vee \bot = a$ for every $a$.

Most [lattices](../terms/lattice.md) encountered in practice are bounded. The existence of $\top$ and $\bot$ is required for defining [Heyting implication](./heyting-algebras.md) in the next lesson.

### Complete lattice

A **complete lattice** is a lattice where every subset (not just every pair) has a meet and a join. This is stronger than being a lattice: it means you can take the meet of infinitely many elements and get a result.

Every finite lattice is automatically complete (since you can compute the meet or join of any subset by iterating pairwise operations). Infinite [lattices](../terms/lattice.md) need not be complete.

## Worked example: the power set lattice

Continuing from the previous lesson, let $X = \{a, b\}$ and consider $(\mathcal{P}(X), \subseteq)$ — the subsets of $X$ ordered by inclusion.

**Computing meets and joins:**

| Pair | Meet ($\wedge$ = $\cap$) | Join ($\vee$ = $\cup$) |
|---|---|---|
| $\{a\}, \{b\}$ | $\emptyset$ | $\{a,b\}$ |
| $\{a\}, \{a,b\}$ | $\{a\}$ | $\{a,b\}$ |
| $\emptyset, \{b\}$ | $\emptyset$ | $\{b\}$ |

Every pair has a meet and a join, so this is a lattice.

It is **bounded**: $\bot = \emptyset$ and $\top = \{a,b\}$.

It is **complete**: the meet of any collection of subsets is their intersection, and the join is their union. (This works for arbitrary collections, not just pairs.)

**Hasse diagram** (same as before, now annotated with lattice operations):

```
   {a,b} = ⊤
   /   \
 {a}   {b}      {a} ∧ {b} = ∅,  {a} ∨ {b} = {a,b}
   \   /
    ∅ = ⊥
```

This lattice will serve as the basis for the [Heyting algebra](../../../concepts/heyting-algebra/index.md) in the next lesson, where we add an implication operation.

## A non-example: a poset that is not a lattice

Consider $S = \{a, b, c, d\}$ with:

```
  c   d
  |   |
  a   b
```

where $a \leq c$, $b \leq d$, and no other non-trivial comparisons hold. The pair $\{a, b\}$ has no upper bound — neither $c$ nor $d$ is above both $a$ and $b$. Since the join of $\{a, b\}$ does not exist, this is **not** a lattice.

Adding a top element $\top$ above both $c$ and $d$ would make the join of $\{a, b\}$ exist (it would be $\top$), but you would also need a bottom element $\bot$ below both $a$ and $b$ for the meet. The structure needed for a lattice is tighter than for a mere poset.

## Check your understanding

<details>
<summary>1. In the divisibility order on $\{1, 2, 3, 6\}$, what is $2 \wedge 3$? What is $2 \vee 3$?</summary>

$2 \wedge 3 = 1$ (the greatest common divisor). $2 \vee 3 = 6$ (the least common multiple). Since meets and joins exist for all pairs, $(\{1, 2, 3, 6\}, |)$ is a lattice. It is bounded with $\bot = 1$ and $\top = 6$.
</details>

<details>
<summary>2. Is the divisibility order on $\{2, 3, 4, 6\}$ a lattice?</summary>

Consider $4$ and $6$. Their lower bounds are the elements dividing both: $2$ divides both, so $2$ is a lower bound. Is $2$ the greatest lower bound? There is no element $> 2$ that divides both $4$ and $6$ ($3$ does not divide $4$, $4$ does not divide $6$). So $4 \wedge 6 = 2$. Now check the join: $4 \vee 6$ would be the least common multiple of $4$ and $6$, which is $12$. But $12 \notin S$. Since the join of $\{4, 6\}$ does not exist in $S$, this is **not** a lattice.
</details>

<details>
<summary>3. Why can't you define [Heyting implication](../../../disciplines/logic/terms/heyting-implication.md) without meets and joins?</summary>

[Heyting](../../../../general/people/arend-heyting.md) implication $a \Rightarrow b$ is defined as the greatest element $c$ such that $c \wedge a \leq b$. Computing this requires that meets exist (to make sense of $c \wedge a$) and that the set of all such $c$ has a greatest element (which is guaranteed in a lattice but not in a general poset). Without the lattice structure, implication cannot be defined.
</details>

## Common mistakes

- **Confusing "the meet exists" with "a lower bound exists."** A lower bound of $\{a, b\}$ is any element below both. The meet is the *greatest* such element. There may be many lower bounds but no greatest one (in which case the meet does not exist and the poset is not a lattice).
- **Assuming all posets are [lattices](../terms/lattice.md).** Many natural orders (like the divisibility order on arbitrary finite sets) are not [lattices](../terms/lattice.md). Always check that meets and joins exist for *every* pair.
- **Forgetting boundedness.** A lattice need not have a top and bottom. But [Heyting algebras](../../../concepts/heyting-algebra/index.md) and most structures in this sequence require boundedness. When moving to the next lesson, verify that $\top$ and $\bot$ exist.

## What comes next

The next lesson, [Heyting Algebras](./heyting-algebras.md), adds an implication operation to the bounded lattice. Given the lattice structure, $a \Rightarrow b$ is defined as the greatest element whose meet with $a$ stays below $b$. This gives the lattice the structure of an [intuitionistic logic](../../../disciplines/logic/curricula/intuitionistic-logic.md) — where "or" is not always decidable and double negation does not always cancel. [Heyting algebras](../../../concepts/heyting-algebra/index.md) are the algebraic foundation of the [Semiotic Universe](../../universes/semiotic-universe/index.md) and the structures that emerge from the [relational derivation](../../../../relationality/index.md).
