---
type: term
term-kind: concept
class: integer-tuple
symbol: (a_n, z_n, k_n)
depends-on: [pataki-rank-stratum, kernel-of-Q]
see-also: [stratification-ii, hilbert-degeneracy-stratification, chain-filtration]
---

# Schubert invariant of a degenerate Hilbert structure

The chain-complex-respecting refinement of the [Pataki rank stratum](pataki-rank-stratum.md). For $Q \in \partial \overline{\mathcal H}$ at the SPD-cone boundary, records how $K_n = \ker Q_n$ sits relative to the chain filtration of $C_n$.

## The chain filtration

For a chain complex $(C_\bullet, d)$, each $C_n$ has the intrinsic algebraic filtration
$$0 \subseteq \mathrm{im}\, d_{n+1} \subseteq \ker d_n \subseteq C_n,$$
of dims $0, \rho_{n+1}, m_n - \rho_n, m_n$ where $\rho_k = \mathrm{rank}\, d_k$.

This filtration depends only on $(C_\bullet, d)$, not on any Hilbert structure $Q$.

## Schubert tuple

For $Q$ with kernel $K_n = \ker Q_n$ of dim $k_n = m_n - r_n$, define
$$a_n := \dim(K_n \cap \mathrm{im}\, d_{n+1}), \qquad z_n := \dim(K_n \cap \ker d_n), \qquad k_n := \dim K_n.$$

The triple $(a_n, z_n, k_n)$ records how $K_n$ intersects the filtration:
- $a_n$: kernel ∩ boundaries (dim of $K_n$ inside $\mathrm{im}\, d_{n+1}$).
- $z_n - a_n$: kernel ∩ harmonics (dim of $K_n$ inside $\ker d_n / \mathrm{im}\, d_{n+1}$, the homological piece).
- $k_n - z_n$: kernel ∩ cocycles (dim of $K_n$ outside $\ker d_n$, the "cocycle" piece).

Constraints: $0 \le a_n \le \min(k_n, \rho_{n+1})$, $a_n \le z_n \le \min(k_n, m_n - \rho_n)$.

## Generic Schubert invariants

For a *generic* $Q$ in the Pataki stratum of rank $r_n$ (kernel of dim $k_n$), the kernel is a generic $k_n$-dim subspace of $C_n$. By Grassmannian generic-position arguments:
$$a_n^{\mathrm{gen}} = \max(0, k_n + \rho_{n+1} - m_n), \qquad z_n^{\mathrm{gen}} = \max(0, k_n - \rho_n).$$

## Schubert codim

The locus where the Schubert invariants take non-generic values $(a_n, z_n, k_n)$ has additional codim within the Pataki stratum. By the Grassmannian Schubert codim formula, the codim of "$\dim(K_n \cap V) \ge j$" for fixed $V \subset C_n$ of dim $v$ in $\mathrm{Gr}(k_n, m_n)$ is
$$j(m_n - v - k_n + j) \quad \text{for}\ j \ge \max(0, k_n + v - m_n).$$

Applied to the chain filtration: the codim of "$a_n \ge a, z_n \ge z$" within the Pataki rank-$r_n$ stratum is the standard nested-Schubert codim with $V_1 = \mathrm{im}\,d_{n+1}, V_2 = \ker d_n$.

## Sub-stratification of $\overline{\mathcal H}$

Combining Pataki rank tuple $\mathbf r$ with Schubert invariants $\sigma = (a_n, z_n, k_n)_n$, the [Stratification II](./stratification-ii.md) strata are
$$\mathrm{Stratum}_{\mathrm{II}}(\mathbf r, \sigma) := \{Q : \mathrm{rank}\, Q_n = r_n,\ (a_n(Q), z_n(Q), k_n(Q)) = \sigma_n\ \forall n\}.$$

Total codim in $\overline{\mathcal H}$: $\sum_n \binom{m_n - r_n + 1}{2} + \mathrm{Schubert}(\mathbf r, \sigma)$.

## Closure poset

The Schubert refinement of the Pataki product chain has the closure relation: $\sigma' \le \sigma$ if for each $n$ where $r_n = r'_n$, the kernel intersection numbers refine: $a_n \ge a'_n$, $z_n \ge z'_n$ (kernel can only grow / contain larger subspaces in the limit). For rank drops $r_n < r'_n$, additional kernel directions can land anywhere consistent with the chain structure.

## Worked example: $K_1 = \mathrm{im}\, d_{n+1}$

The simplest non-trivial Schubert refinement: kernel of $Q_n$ exactly contains $\mathrm{im}\, d_{n+1}$.

For the $(2, 1)$ chain complex with $m_1 = 3, \rho_1 = 2, \rho_2 = 1$, kernel dim $k_1 = 1$:
- Generic: $a_1^{\mathrm{gen}} = 0$, $z_1^{\mathrm{gen}} = 0$. Kernel disjoint from filtration.
- Refined: $a_1 = 1, z_1 = 1$. Kernel contains $\mathrm{im}\, d_2 = \langle e_3 \rangle$.
- Schubert codim: $1 \cdot (3 - 1 - 1 + 1) = 2$.
- Total codim: $\binom{2}{2} + 2 = 1 + 2 = 3$.

This matches Component 2 of the EDD = 40 boundary analysis ([example](../../documents/articles/teaching-articles/examples/edd-computation-on-2-1-chain.md)).
