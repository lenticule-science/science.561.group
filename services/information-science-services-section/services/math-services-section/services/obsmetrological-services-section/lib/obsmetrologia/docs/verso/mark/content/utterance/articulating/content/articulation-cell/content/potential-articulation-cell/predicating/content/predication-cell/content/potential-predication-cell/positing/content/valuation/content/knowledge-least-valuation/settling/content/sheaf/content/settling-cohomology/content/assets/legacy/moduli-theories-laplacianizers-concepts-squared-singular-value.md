---
type: concept
class: spectral-data
symbol: \sigma_i^2(\widetilde d_n)
depends-on: [hodge-laplacian]
see-also: [bipartite-multipartition, weighted-boundary-operator]
---

# Squared singular value (of a weighted boundary)

The basic spectral datum on which the bipartite stratification of moduli is built. For a chain complex $(C_\bullet, d)$ and Hilbert structure $Q \in \mathcal H = \prod_n \mathrm{Sym}^+(C_n)$, the **weighted boundary** at degree $n$ is
$$\widetilde d_n := Q_{n-1}^{1/2} d_n Q_n^{-1/2}: (C_n, \mathrm{std}) \to (C_{n-1}, \mathrm{std}),$$
an operator between standard-inner-product Hilbert spaces that has the same singular values as $d_n: (C_n, Q_n) \to (C_{n-1}, Q_{n-1})$ in its natural Hilbert spaces.

The **squared singular values** of $\widetilde d_n$ are the eigenvalues of $\widetilde d_n^T \widetilde d_n$ (= eigenvalues of $\widetilde d_n \widetilde d_n^T$ on the image side, by the singular-value duality):
$$\sigma_1^2(\widetilde d_n) \le \sigma_2^2(\widetilde d_n) \le \cdots \le \sigma_{r_n}^2(\widetilde d_n),$$
where $r_n = \mathrm{rank}\, d_n$ and the values are positive (since $\widetilde d_n$ is rank $r_n$ as a real operator).

## Equivalent characterizations

The squared singular values are equivalently:
- Nonzero eigenvalues of the [Hodge Laplacian](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/hodge-laplacian.md) $\Delta_n^{(Q)} = d_n^* d_n + d_{n+1} d_{n+1}^*$ on the $\mathrm{im}\, d_n^*$-piece of $C_n$ (the "$d_n$-side" Hodge component).
- Nonzero eigenvalues of $\Delta_{n-1}^{(Q)}$ on the $\mathrm{im}\, d_n$-piece of $C_{n-1}$ (the "$d_n$-image-side" component) — equal as multisets, by Hodge supersymmetric isospectrality.
- Roots of the generalized eigenvalue pencil $\det(d_n^T Q_{n-1} d_n - \lambda Q_n) = 0$ in $C_n$, taking the $r_n$ nonzero roots.

## Continuity in $Q$

As functions $\sigma_i^2: \mathcal H \to \mathbb R_{>0}$, the squared singular values are continuous in $Q$ (real-analytic in fact, on the open dense locus where they're simple; with branch crossings handled by Kato analytic perturbation when multiplicities form). This continuity is essential to the closure-poset argument for [strata](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/stratum-eigenvalue-multiplicity.md).

## Hodge isomorphism

The map $\widetilde d_n: \mathrm{im}\,\widetilde d_n^* \xrightarrow{\sim} \mathrm{im}\,\widetilde d_n$ is an isomorphism, with the squared singular values appearing on both sides. This is the source of the Hodge supersymmetric isospectrality — eigenvalues are identified across degrees even though the underlying operators act on different chain spaces.

## What they label

The $\sigma_i^2(\widetilde d_n)$ for fixed $n$ label "the eigenvalues of $\Delta$ in the $d_n$-piece" of the chain complex. The bipartite indexing $(n, i)$ records the operator $d_n$ together with the eigenvalue index $i \in \{1, \ldots, r_n\}$. The bipartite multipartition $\Pi(Q)$ is the partition of all such $(n, i)$ by the equivalence relation "$\sigma_i^2(\widetilde d_n) = \sigma_j^2(\widetilde d_m)$".

## In the cellular case

For a cellular chain complex with stalkwise diagonal $Q_n = \mathrm{diag}(w_{1,n}, \ldots, w_{m_n,n})$:
$$\widetilde d_n^T \widetilde d_n = Q_n^{-1/2} d_n^T Q_{n-1} d_n Q_n^{-1/2}$$
is similar to $d_n^T Q_{n-1} d_n \cdot Q_n^{-1}$, whose nonzero eigenvalues are the squared singular values. Concretely, this is the matrix whose entries are weighted graph-Laplacian-like quantities — symmetric, rank $r_n$, with positive eigenvalues. The combinatorics of when its eigenvalues coincide drives the cellular IEP-G obstructions.
