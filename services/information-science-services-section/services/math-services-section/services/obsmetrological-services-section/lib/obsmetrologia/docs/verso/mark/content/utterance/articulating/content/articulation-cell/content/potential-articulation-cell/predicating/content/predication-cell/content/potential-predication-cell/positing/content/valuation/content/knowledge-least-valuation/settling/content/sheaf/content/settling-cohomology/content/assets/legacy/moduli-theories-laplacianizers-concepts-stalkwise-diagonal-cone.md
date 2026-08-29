---
type: concept
class: subcone
symbol: \mathcal H_{\mathrm{diag}}
depends-on: [hodge-laplacian]
see-also: [chain-complex-iep-g, cellular-sheaf, gauge-group]
---

# Stalkwise diagonal cone

The natural sub-cone of inner products imposed by the cellular-sheaf framework: each $Q_n$ is required to be diagonal in a chosen cellular basis.

## Definition

For a cellular chain complex $(C_\bullet, d)$ with distinguished cellular bases (one per chain space), the **stalkwise diagonal cone** is
$$\mathcal H_{\mathrm{diag}} := \{Q \in \mathcal H : Q_n \in \mathrm{diag}(\mathbb R^{m_n}_{>0})\ \text{for all}\ n\} = \prod_n \mathbb R^{m_n}_{>0}.$$

Each $Q_n = \mathrm{diag}(w_{1,n}, \ldots, w_{m_n, n})$ assigns one positive weight per cell of degree $n$. The total parameter count is $\sum_n m_n$ (one per cell).

## Codim in $\mathcal H$

The diagonal cone has codim $\sum_n \binom{m_n}{2}$ in $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ — the off-diagonal entries of each $Q_n$ are killed.

For small examples:
- $\partial \Delta^2$: $\mathcal H$ has dim 6 ($\binom{3+1}{2} \cdot 2 = 12$? wait, 3 vertices + 3 edges, $\dim \mathrm{Sym}^+_3 = 6$ each, so $12$ total). $\mathcal H_{\mathrm{diag}}$ has dim 6 (3 vertex weights + 3 edge weights). Codim 6.
- $\partial \Delta^3$: $\mathcal H$ has dim $10 + 21 + 10 = 41$. $\mathcal H_{\mathrm{diag}}$ has dim $4 + 6 + 4 = 14$. Codim 27.

## Cellular automorphism group

The chain auto group $G$ of $(C_\bullet, d)$ in general is large — $\dim G = \sum_n \dim O(\mathcal E_n)$ for full-Hodge-eigenspace decomposition, or smaller if chain conditions constrain.

Restricted to $\mathcal H_{\mathrm{diag}}$, the natural automorphism group is the **cellular automorphism group** $G_{\mathrm{cell}} \subset G$ — chain autos that preserve the cellular basis up to signed permutation. $G_{\mathrm{cell}}$ is *finite* in general (= the symmetry group of the underlying CW complex), much smaller than $G$.

## Realizability becomes substantive

In the unconstrained case ($Q \in \mathcal H$), every bipartite multipartition is realized as a non-empty stratum ([bipartite realizability](../theorems/bipartite-realizability.md)).

In the stalkwise diagonal case ($Q \in \mathcal H_{\mathrm{diag}}$), realizability is non-trivial. Some bipartite multipartitions are *not* realizable in $\mathcal H_{\mathrm{diag}}$ — this is the [chain-complex IEP-G program](../theorems/chain-complex-iep-g.md), generalizing the classical IEP-G obstructions.

The first concrete obstruction is **paths admit no within-degree multiplicity** (Sturm tridiagonal-simplicity, [proved](../theorems/chain-complex-iep-g.md)). Computational catalog ([toolkit](../tools/python-toolkit/)) refines this:
- Vertex-transitive graphs ($K_n$, $C_n$, $\partial \Delta^n$) admit some spectral degeneracy.
- Star graphs $K_{1, n}$ admit only partial degeneracy (the leaf-symmetry gives mult $(2, 1)$, not $(n)$).
- Cycle $C_4$ admits only mult $(2, 1)$ at uniform weights, not $(3)$.

## Decomposition theorem

The realizability of a bipartite multipartition $\Pi$ in $\mathcal H_{\mathrm{diag}}$ decomposes per-degree: $\Pi$ is realizable iff each within-degree restriction $\Pi|_n$ is univariate-IEP-G-realizable for the [boundary-operator graph](boundary-operator-graph.md) at degree $n$. ([Theorem](../theorems/chain-complex-iep-g-decomposition.md), sketch.)

## Why the constraint matters for laplacianizers

The 2025 wave's cellular-sheaf and weighted-graph constructions all live in $\mathcal H_{\mathrm{diag}}$ (one weight per cell, sometimes per edge as well). Realizability of bipartite multipartitions in $\mathcal H_{\mathrm{diag}}$ is what controls "which Laplacians can actually be obtained from the cellular construction." The unconstrained $\mathcal H$ is the algebraic baseline, but the practical question is what's realizable in $\mathcal H_{\mathrm{diag}}$.
