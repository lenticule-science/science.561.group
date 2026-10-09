---
type: reference
key: gillespie2025bayesian
class: article
- Gillespie, Patrick
- Hamdan, Vasileios
- Schizas, Ioannis
- Boothe, Daniel
- Maroulas, Vasileios
year: 2025
title: Bayesian Sheaf Neural Networks
eprint: '2410.09590'
eprinttype: arxiv
---

arxiv:2410.09590 (cs.LG, last revised 2025).

## Why this matters

Treats the **sheaf restriction maps as random variables** and learns the cellular sheaf variationally. Program-relevant because it makes the choice-of-Hilbert-structure point even sharper than the weighted-simplicial-complex paper does: here the inner-product / restriction data is not just chosen but *inferred*, with a posterior distribution over Laplacianizations.

This frames Laplacianization in the survey as a *parameter* rather than a fixed datum, and pushes toward a moduli-theoretic view: for a given input structure, the space of compatible Laplacianizations is itself an object worth studying. That perspective should shape `objects/` entries — input categories may want to come with a moduli of Laplacianizations.

## Bridges

- To `concepts/laplacianizability.md` — the moduli view; Laplacianizer with structure-on-the-functor.
- To `questions/universal-laplacianization.md` — a posterior distribution is, in some sense, an answer to the uniqueness question (no canonical choice; there is a measure on the choices).
