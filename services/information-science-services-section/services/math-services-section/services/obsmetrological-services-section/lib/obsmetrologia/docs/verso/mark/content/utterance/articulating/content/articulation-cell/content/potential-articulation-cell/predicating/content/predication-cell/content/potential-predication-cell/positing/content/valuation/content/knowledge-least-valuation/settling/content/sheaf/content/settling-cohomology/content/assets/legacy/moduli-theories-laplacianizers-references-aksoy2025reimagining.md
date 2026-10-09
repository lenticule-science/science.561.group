---
type: reference
key: aksoy2025reimagining
class: article
- Aksoy, Sinan G.
- Young, Stephen J.
year: 2025
title: Re-imagining Spectral Graph Theory
eprint: '2504.10624'
eprinttype: arxiv
---

## Young 2025 — Re-imagining Spectral Graph Theory (the inner product Laplacian)

arxiv:2504.10624 (April 2025).

## Why this is central to laplacianizers

This paper is the strongest empirical evidence so far that the parametric / moduli view of Laplacianization is independently emerging in the 2025 literature. Young defines the **inner product Laplacian** explicitly as a *parameterized family*:

> "We propose a Laplacian based on general inner product spaces, which we call the inner product Laplacian."

The inputs are: (1) graph structure (vertices and edges), and (2) inner product spaces on vertices and edges, specified via positive-definite matrices. This is precisely the data of a Hilbert lift of cellular cohomology in laplacianizers' sense (`concepts/laplacianizability.md`), with the inner products being coordinates on the moduli $\mathcal H$.

**Crucially**, the paper does *not* treat the inner products as auxiliary or aesthetic; it proves uniform theorems across the parameter space:

- A generalized Cheeger inequality holding for every inner product Laplacian.
- An expander mixing lemma that is uniform in the parameters.
- Standard combinatorial, normalized, hypergraph, and directed-graph Laplacians appear as **special cases** (i.e., specific points in the moduli of inner product Laplacians).
- Dirichlet and Neumann subgraph eigenvalues are recovered as **limit points of sequences** of inner product Laplacians — explicitly using the topology of the moduli.

The framework uses "conformality" — alignment of inner product spaces with a chosen basis — rather than orthogonality, which is precisely the *partial gauge* the moduli theorem (`theorems/moduli-of-laplacianizations.md`) makes visible: choosing a basis is not the same as choosing an inner product, and the difference is moduli structure.

## Subsumption pattern

The paper makes the unification claim explicit:

> "a formalization of how inner product Laplacian generalizes existing Laplacians, such as normalized and combinatorial Laplacian, as well as a host of Laplacians for hypergraphs and directed graphs"

Read in laplacianizers' framework: Young is constructing the moduli of cellular-sheaf Hilbert lifts on a graph (with sheaf data being the per-edge / per-vertex Hilbert spaces) and proving that the resulting Laplacian family contains all the named graph Laplacians. This is the cellular-sheaf-cofinality picture (`theorems/cellular-sheaf-cofinality.md`) made *constructively explicit* for graphs.

## Where this sits in laplacianizers' classification

- For Laplacianizability of $(\mathbf{Graph}, H^\bullet)$: the inner product Laplacian is **the** Hilbert lift functor. Modulo gauge, every named graph/hypergraph/directed-graph Laplacian is one of its values.
- For the universal-property / stratified-moduli question: Young's framework treats the moduli as a parameter space without (visibly) examining its strata — the orbifold structure is implicit. The next step laplacianizers would want is a stratification analysis: which special inner products produce the named cases, and how do the strata sit in the moduli? (See `examples/gauge-fiber-structure.md` for the analog on $\partial \Delta^3$.)

## Bridges

- To `concepts/laplacianizability.md` — the Hilbert-lift definition, with concrete realization for graphs.
- To `theorems/cellular-sheaf-cofinality.md` — Young's construction is a verification of cofinality for the graph case.
- To `theorems/moduli-of-laplacianizations.md` — Young's "inner product space" data are coordinates on $\mathcal H_{\mathrm{cell}}$.
- To `examples/cellular-sheaf-on-tetrahedron-boundary.md` — the same parametric structure, computed concretely.
