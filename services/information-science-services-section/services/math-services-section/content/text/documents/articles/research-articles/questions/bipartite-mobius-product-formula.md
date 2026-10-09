---
type: question
status: open
explores: [bipartite-multipartition-lattice, bipartite-vassiliev-shapiro-vainshtein, refinement-cover]
title: Does the bipartite Möbius function factor over blocks?
description: "The Möbius function of the bipartite multipartition lattice is conjectured to factor as a product over blocks of univariate Möbius factors:"
---

# Does the bipartite Möbius function factor over blocks?

The Möbius function of the [bipartite multipartition lattice](../../../../glossary/terms/bipartite-multipartition-lattice.md) is conjectured to factor as a product over blocks of univariate Möbius factors:

> **Conjecture.** For $\Pi \preceq \Pi'$ in $\mathcal P_{\mathrm{bip}}$,
> $$\mu_{\mathcal P_{\mathrm{bip}}}(\Pi, \Pi') = \prod_{B \in \Pi} \mu_{\Pi_{|B|}}(\hat 0_B, \Pi'|_B)$$
> where $\Pi'|_B$ is the partition of $B$ induced by $\Pi'$ refining $B$, and $\mu_{\Pi_{|B|}}$ is the classical partition-lattice Möbius function $\mu(\hat 0, \pi) = (-1)^{|\pi|-1}(|\pi|-1)!$.

## Status

- **Univariate case** ($N = 1$): the bipartite multipartition lattice is the partition lattice $\Pi_{r_1}$, and the conjecture reduces to the classical formula. ✓ Verified numerically for $r_1 = 2, 3, 4$ via toolkit (`mobius_and_vassiliev.py`): $\mu(\text{coarsest}, \text{finest}) = -1, 2, -6$ matches $(-1)^{n-1}(n-1)!$.

- **Hodge-constrained case** for (2, 2): toolkit verifies $\mu(\Pi_{\max}, \Pi_{\min}) = -1$ in the binary lattice, consistent with the formula reducing to $\Pi_2$ on Hodge-pairs.

- **General**: not proved.

## Why this matters

The product factorization is structurally important for two reasons:

1. **Computability of $E_2$ in bipartite Vassiliev**. The bipartite Vassiliev spectral sequence ([entry](../../learning-articles/research-papers/bipartite-vassiliev-shapiro-vainshtein/bipartite-vassiliev-shapiro-vainshtein.md)) has differentials computed from $\mu_{\mathcal P_{\mathrm{bip}}}$. If the Möbius factors over blocks, the $E_2$ page computation reduces to per-block calculations using classical partition-lattice Möbius.

2. **Shapiro–Vainshtein extension**. The classical $E_2$-degeneration for the univariate case relies on the partition-lattice Möbius having the well-known factorial form. The bipartite analog of $E_2$-degeneration would similarly leverage the product structure of the bipartite Möbius — if it exists.

## Why it should hold

The bipartite multipartition lattice is *not* literally a product of partition lattices. But the refinement structure, *for fixed coarse partition $\Pi$*, decomposes per-block: refining $\Pi$ to $\Pi'$ is independently refining each block of $\Pi$. So the interval $[\Pi, \hat 1]$ in $\mathcal P_{\mathrm{bip}}(\mathbf r)$ is a product of intervals $\prod_B [\hat 0_B, \hat 1_B]$ in partition lattices of $|B|$.

By the standard Möbius-function-of-product-poset formula, $\mu$ on a product is the product of $\mu$'s. So the conjecture is *plausible* once we identify the interval structure as a product.

## What needs to be proved

The interval $[\Pi, \Pi']$ in $\mathcal P_{\mathrm{bip}}$ is NOT in general a product of partition lattices when $\Pi$ has constraints (e.g., Hodge-forced cross-degree blocks that aren't allowed to split). For Hodge-constrained lattices, the interval structure is restricted, and the product formula may not apply directly.

The conjecture should be:

> For Hodge-unconstrained bipartite multipartition lattices, $\mu$ factors as conjectured. For Hodge-constrained lattices, the factorization holds for refinements that respect the Hodge constraints, with appropriate restriction.

## Concrete cases to test

- $(3, 3)$ chain Hodge-constrained: lattice has 5 elements (= $\Pi_3$ on 3 Hodge-pairs). Compute $\mu$ via toolkit and check factorization.
- $(2, 1)$ chain Hodge-constrained: 3 elements. Toolkit gives $\mu = -1, -1, 2$ for the three non-trivial pairs.
- Higher cases with cross-degree blocks of size $> 2$.

## Connection to Whitney–lattice / supersolvable structure

The univariate partition lattice $\Pi_n$ is a *geometric lattice* (its Möbius function takes specific signs on intervals). Whether the bipartite multipartition lattice is geometric, or supersolvable, or has any of the standard combinatorial-lattice structures, is a side question that would inform the Möbius factorization.
