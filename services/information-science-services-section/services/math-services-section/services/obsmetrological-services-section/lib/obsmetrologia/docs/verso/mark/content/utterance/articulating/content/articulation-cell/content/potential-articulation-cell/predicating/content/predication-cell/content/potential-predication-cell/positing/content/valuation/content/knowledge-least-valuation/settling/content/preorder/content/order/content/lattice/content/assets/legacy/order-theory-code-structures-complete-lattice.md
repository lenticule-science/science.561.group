---

introduces: algebraic-structure
description: "A lattice where meets and joins exist for all subsets, not just finite ones. The setting for the Knaster-Tarski fixpoint theorem."
defines: complete-lattice
aliases: [complete lattice, complete lattices]
specialization: lattice
enables: fixpoint
date-created: 2026-03-30
---

A complete [lattice](./lattice.md) is a lattice where every subset has a meet (greatest lower bound) and a join (least upper bound) — not just pairs, but arbitrary subsets including infinite ones.

Every complete lattice is bounded: the join of the empty set is the bottom element $\bot$, and the meet of the empty set is the top element $\top$.

The **Knaster-Tarski theorem**: every monotone function on a complete lattice has a least [fixpoint](./fixpoint.md) and a greatest fixpoint. This is the foundation for closure operations in logic programming and bilattice semantics (Fitting 1991).

The power set of any set, ordered by inclusion, is a complete lattice. The set of all [epistemic states](../../../../information/terms/epistemic-state.md) $\{\bot, t, f, \top\}^n$ ordered pointwise by the knowledge ordering is a complete lattice of height $2n$.
