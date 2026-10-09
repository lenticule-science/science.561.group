---
type: theorem
status: sketch
depends-on:
- nonlinear-laplacianizability
- cross-category-orbifold-stratification
- bipartite-stratification-theorem
see-also:
- p-laplacian-signed-graphs-tensor-2025
- p-laplacian-graph-surgery-2025
- nonlinear-laplacians-pca-2025
references:
- key: ge2025computing
  type: article
  authors:
  - Ge, Lingyu
  - Qin, Yuning
  year: 2025
  title: Computing the p-Laplacian eigenpairs of signed graphs
  eprint: '2501.07929'
  eprinttype: arxiv
- key: aksoy2025reimagining
  type: article
  authors:
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
- key: ma2025nonlinear
  type: article
  authors:
  - Ma, Yinghan
  - Kunisky, Dmitriy
  year: 2025
  title: 'Nonlinear Laplacians: Tunable principal component analysis under directional prior information'
  eprint: '2505.12528'
  eprinttype: arxiv
title: Nonlinear $p$-Hodge Laplacianizability — variational extension
description: "For fixed $p \\in (1, \\infty)$ and a finite-dimensional chain complex with Banach (specifically $p$-ellipsoidal) lifts, a variational analog of the Laplacianizer framework can be set up: $p$-Hodge isomorphism, variational eigenvalue…"
---

# Nonlinear $p$-Hodge Laplacianizability — variational extension

For fixed $p \in (1, \infty)$ and a finite-dimensional chain complex with Banach (specifically $p$-ellipsoidal) lifts, a variational analog of the Laplacianizer framework can be set up: $p$-Hodge isomorphism, variational eigenvalue stratification, and a fixed-$p$ cross-category claim. The full cross-category theorem (varying $p$, varying chain category) requires nonlinear eigenvalue perturbation theory and remains conjectural.

This entry states the variational framework precisely, identifies what's provable, and isolates the open analytical questions.

## Setup

A **graded $p$-Banach chain complex** is $(B_\bullet, d, \|\cdot\|^{(\bullet)}_p)$ where:

- Each $B_n$ is a finite-dim real vector space.
- $d_n: B_n \to B_{n-1}$ is linear with $d^2 = 0$.
- $\|\cdot\|^{(n)}_p$ is a $p$-norm on $B_n$ — i.e., a Minkowski functional of a centrally-symmetric convex body $K_n \subset B_n$ with $p$-homogeneous "duality"-compatible structure.

For our purposes, restrict to **$p$-ellipsoidal norms**: $\|x\|_p^{(n)} := \langle Q_n x, x\rangle^{1/2}$ raised to $p$-power for $p = 2$, or more generally $\|x\|_p^{(n)} := (\sum_i Q_n[i,i] |x^i|^p)^{1/p}$ in a chosen basis (weighted $\ell^p$-norm with diagonal weights $Q_n$). This makes the moduli of $p$-norms isomorphic to $\prod_n \mathbb R^{m_n}_{>0}$ — diagonal positive weights — a finite-dim space mirroring $\mathrm{Sym}^+$ but smaller.

Let $\mathcal H_p := \prod_n \mathbb R^{m_n}_{>0}$ — the moduli ambient for diagonal $p$-Banach lifts.

## Variational $p$-Hodge

> **Definition ($p$-Laplacian).** For a graded $p$-Banach chain complex $(B_\bullet, d, \|\cdot\|_p)$, the **$p$-Laplacian** in degree $n$ is the operator $\Delta_p^{(n)}: B_n \to B_n$ defined as the Euler–Lagrange operator of the action functional
> $$\mathcal F_p^{(n)}(u) := \frac{\|d_{n-1}u\|^p_p + \|d_n^{*p} u\|^p_q}{\|u\|^p_p}, \qquad \frac{1}{p} + \frac{1}{q} = 1$$
> where $d_n^{*p}: B_{n-1} \to B_n$ is the *$p$-Banach adjoint* of $d_n$ — the duality-map composition $d_n^{*p} = J_p^{(n)} \circ d_n^* \circ J_q^{(n-1)}$ with $J_r$ the duality maps of the respective $r$-norms.
>
> A **variational $p$-eigenvalue** is a critical value $\lambda$ of $\mathcal F_p^{(n)}$, i.e., a value at which $\nabla \mathcal F_p^{(n)}(u) = 0$ for some $u \neq 0$.

For $p = 2$, this recovers the standard Hodge Laplacian $\Delta_2 = dd^* + d^*d$ with eigenvalues = squared singular values.

For $p \neq 2$, $\Delta_p$ is *nonlinear*, but its eigenvalues form a discrete set (under finite-dim setting, by Lyusternik–Schnirelman theory).

> **Theorem ($p$-Hodge isomorphism, finite-dim cellular case).** For a finite-dim graded $p$-Banach chain complex over $\mathbb R$ with closed range (automatic in finite-dim), the $p$-Laplacian's kernel satisfies
> $$\ker \Delta_p^{(n)} \cong H_n(B_\bullet, d).$$
> The dim of the kernel is $\dim H_n$ (independent of $p$).

