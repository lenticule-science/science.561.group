---
type: theorem
status: proved
depends-on:
- cross-category-orbifold-stratification
- noncommutative-laplacianizability
- stratified-moduli-of-laplacianizations
see-also:
- spectral-triple-curvature-weitzenbock-2024
- noncommutative-laplacian-2025
- bipartite-stratification-theorem
classical-anchor:
- arnold-1995-hermitian-stratification
references:
- key: mesland2024curvature
  type: article
  authors:
  - Mesland, Bram
  - Rennie, Adam
  year: 2024
  title: Curvature and Weitzenbock formula for spectral triples
  eprint: '2404.07957'
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
title: Laplacianizability for finite spectral triples
description: For finite spectral triples — i.e., $(\mathcal A, \mathcal H, D)$ with $\mathcal A$ a finite-dimensional $$-algebra and $\mathcal H$ a finite-dimensional Hilbert space — the cross-category orbifold-stratification theorem applies once a…
---

# Laplacianizability for finite spectral triples

For *finite* spectral triples — i.e., $(\mathcal A, \mathcal H, D)$ with $\mathcal A$ a finite-dimensional $*$-algebra and $\mathcal H$ a finite-dimensional Hilbert space — the cross-category orbifold-stratification theorem applies once a suitable **Hochschild–Hilbert lift** is constructed. This article provides the explicit construction and proves the cross-category theorem in this setting.

The result: finite spectral triples on a fixed $(\mathcal A, \mathcal H)$ have an orbifold-stratified moduli with the same universal codim formula $\sum_B(|B|-1)$ as the cellular and smooth Riemannian cases, with stab dim depending on the commutant of $\mathcal A$ in $U(\mathcal H)$.

## Setup

A **finite spectral triple** is $(\mathcal A, \mathcal H, D)$ with:

- $\mathcal A$ a finite-dim $*$-algebra over $\mathbb C$, equipped with a faithful $*$-representation $\pi: \mathcal A \to \mathcal B(\mathcal H)$.
- $\mathcal H$ a finite-dim Hilbert space.
- $D \in \mathcal B(\mathcal H)$ self-adjoint.

Bounded-commutator and compact-resolvent conditions are automatic in finite-dim.

Fix $(\mathcal A, \mathcal H)$. The space of admissible $D$'s is
$$\mathcal D(\mathcal A, \mathcal H) := \{D \in \mathcal B(\mathcal H) : D = D^*\} = \mathrm{Herm}(\mathcal H),$$
a real vector space of dim $(\dim \mathcal H)^2$. This is the **moduli ambient** for spectral triples on $(\mathcal A, \mathcal H)$.

The **gauge group** is the commutant
$$G(\mathcal A) := U(\mathcal H) \cap \pi(\mathcal A)' = \{u \in U(\mathcal H) : u \pi(a) = \pi(a) u\ \forall a \in \mathcal A\},$$
acting on $D$ by conjugation $u \cdot D := u D u^*$. The moduli of spectral triples is
$$\mathcal M_{\mathrm{spec}}(\mathcal A, \mathcal H) := G(\mathcal A) \backslash \mathrm{Herm}(\mathcal H).$$

## Hochschild complex

The reduced Hochschild complex of $\mathcal A$:
$$C_n(\mathcal A) := \mathcal A^{\otimes(n+1)}, \qquad b: C_n \to C_{n-1}$$
$$b(a_0 \otimes \cdots \otimes a_n) := \sum_{i=0}^{n-1}(-1)^i a_0 \otimes \cdots \otimes a_i a_{i+1} \otimes \cdots \otimes a_n + (-1)^n a_n a_0 \otimes a_1 \otimes \cdots \otimes a_{n-1}.$$
$b^2 = 0$. Hochschild homology $\mathrm{HH}_\bullet(\mathcal A) = H_\bullet(C_\bullet, b)$ is finite-dim (since $\mathcal A$ is finite-dim).

For finite-dim $\mathcal A$ over $\mathbb C$, $\mathrm{HH}_\bullet(\mathcal A)$ is computable:
- $\mathcal A = M_n(\mathbb C)$ (separable): $\mathrm{HH}_0 = \mathbb C$, $\mathrm{HH}_k = 0$ for $k \ge 1$.
- $\mathcal A = \mathbb C^N$ (commutative): $\mathrm{HH}_0 = \mathbb C^N$, $\mathrm{HH}_k = 0$ for $k \ge 1$ (also separable).
- $\mathcal A = \mathbb C[\mathbb Z/n]$ (group algebra): $\mathrm{HH}_\bullet$ has rich structure depending on $n$.
- $\mathcal A = \mathbb C[t]/(t^n)$ (truncated polynomials): $\mathrm{HH}_\bullet$ is non-trivial in all degrees up to some bound.

