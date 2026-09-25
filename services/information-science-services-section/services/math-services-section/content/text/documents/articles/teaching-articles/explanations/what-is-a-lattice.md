---

title: "What Is a Lattice?"
description: "An introduction to lattices for readers who understand 'greater than' and 'less than' but haven't seen the algebraic structure."
date-created: 2026-03-30
requires:
  - partial-order
teaches:
  - lattice
  - meet
  - join
type: explanation

---

A [partial order](./what-is-a-partial-order.md) lets you compare things. A lattice guarantees that comparisons always produce results.

Given two elements $a$ and $b$ in a partial order, you can ask: what is the most you can say that is true of both? And: what is the least you can say that covers both? In a lattice, these questions always have answers.

The **meet** of $a$ and $b$ (written $a \wedge b$) is their greatest lower bound: the largest element that is below both $a$ and $b$. Think of it as "what $a$ and $b$ agree on."

The **join** of $a$ and $b$ (written $a \vee b$) is their least upper bound: the smallest element that is above both. Think of it as "the least thing that accounts for both $a$ and $b$."

A **lattice** is a partial order where every pair of elements has a meet and a join.

Consider sets ordered by inclusion again. The meet of $\{1, 2, 3\}$ and $\{2, 3, 4\}$ is their intersection $\{2, 3\}$ — the largest set contained in both. The join is their union $\{1, 2, 3, 4\}$ — the smallest set containing both. Every pair of sets has an intersection and a union, so sets under inclusion form a lattice.

A lattice has a **top** element $\top$ if there is something above everything: $a \leq \top$ for all $a$. And a **bottom** element $\bot$ if there is something below everything: $\bot \leq a$ for all $a$. A lattice with both is **bounded**.

A lattice is **distributive** if meet and join interact nicely: $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$. This says: taking the meet with $a$ distributes over a join, the same way multiplication distributes over addition in arithmetic. Most lattices you encounter in practice are distributive.

A lattice is **complete** if meets and joins exist not just for pairs but for ALL subsets, including infinite ones. The power set of any set (all subsets, ordered by inclusion) is a complete lattice.

Lattices appear everywhere: types in a programming language ordered by subtyping form a lattice. Propositions ordered by entailment form a lattice. Concepts ordered by generality form a lattice. Any time you have a collection of things with a natural "more specific / more general" ordering, and the ordering behaves well enough that "most specific common generalization" and "most general common specialization" always exist, you have a lattice.

The step from a lattice to a [residuated lattice](./from-lattices-to-residuated-lattices.md) adds a product operation — a way to COMBINE elements, not just compare them — and that step is where the algebra becomes capable of modeling predication.