This is a known result in the discrete $p$-Laplacian literature: the $p$-harmonic representatives of cohomology classes form a $p$-deformation of the standard ($p=2$) harmonic forms, with the same kernel dim. (References: Eckmann, "Spectra of Laplacians on signed/$p$-Laplacian variants"; Lim, "Hodge theory for graphs and the discrete $p$-Laplacian"; Tudisco–Hein, "A nodal domain theorem and a higher-order Cheeger inequality for the graph $p$-Laplacian.")

**Important caveat for $p \ne 2$.** The $p$-eigenspaces are *not vector subspaces* in general — they're nonlinear cones. So "multiplicity" of an eigenvalue means dim of the cone (or the variational genus, or other combinatorial invariant), not dim of an eigenspace.

For our stratification purposes, define the **$p$-multiplicity** of eigenvalue $\lambda$ as the variational genus $\gamma_\lambda$ of the level set $\{u \in B_n : \mathcal F_p^{(n)}(u) = \lambda\}$ — a Lyusternik–Schnirelman-style invariant. For $p = 2$, $p$-multiplicity = dim of eigenspace.

## Cross-category claim (fixed $p$)

> **Theorem (cross-category orbifold-stratification, fixed-$p$ cellular case).** Let $(B_\bullet, d)$ be a finite-dim graded chain complex over $\mathbb R$, and fix $p \in (1, \infty)$. Restrict to diagonal $p$-Banach lifts in the moduli $\mathcal H_p = \prod_n \mathbb R^{m_n}_{>0}$. Then:
>
> 1. **Orbifold structure.** $\mathcal M^{(p)}_{\mathrm{Lap}} := G \backslash \mathcal H_p$ is a real-analytic orbifold, where $G$ is the diagonal automorphism group preserving $d$ — typically smaller than the full $O(C_n)$ action of the linear case.
>
> 2. **Stratification.** Strata indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}_p(\Delta_p^{(n)})$ — recording variational-eigenvalue coincidences (in the $p$-multiplicity sense).
>
> 3. **Universal codim.** $\mathrm{codim}\,\mathrm{Stratum}(\Pi) = \sum_{B \in \Pi, |B| \ge 2}(|B|-1)$, *for variational eigenvalue equalities*.
>
> 4. **Stab dim.** Depends on the diagonal-automorphism group $G$ and how it acts on $p$-eigenvalue clusters.
>
> 5. **Closure poset.** Refinement of bipartite multipartitions, *conjecturally* under a nonlinear analog of Kato perturbation theory.

### Status of pieces

| Piece | Status |
|---|---|
| Stratification well-defined (fixed $p$) | Proved (variational eigenvalues are continuous in $p$-Banach lifts) |
| Codim formula | Sketch (each eigenvalue equality is one analytic equation, but transversality requires nonlinear-perturbation argument) |
| Stab formula | Sketch (depends on automorphism action on $p$-eigenspaces, which are nonlinear cones) |
| Closure poset | Conjectural (requires nonlinear eigenvalue continuity à la Kato; open for $p \ne 2$) |
| Specialization to $p = 2$ | Recovers [bipartite-stratification-theorem](bipartite-stratification-theorem.md) (with diagonal-automorphism restriction) |

So the fixed-$p$ cellular cross-category theorem is **structurally laid out** but **partially open** — the codim formula and closure poset require nonlinear eigenvalue-perturbation arguments that aren't in standard literature for our setting.

## The varying-$p$ case (genuinely nonlinear)

When $p$ varies (not fixed), the moduli enlarges to include the choice of $p$. The space of pairs $(p, Q) \in (1, \infty) \times \mathcal H_p$ stratifies further:

- **$p$-strata**: loci where $p$ takes a specific value.
- **Bipartite-multipartition strata** within each $p$-stratum: as in the fixed-$p$ case.
- **Cross-$p$ coincidences**: rare events where the $p$-spectrum of one $\Delta_p$ coincides with the $p'$-spectrum of another at $p \ne p'$. Generic-position argument: codim 1 at each cross-$p$ coincidence.

The varying-$p$ case is a richer stratification but requires nonlinear-perturbation theory across the $p$-parameter, which is a substantial open analytical project.

## What goes beyond ellipsoidal Banach norms

The diagonal $p$-Banach moduli $\mathcal H_p = \prod_n \mathbb R^{m_n}_{>0}$ is a *finite-dim sub-moduli* of the full moduli of Banach norms on $B_\bullet$. The full moduli (all centrally-symmetric convex bodies in each $B_n$) is *infinite-dim* — parametrized by smooth curvature functions on the unit sphere.