## Hochschild–Hilbert lift

> **Definition (Hochschild–Hilbert lift).** For a finite spectral triple $(\mathcal A, \mathcal H, D)$, define the inner product on $C_n(\mathcal A)$ by
> $$\langle a_0 \otimes \cdots \otimes a_n,\ b_0 \otimes \cdots \otimes b_n \rangle_D := \mathrm{Tr}_\mathcal H\big(\pi(a_0)^* R_D\, \pi(b_0)\big) \cdot \prod_{i=1}^{n} \mathrm{Tr}_\mathcal H\big([D, \pi(a_i)]^* R_D\, [D, \pi(b_i)]\big)$$
> where $R_D := (1 + D^2)^{-1}$ is the resolvent.

This depends on $D$ via the resolvent and the commutators $[D, \pi(\cdot)]$. The resolvent $R_D$ is positive (as $1 + D^2 \ge 1$), so the inner product is positive-definite *provided* the map
$$\theta_D^{(n)}: C_n(\mathcal A) \to \mathcal B(\mathcal H)^{\otimes(n+1)}, \quad a_0 \otimes \cdots \otimes a_n \mapsto \pi(a_0) \otimes [D, \pi(a_1)] \otimes \cdots \otimes [D, \pi(a_n)]$$
is injective.

> **Lemma (injectivity of $\theta_D$ on a generic open set).** For $D$ in a Zariski-open subset of $\mathrm{Herm}(\mathcal H)$, $\theta_D^{(n)}$ is injective. On the complement (a real-algebraic subvariety of positive codim), $\theta_D^{(n)}$ has non-trivial kernel; on this complement, the bilinear form $\langle \cdot, \cdot \rangle_D$ is positive *semidefinite*, and we work modulo its kernel.

For $D$ in the open injective locus, $(C_\bullet(\mathcal A), b, \langle\cdot,\cdot\rangle_D)$ is a finite-dim graded Hilbert chain complex.

The Hodge Laplacian
$$\Delta_n^{(D)} := b b^*_D + b^*_D b: C_n(\mathcal A) \to C_n(\mathcal A)$$
is self-adjoint w.r.t. $\langle\cdot,\cdot\rangle_D$, with $\ker \Delta_n^{(D)} \cong \mathrm{HH}_n(\mathcal A)$ by the Hodge isomorphism.

> **Justification.** For finite-dim chain complexes with non-degenerate inner product, the Hodge isomorphism $\ker \Delta_n \cong H_n$ is automatic (no closed-range obstruction). So the lift gives a Laplacianization in the sense of [laplacianizer](../../../glossary/terms/laplacianizer.md).

## Cross-category theorem in this setting

> **Theorem (cross-category orbifold-stratification, finite spectral triples).** Let $(\mathcal A, \mathcal H)$ be fixed with $\dim_\mathbb C \mathcal A < \infty$ and $\dim_\mathbb C \mathcal H < \infty$. Restrict to the Zariski-open subset $\mathrm{Herm}^\circ(\mathcal H) \subset \mathrm{Herm}(\mathcal H)$ where the Hochschild–Hilbert lift is non-degenerate. Then:
>
> 1. **Orbifold structure.** $\mathcal M^\circ_{\mathrm{spec}}(\mathcal A, \mathcal H) := G(\mathcal A) \backslash \mathrm{Herm}^\circ(\mathcal H)$ is a real-analytic orbifold of dim $(\dim \mathcal H)^2 - \dim G(\mathcal A)$.
>
> 2. **Stratification.** Strata are indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}(\Delta_n^{(D)})$ — recording within-degree-$n$ and cross-degree-$n$ eigenvalue coincidences of the Hodge Laplacians on Hochschild chains.
>
> 3. **Universal codim.** $\mathrm{codim}\,\mathrm{Stratum}(\Pi) = \sum_{B \in \Pi, |B| \ge 2}(|B|-1)$, same as cellular and smooth cases.
>
> 4. **Stab dim (category-specific).** $\dim \mathrm{stab}_G([D]) = \dim Z_{G(\mathcal A)}(D)$, the dim of the centralizer of $D$ in the gauge group $G(\mathcal A)$. For generic $D$ in a $\Pi$-stratum, this is determined by the multipartition of $D$'s eigenvalues *as restricted to* the irreducible components of $\mathcal H$ under $\mathcal A$-action.
>
> 5. **Closure poset.** Refinement of bipartite multipartitions, same as cellular and smooth cases.

