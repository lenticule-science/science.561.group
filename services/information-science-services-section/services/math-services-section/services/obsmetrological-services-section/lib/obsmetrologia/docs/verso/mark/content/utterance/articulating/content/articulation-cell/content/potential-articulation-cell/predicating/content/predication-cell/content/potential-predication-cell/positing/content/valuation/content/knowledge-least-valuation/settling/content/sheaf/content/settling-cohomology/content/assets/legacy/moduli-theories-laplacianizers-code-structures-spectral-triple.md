---
type: object
class: noncommutative-structure
symbol: (\mathcal A, \mathcal H, D)
status: draft
realizes:
- laplacianizability
see-also:
- metric-measure-space
references:
- key: mesland2024curvature
  type: article
  - Mesland, Bram
  - Rennie, Adam
  year: 2024
  title: Curvature and Weitzenbock formula for spectral triples
  eprint: '2404.07957'
  eprinttype: arxiv
- key: tageddine2025noncommutative
  type: article
  - Tageddine, Damien
  - Nave, Jean-Christophe
  year: 2025
  title: Noncommutative Laplacian and numerical approximation of Laplace-Beltrami spectrum of compact Riemann surfaces
  eprint: '2510.09909'
  eprinttype: arxiv
---

# Spectral triple

A Connes spectral triple $(\mathcal A, \mathcal H, D)$ — a unital $*$-algebra $\mathcal A$ acting on a Hilbert space $\mathcal H$, together with an unbounded self-adjoint operator $D$ (the Dirac operator) with compact resolvent and bounded commutators with $\mathcal A$. Encodes a "noncommutative Riemannian manifold."

## Why this is in the survey

Two 2025 papers attach laplacianizers: [@mesland2024curvature] defines connection Laplacians and a Weitzenböck identity, and [@tageddine2025noncommutative] constructs a Laplacian on matrix-algebra approximations whose classical limit is Laplace–Beltrami.

A spectral triple is the most distant input category from the cellular / poset world that still admits a recognizable Laplacianization. The Laplacian here is built from the Dirac operator (or its connection version) and lives in the operator algebra of $\mathcal H$. The Weitzenböck identity matters because it is *the* signature of a genuine Laplacianization — relating the abstract operator to curvature data — and its analogue in spectral triples is exactly what licenses the claim that the construction is the right one.

## Where this strains laplacianizers

The Laplacianizer framework (`concepts/laplacianizer.md`) requires a graded chain complex $(F(X), d)$ with $d^2 = 0$. For spectral triples this is *not* immediately given:

- No obvious chain complex: the spectral triple has $\mathcal H$ as a single Hilbert space with no graded decomposition coming from the structure.
- The Dirac operator $D$ is not a degree-(-1) chain differential with $D^2 = 0$ in the de Rham sense; instead $D^2$ is related to the Laplacian via the Weitzenböck formula.
- A functor from spectral triples to graded Hilbert chain complexes is not in the literature in a form laplacianizers could use directly.

The **Hochschild / cyclic complex** of $\mathcal A$ is the natural candidate to play the role of $C_\bullet(X)$ for spectral triples. If the connection Laplacian on a spectral triple agrees with a Hodge Laplacian on the cyclic complex (with the spectral-triple-induced inner product), laplacianizers would have a clean categorical bridge from noncommutative geometry to combinatorial Laplacian theory. That bridge is open.

## Bridges

- To `concepts/laplacianizer.md` — the noncommutative case requires either an extension of the Laplacianizer framework or a translation of spectral-triple data into a chain-complex form (probably via Hochschild / cyclic complexes).
- To `questions/what-is-laplacianizability.md` — the noncommutative case is one of the open frontier directions raised there.
