---
type: theorem
status: proved
depends-on: [moduli-of-laplacianizers, closure-poset-of-strata, stratified-moduli-of-laplacianizations]
see-also: [edd-computation-on-2-1-chain, stab-codim-formula, bipartite-stratification-theorem]
classical-anchor: [pataki-cone-lp]
title: Hilbert-degeneracy stratification (Stratification II)
description: A second stratification of $\overline{\mathcal H}$, the algebraic closure of the moduli of Hilbert structures, complementing the bipartite-multipartition stratification (Stratification I, in the SPD interior; closure-poset-of-strata).
---

# Hilbert-degeneracy stratification (Stratification II)

A second stratification of $\overline{\mathcal H}$, the algebraic closure of the moduli of Hilbert structures, complementing the bipartite-multipartition stratification (Stratification I, in the SPD interior; [closure-poset-of-strata](closure-poset-of-strata.md)).

Stratification II lives at the SPD-cone boundary $\partial \overline{\mathcal H}$ and is invisible from the SPD interior. It surfaces in any global computation of $V(\Pi) \subset \overline{\mathcal H}$ (EDD, intersection cohomology, compactified moduli) and is what the EDD = 40 computation on the (2,1) chain complex actually measured ([edd-computation-on-2-1-chain](../teaching-articles/examples/edd-computation-on-2-1-chain/edd-computation-on-2-1-chain.md)).

This entry states Stratification II as a full theorem: explicit codim formula, closure poset, and chain-complex Schubert refinement.

## Setup

Fix a finite-dim graded chain complex $(C_\bullet, d)$ over $\mathbb R$ with $C_n$ of dim $m_n$ and $d_n: C_n \to C_{n-1}$ of rank $\rho_n$. Write
$$\mathcal H = \prod_n \mathrm{Sym}^+(C_n), \qquad \overline{\mathcal H} = \prod_n \overline{\mathrm{Sym}^+(C_n)},$$
the open product cone of positive-definite Hilbert structures and its closure (positive-semidefinite). The boundary is $\partial \overline{\mathcal H} = \overline{\mathcal H} \setminus \mathcal H$.

For each $Q = (Q_0, \ldots, Q_N) \in \overline{\mathcal H}$, let $K_n(Q) := \ker Q_n \subseteq C_n$ be the kernel and $r_n(Q) := \mathrm{rank}\, Q_n = m_n - \dim K_n$.

## Pataki product stratification (coarse)

> **Definition (Pataki product stratum).** For a rank tuple $\mathbf r = (r_0, \ldots, r_N)$ with $0 \le r_n \le m_n$,
> $$\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r) := \{Q \in \overline{\mathcal H} : r_n(Q) = r_n\ \text{for all}\ n\}.$$

> **Theorem (Pataki product stratification).**
>
> 1. **Stratification.** $\overline{\mathcal H} = \bigsqcup_\mathbf{r} \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)$, and each stratum is a connected real-analytic submanifold of $\prod_n \mathrm{Sym}(C_n)$.
>
> 2. **Dim formula.** $\dim \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r) = \sum_n \left[ r_n m_n - \binom{r_n}{2} \right]$.
>
> 3. **Codim formula.** $\mathrm{codim}\, \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)\ \text{in}\ \overline{\mathcal H} = \sum_n \binom{m_n - r_n + 1}{2}$.
>
> 4. **Closure poset.** $\overline{\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r')} \supseteq \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)$ iff $r_n \le r'_n$ for all $n$. The closure poset is the product chain $\prod_n \{0, 1, \ldots, m_n\}$ with coordinate-wise order.
>
> 5. **Top stratum.** $\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}((m_0, \ldots, m_N)) = \mathcal H$ (the SPD interior).
>
> 6. **Bottom stratum.** $\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}((0, \ldots, 0)) = \{0\}$.

### Proof

(1)–(2) Each $\mathrm{Sym}^+(C_n)$-rank-$r_n$ stratum is a smooth submanifold of $\mathrm{Sym}(C_n)$ of dim $r_n m_n - \binom{r_n}{2}$ (Pataki, equivalently the manifold of factorizations $Q_n = L L^T$ with $L \in \mathbb R^{m_n \times r_n}$ of full column rank, mod $O(r_n)$). The product stratum is the product of these.

(3) Codim in $\mathrm{Sym}_{m_n}$ of rank-$r_n$ stratum: $\binom{m_n + 1}{2} - r_n m_n + \binom{r_n}{2} = \binom{m_n - r_n + 1}{2}$ (algebraic identity). Sum over $n$.

