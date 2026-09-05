---
type: reference
key: weinstein2020real
class: article
authors:
- Weinstein, Madeleine
year: 2020
title: Real Symmetric Matrices with Partitioned Eigenvalues
eprint: '2008.08554'
eprinttype: arxiv
anchor: true
status: anchor
---

# Weinstein 2020 — Variety of partitioned-eigenvalue real symmetric matrices

arxiv:2008.08554 (2020). Published in Linear Algebra Appl. (2022). **Anchor reference** — modern algebraic-geometry treatment of the eigenvalue-multiplicity stratification of $\mathrm{Sym}_n(\mathbb R)$.

## Why this matters for laplacianizers

Provides the **explicit closed form** for the dimension and closure structure of the eigenvalue-multiplicity stratification — confirming the univariate part of laplacianizers's framework as a known result.

**Definition (Weinstein).** For $\lambda = (\lambda_1, \ldots, \lambda_m)$ a partition of $n$, the **variety $V_\mathbb{R}(\lambda) \subset \mathbb{R}^{n(n+1)/2}$ of $\lambda$-partitioned eigenvalues** is the Zariski closure of the locus of real symmetric $n \times n$ matrices whose eigenvalue multiplicities are determined by $\lambda$.

**Theorem (W. '20, dim formula).** $V_\mathbb{C}(\lambda)$ is irreducible of dimension
$$\dim V_\mathbb{C}(\lambda) = m + \binom{n}{2} - \sum_{i=1}^m \binom{\lambda_i}{2}.$$

**Theorem (closure relation, W. '20).** $V_\mathbb{R}(\lambda)$ "includes all matrices with eigenvalue multiplicities determined by partitions of $n$ that are *coarser* than $\lambda$." So:
$$\overline{\{\text{matrices with strict partition } \lambda\}} = \bigsqcup_{\lambda' \text{ coarser than } \lambda} \{\text{matrices with strict partition } \lambda'\}.$$

This is the **univariate closure poset** structure — coarsening order on partitions of $n$.

**Theorem (W. '20, parametrization).** For $\lambda \ne (1, \ldots, 1)$, $V_\mathbb{R}(\lambda)$ has an explicit rational parametrization
$$B \mapsto (I - B)(I + B)^{-1} \mathrm{Diag}(\lambda)(I + B)(I - B)^{-1}$$
where $B$ ranges over skew-symmetric $n \times n$ matrices and $\mathrm{Diag}(\lambda)$ is a diagonal matrix with eigenvalue multiplicities $\lambda_i$.

**Theorem (Bik–Draisma).** The Euclidean distance degree of $V_\mathbb{R}(\lambda)$ is $n! / (\lambda_1! \cdots \lambda_m!)$ — the multinomial coefficient.

## Comparison to laplacianizers framework

**Univariate codim.** Weinstein computes $\dim V_\mathbb{R}(\lambda)$ in the *unquotiented* space $\mathrm{Sym}_n$. Codim in $\mathrm{Sym}_n$: $\binom{n+1}{2} - \dim V_\mathbb{R}(\lambda) = (n - m) + \sum \binom{\lambda_i}{2}$.

The laplacianizers codim formula, in the *moduli quotient* $G \backslash \mathcal H$ (with $G = O(n)$ in the univariate case), is

$$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}} = \sum_i (\lambda_i - 1) = n - m.$$

The two formulas agree up to the $\sum \binom{\lambda_i}{2}$ term, which is exactly $\dim O(n) \cdot Q$ — the dimension of the $O(n)$-orbit through a generic diagonal matrix with multiplicities $\lambda$. The decomposition

$$\dim V_\mathbb{R}(\lambda) = \underbrace{m}_{\text{eigenvalues}} + \underbrace{\binom{n}{2} - \sum \binom{\lambda_i}{2}}_{O(n)\text{-orbit through diagonal}}$$

makes the relationship explicit: total stratum dim in $\mathrm{Sym}_n$ = (moduli stratum dim in $\mathcal M_{\mathrm{Lap}}$) + ($O(n)$-orbit dim).

This is the modern algebraic-geometry confirmation that the laplacianizers univariate-case formulas are classical.

**Univariate closure poset.** Weinstein's "$V_\mathbb{R}(\lambda)$ includes coarsenings of $\lambda$" *is* the laplacianizers closure-poset claim, restated for the unquotiented variety. In the moduli quotient, the closure relation descends: stratum $\Pi$ is in closure of stratum $\Pi'$ iff $\Pi'$ refines $\Pi$ (equivalently, $\Pi$ is a coarsening of $\Pi'$).

## What's still novel for laplacianizers

Weinstein's framework is purely *univariate*: it studies $\mathrm{Sym}_n$ stratified by a single partition. The laplacianizers framework extends to **chain complexes with multiple boundary operators**, where each operator's singular values form their own partition and *cross-operator identifications* between operators add to the codim without contributing to stab.

The bipartite (or N-partite) generalization of Weinstein's variety would be: a variety in $\mathrm{Sym}_{n_0} \times \mathrm{Sym}_{n_1} \times \ldots$ defined by a *bipartite multipartition* of $r_0 + r_1 + \cdots$ singular-value labels, with closure under bipartite-multipartition coarsening. This variety is not in the literature.

## Tools that should generalize

- **Dimension formula generalization:** With the addition of cross-operator identifications and chain auto group's reduction of $O(n_0) \times O(n_1) \times \ldots$ to a smaller group, an analogous closed-form dim formula for bipartite strata should exist.
- **Closure poset:** Bipartite multipartitions form a poset under refinement; closure of a stratum = coarsenings (i.e., merges of blocks, possibly across $d_n$).
- **Distance degree:** Bik–Draisma's multinomial generalizes — at least conjecturally — to bipartite multinomials.
- **Parametrization:** Weinstein's rational parametrization should generalize, with $B$ ranging over the chain-auto-group analog of the skew-symmetric matrices (= $\mathrm{Lie}(G)$ part, modulo the Hilbert structure).

These are the concrete generalization targets for Direction B.

## Bridges

- To `theorems/stab-codim-formula.md` — Weinstein's dim formula directly verifies the univariate decomposition $\dim V_\mathbb{R}(\lambda) = (\text{moduli dim}) + (O(n)\text{-orbit dim})$.
- To `references/arnold-1995-hermitian-stratification.md` — Weinstein gives modern algebraic-geometry tools for what Arnold treated topologically.
- To `theorems/main-theorem-synthesis.md` — Weinstein's univariate result is the $N = 1$ specialization of the bipartite stratification.
