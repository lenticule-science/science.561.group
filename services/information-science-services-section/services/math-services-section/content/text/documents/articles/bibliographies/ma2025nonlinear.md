---
type: bibliography
key: ma2025nonlinear
reference-type: article
authors:
- Ma, Yinghan
- Kunisky, Dmitriy
year: 2025
title: 'Nonlinear Laplacians: Tunable principal component analysis under directional prior information'
eprint: '2505.12528'
eprinttype: arxiv
---

# Nonlinear Laplacians: Tunable PCA (2025)

arxiv:2505.12528 (May 2025).

## Why this matters

Names "nonlinear Laplacians" explicitly as a **parametrized family** of operators, designed for tunable PCA with directional priors. The paper takes the linear graph Laplacian and replaces it with a class indexed by a tunable nonlinearity, showing that the resulting operators have spectral behaviour that interpolates between linear and saturating regimes.

Two program-relevant signals:

1. The construction is *parametric* in shape — there is no single "nonlinear Laplacian" but a family — which lines up with the moduli-of-Laplacianizations view raised by [Bayesian sheaf neural networks](./gillespie2025bayesian.md). Different communities are independently arriving at the same observation: there is no canonical Laplacian on a structure; there is a *space* of them.
2. The cs.LG framing (PCA, prior information) matters because it pulls Laplacianizability into a context where the *applied* utility of the construction is the criterion. If the right Laplacianization is whichever one solves the downstream problem, the universal-property question gets a probabilistic / decision-theoretic answer rather than a categorical one.

## Bridges

- To [Bayesian sheaf neural networks](./gillespie2025bayesian.md) — co-evidence for the moduli view.
- To [laplacianizability](../../../glossary/terms/laplacianizability.md) — argues for parametric form.
