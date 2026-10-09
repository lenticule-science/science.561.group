---
type: observation
status: known
depends-on:
- hodge-laplacian
- laplacianizability
references:
- key: wolf2025generalized
  type: article
  - Wolf, Roman
  - Fan, Jiahui
  - Monod, Anthea
  year: 2025
  title: Generalized Persistent Laplacians and their Spectral Properties
  eprint: '2509.20220'
  eprinttype: arxiv
- key: backhausz2025spectral
  type: article
  - Backhausz, Ágnes
  - Kuehn, Christian
  - van der Niet, Charlotte
  - Zucal, Joaquín
  year: 2025
  title: Spectral theory of dense hypergraph limits
  eprint: '2511.03516'
  eprinttype: arxiv
---

# Continuity of Laplacianization (observation, not a single theorem)

This file collects the *real* continuity statements that hold for Laplacianization, with their precise hypotheses. The unifying claim ("the Laplacianization functor is continuous") was the gestural framing in an earlier draft; what is actually true is a family of related theorems, each in its own setting, each with precise statements available in the literature.

## Finite-dimensional case (perturbation theory)

**Statement.** Let $(C_\bullet, d, \langle \cdot, \cdot \rangle)$ be a finite-dimensional graded Hilbert chain complex. The map

$$(d, \langle \cdot, \cdot \rangle) \;\longmapsto\; \mathrm{spec}(\Delta) \in \mathbb R_{\ge 0}^{\dim C_n}$$

(eigenvalues counted with multiplicity, sorted) is continuous in the entries of the boundary matrix and the Gram matrix of the inner product. Eigenprojections are also continuous *off the discriminant locus* (where eigenvalues collide).

**Why it holds.** Direct from finite-dimensional spectral perturbation theory (Kato, *Perturbation Theory for Linear Operators*, ch. II). $\Delta$ depends polynomially on $d$ and $\langle \cdot, \cdot \rangle$; eigenvalues of a continuous family of self-adjoint matrices are continuous.

**Why it's relevant.** Most 2025 papers in `references/` work over finite-dimensional chain complexes; for those, "continuity of Laplacianization" is an immediate corollary of finite-dim perturbation theory. Specific results in the literature (e.g. Lipschitz bounds for persistent Laplacian eigenvalues under one-simplex insertions, stability bounds for quiver Laplacians) are *quantitative* refinements of the qualitative continuity.

## Closed-range unbounded case (norm-resolvent convergence)

**Statement.** Let $(C_\bullet^{(t)}, d^{(t)}, \langle \cdot, \cdot \rangle^{(t)})$ be a family of unbounded graded Hilbert chain complexes parametrized by $t \in [0, 1]$, each with $d^{(t)}$ closed densely-defined and having closed range. If the family is *norm-resolvent continuous* in $t$ — meaning $(\Delta^{(t)} + 1)^{-1}$ varies continuously in operator norm — then:

- $\mathrm{spec}(\Delta^{(t)})$ is continuous in $t$ (each eigenvalue varies continuously in some local labeling, and the essential spectrum is upper-semicontinuous).
- Eigenprojections of isolated eigenvalues are continuous in $t$.

**Why it holds.** Standard result (Kato, ch. IV; Reed–Simon vol. IV).

**Why it's relevant.** Cases like:
- spectral propinquity continuity for Dirac operators (anchor in noncommutative geometry);
- generalized persistent Laplacians varying with the persistence parameter ([@wolf2025generalized]);
- de Rham Laplacians on Riemannian metrics varying continuously.

In each, the work is to verify norm-resolvent continuity for the specific family in question; once that is established, the spectral consequences are textbook.

## Categorical limits

**Open / non-trivial.** When $\mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ is a Laplacianization functor and $X^{(n)} \to X$ is a sequence in $\mathcal C$ converging in some structural metric (cut distance, Gromov–Hausdorff, propinquity), does the induced sequence $\Delta^{(n)} \to \Delta$ converge spectrally?

This is the form of continuity the gestural earlier draft was reaching for. It is *not* automatic from finite-dim perturbation theory or norm-resolvent continuity, because morphisms in $\mathcal C$ may not induce bounded chain maps in any uniform way. Each setting has its own statement:

- **Hypergraph cut-metric limits** ([@backhausz2025spectral]): the relevant theorem is convergence of Laplacian spectra in a measure-theoretic sense.
- **Graphon limits**: established for graph Laplacians in adjacency form; less mature for higher-order Laplacians.
- **Persistence parameter limits**: addressed by the generalized persistent Laplacian framework.

Whether one theorem covers all these cases — categorical continuity of Laplacianization — is open. Each setting has its own perturbation-theoretic statement; a categorical unification is not in the literature.

## Why this is an "observation" not a "theorem"

There is no single theorem here, just a family of perturbation-theoretic results plus an open conjecture about uniformity across categories. Labeling the file `kind: observation` rather than `kind: theorem` reflects this; it was wrong to label it "theorem" without a precise statement.

## What would constitute progress

A clean theorem of the form: "for $\mathcal C$ in a class $\mathfrak K$ of categories of structures (with a structural metric and a cohomology theory), every Hilbert lift $F: \mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ is automatically continuous in the structural metric, with eigenvalues of $\Delta_X$ uniformly Lipschitz in some norm." Identifying $\mathfrak K$ is the open part. Compactly-generated, finite-type, categorical-Hausdorff — there are multiple plausible candidates.
