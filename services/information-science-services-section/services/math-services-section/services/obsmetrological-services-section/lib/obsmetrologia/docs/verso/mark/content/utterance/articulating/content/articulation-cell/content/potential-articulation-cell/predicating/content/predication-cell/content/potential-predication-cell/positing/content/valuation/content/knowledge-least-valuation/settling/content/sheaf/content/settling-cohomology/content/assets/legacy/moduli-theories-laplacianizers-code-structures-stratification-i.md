---
type: object
class: stratification
depends-on:
- hilbert-structure-cone
- bipartite-multipartition
- stratum-eigenvalue-multiplicity
see-also:
- stratification-ii
- bipartite-multipartition-lattice
- closure-poset-of-strata
references:
- key: aksoy2025reimagining
  type: article
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
- key: schwahn2025einstein
  type: article
  - Schwahn, Paul
  - Semmelmann, Uwe
  year: 2025
  title: Einstein metrics, their moduli spaces and stability
  eprint: '2507.18463'
  eprinttype: arxiv
---

# Stratification I (eigenvalue multipartition)

The intrinsic stratification of $\mathcal M_{\mathrm{Lap}}$ in the SPD interior, by [bipartite multipartitions](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/bipartite-multipartition.md) of the Hodge spectrum.

## Definition

The decomposition
$$\mathcal H = \bigsqcup_\Pi \mathrm{Stratum}(\Pi), \qquad \mathcal M_{\mathrm{Lap}} = \bigsqcup_\Pi G \backslash \mathrm{Stratum}(\Pi),$$
where $\Pi$ ranges over [bipartite multipartitions](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/bipartite-multipartition.md) of the indexing set $[N_*]$, and $\mathrm{Stratum}(\Pi) = \{Q \in \mathcal H : \Pi(Q) = \Pi\}$ is the locus of Hilbert structures with bipartite multipartition exactly $\Pi$.

## Key properties

- **Codim**: $\sum_B (|B|-1)$ for stratum $\Pi$, in moduli (after quotient by gauge).
- **Stab dim**: $\sum_B \sum_n \binom{k_n^B}{2}$.
- **Closure poset**: bipartite multipartition refinement lattice.
- **Realizability**: every $\Pi$ is realized in the unconstrained case ([proved](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/bipartite-realizability.md)).
- **Interior to $\mathcal H$**: all strata live entirely inside the SPD interior $\mathcal H$, not at its boundary.

## What it sees

Stratification I depends only on **spectral data** of $\Delta(Q)$ — specifically, the bipartite multipartition of the squared singular values of weighted boundaries $\widetilde d_n$. It is invariant under the gauge action and intrinsic to the moduli.

It does *not* see the rank or kernel structure of $Q$ itself — those only become visible at the SPD-cone boundary, where Stratification II takes over.

## Universality across categories

The same stratification structure (universal codim formula, category-specific stab) appears in:
- [Cellular finite-dim case](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/bipartite-stratification-theorem.md) — proved.
- [Smooth Riemannian case](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/cross-category-smooth.md) — proved, via Ebin + Kato + Myers–Steenrod.
- [@aksoy2025reimagining] — instance of finite-dim cellular.
- [Finite spectral triple case](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/finite-spectral-triple-laplacianizability.md) — proved via Hochschild-Hilbert lift.
- [@schwahn2025einstein] — specialization of smooth Riemannian.

The precise category-free hypothesis under which Stratification I is well-defined is the [cross-category orbifold-stratification theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/cross-category-orbifold-stratification.md), partial-proved.

## Univariate specialization

For $N = 1$ (single chain space, single boundary operator), bipartite multipartitions reduce to ordinary partitions of $r_1$, and Stratification I reduces to the classical Arnold–Weinstein eigenvalue stratification of $\mathrm{Sym}^+_n$.

## Bipartite content

For $N \ge 2$, the bipartite extension produces structurally new content:
- Cross-degree blocks (eigenvalue identifications between different $d_n$'s) contribute to codim but not to stab.
- The closure poset is the bipartite multipartition refinement lattice, richer than the univariate partition lattice.
- Realizability under sparsity (cellular-sheaf case) becomes substantive — the [chain-complex IEP-G program](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/chain-complex-iep-g.md).
