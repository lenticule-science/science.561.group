---
type: term
term-kind: object
class: structure
symbol: \mathcal F
status: draft
realizes:
- laplacianizability
depends-on:
- finite-poset
see-also:
- hypergraph
- symmetric-simplicial-set
references:
- key: ayzenberg2025sheaf
  type: article
  authors:
  - Ayzenberg, Anton
  - Gebhart, Thomas
  - Magai, German
  - Solomadin, Grigory
  year: 2025
  title: 'Sheaf theory: from deep geometry to deep learning'
  eprint: '2502.15476'
  eprinttype: arxiv
- key: hu2025cellular
  type: article
  authors:
  - Hu, Yang
  year: 2025
  title: Cellular Sheaves on Higher-Dimensional Structures
  eprint: '2505.23993'
  eprinttype: arxiv
- key: choi2024cellular
  type: article
  authors:
  - Choi, Eunho
  - Park, Hee Rhang
  year: 2024
  title: Cellular sheaf Laplacians on the set of simplices of symmetric simplicial set induced by hypergraph
  eprint: '2411.08458'
  eprinttype: arxiv
- key: choi2025hypergraph
  type: article
  authors:
  - Choi, Seonghyun
  - Kim, Junhyeok
  - Oh, Sangwoo
  year: 2025
  title: 'Hypergraph Neural Sheaf Diffusion: A Symmetric Simplicial Set Framework for Higher-Order Learning'
  eprint: '2505.05702'
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
---

# Cellular sheaf

A cellular sheaf on a regular CW complex (or, more generally, on a finite poset $P$) is a functor $\mathcal F: P \to \mathbf{Vec}$ — assigning a vector space to each cell and a linear restriction map to each face inclusion. Equipped with stalk-wise inner products, the cellular sheaf produces a graded Hilbert cochain complex and a sheaf Laplacian $L_{\mathcal F} = \delta\delta^* + \delta^*\delta$.

## Why cellular sheaves are central

The cellular sheaf is the most flexible and best-classified Laplacianizable structure in the 2025 literature. Five separate threads use it:

- **Topological** ([@ayzenberg2025sheaf]) — the sheaf-on-poset framework subsumes hypergraph and other "non-cellular" Laplacians.
- **Network biology** ([@hu2025cellular]) — the 0-th sheaf Laplacian recovers the classical anisotropic network model Hessian.
- **Symmetric simplicial sets** ([@choi2024cellular]) — lift to a richer combinatorial category.
- **Neural networks** ([@choi2025hypergraph], [@gillespie2025bayesian]) — sheaf Laplacians as a learnable architectural component.
- **Spectral diagnostics** — relative cohomology and sheaf Laplacian spectra as obstruction measures.

The cellular sheaf has the property the framework is hunting: a *parametrized* family of Laplacians on a fixed combinatorial backbone, where the parameter is the sheaf data itself. This is what [@gillespie2025bayesian] exploits by making the parameter a random variable.

## Frame

As a Laplacianizer ([laplacianizer](laplacianizer.md)), the cellular-sheaf construction is the functor

$$\mathbf{Sh}(P, \mathbf{Hilb}) \to \mathbf{HilbCh}_{[P]}$$

that sends a Hilbert-valued sheaf on $P$ to its (Hilbert) cochain complex graded by the rank function on $P$. The Laplacian $L_{\mathcal F}$ is then a derived invariant of this functor.

## Open

Whether the cellular-sheaf framework is *cofinal* among Laplacianization functors on combinatorial inputs — i.e., whether every Laplacian construction in the 2025 survey on finite combinatorial structures factors through some cellular sheaf. @ayzenberg2025sheaf is the strongest evidence yet that it does.
