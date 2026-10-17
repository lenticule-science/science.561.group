---
type: question
status: open
explores: [nonlinear-p-hodge-laplacianizability]
title: Variational $p$-eigenvalue perturbation theory
description: For the nonlinear $p$-Hodge Laplacianizability theorem at fixed $p$, the closure-poset argument requires Kato-style perturbation theory for variational eigenvalues — continuity (and ideally real-analyticity) of variational eigenvalues…
---

# Variational $p$-eigenvalue perturbation theory

For the [nonlinear $p$-Hodge Laplacianizability theorem](../nonlinear-p-hodge-laplacianizability.md) at fixed $p$, the closure-poset argument requires *Kato-style perturbation theory for variational eigenvalues* — continuity (and ideally real-analyticity) of variational eigenvalues under perturbation of the $p$-Banach lift.

For $p = 2$ (linear Hilbert case), Kato analytic perturbation theory provides this directly. For $p \ne 2$, the eigenvalues are critical values of nonlinear functionals; standard Kato doesn't apply.

## Question

Is there a Kato-style perturbation theory for variational $p$-eigenvalues sufficient for the closure-poset argument?

## What's needed

Given a graded $p$-Banach chain complex $(B_\bullet, d, \|\cdot\|_p^{(\bullet)})$ and a parametric family of $p$-Banach lifts $\|\cdot\|_p^{(t)}$ varying smoothly in $t$, the variational $p$-eigenvalues $\lambda_k^{(p)}(t)$ should:

(a) Be continuous in $t$.
(b) Be real-analytic on a dense open set.
(c) Have eigenfunction-like critical points varying continuously.
(d) Admit a first-order perturbation formula: $\lambda_k^{(p)}(t) \approx \lambda_k^{(p)}(0) + t \cdot \langle \text{eigenfunction}, \text{perturbation}\rangle + O(t^2)$ in some appropriate sense.

For $p = 2$: all four hold via standard Kato.

For $p \ne 2$: continuity (a) is partially known (Tudisco–Hein, Amghibech for fixed $p$ on graphs). The other conditions are less clear.

## Specific challenge: nonlinear eigenspaces

For $p = 2$, an eigenspace is a vector subspace; perturbation rotates it among neighboring subspaces. Standard Kato handles this via spectral projections.

For $p \ne 2$, an "eigenspace" (level set of $\mathcal F_p$ at a critical value) is *not a vector subspace* — it's a nonlinear cone (possibly a finite collection of points up to scaling). Perturbation of a critical point gives a deformed critical point in a "tangent cone" — but this isn't captured by linear Kato machinery.

The natural framework is *Lyusternik–Schnirelman category-theoretic perturbation*, which handles min-max critical values rather than linear-algebraic eigenvalues. This exists in the literature (e.g., Mawhin–Willem, "Critical Point Theory") but isn't packaged for our setting.

## Sub-question: small perturbation regime

For $p$ near 2, the $p$-Laplacian is a perturbation of the linear Laplacian. *Small-deformation* theory should give the closure-poset argument in the regime $|p - 2| < \epsilon$.

Specifically: if at $p = 2$ a stratum is the closure of another, does this persist for $p \in (2 - \epsilon, 2 + \epsilon)$?

## Sub-question: graphs at $p$ near 2

For graph $p$-Laplacians on $K_3, C_4, \partial \Delta^2$, etc., compute the variational eigenvalues at a few values of $p \in \{1.5, 2, 2.5\}$ numerically. Verify continuity and any closure-poset behavior.

This is a concrete numerical study, doable with the toolkit (extended to numerical / variational eigenvalue computation).

## Sub-question: closed forms for special $p$

For special $p$ (e.g., $p = 2$, $p \to \infty$ giving the $\infty$-Laplacian, $p = 1$ giving the cut-Laplacian), the variational eigenvalues admit closed forms. The closure poset at these special $p$ might be tractable directly.

Interpolating between these via $p$-deformation could give the closure-poset argument across all $p \in (1, \infty)$.

## Implication

A clean variational-Kato theorem would:
- Complete the [nonlinear $p$-Hodge cross-category theorem](../nonlinear-p-hodge-laplacianizability.md) for fixed $p$.
- Open the door to a *varying-$p$* cross-category theorem (treating $p$ as a parameter alongside the $p$-Banach lift).
- Connect to the $p$-deformation literature in nonlinear PDE.

Without it, the nonlinear case remains conjectural beyond fixed special $p$.

## Connection to spectral fragmentation

For $p$ slightly different from 2, eigenvalues that were degenerate at $p = 2$ may "split" into nearby critical values. This *spectral fragmentation* is the analog of branching in linear Kato; controlling it requires a $p$-aware version of the standard spectral-perturbation formulas.

The structural question: how does the bipartite multipartition stratification at $p = 2$ deform to nearby $p$? Specifically: do strata move continuously, or do they split / merge?