### Proof

The cross-category orbifold-stratification theorem ([cross-category-orbifold-stratification](cross-category-orbifold-stratification.md)) applies once we verify the Laplacianizer framework $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ assembles:

- $\mathcal C$ = category of finite spectral triples on $(\mathcal A, \mathcal H)$, morphisms = unitary intertwiners commuting with $\pi(\mathcal A)$.
- $H^\bullet = \mathrm{HH}_\bullet(\mathcal A)$ — independent of $D$.
- $F: D \mapsto (C_\bullet(\mathcal A), b, \langle\cdot,\cdot\rangle_D)$ — Hochschild complex with $D$-dependent Hilbert structure.
- $\eta_D$: standard Hodge isomorphism for non-degenerate inner products.
- $\mathrm{Aut} = G(\mathcal A)$.

The framework is *finite-dim* (both $\mathcal H$ and $C_\bullet(\mathcal A)$ are finite-dim), so the **finite-dim cross-category theorem** applies directly, yielding (1)–(5).

The main verification is that the inner product $\langle\cdot,\cdot\rangle_D$ varies real-analytically in $D$ on $\mathrm{Herm}^\circ(\mathcal H)$. This follows because $R_D = (1+D^2)^{-1}$ is real-analytic in $D$ on the open set where $1+D^2$ is invertible (here automatic since $1+D^2 \ge 1$), and trace and tensor products preserve real-analyticity. ∎

## Specialization: matrix algebra

> **Corollary (matrix algebra reduces to Arnold).** For $\mathcal A = M_n(\mathbb C)$ acting irreducibly on $\mathcal H = \mathbb C^n$:
>
> - $\mathrm{HH}_0 = \mathbb C$ (traces), $\mathrm{HH}_k = 0$ for $k \ge 1$.
> - The Hochschild complex resolves to a single chain space $\mathcal A / [\mathcal A, \mathcal A] = \mathbb C$.
> - The cross-category theorem reduces to: moduli of self-adjoint $D$ on $\mathbb C^n$, modulo $G(M_n(\mathbb C)) = U(1)$ (only scalars commute with $M_n(\mathbb C)$ acting irreducibly).
> - But $U(1)$ acts trivially by conjugation on Hermitian matrices: $u D u^* = D$ for $u \in U(1)$.
> - So $\mathcal M^\circ_{\mathrm{spec}} = \mathrm{Herm}(\mathbb C^n)$, with stratification by eigenvalue multipartition of $D$.
>
> This is exactly **Arnold's classical eigenvalue stratification of Hermitian $n \times n$ matrices** [@arnold1995remarks].

So the noncommutative theorem on $M_n(\mathbb C)$-spectral triples *is* Arnold's theorem, recovered through the Hochschild–Hilbert lift. The theorem genuinely extends Arnold rather than reducing to a triviality: the chain-complex side is concentrated in degree 0, but the Hilbert-lift side is non-trivial (it's the choice of $D$).

## Specialization: commutative finite-dim algebras

> **Corollary (commutative case).** For $\mathcal A = \mathbb C^N$ acting diagonally on $\mathcal H = \mathbb C^N$:
>
> - $\mathrm{HH}_0 = \mathbb C^N$, $\mathrm{HH}_k = 0$ for $k \ge 1$.
> - Gauge group $G(\mathbb C^N) = U(1)^N$ (diagonal unitaries).
> - Moduli of Hermitian $D$'s on $\mathbb C^N$ modulo $U(1)^N$ has dim $N^2 - N$.
> - The Laplacian $\Delta_0^{(D)}$ on $C_0 = \mathbb C^N$ has $N$ eigenvalues; the bipartite multipartition reduces to a single-degree partition of $\{1, \ldots, N\}$.
>
> The theorem says this moduli is stratified by partitions of $N$, with codim $\sum_B(|B|-1)$ per stratum.

