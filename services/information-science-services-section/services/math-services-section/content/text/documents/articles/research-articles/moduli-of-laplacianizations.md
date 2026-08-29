---
type: theorem
status: proved
depends-on:
- laplacianizability
- hodge-laplacian
see-also:
- moduli-of-laplacianizers
- stab-codim-formula
- closure-poset-of-strata
- hilbert-degeneracy-stratification
classical-anchor:
- arnold-1995-hermitian-stratification
- weinstein-2020-partitioned-eigenvalues
references:
- key: ennaceur2025hodge
  type: article
  authors:
  - Ennaceur, Mohamed
  - Jadlaoui, Karim
  year: 2025
  title: 'Hodge Laplacians on Weighted Simplicial Complexes: Forms, Closures, and Essential Self-Adjointness'
  eprint: '2510.15546'
  eprinttype: arxiv
- key: gillespie2025bayesian
  type: article
  authors:
  - Gillespie, Patrick
  - Hamdan, Vasileios
  - Schizas, Ioannis
  - Boothe, Daniel
  - Maroulas, Vasileios
  year: 2025
  title: Bayesian Sheaf Neural Networks
  eprint: '2410.09590'
  eprinttype: arxiv
- key: andreotti2025generalizing
  type: article
  authors:
  - Andreotti, Eleonora
  year: 2025
  title: 'Generalizing Lattice Structures to Hypergraphs: Spectra of Clique and Hyperedge-based Laplacians'
  eprint: '2511.11138'
  eprinttype: arxiv
- key: arnold1995remarks
  type: article
  authors:
  - Arnold, V. I.
  year: 1995
  title: Remarks on eigenvalues and eigenvectors of Hermitian matrices, berry phase, adiabatic connections and quantum Hall
    effect
  journal: Selecta Mathematica New Series
  volume: 1
  number: 1
  pages: 1–19
- key: weinstein2020real
  type: article
  authors:
  - Weinstein, Madeleine
  year: 2020
  title: Real Symmetric Matrices with Partitioned Eigenvalues
  eprint: '2008.08554'
  eprinttype: arxiv
---

# Moduli of Laplacianizations on a fixed chain complex

> **Note on scope.** This theorem is a *per-object* statement: fix one chain complex, study the moduli of its Hilbert structures. The univariate case (single chain space, single self-adjoint operator quotient by $O(n)$) is *classical* (@arnold1995remarks, @weinstein2020real). The bipartite extension to multi-operator chain complexes is in [stab-codim-formula](stab-codim-formula.md) (formulas) and [closure-poset-of-strata](closure-poset-of-strata.md) (closure poset). Stratification II at the SPD-cone boundary of $\mathcal H$ is in [hilbert-degeneracy-stratification](hilbert-degeneracy-stratification.md).

## Setup

Fix a finite-dimensional algebraic chain complex $(C_\bullet, d)$ over $\mathbb R$: each $C_n$ a real vector space of dimension $n_n < \infty$, finitely many nonzero, with $d_n: C_n \to C_{n-1}$ linear and $d_{n-1} d_n = 0$.

A **Hilbert structure** on $(C_\bullet, d)$ is a graded inner product, equivalently a tuple $Q = (Q_n)$ with each $Q_n$ a positive-definite symmetric bilinear form on $C_n$. The space of Hilbert structures is

$$\mathcal H(C_\bullet) = \prod_n \mathrm{Sym}^+_{n_n}(\mathbb R), \qquad \mathrm{Sym}^+_m(\mathbb R) = \{m \times m \text{ positive-definite symmetric}\}.$$

Each $\mathrm{Sym}^+_m(\mathbb R)$ has dimension $\binom{m+1}{2}$, so

$$\dim \mathcal H(C_\bullet) = \sum_n \binom{n_n + 1}{2}.$$

The **graded chain automorphism group** is

$$G(C_\bullet, d) = \{ g = (g_n) \mid g_n \in \mathrm{GL}(C_n), \; g_{n-1} d_n = d_n g_n \text{ for all } n \}.$$

It acts on $\mathcal H$ by $(g \cdot Q)_n(x, y) := Q_n(g_n^{-1} x, g_n^{-1} y)$, equivalently $g \cdot Q_n = g_n^{-T} Q_n g_n^{-1}$ in matrix form (relative to a fixed basis).

## Statement

Two Hilbert structures $Q, Q'$ are **equivalent** if their Laplacians $\Delta = \Delta(Q)$ and $\Delta' = \Delta(Q')$ are unitarily equivalent via a graded chain automorphism — i.e., there exists $u \in G$ that is an isometry $(C_\bullet, Q) \to (C_\bullet, Q')$.

> **Theorem.** Two Hilbert structures $Q, Q' \in \mathcal H(C_\bullet)$ are equivalent in this sense if and only if they lie in the same $G$-orbit. The **moduli of Laplacianizations** of $(C_\bullet, d)$ is
> $$\mathcal M_{\mathrm{Lap}}(C_\bullet, d) := G(C_\bullet, d) \backslash \mathcal H(C_\bullet).$$

