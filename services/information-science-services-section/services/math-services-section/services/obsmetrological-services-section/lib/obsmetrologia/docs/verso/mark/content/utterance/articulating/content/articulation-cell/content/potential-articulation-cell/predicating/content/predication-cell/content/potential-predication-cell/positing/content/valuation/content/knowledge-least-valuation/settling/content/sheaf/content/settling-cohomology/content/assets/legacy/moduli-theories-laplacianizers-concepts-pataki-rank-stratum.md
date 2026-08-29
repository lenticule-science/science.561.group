---
type: concept
class: subset
symbol: \mathrm{Stratum}_{\mathrm{II}}^{\mathrm{coarse}}(\mathbf r)
depends-on: [hilbert-degeneracy-stratification]
see-also: [schubert-invariant, stratification-ii, kernel-of-Q]
classical-anchor: [pataki-cone-lp]
---

# Pataki rank stratum

The coarse stratification of the closed cone $\overline{\mathrm{Sym}^+_m}$ (and its product across chain degrees, $\overline{\mathcal H}$) by the rank of the Hilbert structure. Classical for SDP face theory (Pataki 1995); used here as the coarse layer of [Stratification II](../objects/stratification-ii.md).

## Definition

For $\overline{\mathrm{Sym}^+_m}$ — the cone of positive-semidefinite real symmetric $m \times m$ matrices — the **Pataki stratum** of rank $r$ is
$$\{Q \in \overline{\mathrm{Sym}^+_m} : \mathrm{rank}\, Q = r\}, \qquad 0 \le r \le m.$$

This is a smooth submanifold of dim $rm - \binom{r}{2}$. It can be parametrized as $\{LL^T : L \in \mathbb R^{m \times r},\ \mathrm{rank}\, L = r\} / O(r)$ (factorization by injective $m \times r$ matrices modulo right-multiplication by orthogonal $r \times r$).

## Codim formula

The codim of the rank-$r$ stratum in $\mathrm{Sym}_m$ is
$$\binom{m+1}{2} - rm + \binom{r}{2} = \binom{m - r + 1}{2}.$$

The "rank-deficit triangular number" — the codim depends only on the rank-deficit $m - r$.

## Closure relations

The rank-$r$ stratum is in the closure of the rank-$r'$ stratum iff $r \le r'$. The closure poset is the chain $0 \le 1 \le \cdots \le m$ — equivalently, "rank can only drop in the limit," upper-semi-continuity of rank.

## Product extension to chain complexes

For a chain complex with chain spaces $C_n$ of dim $m_n$, the **product Pataki stratification** of $\overline{\mathcal H} = \prod_n \overline{\mathrm{Sym}^+_{m_n}}$ has strata indexed by rank tuples $\mathbf r = (r_0, \ldots, r_N)$:
$$\mathrm{Stratum}^{\mathrm{coarse}}_{\mathrm{II}}(\mathbf r) := \prod_n \{Q_n \in \overline{\mathrm{Sym}^+_{m_n}} : \mathrm{rank}\, Q_n = r_n\}.$$

Codim of the $\mathbf r$-stratum: $\sum_n \binom{m_n - r_n + 1}{2}$. Closure poset: product of chains $\prod_n \{0, \ldots, m_n\}$ with coordinate-wise order.

## Refinement by chain-complex Schubert structure

The Pataki coarse stratum ignores the chain structure $(d_n)$. The chain-complex *refinement* records how the kernel $K_n = \ker Q_n$ sits relative to the algebraic filtration $0 \subseteq \mathrm{im}\, d_{n+1} \subseteq \ker d_n \subseteq C_n$. This refinement is by [Schubert invariants](schubert-invariant.md), giving sub-strata within each Pataki stratum.

## Top and bottom

- **Top stratum**: $\mathbf r = (m_0, \ldots, m_N)$, all $Q_n$ full-rank. Equals the SPD interior $\mathcal H$.
- **Bottom stratum**: $\mathbf r = (0, \ldots, 0)$. Equals the origin $\{0\}$ in $\overline{\mathcal H}$.
- All other Pataki strata live in the boundary $\partial \overline{\mathcal H} = \overline{\mathcal H} \setminus \mathcal H$.