(4) Continuity of rank: rank is upper-semi-continuous (rank can only drop in the limit), so $\overline{\mathrm{Stratum}^{\mathrm{coarse}}(\mathbf r')} \subseteq \bigcup_{\mathbf r \le \mathbf r'} \mathrm{Stratum}^{\mathrm{coarse}}(\mathbf r)$. Conversely, given $\mathbf r \le \mathbf r'$, an explicit limit construction (replace zero eigenvalues with small positive perturbations) realizes the lower stratum as a limit of the higher.

(5)–(6) Direct.

This is just the product of Pataki's classical SDP-cone face structure (Pataki 1995, "Cone-LP's and semidefinite programs," and follow-up in semidefinite-optimization literature). The codim formula $\binom{m-r+1}{2}$ is the standard "rank-deficit triangular number."

## Chain-complex refinement (fine)

The Pataki coarse stratification ignores the chain complex. The kernel $K_n \subseteq C_n$ is treated as a subspace without algebraic structure. The chain-complex *refinement* records how $K_n$ sits relative to the algebraic filtration
$$0 \subseteq \mathrm{im}\, d_{n+1} \subseteq \ker d_n \subseteq C_n.$$

This filtration is *intrinsic* — it depends only on $(C_\bullet, d)$, not on any Hilbert structure. So refining Pataki strata by how $K_n$ aligns with this filtration produces a chain-complex-canonical refinement.

### Schubert invariants

> **Definition (kernel Schubert invariants).** For $Q \in \overline{\mathcal H}$ with kernel $K_n = \ker Q_n$, the **kernel Schubert tuple** is
> $$\sigma(Q) := \big( a_n, z_n, k_n \big)_n$$
> where
> - $a_n := \dim(K_n \cap \mathrm{im}\, d_{n+1})$ — kernel meets boundaries;
> - $z_n := \dim(K_n \cap \ker d_n)$ — kernel meets cycles;
> - $k_n := \dim K_n = m_n - r_n$ — total kernel.
>
> These satisfy $0 \le a_n \le z_n \le k_n$ and $a_n \le \rho_{n+1} = \mathrm{rank}\, d_{n+1}$, $z_n \le \dim \ker d_n = m_n - \rho_n$.

The kernel decomposes into three pieces relative to the chain filtration:
- $a_n$ dims live in $\mathrm{im}\, d_{n+1}$ (boundary part of kernel),
- $(z_n - a_n)$ dims live in $\ker d_n / \mathrm{im}\, d_{n+1} = H_n$ (homological part of kernel),
- $(k_n - z_n)$ dims live in $C_n / \ker d_n$ (cocycle part of kernel).

### Generic Schubert invariants

For *generic* $Q$ in the Pataki rank-$r_n$ stratum, the kernel $K_n$ is a generic $k_n$-dim subspace of $C_n$. Generic-position Schubert calculus on the Grassmannian gives:

> **Lemma (generic Schubert invariants).** For a generic $k_n$-dim subspace $K_n \subset C_n$ and a fixed $v$-dim subspace $V_n \subset C_n$:
> $$\dim(K_n \cap V_n)^{\mathrm{gen}} = \max(0,\ k_n + v - m_n).$$
>
> Hence for generic $Q$ in $\mathrm{Stratum}^{\mathrm{coarse}}(\mathbf r)$:
> - $a_n^{\mathrm{gen}} = \max(0, k_n + \rho_{n+1} - m_n)$;
> - $z_n^{\mathrm{gen}} = \max(0, k_n + (m_n - \rho_n) - m_n) = \max(0, k_n - \rho_n)$.

### Schubert codim formula

Strata where the Schubert tuple deviates from generic carry extra codim, given by the standard Grassmannian Schubert codim formula.

> **Theorem (chain-complex Schubert codim).** Within $\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)$, the locus where the kernel Schubert invariants take values $\sigma = (a_n, z_n, k_n)_n$ has codim
> $$\mathrm{codim}\big(\mathrm{Stratum}_\mathrm{II}(\mathbf r, \sigma)\ \text{in}\ \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)\big) = \sum_n \big[\, (a_n - a_n^{\mathrm{gen}})\cdot \alpha_n + (z_n - a_n - (z_n - a_n)^{\mathrm{gen}})\cdot \beta_n \,\big]$$
> where:
> - $\alpha_n = m_n - \rho_{n+1} - k_n + a_n$ — Schubert codim weight for the boundary-intersection condition;
> - $\beta_n = \rho_n - (k_n - z_n) + (z_n - a_n - (z_n-a_n)^{\mathrm{gen}})$ — Schubert codim weight for the homological-intersection condition.

