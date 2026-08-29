---
type: question
status: open
explores:
- laplacianizability
- hilbert-degeneracy-stratification
references:
- key: choi2024cellular
  type: article
  authors:
  - Choi, Eunho
  - Park, Hee Rhang
  year: 2024
  title: Cellular sheaf Laplacians on the set of simplices of symmetric simplicial set induced by hypergraph
  eprint: '2411.08458'
  eprinttype: arxiv
- key: barrett2017inverse
  type: article
  authors:
  - Barrett, Wayne
  - Butler, Steve
  - Fallat, Shaun
  - Hall, H. Tracy
  - Hogben, Leslie
  - Lin, Jephian C.-H.
  - Shader, Bryan
  - Young, Michael
  year: 2017
  title: 'The inverse eigenvalue problem of a graph: Multiplicities and minors'
  eprint: '1708.00064'
  eprinttype: arxiv
---

# What is the obstruction to Laplacianization?

If Laplacianizability is a real property of pairs $(\mathcal C, H^\bullet)$, it has a negation. Which pairs admit no Laplacianizer? And — when a Laplacianizer exists — what features of the data control its singular structure?

## Concrete obstructions identified so far

- **Failure of $d^2 = 0$.** The Laplacianizer requires the chain differential to satisfy $d^2 = 0$. Structures whose natural "boundary-like" map doesn't square to zero need to be lifted to a richer category before Laplacianization is possible. The hypergraph case ([hypergraph](../../../../glossary/terms/hypergraph.md), [@choi2024cellular]) is the canonical example: a hypergraph's boundary is sign-ambiguous, and the natural lift is to symmetric simplicial sets where the differential genuinely squares to zero.

- **No natural pairing.** Categories whose objects don't carry a canonical inner product structure on their cochains. The choice of pairing is the first piece of "Hilbert" data; without it, there's no Laplacianizer. Often there *is* a pairing, but only after enriching the input with extra structure (per-cell weights, per-edge metrics, etc.).

- **Closed-range failure.** For infinite-dimensional cases, the boundary operator $d_n$ may fail to have closed range, breaking the Hodge isomorphism between $\ker \Delta$ and cohomology ([closed-range-obstruction](../closed-range-obstruction.md)). This is a technical obstruction in the analytic setting.

- **Non-self-dual structures.** Directed graphs, directed hypergraphs, time-reversal-violating quantum graphs — cases where the Laplacian construction produces a non-self-adjoint operator. The "Hilbert lift" framework requires self-adjoint $\Delta = dd^* + d^*d$, so these cases need either symmetrization (information loss) or an enlargement to sectorial operators (categorical lift template, [categorical-lift-fixes-obstruction](../categorical-lift-fixes-obstruction.md)).

## Refined: obstructions visible in the dual-stratification framework

The dual-stratification observation ([hilbert-degeneracy-stratification](../hilbert-degeneracy-stratification.md)) suggests a more refined obstruction question:

- **Stratum-realizability.** Given a chain complex and a candidate bipartite multipartition $\Pi$, when does the corresponding stratum $V(\Pi)$ in $\mathcal M_{\mathrm{Lap}}$ have a non-empty SPD interior? Equivalently: which bipartite multipartitions are realized by *positive-definite* Hilbert structures, and which only at the SPD boundary (Stratification II)?

This is the **chain-complex generalization of IEP-G's realizability question** ([@barrett2017inverse]): given a graph-pattern, which multiplicity partitions are realized by symmetric matrices with that pattern? Our generalization: given a chain complex, which bipartite multipartitions are realized by *Hilbert structures* (i.e., in the SPD interior)?

If a multipartition is *not* realizable in the SPD interior — only on the boundary — that's a refined sense in which the corresponding Laplacian "fails to exist" for that chain complex. It's a structural obstruction, computable in principle, generalizing IEP-G.

## Open

A clean obstruction theorem in the dual-stratification framework would say:

> For a finite-dim chain complex $(C_\bullet, d)$ and a bipartite multipartition $\Pi$, $\mathrm{Stratum}(\Pi)$ has non-empty SPD interior in $\mathcal M_{\mathrm{Lap}}$ iff [structural condition on $\Pi$ and the chain complex's rank profile / dimensions].

Working this out concretely on small cases ($\partial \Delta^2$, $\partial \Delta^3$, the (2,1) chain) is feasible by hand and would generalize Barrett–Fallat-style realizability theorems to the bipartite case.
