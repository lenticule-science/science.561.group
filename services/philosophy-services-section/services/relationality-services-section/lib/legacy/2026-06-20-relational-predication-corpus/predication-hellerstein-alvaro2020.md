---
type: reference
authors: [Hellerstein, Joseph M., Alvaro, Peter]
year: 2020
title: "Keeping CALM: When Distributed Consistency is Easy"
venue: "Communications of the ACM 63(9), 72–81"
---

## Full citation

J. M. Hellerstein, P. Alvaro. "Keeping CALM: When Distributed Consistency is Easy." *Communications of the ACM* 63(9), 72–81, 2020.

## Status

Pending direct access.

## Annotation

The **CALM theorem**: a program has a consistent, coordination-free distributed implementation if and only if it is **monotonic** in a suitable lattice-theoretic sense. CALM = *Consistency As Logical Monotonicity*.

For the program: predication-settling-based computation is a CALM instance — predication-settling updates are monotone in $\leq_k$, so by CALM all queries computable as $\leq_k$-monotone functions of the predication-settling state can be evaluated without cross-replica coordination. See [settling CALM corollary](../theorems/settling-calm-corollary.md) and [cohomological CALM](../theorems/cohomological-calm.md).

The cohomological layer reformulates CALM compatibility cohomologically: for settling-derived sheaves, all Mayer–Vietoris obstructions vanish.