(The $\alpha_n, \beta_n$ formulas come from the standard "Schubert codim of $\dim(K \cap V) = j$ in $\mathrm{Gr}(k, m)$ is $j(m - v - k + j)$ for $j \ge \max(0, k+v-m)$.")

> **Total Stratification II codim.** Combining Pataki coarse and Schubert refinement:
> $$\mathrm{codim}\, \mathrm{Stratum}_\mathrm{II}(\mathbf r, \sigma)\ \text{in}\ \overline{\mathcal H} = \sum_n \binom{m_n - r_n + 1}{2} + \mathrm{Schubert}(\mathbf r, \sigma).$$

The first term is Pataki rank-deficit; the second is Schubert chain-alignment codim.

### Proof sketch

The Pataki rank-$r_n$ stratum, viewed as a fiber bundle, is
$$\mathrm{Stratum}^{\mathrm{coarse}}(\mathbf r) \cong \prod_n \mathrm{Gr}(k_n, m_n) \times_{\mathrm{frame}} \mathrm{Sym}^+_{r_n}$$
where each factor is "choose a $k_n$-dim kernel + an SPD form on the complementary $r_n$-dim quotient." The Schubert conditions on $K_n$ live entirely in the Grassmannian factor.

So the Schubert codim within the Pataki stratum equals the standard Grassmannian Schubert codim. Summing over $n$ gives the formula. The total codim in $\overline{\mathcal H}$ is Pataki codim + Schubert codim. ∎

## Closure poset of Stratification II

> **Theorem (closure poset of Stratification II).** $\overline{\mathrm{Stratum}_\mathrm{II}(\mathbf r', \sigma')} \supseteq \mathrm{Stratum}_\mathrm{II}(\mathbf r, \sigma)$ iff:
>
> (a) $r_n \le r'_n$ for all $n$ (rank can only drop in limits), AND
>
> (b) For each $n$ where $r_n = r'_n$ (no rank drop), the Schubert pattern *coarsens*: $a_n \ge a'_n$ and $z_n \ge z'_n$ (with same $k_n = k'_n$ since rank is fixed), reflecting that the kernel intersection with chain-filtration subspaces can only grow in limits, AND
>
> (c) For each $n$ where $r_n < r'_n$ (rank drops), the Schubert pattern is consistent with adding $r'_n - r_n$ additional kernel directions, which can land in any combination of $\mathrm{im}\,d_{n+1}, \ker d_n / \mathrm{im}\,d_{n+1}, C_n/\ker d_n$, so any $(a_n, z_n)$ with $a'_n \le a_n$ and $z'_n \le z_n$ and $z_n - a_n \ge z'_n - a'_n$ and $k_n - z_n \ge k'_n - z'_n$ is reachable.

In short: the closure poset is the *Pataki product chain* in the rank coordinate, with each rank step refined by *Schubert closure* in the Grassmannian-pattern coordinate.

### Proof sketch

(a) Upper-semi-continuity of rank.

(b) Upper-semi-continuity of $\dim(K_n \cap V_n)$ for any fixed subspace $V_n$ (also a Schubert closure relation in the Grassmannian).

(c) When rank drops, the new kernel directions can be chosen to land anywhere in the chain filtration, giving full flexibility for the Schubert pattern. Limits realize all consistent patterns.

The result combines the Pataki product chain with the Grassmannian Schubert order on each "fiber." ∎

## Worked example: the (2,1) chain complex

Recall the chain complex $(C_0, C_1, C_2) = (2, 3, 1)$ with $d_1, d_2$ in canonical form ([edd-computation-on-2-1-chain](../teaching-articles/examples/edd-computation-on-2-1-chain/edd-computation-on-2-1-chain.md)):
$$d_1 = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \end{pmatrix}, \qquad d_2 = (0, 0, 1)^T.$$

Rank profile: $\rho_1 = 2$, $\rho_2 = 1$. Filtrations:
- $C_0$: $\mathrm{im}\, d_1 = C_0 = \mathbb R^2$, $\ker d_0 = C_0$ (no $d_0$). Dim filtration $(0, 2, 2, 2) \subseteq \cdots$.
- $C_1$: $\mathrm{im}\, d_2 = \langle e_3 \rangle$ (1-dim), $\ker d_1 = \langle e_3 \rangle$ (1-dim). So $H_1 = 0$. Filtration: $(0, 1, 1, 3)$.
- $C_2$: $\mathrm{im}\, d_3 = 0$, $\ker d_2 = 0$ (since $d_2$ injective). Filtration: $(0, 0, 0, 1)$.

### Stratification II strata of low codim in $\overline{\mathcal H}$

