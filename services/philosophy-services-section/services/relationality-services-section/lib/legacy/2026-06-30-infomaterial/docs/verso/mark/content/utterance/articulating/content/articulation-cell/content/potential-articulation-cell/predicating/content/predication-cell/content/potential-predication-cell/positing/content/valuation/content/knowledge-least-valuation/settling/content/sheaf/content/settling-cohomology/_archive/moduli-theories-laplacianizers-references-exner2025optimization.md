---
type: reference
key: exner2025optimization
class: article
authors:
- Exner, Pavel
- Rohleder, Jonathan
year: 2025
title: Optimization of quantum graph eigenvalues with preferred orientation vertex conditions
eprint: '2410.21820'
eprinttype: arxiv
---

# Quantum graph Laplacian eigenvalue optimization (2025)

arxiv:2410.21820 (last revised 2025).

## Why this matters

Treats the **Laplacian on edges of a metric graph with vertex couplings violating time-reversal invariance**, and optimizes ground-state eigenvalues over edge-length configurations. The metric-graph Laplacian is one of the cleanest "structurally enriched graph Laplacian" cases: the input is a graph + a metric on edges + vertex coupling data, and the operator is a genuine differential operator on a 1-complex.

For laplacianizers: the *vertex coupling* data is exactly the kind of choice the Laplacianization functor would have to consume. Time-reversal-violating couplings break the standard self-adjointness machinery and force a more careful operator-theoretic setup, paralleling the directed-hypergraph case (`references/directed-hypergraph-laplacian-heat-2025.md`).

## Bridges

- To `concepts/laplacianizability.md` — the parametric / structural-data view.
- To `objects/metric-graph.md` (future).
- To `questions/obstruction-to-laplacianization.md` — time-reversal violation as a non-self-duality obstruction the construction *survives* by enlarging the operator class.
