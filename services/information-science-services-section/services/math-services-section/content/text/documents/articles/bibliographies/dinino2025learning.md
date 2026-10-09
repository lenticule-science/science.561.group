---
type: bibliography
key: dinino2025learning
reference-type: article
authors:
- Di Nino, Andrea
- Barbarossa, Sergio
- Di Lorenzo, Paolo
year: 2025
title: Learning Sheaf Laplacian Optimizing Restriction Maps
eprint: '2501.19207'
eprinttype: arxiv
description: "The paper poses the moduli of sheaf Laplacians as an optimization domain: given data observed at vertices, find the sheaf Laplacian — i.e., choose the restriction maps (and implicitly the stalkwise inner products) — that minimizes the…"
---

# Learning Sheaf Laplacian (2025)

arxiv:2501.19207 (January 2025).

## Why this matters for the framework

The paper poses the **moduli of sheaf Laplacians as an optimization domain**: given data observed at vertices, find the sheaf Laplacian — i.e., choose the restriction maps (and implicitly the stalkwise inner products) — that minimizes the total variation of the data over the resulting graph.

This operationalizes the framework's moduli view: one explicitly searches a parameterized space of Laplacians for a "best" one according to a data-driven criterion. The construction parallels [Bayesian sheaf neural networks](./gillespie2025bayesian.md), but in a frequentist optimization framing.

## What it adds

- **Closed-form solution**: the optimization is solved analytically (not via SDP, which is the alternative). This means the moduli of sheaf Laplacians has, for this objective, an explicit critical-point structure that is computable.
- **Confirmation that the moduli is the right object of study**: by formulating data fitting as a search over sheaf Laplacians (rather than fixing a single Laplacian and asking which data fit it), the paper takes the parametric view as primary.

## Bridges

- To [moduli-of-laplacianizations](../research-articles/moduli-of-laplacianizations.md) — Bayesian/learning approaches to navigating the moduli.
- To [Bayesian sheaf neural networks](./gillespie2025bayesian.md) — co-evidence that the moduli, not any single Laplacian, is the working object.
- To [cellular-sheaf-on-tetrahedron-boundary](../teaching-articles/examples/cellular-sheaf-on-tetrahedron-boundary/cellular-sheaf-on-tetrahedron-boundary.md) — the moduli the paper learns over, in concrete form.

## Caveat for the cofinality conjecture

The closed-form optimum is a *single* Laplacian (the minimizer). The moduli is therefore being used as a search space, not as an object of study in itself — there is no analysis of strata, gauge fibers, or critical-point landscape. the framework's contribution is to argue these structures are the next thing to study; the paper provides the moduli's existence and computability, but not its geometry.