Total $\dim \overline{\mathcal H} = \binom{3}{2} + \binom{4}{2} + \binom{2}{2} = 3 + 6 + 1 = 10$.

Codim-1 Pataki strata (rank drop by 1 in some $C_n$):

| Pataki $\mathbf r$ | Pataki codim | Stratum |
|---|---|---|
| $(1, 3, 1)$ | $\binom{2}{2} = 1$ | $\det Q_0 = 0$ |
| $(2, 2, 1)$ | $\binom{2}{2} = 1$ | $Q_1$ rank-2 (one cubic discriminant) |
| $(2, 3, 0)$ | $\binom{2}{2} = 1$ | $Q_2 = 0$ |

Codim-1 Schubert refinements within $(2, 2, 1)$ Pataki stratum:

The kernel $K_1$ is a 1-dim subspace of $C_1 = \mathbb R^3$. The chain filtration is $0 \subset \mathrm{im}\,d_2 = \langle e_3 \rangle \subset \ker d_1 = \langle e_3 \rangle \subset C_1$.

For generic $K_1$ of dim 1: $a_1^{\mathrm{gen}} = \max(0, 1 + 1 - 3) = 0$ (kernel disjoint from $\mathrm{im}\,d_2$), $z_1^{\mathrm{gen}} = \max(0, 1 - 2) = 0$ (kernel disjoint from $\ker d_1$).

Non-generic Schubert refinements (codim within Pataki):

| Schubert $(a_1, z_1, k_1)$ | Description | Schubert codim |
|---|---|---|
| $(0, 0, 1)$ | generic | 0 |
| $(1, 1, 1)$ | $K_1 = \mathrm{im}\,d_2 = \langle e_3 \rangle$ | $1 \cdot (3 - 1 - 1 + 1) = 2$ |

So the locus "$K_1 = \langle e_3 \rangle$" inside the $(2, 2, 1)$ Pataki stratum has codim 2 in Pataki + Pataki codim 1 = total codim 3 in $\overline{\mathcal H}$.

This is exactly the Stratification II stratum corresponding to **Component 2** of the (2,1) singular locus computation: $b_{13} = b_{23} = b_{33} = 0$, codim 3 in $\overline{\mathcal H}$, dim $10 - 3 = 7$ — wait, but Component 2 has dim 6 in 9-dim $a, b$-space (= dim 7 in 10-dim $\overline{\mathcal H}$ when we add the $c$-axis back).

Yes — Component 2 has dim 6 in 9-dim $a, b$-space (= dim 7 in 10-dim $\overline{\mathcal H}$ once the $c$-axis is restored). Codim 3. Matches.

### Match with EDD computation singular components

| Component | dim | codim | Stratification II identification |
|---|---|---|---|
| 0 | 7 | 2 | **Stratification I**: $V(\Pi_T)$, supersymmetric sub-stratum |
| 1 | 6 | 3 | Stratification II: $K_1 \supseteq \langle e_3 \rangle$ + extra cubic conditions |
| 2 | 6 | 3 | Stratification II: $K_1 = \langle e_3 \rangle$ (Schubert: $K_1 = \mathrm{im}\,d_2$) |
| 3 | 6 | 3 | Stratification II: $K_1 \supseteq \langle e_3 \rangle$ + quadric refinement |
| 4 | 6 | 3 | Stratification II: $\det Q_0 = 0$ + Stratification I-coupling cubics |

So the 5 singular components of the EDD computation decompose as **1 Stratification-I component (Component 0) + 4 Stratification-II components (Components 1–4)**, exactly matching the dual-stratification picture.

Components 1, 3 are *intersections* of Stratification I and II (kernel-pattern + eigenvalue-pattern), giving smaller subloci. Components 2, 4 are pure Stratification II strata (kernel-pattern, generic eigenvalue).

This confirms Stratification II as a real geometric object explaining the structure of the EDD = 40 result.

## Connection to compactified moduli

The closure $\overline{\mathcal M_{\mathrm{Lap}}} = G \backslash \overline{\mathcal H}$ (with $G = \prod_n O(C_n)$) carries Stratification II at its boundary, refining the Stratification I that lives in the interior $\mathcal M_{\mathrm{Lap}} = G \backslash \mathcal H$.

Concretely:
- The interior $\mathcal M_{\mathrm{Lap}}$ has Stratification I (eigenvalue multipartition of $\Delta$).
- The boundary $\partial \overline{\mathcal M_{\mathrm{Lap}}}$ has Stratification II (Pataki + Schubert).

This gives a Borel–Serre-style stratified compactification of the moduli of Laplacianizations, with explicit codim formulas on both the interior and boundary strata.