*Proof sketch.* If $g \in G$ takes $Q$ to $Q'$ (i.e. $g \cdot Q = Q'$), then $g$ is an isometry $(C, Q) \to (C, Q')$ that intertwines $d$, hence intertwines the adjoints (taken in the respective inner products) and the Laplacians. Conversely, an isometry $u: (C, Q) \to (C, Q')$ intertwining $d$ satisfies $u^{-T} Q u^{-1} = Q'$ and lies in $G$, so $Q$ and $Q'$ are in the same $G$-orbit. $\square$

The earlier-draft formulation $\mathcal M = G \backslash \mathcal H / U$ with an "extra" unitary quotient was redundant: the unitaries are already inside $G$ (for any reference inner product), and their action is part of the $G$-action on $\mathcal H$. The clean statement is the single-coset $G \backslash \mathcal H$ above.

## Dimension formula (sketch)

Generically — when the $G$-action on $\mathcal H$ has discrete (or trivial) stabilizers at a generic point —

$$\dim \mathcal M_{\mathrm{Lap}}(C_\bullet, d) = \dim \mathcal H(C_\bullet) - \dim G(C_\bullet, d).$$

This is positive in general, witnessing that *the Laplacian is not canonical* on a fixed algebraic chain complex.

## Computing $\dim G$ via orbit-stabilizer

$G$ is the stabilizer of $d$ under the action of $G_{\mathrm{ext}} := \prod_n \mathrm{GL}(C_n)$ on $\bigoplus_n \mathrm{Hom}(C_n, C_{n-1})$ by $(g \cdot d)_n = g_{n-1} d_n g_n^{-1}$.

For a chain complex with all $d_n$ of generic rank (i.e., on the open stratum of the rank locus), orbit-stabilizer gives

$$\dim G = \dim G_{\mathrm{ext}} - \dim \mathrm{orbit}(d) = \sum_n n_n^2 - \sum_n r_n (n_n + n_{n-1} - r_n)$$

where $r_n = \mathrm{rank}(d_n)$.

## Worked computation: $\partial \Delta^2$

See [moduli-of-triangle-boundary](../teaching-articles/examples/moduli-of-triangle-boundary.md) for the worked-out case of the cellular cochain complex of the boundary of a 2-simplex. The result: $\dim \mathcal M_{\mathrm{Lap}}(\partial \Delta^2) = 2$, with explicit identification $\mathcal M_{\mathrm{Lap}}(\partial \Delta^2) \cong \mathrm{Sym}^2(\mathbb R_{>0}) = \mathbb R_{>0}^2 / S_2$ — parameterized by the unordered pair of nonzero eigenvalues of $\Delta$.

## Why this matters

- **Weighted simplicial complexes** ([@ennaceur2025hodge]): the weights are coordinates on $\mathcal H$. The moduli quotient says which weight changes are *real* (different Laplacian spectra) and which are gauge.
- **Bayesian sheaf neural networks** ([@gillespie2025bayesian]): the variational posterior is a probability distribution on $\mathcal H$ (or on its sheaf-paired analogue). The natural setting for learning is on $\mathcal M_{\mathrm{Lap}}$, not on $\mathcal H$ — failing to quotient by gauge introduces flat directions in the loss.
- **Hypergraph Laplacian forks** ([@andreotti2025generalizing]): clique vs. hyperedge live on **different** chain complexes, so they sit in *different* moduli, not different points of one moduli. This separates "structural" choice (which complex) from "metric" choice (which inner product within a fixed complex).

## Open

1. ~~Compute $\mathcal M_{\mathrm{Lap}}$ for a complex with multiple nontrivial $d_n$.~~ **Done** for $\partial \Delta^3$ in [cellular-sheaf-on-tetrahedron-boundary](../teaching-articles/examples/cellular-sheaf-on-tetrahedron-boundary.md) and [gauge-fiber-structure](../teaching-articles/examples/gauge-fiber-structure.md). The dim formula holds, the moduli is 6-dim, and the gauge structure decomposes as 1-dim uniform scaling + 7-dim "twisted skew."
2. **Geometry.** $\mathcal H$ inherits the symmetric-space metric from each $\mathrm{Sym}^+_n$. Does the quotient $\mathcal M_{\mathrm{Lap}}$ inherit a useful Riemannian or singular metric? On $\partial \Delta^2$, the answer is yes — a flat metric on $\mathrm{Sym}^2(\mathbb R_{>0})$. For higher cases, open.
3. **Functoriality.** When $\mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ is a Laplacianization, varying along $\mathcal C$ produces a path in moduli; fibers of $X \in \mathcal C \mapsto \mathcal M_{\mathrm{Lap}}(C_\bullet(X), d_X)$ form a stratified bundle. Discussed at the categorical level in [moduli-of-laplacianizers](moduli-of-laplacianizers.md). The cross-$X$ behavior remains open.
4. **Dual-stratification at the boundary.** This theorem treats $\mathcal H$ (the SPD interior). The closure $\overline{\mathcal H}$ has additional Hilbert-degeneracy strata at the SPD-cone boundary ([hilbert-degeneracy-stratification](hilbert-degeneracy-stratification.md)), which appear in any global computation (EDD, intersection cohomology) of $V(\Pi)$ in the algebraic closure. How interior and boundary strata interact: see [dual-stratification](../teaching-articles/explanations/dual-stratification.md) and [mixed-stratification-strata](questions/mixed-stratification-strata.md).
