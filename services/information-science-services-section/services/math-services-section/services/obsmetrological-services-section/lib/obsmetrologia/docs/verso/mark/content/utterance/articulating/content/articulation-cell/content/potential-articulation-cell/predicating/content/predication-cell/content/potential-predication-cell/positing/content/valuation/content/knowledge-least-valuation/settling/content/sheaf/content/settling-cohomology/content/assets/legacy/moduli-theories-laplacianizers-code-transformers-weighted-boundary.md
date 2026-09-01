---
type: morphism
class: linear-map
symbol: \widetilde d_n
depends-on: [hilbert-structure-cone]
see-also: [squared-singular-value, hodge-laplacian]
---

# Weighted boundary operator

The unitary normalization of $d_n$ that turns the chain complex's Hilbert structure into the standard Euclidean inner product, isolating the spectral data.

## Definition

For a chain complex $(C_\bullet, d)$ with Hilbert structure $Q = (Q_n) \in \mathcal H$, the **weighted boundary** is
$$\widetilde d_n := Q_{n-1}^{1/2} d_n Q_n^{-1/2}: (C_n, \mathrm{std}) \to (C_{n-1}, \mathrm{std}),$$
viewed between the chain spaces with the *standard Euclidean* inner product.

Here $Q_n^{1/2}$ is the unique positive-definite square root of $Q_n \in \mathrm{Sym}^+(C_n)$ (well-defined since $Q_n$ is SPD).

## Why this normalization

The original $d_n: (C_n, Q_n) \to (C_{n-1}, Q_{n-1})$ has Hilbert adjoint $d_n^* = Q_n^{-1} d_n^T Q_{n-1}$ (computed using the inner products on each side).

The weighted boundary $\widetilde d_n$ is unitarily conjugate to $d_n$: $\widetilde d_n = Q_{n-1}^{1/2} d_n Q_n^{-1/2}$ takes $(C_n, Q_n) \cong (C_n, \mathrm{std})$ via the isometry $v \mapsto Q_n^{1/2} v$, so it has the same singular values as $d_n$ in its native Hilbert spaces.

Computing in the standard inner product is more convenient: the spectral data (singular values, kernel, etc.) of $\widetilde d_n$ as a map between standard-Euclidean spaces is what we want.

## Squared singular values

The squared singular values $\sigma_i^2(\widetilde d_n)$ for $i = 1, \ldots, r_n = \mathrm{rank}\,d_n$ are the eigenvalues of
$$\widetilde d_n^T \widetilde d_n = Q_n^{-1/2} d_n^T Q_{n-1} d_n Q_n^{-1/2}.$$

Equivalently, by the singular-value duality, eigenvalues of
$$\widetilde d_n \widetilde d_n^T = Q_{n-1}^{1/2} d_n Q_n^{-1} d_n^T Q_{n-1}^{1/2}.$$

These are the [squared singular values](teaching/explanations/squared-singular-value.md) — the basic spectral data on which bipartite multipartitions are built.

## Hodge Laplacian via weighted boundary

The Hodge Laplacian on $C_n$ in the standard Euclidean structure (post-conjugation by $Q_n^{1/2}$) is
$$\widetilde \Delta_n = \widetilde d_n^T \widetilde d_n + \widetilde d_{n+1} \widetilde d_{n+1}^T,$$
unitarily equivalent to the original Hodge Laplacian $\Delta_n^{(Q)} = d_n^* d_n + d_{n+1} d_{n+1}^*$ on $(C_n, Q_n)$.

So spectral data of $\Delta_n^{(Q)}$ = spectral data of $\widetilde \Delta_n$, both as multisets and as eigenspaces (modulo the unitary intertwiner).

## In the cellular case

For stalkwise diagonal $Q_n = \mathrm{diag}(w_{1,n}, \ldots)$, the weighted boundary is
$$\widetilde d_n[i, j] = \frac{d_n[i, j]}{\sqrt{w_{j, n}}} \cdot \sqrt{w_{i, n-1}}.$$

For a graph (cellular 1-complex), this is the standard "weighted graph Laplacian normalization": each edge $j$ is weighted by $1/\sqrt{w_j}$ (edge weight) and each vertex contribution by $\sqrt{w_i}$ (vertex weight), giving the classical normalized Laplacian construction (when applied to $\Delta_0$).

## Generalized eigenvalue pencil

The squared singular values are also roots of the **pencil polynomial**
$$\det(d_n^T Q_{n-1} d_n - \lambda Q_n) = 0$$
in $C_n$, taking the $r_n$ nonzero roots. This formulation avoids square roots and works directly with rational functions of the weights — useful for symbolic computation in the [IEP-G program](../theorems/chain-complex-iep-g.md) and the toolkit.

## Continuity in $Q$

$\widetilde d_n$ is real-analytic in $Q$ on the open dense locus where $Q_n$ has all positive eigenvalues (= the SPD interior $\mathcal H$). Spectral data of $\widetilde \Delta_n$ varies real-analytically with $Q$, with branch crossings handled by Kato analytic perturbation. This continuity is essential for the [closure poset theorem](../theorems/closure-poset-of-strata.md).
