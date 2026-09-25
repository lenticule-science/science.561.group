---
term-kind: object
class: combinatorial-structure
symbol: H
status: draft
realizes:
- laplacianizability
see-also:
- finite-poset
- symmetric-simplicial-set
- cellular-sheaf
references:
- key: andreotti2025generalizing
  type: article
  authors:
  - Andreotti, Eleonora
  year: 2025
  title: 'Generalizing Lattice Structures to Hypergraphs: Spectra of Clique and Hyperedge-based Laplacians'
  eprint: '2511.11138'
  eprinttype: arxiv
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
- key: mugnolo2025heat
  type: article
  authors:
  - Mugnolo, Delio
  year: 2025
  title: Non-Markovian heat flows on directed hypergraphs
  eprint: '2510.17497'
  eprinttype: arxiv
---

# Hypergraph

A hypergraph $H = (V, E)$ is a set $V$ together with a collection $E$ of subsets of $V$ ("hyperedges"). Hypergraphs are the most-Laplacianized structure in the 2025 literature, with multiple non-equivalent constructions in active use.

## The hypergraph Laplacian forks

At least three fundamentally different "hypergraph Laplacians" are in 2025 use:

- **Clique Laplacian** ([@andreotti2025generalizing]): replace each hyperedge by its clique on the underlying graph, then take the graph Laplacian.
- **Hyperedge-incidence Laplacian** (same reference): a normalized incidence operator that does not reduce hyperedges to pairwise edges.
- **Sheaf-on-poset Laplacian** ([@ayzenberg2025sheaf]): treat the hypergraph as data on a poset of hyperedges and inclusions, take the resulting sheaf Laplacian.
- **Symmetric-simplicial-set Laplacian** ([@choi2024cellular], [@choi2025hypergraph]): lift the hypergraph to a symmetric simplicial set, take the cellular sheaf Laplacian there.
- **Directed-hypergraph (heat-flow) Laplacian** ([@mugnolo2025heat]): for hypergraphs with directed hyperedges, a non-self-adjoint operator generating a heat-style semigroup.

The plurality is *the* uniqueness data for the framework. Hypergraphs are the test bed for "is there a canonical Laplacianization, or merely a family?"

## Why hypergraphs matter beyond their own subfield

Two of the most ambitious 2025 unification papers — Ayzenberg–Magai (sheaves on posets) and the symmetric-simplicial-set framework — *use the hypergraph case as a benchmark* for whether their generalization captures known constructions correctly. The hypergraph Laplacian is therefore a stress test that any candidate definition of Laplacianizability must pass: a well-posed framework either (a) singles out one of the existing constructions as canonical, (b) classifies the choices, or (c) provides a moduli of Laplacianizations — and Hypergraphs are where these alternatives are concretely visible.

## Open

The fork between clique- and hyperedge-incidence Laplacians is *not* obviously a moduli direction: they recover different invariants. A clean structural account of why the choice exists, and what fixes it, is open.
