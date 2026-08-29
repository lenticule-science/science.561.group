---

introduces: order-element
description: "A value unchanged by an operation: f(x) = x. The Knaster-Tarski theorem guarantees least fixpoints exist on complete lattices."
defines: fixpoint
aliases: [fixed point, fixpoints, fixed points, least fixpoint]
existence-theorem: knaster-tarski
requires: [monotone, complete-lattice]
computed-by: closure
bilattice-application: fitting-1991
convergence-bound: "2 × |assertions| on four-valued bilattice"
result-of-closure: "⊥ eliminated within scope"
date-created: 2026-03-30
---

A **fixpoint** of a function $f$ is a value $x$ satisfying $f(x) = x$. The function maps $x$ to itself.

The **Knaster-Tarski theorem**: every monotone function on a complete [lattice](./lattice.md) has a least fixpoint (and a greatest fixpoint). The least fixpoint is the meet of all pre-fixpoints ($x$ with $f(x) \leq x$).

In logic programming on [bilattices](../../algebra/terms/bilattice.md), Fitting (1991) used the Knaster-Tarski theorem to show that inference operators on bilattice-valued assignments reach a least fixpoint — the closure of the program under its inference rules. The closure makes all derivable knowledge explicit.

On the four-valued bilattice $\mathbf{2} \otimes \mathbf{2}$, the knowledge ordering $\leq_k$ has height 2, so fixpoint iteration converges in at most $2n$ steps where $n$ is the number of assertions. After closure, all in-scope assertions carry values in $\{t, f, \top\}$ — the $\bot$ (unattested) state has been resolved by inference.
