---
term-kind: object
class: open-cone
symbol: \mathcal H
depends-on: [hodge-laplacian]
see-also: [moduli-of-laplacianizations, algebraic-closure-of-H, stratification-i, stratification-ii]
---

# Hilbert structure cone $\mathcal H$

The space of Hilbert structures on a chain complex — the upstairs of the moduli quotient.

## Definition

For a finite-dim graded chain complex $(C_\bullet, d)$ with chain dims $m_n = \dim C_n$,
$$\mathcal H := \prod_n \mathrm{Sym}^+(C_n)$$
is the open product of cones of positive-definite real symmetric forms on each $C_n$.

Each point $Q = (Q_0, Q_1, \ldots) \in \mathcal H$ specifies an inner product on each chain space, hence a Hilbert structure on $(C_\bullet, d)$ inducing the [Hodge Laplacian](./hodge-laplacian.md) $\Delta_n^{(Q)} = d_n^* d_n + d_{n+1} d_{n+1}^*$ via the Hilbert adjoint $d^* = Q_n^{-1} d_n^T Q_{n-1}$.

## Topology and structure

- **Open subset** of $\prod_n \mathrm{Sym}(C_n)$ (the linear space of symmetric forms).
- **Real algebraic open cone**: invariant under positive scaling $Q \mapsto \lambda Q$ for each chain space independently.
- **Dimension**: $\sum_n \binom{m_n + 1}{2}$.
- **Riemannian symmetric space structure**: each $\mathrm{Sym}^+(C_n) \cong \mathrm{GL}(C_n) / O(C_n)$ is a Riemannian symmetric space (positive part of the symmetric pair). $\mathcal H$ inherits a product Riemannian symmetric structure.

## Action of the chain auto group

The chain auto group $G$ acts on $\mathcal H$ via $g \cdot Q = (g_n^T Q_n g_n)_n$. The quotient $G \backslash \mathcal H = \mathcal M_{\mathrm{Lap}}$ is the [moduli of Laplacianizations](./moduli-of-laplacianizations.md).

The action is proper (since $G$ is a Lie group and orbits are submanifolds). Generic stabilizer is finite (discrete); positive-dim stabilizers occur at structurally symmetric Hilbert structures (e.g., the Euclidean Hilbert structure for vertex-transitive graphs).

## Algebraic closure

$\mathcal H$ has an algebraic closure
$$\overline{\mathcal H} = \prod_n \overline{\mathrm{Sym}^+(C_n)},$$
the closed cone of positive-semidefinite forms. The boundary $\partial \overline{\mathcal H} = \overline{\mathcal H} \setminus \mathcal H$ consists of tuples where at least one $Q_n$ is rank-deficient. Both stratifications of moduli — [Stratification I](./stratification-i.md) (interior) and [Stratification II](./stratification-ii.md) (boundary) — are visible in $\overline{\mathcal H}$.

## Sub-cones

Several mathematically-natural sub-cones of $\mathcal H$:

- **[Stalkwise diagonal cone](./stalkwise-diagonal-cone.md)** $\mathcal H_{\mathrm{diag}} \subseteq \mathcal H$: each $Q_n$ diagonal in a chosen basis. Codim $\sum_n \binom{m_n}{2}$. Used in cellular-sheaf framework.

- **Conformal sub-cone**: $Q_n = \lambda_n \cdot Q_n^{(0)}$ for fixed $Q_n^{(0)}$ and varying $\lambda_n > 0$. Dim $N+1$ (one scalar per chain space).

- **Spectral-triple sub-cone**: when $\mathcal H$ is induced from a [resolvent-based Hilbert lift](./resolvent-intertwiner.md) of a spectral triple, the realized $\mathcal H$ is a sub-cone of the full $\prod_n \mathrm{Sym}^+(C_n)$ — those Hilbert structures expressible via $\mathrm{Tr}(\cdot R_D \cdot R_D)$ for some self-adjoint $D$.

## Coordinate-free vs. matrix view

Each $\mathrm{Sym}^+(C_n)$ has two equivalent presentations:
- **Coordinate-free**: positive-definite symmetric bilinear forms on $C_n$.
- **Matrix-valued**: in any chosen basis of $C_n$, an SPD matrix.

The cellular-sheaf and stalkwise-diagonal frameworks pick a distinguished basis (the cellular basis); the unconstrained framework treats $C_n$ as an abstract real vector space.

## In the spectral-triple case

For a finite spectral triple $(\mathcal A, \mathcal H_{\mathrm{spt}}, D)$, the [Hochschild-Hilbert lift](./resolvent-intertwiner.md) maps the moduli of $D$'s on $(\mathcal A, \mathcal H_{\mathrm{spt}})$ into the corresponding $\mathcal H$ for the Hochschild chain complex of $\mathcal A$. Different $D$'s give different points in $\mathcal H$, parametrizing the moduli of finite spectral triples.
