---
title: "Hilbert Space"
aliases:
  - "Hilbert space"
  - "Hilbert spaces"
  - "inner product space"
date-created: 2026-08-26
tags: []
defines:
  - "Hilbert Space"
  - "inner product space"
type: term
---

A Hilbert space is a [vector space](./vector-space.md) $H$ over $\mathbb R$ or $\mathbb C$ equipped with an inner product $\langle \cdot, \cdot \rangle: H \times H \to \mathbb R$ (or $\mathbb C$) — bilinear (or sesquilinear) in its two arguments, symmetric (or conjugate-symmetric), and positive-definite, $\langle x, x \rangle > 0$ for $x \neq 0$ — such that $H$ is complete in the norm $\|x\| := \sqrt{\langle x, x \rangle}$: every Cauchy sequence converges. A vector space with an inner product but not necessarily complete is an inner product space; every finite-dimensional inner product space is automatically complete, so the distinction only bites in infinite dimensions.

The inner product supplies orthogonality and, through it, the two facts that make Hilbert spaces so usable. First, every closed subspace $W \subseteq H$ has an orthogonal complement $W^\perp$ with $H = W \oplus W^\perp$, so any vector decomposes uniquely into its projection onto $W$ and a piece orthogonal to $W$. Second, a bounded [linear map](./linear-map.md) $T: H \to K$ between Hilbert spaces has an adjoint $T^*: K \to H$ characterized by $\langle Tx, y \rangle_K = \langle x, T^*y \rangle_H$ for all $x, y$; the adjoint always exists and is itself bounded, which is not automatic for general normed spaces.

These two facts are exactly the ingredients of the Hodge construction. Given a [chain complex](./chain-complex.md) of Hilbert spaces $(C_n, d_n)$, the differential's adjoint $d_n^*$ lets one form the Laplacian $\Delta_n := d_{n+1} d_{n+1}^* + d_n^* d_n$, and the orthogonal-decomposition fact is what makes the Hodge theorem — $C_n = \ker \Delta_n \oplus \mathrm{im}\, d_{n+1} \oplus \mathrm{im}\, d_n^*$, with $\ker \Delta_n$ isomorphic to the homology — provable rather than merely stated. Neither the adjoint nor the orthogonal decomposition is available on a bare vector space or even a general Banach space; both require the inner product.

The theory originates in David Hilbert's work on integral equations in the early 1900s (spaces of square-summable sequences, $\ell^2$), with the abstract axiomatic definition due to John von Neumann in 1929, formulated to give a rigorous common foundation for the state spaces of Heisenberg's matrix mechanics and Schrödinger's wave mechanics in quantum theory — the two having been shown equivalent, but through incompatible-looking formalisms, shortly before.
