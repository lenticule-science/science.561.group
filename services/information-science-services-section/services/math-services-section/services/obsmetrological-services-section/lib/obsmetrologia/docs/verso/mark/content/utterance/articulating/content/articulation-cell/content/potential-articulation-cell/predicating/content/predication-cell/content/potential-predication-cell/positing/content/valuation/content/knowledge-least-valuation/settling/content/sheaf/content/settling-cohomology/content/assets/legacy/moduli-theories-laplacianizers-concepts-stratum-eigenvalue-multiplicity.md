---
type: concept
class: subset
symbol: \mathrm{Stratum}(\Pi)
depends-on: [bipartite-multipartition, squared-singular-value]
see-also: [stratification-i, stratification-ii, bipartite-multipartition-lattice]
---

# Stratum (eigenvalue-multiplicity)

A **stratum** of $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ (or its image in $\mathcal M_{\mathrm{Lap}} = G \backslash \mathcal H$) is the locus of Hilbert structures with a fixed [bipartite multipartition](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/bipartite-multipartition.md) $\Pi$:
$$\mathrm{Stratum}(\Pi) := \{Q \in \mathcal H : \Pi(Q) = \Pi\}.$$

Strata are pairwise disjoint and cover $\mathcal H$. Their union is the **eigenvalue stratification** of $\mathcal H$ (= [Stratification I](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/stratification-i.md)).

## Geometric structure

Each $\mathrm{Stratum}(\Pi)$ is:

- A **locally closed real semi-algebraic set** in $\mathcal H$. Closed conditions $\sigma_i^2 = \sigma_j^2$ hold for indices in the same block of $\Pi$; open conditions $\sigma_i^2 \ne \sigma_j^2$ for indices in distinct blocks.

- **Codimension** $\sum_B(|B|-1) = N_* - \#\Pi$ in moduli (modulo the gauge action). [Proved](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/stab-codim-formula.md).

- **Stab dimension** $\sum_B \sum_n \binom{k_n^B}{2}$ at any point of the stratum (under the chain auto group $G$). [Proved](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/stab-codim-formula.md).

- A **fiber bundle** over the open simplex $\mathrm{Spec}^*(\Pi)$ of distinct eigenvalues compatible with $\Pi$, with fiber a real partial flag manifold $G / \mathrm{stab}(\Pi)$.

## Realizability

Strata are non-empty for *every* bipartite multipartition $\Pi$ compatible with the chain rank profile $(r_n)$ — the [bipartite realizability theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/bipartite-realizability.md). With sparsity constraints (e.g., stalkwise diagonal cellular sheaves), realizability becomes substantive — the [chain-complex IEP-G program](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/chain-complex-iep-g.md).

## Closure relations

$\overline{\mathrm{Stratum}(\Pi')} = \bigsqcup_{\Pi \succeq \Pi'} \mathrm{Stratum}(\Pi)$ — the closure consists of the stratum together with all coarser strata. The closure poset is the [bipartite multipartition refinement lattice](../objects/bipartite-multipartition-lattice.md). [Proved](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/closure-poset-of-strata.md).

## Distinguished strata

- **Open dense (generic) stratum**: $\Pi = \Pi_{\min}$, the multipartition with only Hodge-forced cross-degree blocks (and otherwise singletons). Codim 0 modulo Hodge constraints.

- **Top (supersymmetric) stratum**: $\Pi = \Pi_{\max} = \{\{[N_*]\}\}$ (single block of all indices). Codim $N_* - 1$. Realizable in the unconstrained case; subject to IEP-G obstructions in the cellular case.

- **Intermediate strata**: any refinement order between $\Pi_{\min}$ and $\Pi_{\max}$.

## Distinct from Hilbert-degeneracy strata

Strata in this sense (Stratification I) live in the SPD interior $\mathcal H$. The closure $\overline{\mathcal H}$ has a *second* family of strata — the [Pataki rank strata](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/pataki-rank-stratum.md) at the SPD-cone boundary, refined by [Schubert invariants](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/schubert-invariant.md) — collectively [Stratification II](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/stratification-ii.md). Stratification I depends on spectral data of $\Delta(Q)$; Stratification II depends on rank/kernel data of $Q$ itself.