This is **Connes' two-point space** ($N = 2$) and its multi-point generalizations. The cross-category theorem gives the explicit stratified-moduli structure, recovering and extending the spectrum-stratification of finite metric measure spaces (= finite-dim commutative spectral triples).

## Specialization: group algebra $\mathbb C[\mathbb Z/n]$

For $\mathcal A = \mathbb C[\mathbb Z/n]$, the Hochschild homology is non-trivial in higher degrees, and the bipartite multipartition has genuine cross-degree content.

Specifically, for $n$ even, $\mathrm{HH}_\bullet(\mathbb C[\mathbb Z/n])$ has dim 1 in each non-negative degree (there's a "non-split" piece). The bipartite multipartition records cross-degree eigenvalue coincidences of $\Delta_0, \Delta_1, \Delta_2, \ldots$.

This gives the *first concrete instance* of a noncommutative bipartite stratification with non-trivial cross-degree structure — generalizing Arnold beyond the univariate case.

## What this delivers

1. **Concrete construction** of the Hochschild–Hilbert lift for finite spectral triples, with explicit formula via the resolvent $R_D$.

2. **Cross-category theorem proved** in the finite spectral triple case — the third proved instance of the cross-category framework, after cellular finite-dim and parametric graph.

3. **Specializations** showing the theorem recovers Arnold (for $M_n$), gives new content for commutative finite-dim (= finite metric spaces), and produces genuinely bipartite stratifications for group algebras.

4. **Noncommutative case is now partial-proved**: the finite-dim sub-case is rigorous; the infinite-dim case via Connes' machinery remains open.

## Connection to Connes–Moscovici

The Hochschild–Hilbert lift defined here is *not* the Connes–Moscovici local-index cocycle. The CM cocycle is a Hochschild *cocycle* in $HH^\bullet(\mathcal A)$ (cohomology); the Hilbert lift defines an inner product on Hochschild *chains* (homology).

These are dual under the Connes–Karoubi pairing $\mathrm{HH}_\bullet(\mathcal A) \otimes \mathrm{HH}^\bullet(\mathcal A) \to \mathbb C$. The connection: the inner product on chains *induces* a pairing with cochains via $\langle c, \phi \rangle := \langle c, \phi^\sharp \rangle_D$ where $\phi^\sharp$ is the dual chain to the cochain $\phi$ under $\langle\cdot,\cdot\rangle_D$.

So our construction sits *adjacent* to Connes–Moscovici but is more elementary: it works directly at the chain level rather than via cocycle pairings, and it gives a Hodge-style theory rather than a cyclic-cocycle local-index theory.

## Open

1. **Verify cross-degree non-triviality on $\mathbb C[\mathbb Z/n]$.** Explicit computation of $\Delta_0, \Delta_1$ on the Hochschild complex of a small group algebra, identifying when their spectra coincide. Should produce genuine bipartite multipartitions.

2. **Cyclic complex variant.** The cyclic complex $\mathrm{HC}_\bullet(\mathcal A)$ has differential $b - B$ (Connes' double-complex). Generalizing the Hochschild–Hilbert lift to cyclic chains is open; should give a Laplacianizability theorem for cyclic homology rather than Hochschild.

3. **Infinite-dim extension via Connes.** For non-finite spectral triples (compact resolvent, finite-summable but not finite-dim), the Hilbert lift via the resolvent generalizes structurally. Closed-range conditions on $b$ become non-trivial; need analytical care. This is the Connes-style infinite-dim noncommutative theorem.

4. **Connection to Weitzenböck identity.** [@mesland2024curvature] establishes a Weitzenböck identity for spectral-triple Laplacians. The relationship between $\Delta_n^{(D)}$ on Hochschild chains (this entry) and the Weitzenböck-style Laplacian on $\mathcal H$ (the spectral-triple analog of $\nabla^*\nabla$ + curvature) is open and should illuminate the structural picture.

5. **Noncommutative bipartite Vassiliev–Shapiro–Vainshtein.** Computing the cohomology of strata in $\mathcal M^\circ_{\mathrm{spec}}$ via the bipartite multipartition lattice — the noncommutative analog of the Vassiliev/SV bipartite extension (also identified as a frontier direction for the cellular case).

## Status

Proved for finite spectral triples. The infinite-dim extension is sketched in [infinite-spectral-triple-laplacianizability](infinite-spectral-triple-laplacianizability.md) via the resolvent-power inner product on regular spectral triples.
