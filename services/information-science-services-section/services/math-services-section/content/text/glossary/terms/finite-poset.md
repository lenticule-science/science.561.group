---
term-kind: object
class: category
symbol: P
status: draft
realizes:
- laplacianizability
see-also:
- hypergraph
- symmetric-simplicial-set
- cellular-sheaf
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
- key: wei2023persistent
  type: article
  authors:
  - Wei, Jian
  - Wei, Guo-Wei
  year: 2023
  title: Persistent Topological Laplacians -- a Survey
  eprint: '2312.07563'
  eprinttype: arxiv
- key: wolf2025generalized
  type: article
  authors:
  - Wolf, Roman
  - Fan, Jiahui
  - Monod, Anthea
  year: 2025
  title: Generalized Persistent Laplacians and their Spectral Properties
  eprint: '2509.20220'
  eprinttype: arxiv
---

# Finite poset

A finite partially ordered set $P = (X, \le)$, treated here as the input category for one of the most *unifying* Laplacianization constructions in the 2025 literature.

## Why finite posets are first-class for the framework

Three pieces of evidence place finite posets at the centre of the survey:

1. **Sheaves on finite posets subsume cellular sheaves and hypergraph Laplacians.** @ayzenberg2025sheaf ([@ayzenberg2025sheaf]) develops sheaf Laplacians on arbitrary finite posets and shows that the hypergraph Laplacian is an instance. The face poset of a CW complex is a particularly nice case (cellular sheaves), but the construction does not need cell structure at all.
2. **Hypergraphs lift to symmetric simplicial sets, which in turn live as functors on a poset.** The chain of categorical lifts (hypergraph ⇒ symmetric simplicial set ⇒ functor on a face-poset analogue) puts the poset at the bottom of the stack.
3. **Persistence modules are functors $P \to \mathbf{Vect}$.** A persistence module is exactly a poset-indexed family of vector spaces with structure maps; persistent Laplacian theory ([@wei2023persistent], [@wolf2025generalized]) is therefore a Laplacian theory for $P$-shaped diagrams.

Three independent communities (combinatorial topology, hypergraph spectral theory, topological data analysis) converge on the finite poset as the right input.

## What structural data the Laplacianization consumes

For a finite poset $P$, a sheaf-Laplacian construction needs:

- a sheaf $\mathcal F: P \to \mathbf{Vec}$ (or richer) over $P$;
- a Hilbert structure on each stalk $\mathcal F(p)$;
- the resulting cellular cochain complex with codifferentials computed from $\mathcal F$'s restriction maps.

The Laplacian is then $\Delta = \delta\delta^* + \delta^*\delta$ on the resulting graded Hilbert space. The choice of sheaf and stalk pairing is the **degree of freedom** of the Laplacianization functor restricted to posets.

## Open

Whether the cellular-sheaf-on-poset construction is *cofinal* among Laplacianizations of finite combinatorial structures — i.e., whether every Laplacianizer on a category of finite combinatorial inputs factors through a sheaf on a poset ([cellular-sheaf-cofinality](../../documents/articles/research-articles/cellular-sheaf-cofinality.md)). @ayzenberg2025sheaf strongly suggests yes; a clean categorical proof is open.