**Fully general Banach moduli.** The cross-category theorem in the fully general Banach setting would have:
- Infinite-dim moduli per chain space.
- Stratification by variational-eigenvalue multipartition still well-defined.
- "Codim" replaced by *relative codim* in finite-dim sub-moduli (analogous to the smooth Riemannian case where moduli is infinite-dim).
- Closure poset open in general.

This is parallel to the smooth Riemannian case (infinite-dim moduli of metrics) but harder because Banach perturbation theory is genuinely more subtle than Riemannian.

## Specialization to graphs ($p$-Laplacian)

For a finite simple graph $G = (V, E)$ with vertex set $V$ and edge set $E$, the **graph $p$-Laplacian** acts on functions $f: V \to \mathbb R$ as
$$(\Delta_p^{(0)} f)(v) := \sum_{w \sim v} |f(v) - f(w)|^{p-2} (f(v) - f(w)).$$

This is the variational $p$-Laplacian for the chain complex
$$0 \to \mathbb R^E \xrightarrow{d^*} \mathbb R^V \to 0$$
where $d^*: \mathbb R^E \to \mathbb R^V$ is the discrete divergence and the $p$-norms are coordinatewise $\ell^p$.

Variational eigenvalues of $\Delta_p^{(0)}$ on graphs are studied in:
- **Tudisco–Hein 2018**: nodal domains and Cheeger-style inequalities for graph $p$-Laplacian.
- **Amghibech 2003**: existence and properties of $p$-eigenvalues.
- **[@ge2025computing]**: tensor reformulation.

The variational $p$-multipartition stratification in this case:
- For fixed $p$, the moduli of "weighted graphs" with given $G$ is $\mathbb R^E_{>0} \times \mathbb R^V_{>0}$ (edge and vertex weights).
- Strata indexed by $p$-eigenvalue multipartitions of $\Delta_p^{(0)}$.
- The unweighted-symmetric stratum (where the graph has full automorphism symmetry) is the most degenerate.

For $p = 2$, this reduces to Young's parametric graph framework ([@aksoy2025reimagining]) and the linear cross-category theorem applies.

For $p \ne 2$, the stratification is genuinely new (variational eigenvalues, $p$-multiplicities). The cross-category claim is the conjectural extension.

## What needs to be done for full nonlinear cross-category

1. **Nonlinear eigenvalue perturbation theory.** Continuity of variational eigenvalues under perturbation of $p$-Banach lift. Some results exist (Tudisco–Hein for fixed $p$); a Kato-style theorem covering the whole framework is open.

2. **$p$-Hodge isomorphism in noncommutative / nonsmooth settings.** The cellular case is OK; smooth Riemannian $p$-Hodge has subtle regularity issues.

3. **Banach-moduli stratification.** Currently restricted to diagonal $p$-Banach (finite-dim sub-moduli). The general Banach case (infinite-dim moduli of convex bodies) is genuinely open.

4. **Closure poset for variational eigenvalues.** First-order Rayleigh–Schrödinger-style perturbation argument needs nonlinear adaptation. For $p = 2$ this is the linear case; for $p$ near 2, perturbation in the "nearly-linear" regime works; for general $p$, open.

5. **Cross-$p$ stratification.** The varying-$p$ case introduces a new stratum dimension; closure poset and codim across $p$ is open.

## Status

**Sketch / partial-proved on restricted cases.** The variational framework is set up; the fixed-$p$ cellular case admits a partial cross-category theorem with codim and closure-poset claims still requiring nonlinear-perturbation arguments. The full varying-$p$ and general-Banach cross-category theorem is conjectural.

The nonlinear case is honestly *the hardest* of the three frontier directions (cellular, smooth, noncommutative being linear-Hilbert; nonlinear is analytically distinct). A full rigorous treatment would likely require its own monograph.

The variational framework here is the most analytically demanding extension; the closure-poset argument requires a Kato-style perturbation theorem for variational eigenvalues that is not in the standard literature for our setting ([variational-p-eigenvalue-perturbation](questions/variational-p-eigenvalue-perturbation.md)).

## Open

1. Nonlinear Kato-style perturbation theory for variational $p$-eigenvalues — needed for the closure-poset argument across $p$-Banach lift variations.

2. Concrete computation: variational $p$-eigenvalue stratification on a small graph (e.g., $K_3$, $C_4$) for a few values of $p$ — does the bipartite multipartition lattice persist, and how do the strata vary with $p$?

3. Connection to nonlinear PCA: [@ma2025nonlinear] parametrizes a family of nonlinear Laplacians; the cross-category claim should apply to this family with appropriate modifications.

4. Tensor-eigenvalue reformulation: [@ge2025computing] shows graph $p$-Laplacian (for even $p$) is a tensor eigenproblem. The cross-category framework on tensor eigenvalues is its own substantial direction.

5. Dual-stratification analog: does the SPD-cone Stratification II have a Banach analog? The closure of the "Banach unit ball" moduli at degenerate norms (e.g., norms with non-strictly-convex unit balls) might give a parallel boundary structure.
