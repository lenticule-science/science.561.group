---
type: conjecture
status: sketch
depends-on:
- laplacianizability
- hodge-laplacian
- finite-poset
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
- key: choi2024cellular
  type: article
  authors:
  - Choi, Eunho
  - Park, Hee Rhang
  year: 2024
  title: Cellular sheaf Laplacians on the set of simplices of symmetric simplicial set induced by hypergraph
  eprint: '2411.08458'
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
- key: sumray2024quiver
  type: article
  authors:
  - Sumray, Alex
  - Harrington, Heather A.
  - Nanda, Vidit
  year: 2024
  title: Quiver Laplacians and Feature Selection
  eprint: '2404.06993'
  eprinttype: arxiv
---

# Cellular-sheaf cofinality (precise conjecture)

## Statement

Let $\mathcal C$ be a small category and $H^\bullet: \mathcal C \to \mathbf{grVect}_\mathbb{R}^{\le \omega}$ a graded-vector-space-valued cohomology theory landing in countable-dimension graded vector spaces. Suppose $(\mathcal C, H^\bullet)$ admits a Hilbert lift $F: \mathcal C \to \mathbf{Ch}_b(\mathbf{Hilb}_\mathbb{R})$ in the sense of [laplacianizability](../../../glossary/terms/laplacianizability.md).

> **Conjecture.** There exists a functor $P: \mathcal C \to \mathbf{Pos}_{\mathrm{fin}}$ to finite posets and a natural transformation realizing $F$ as the sheaf-cochain functor of a Hilbert-valued sheaf $\mathcal F_X$ on $P(X)$ for each $X \in \mathcal C$:
> $$F(X) \;\;\cong\;\; C^\bullet(P(X), \mathcal F_X), \qquad \mathcal F_X: P(X) \to \mathbf{Hilb}_\mathbb{R}.$$
> The natural-transformation data is functorial: morphisms $X \to Y$ in $\mathcal C$ induce poset maps $P(X) \to P(Y)$ and compatible sheaf morphisms.

In words: every Hilbert lift of a cohomology theory on a category of finite combinatorial structures factors through a "sheaf on a poset" presentation.

## Why this is a real conjecture

It is not a tautology. Every chain complex can be presented as a cellular cochain complex of *some* sheaf on *some* poset (take $P = \{0 < 1 < \cdots < N\}$ with $\mathcal F(k) = C^k$); the content is that this can be done **functorially in $X$** with $P(X)$ depending only on $X$ (not on the lift), and that the sheaf $\mathcal F_X$ has interpretable stalks (e.g., reflecting "local" data of $X$).

The conjecture has been proved in cases:

- $\mathcal C = $ regular CW complexes, $H^\bullet = $ cellular cohomology with fixed-rank local coefficients: trivially true with $P(X) = $ face poset of $X$ — Hansen–Ghrist.
- $\mathcal C = $ hypergraphs, $H^\bullet = $ several candidate cohomology theories: @ayzenberg2025sheaf constructs $P(X)$ as the inclusion poset of hyperedges and verifies the conjecture ([@ayzenberg2025sheaf]).
- $\mathcal C = $ symmetric simplicial sets: [@choi2024cellular].

Open cases include:

- Persistence modules with the standard persistent-homology theory: $P(X)$ should be (some adaptation of) the indexing poset of the filtration. The construction of [@wolf2025generalized] is suggestive but not framed in this language.
- Quivers, when treated as in [@sumray2024quiver]. The natural candidate $P(X)$ would be the path category of the quiver (a small category, not a poset). So either the conjecture extends to small categories, or the quiver case sits outside the conjecture's scope.
- Inputs with non-finite-type cohomology (RCD spaces, non-locally-finite simplicial complexes). Here the conjecture as stated fails immediately; a version with $\mathbf{Pos}$ replaced by $\mathbf{Pos}^{\le \omega}$ (countable posets) is the analogue to investigate.

## What needs to be proved

1. **Functorial $P$.** For a given $\mathcal C$ and Hilbert lift $F$, define the candidate $P(X)$ canonically from $F(X)$ — perhaps as the poset of "supports" of harmonic representatives, or by reverse-engineering chains from the structure of $d^F$. Verify this assignment is functorial.
2. **Sheaf $\mathcal F_X$.** Define $\mathcal F_X(p)$ for $p \in P(X)$ from $F(X)$ data, and show the cellular cochain complex $C^\bullet(P(X), \mathcal F_X)$ recovers $F(X)$ up to canonical iso.
3. **Naturality.** Show the assignments $X \mapsto P(X), \mathcal F_X$ are natural in $X \in \mathcal C$.

## Consequences if proved

The sheaf-on-poset construction would be the universal combinatorial Laplacianization template — every cellular Hilbert lift on combinatorial inputs recoverable from a sheaf-on-poset choice. Every combinatorial 2025 Laplacian (cellular sheaf, hypergraph clique-cohomology, persistence module, quiver Laplacian) factors through a single template.

## What it doesn't say

It does not unify combinatorial Laplacianizations with smooth ones (de Rham, Cheeger). The smooth side requires unbounded operators with closed range, and the natural target category is something like $\mathbf{Ch}_b^{\mathrm{cl.range}}(\mathbf{Hilb})$ or differential graded $C^*$-modules. The combinatorial conjecture above is the right starting point because the finite-dimensional case admits clean statements; the smooth analogue is a separate program.
