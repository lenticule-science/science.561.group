---
type: reference
key: mule2025directional
class: article
- Mulé, Manuel
- Fiorini, Stefano
- Purificato, Erasmo
- Siciliano, Federico
- Coniglio, Stefano
- Silvestri, Fabrizio
year: 2025
title: 'Directional Sheaf Hypergraph Networks: Unifying Learning on Directed and Undirected Hypergraphs'
eprint: '2510.04727'
eprinttype: arxiv
---

## Directional Sheaf Hypergraph Networks (2025)

arxiv:2510.04727 (October 2025).

## Why this matters

Unifies Laplacianizations of *directed* and *undirected* hypergraphs in one sheaf-network framework. The unification is structural: a directed hypergraph and an undirected hypergraph appear as special cases of one cellular-sheaf-on-symmetric-simplicial-set construction, with the directionality encoded in the restriction maps.

For laplacianizers: this is one more instance of the **categorical-lift template** (`theorems/categorical-lift-fixes-obstruction.md`). Take a category $\mathcal C$ where Laplacianization fails (directed hypergraphs lack a self-adjoint Laplacian directly; undirected hypergraphs need an orientation choice); lift to a richer $\widetilde{\mathcal C}$ (sheaves on a symmetric simplicial set) where Laplacianization is functorial; verify the lift recovers the original cases.

The 2025 corpus now contains *four* instances of the categorical-lift template (hypergraphs, signed graphs, directed hypergraphs, time-reversal-violating quantum graphs). The pattern is robust enough to warrant a refined statement of the categorical-lift conjecture.

## Bridges

- To `theorems/categorical-lift-fixes-obstruction.md` — fourth verified instance.
- To `references/hypergraph-neural-sheaf-diffusion-2025.md` — same construction line, undirected case.
- To `objects/symmetric-simplicial-set.md` — the lift category.