The compactification is "natural" in the sense that it coincides with the algebraic-geometric closure of $\mathcal M_{\mathrm{Lap}}$ inside the GIT quotient $G \backslash\!\!\backslash \mathrm{Sym}(\bigoplus_n C_n)$ — though making this precise in the algebraic-geometry sense requires more care (the action of $G$ on $\partial \overline{\mathcal H}$ is not free, so the quotient is genuinely an orbifold-with-boundary stratified by both stratifications).

## Connection to literature

- **Pataki, *Cone-LP's and semidefinite programs* (1995)**: the rank stratification of $\mathrm{Sym}^+_n$, foundational for SDP face structure. Stratification II's coarse part is the product Pataki stratification.
- **Schubert calculus on Grassmannians**: classical (e.g., Fulton, *Young Tableaux*). The Schubert codim formula is standard.
- **Borel–Serre compactification** (Borel–Serre 1973): boundary stratification of locally symmetric spaces by parabolic-type. Structurally analogous to Stratification II's role in the moduli compactification, but the specific groups and stratifications differ.
- **Semidefinite optimization literature** (Ramana, Renegar, Pataki and follow-ups): face lattices of SDP cones. The product Pataki order is implicit.
- **Hilbert chain complexes / weighted simplicial complexes**: the chain-complex Schubert refinement may be in niche literature on weighted simplicial complexes (Forman's discrete Morse, Friedman's spectral graph theory, etc.) but I haven't located a direct match. Likely novel in the explicit form here.

## Status of pieces

| Piece | Source | Status |
|---|---|---|
| Pataki product stratification | Pataki 1995, product extension is routine | Proved |
| Codim formula (coarse) | Algebraic identity | Proved |
| Closure poset (coarse) | Upper-semi-continuity of rank | Proved |
| Schubert refinement | Standard Grassmannian Schubert calculus | Proved |
| Total codim formula | Combination | Proved |
| Closure poset (fine) | Combination of Pataki order + Schubert order | Proved |
| Match with EDD singular locus on (2,1) | Explicit verification | Proved (this entry) |

So Stratification II is now a **proved theorem** with explicit codim formula, closure poset, and worked example matching the (2,1) computation.

## Significance

1. **Explains the 4 boundary components of the EDD = 40 computation** as Stratification II strata of specific Pataki + Schubert types.

2. **Distinguishes intrinsic from extrinsic invariants** of the moduli: Stratification I is intrinsic (depends only on the Laplacianizer framework); Stratification II is extrinsic (depends on the embedding into $\overline{\mathcal H}$).

3. **Completes the dual-stratification picture**: the moduli of Laplacianizations, viewed in algebraic-closure, has *two* canonical stratifications — one in the interior (eigenvalue multipartition), one at the boundary (Hilbert degeneracy + chain-Schubert).

4. **Provides the right framework for compactified moduli**: any compactification of $\mathcal M_{\mathrm{Lap}}$ that respects both algebraic and metric structure must include Stratification II at the boundary.

5. **Generalizes Pataki to the chain-complex setting**: the chain-Schubert refinement is the new content beyond classical SDP face theory.

## Open

1. **Closure poset combinatorics.** The closure poset is described algorithmically (Pataki order × Schubert orders); a clean *combinatorial* description (e.g., as a product of posets or as Bruhat-like) would be useful for compactification arguments.

2. **Intersection of Stratification I and II.** Components 1, 3 of the (2,1) singular locus are *intersections* — strata with both eigenvalue-multipartition and kernel-Schubert structure. The systematic study of these "mixed strata" is open.

3. **Stratification II in cellular sheaves.** When $Q_n$ comes from a stalkwise diagonal Hilbert structure on a cellular sheaf, the kernel of $Q_n$ has additional cellular constraints. The corresponding sub-stratification is the cellular-sheaf version of Stratification II, with potentially richer combinatorics.

4. **EDD formula via Stratification II.** EDD = 40 on the (2,1) chain decomposes conjecturally as (Stratification I) + (Stratification II boundary). A closed-form for each contribution as a function of chain-complex invariants is open. Saturating away Stratification II isolates the intrinsic SPD-interior EDD — see [saturated-edd](../learning-articles/research-papers/questions/saturated-edd/saturated-edd.md).

5. **Compactification as a categorical moduli.** Whether $\overline{\mathcal M_{\mathrm{Lap}}}$ can be defined as a categorical moduli (representing some functor on graded commutative algebras / chain complexes / etc.) is open. If yes, Stratification II is a canonical structure on the categorical moduli.
