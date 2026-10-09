---
type: question
status: open
explores:
- cross-category-orbifold-stratification
- universal-vs-categorical-stratification
- moduli-of-laplacianizers
references:
- key: aksoy2025reimagining
  type: article
  authors:
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
title: What is the category-free hypothesis for the cross-category theorem?
description: The cross-category orbifold-stratification theorem is proved in finite-dim and sketched abstractly.
---

# What is the category-free hypothesis for the cross-category theorem?

The [cross-category orbifold-stratification theorem](../cross-category-orbifold-stratification.md) is proved in finite-dim and sketched abstractly. Its proved instances include cellular finite-dim, parametric graph, smooth Riemannian, finite spectral triple. The pattern persists across these distinct categories with no a priori connection.

## Question

What is the *minimal categorical hypothesis* on $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ that implies the cross-category theorem? And what category-free statement encodes the universal codim formula $\sum_B(|B|-1)$ + category-specific stab?

## Current state

Each proved instance uses different ingredients:
- **Cellular finite-dim**: finite-dim chain complex, $G = $ chain auto group, real-algebraic.
- **Parametric graph**: @aksoy2025reimagining framework, finite-dim with $\mathrm{Aut} =$ vertex symmetry.
- **Smooth Riemannian**: Ebin slice + Kato + Myers–Steenrod + Rayleigh–Schrödinger. Infinite-dim Banach orbifold.
- **Finite spectral triple**: Hochschild–Hilbert lift via resolvent. Finite-dim.

The proofs share the *five-step pattern*: (1) orbifold structure, (2) analytic-spectrum continuity, (3) codim by counting equations, (4) stab from gauge group, (5) closure poset by Rayleigh–Schrödinger. Steps (1)-(2) and (5) use category-specific tools; steps (3)-(4) are category-independent.

## Conjectural unifying hypotheses

> **Hypothesis (C-OS framework).** A 5-tuple $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ where:
> - $\mathcal C$ is a category.
> - $H^\bullet: \mathcal C \to \mathbf{grVect}_\mathbb{R}$ is a graded-vector-space-valued cohomology theory.
> - $F: \mathcal C \to \mathbf{Hilb}^\mathbb Z$ is a Hilbert lift functor with chain differential $d$ and $d^2 = 0$.
> - $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is a natural iso.
> - $\mathrm{Aut}: \mathcal C \to \mathbf{Grp}$ is an automorphism group functor (auto of $X \in \mathcal C$ as input, intertwining the Hilbert lift with $F$).

Hypothesis 1: $\mathrm{Aut}(X)$ acts properly on the Hilbert structure moduli $\mathcal H(X)$ for each $X$, with finite-dim stabilizers.

Hypothesis 2: The Hodge Laplacian $\Delta(X, Q)$ has discrete spectrum varying real-analytically in $Q$, with closed-range condition holding generically.

Hypothesis 3 (closure-direction): At any spectral degeneracy, generic perturbations of $Q$ split eigenvalues at first order (Rayleigh–Schrödinger applies).

Under these hypotheses, the cross-category orbifold-stratification theorem holds: moduli is an orbifold, stratified by bipartite multipartition with universal codim and category-specific stab.

## What's missing

The above is essentially a wish-list of conditions. The genuine unifying statement would:
- Identify these conditions as derivable from a single categorical structure (e.g., a "Hilbert-lift functor in a category with appropriate compactness/regularity").
- Verify each proved instance satisfies the hypotheses (not just satisfies the conclusion).
- Identify a *non-example*: a category where one of the hypotheses fails and the theorem doesn't hold.

The nonlinear / $p$-Laplacian case is the natural non-example: variational eigenvalue perturbation theory doesn't satisfy Hypothesis 2-3 directly (eigenvalues are not real-analytic in the same Kato sense). So the conditions distinguishing linear-Hilbert from nonlinear-Banach should be the boundary of the cross-category framework.

## Possible categorical formalism

The right ambient might be the *derived category* $D^b(\mathbf{Hilb}^\mathbb Z)$ of bounded Hilbert chain complexes. In this ambient:
- Cohomology theories are natural transformations to $\mathbf{grVect}$.
- Hilbert lifts are objects of $D^b(\mathbf{Hilb}^\mathbb Z)$.
- Quasi-isomorphisms are inverted, identifying chain-homotopic complexes.
- Moduli of Hilbert lifts is moduli in this derived category.

Universal codim might then be a feature of moduli of objects in $D^b(\mathbf{Hilb}^\mathbb Z)$ — *category-free* in the sense of not depending on which $\mathcal C \to D^b(\mathbf{Hilb}^\mathbb Z)$ we use as input.

## Implications

A category-free cross-category theorem would:
- Cover all current proved instances *under one unified statement*.
- Identify exactly which categories of inputs admit the bipartite stratification framework.
- Predict the framework's applicability for new categories (RCD spaces, persistent complexes, etc.) without needing case-by-case verification.

It would also clarify what the *Laplacianizer* framework is at maximum generality: not "a Hilbert lift functor on a category," but "an object in the derived category of Hilbert chain complexes with a natural automorphism group action."

## Open challenges

- Defining the right "moduli" in the derived setting (homotopy moduli? Stack? $\infty$-groupoid?).
- Showing the "five-step" proof structure transfers to the derived setting.
- Identifying the "stab dim" as a derived invariant rather than category-specific data.

This is a substantial categorical project, well-defined but unresolved.
