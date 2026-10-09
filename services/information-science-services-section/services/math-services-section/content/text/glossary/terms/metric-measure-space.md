---
term-kind: object
class: geometric-structure
symbol: (X, d, m)
status: draft
realizes:
- laplacianizability
see-also:
- cellular-sheaf
- finite-poset
references:
- key: honda2025almost
  type: article
  authors:
  - Honda, Shouhei
  - Sun, Xiang
  year: 2025
  title: From almost smooth spaces to RCD spaces
  eprint: '2502.20998'
  eprinttype: arxiv
---

# Metric measure space (and RCD)

A triple $(X, d, m)$ where $X$ is a topological space, $d$ a metric, and $m$ a Borel measure. The **RCD** subclass — metric measure spaces with synthetic lower Ricci curvature bound and infinitesimally Hilbertian Cheeger energy — is the setting in which a Laplacian is rigorously defined as the generator of the gradient flow of the Cheeger energy $\mathrm{Ch}: L^2(m) \to [0, \infty]$.

## Why metric measure spaces matter for the framework

This is the input category most distant from the chain-complex / cellular pictures, and yet:

- The **Laplacian is constructed canonically** — once $(X, d, m)$ has bounded Ricci, the Cheeger energy is determined, and so is its generator.
- **Two routes converge** ([@honda2025almost]): the Bakry–Émery framework (Markov-generator-side curvature) and the RCD framework (transport-side curvature) produce the same Laplacian on an RCD space. This is the cleanest piece of universal-property evidence in the survey: two structurally different functorial routes commute on overlapping inputs.

## What does *not* work directly

Higher-degree Hodge analogues — analogues of $\Delta^k$ acting on "$k$-forms" of an RCD space — are not generally available. The Hilbert-chain-complex framing of the Laplacianizer ([laplacianizer](laplacianizer.md)) breaks here: the structure delivers $\Delta^0$ via Cheeger, but no canonical $C_\bullet(X)$ in higher degree.

For the framework: this means the Laplacianizer framework (as currently set up for graded Hilbert chain complexes) doesn't directly accommodate RCD spaces. A working framework needs either:
- A *Dirichlet-form-induced* variant of Laplacianizer, where the data is a Markov generator $\Delta$ rather than a chain complex; or
- A way to recover "$k$-forms" abstractly from RCD data, generating a graded chain complex on the RCD side. (The latter is one of the hardest open problems in synthetic geometry.)

## Bridges

- To [laplacianizer](laplacianizer.md) — the RCD case is a frontier where the Laplacianizer framework needs extension: from "graded Hilbert chain complex" to "Dirichlet form + Markov generator."
- To [universal-laplacianization](../../documents/articles/research-articles/questions/universal-laplacianization.md) — Bakry–Émery / RCD agreement is one of the strongest pieces of universal-property evidence in the survey.
