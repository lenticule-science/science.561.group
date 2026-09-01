---
type: reference
key: choi2025hypergraph
class: article
authors:
- Choi, Seonghyun
- Kim, Junhyeok
- Oh, Sangwoo
year: 2025
title: 'Hypergraph Neural Sheaf Diffusion: A Symmetric Simplicial Set Framework for Higher-Order Learning'
eprint: '2505.05702'
eprinttype: arxiv
---

# Hypergraph Neural Sheaf Diffusion (2025)

arxiv:2505.05702 (cs.LG, May 2025).

## Why this matters

The first principled extension of Neural Sheaf Diffusion to hypergraphs, operating via **normalized degree-zero sheaf Laplacians over symmetric simplicial sets**. Three program-relevant signals at once:

1. The **same input category** as the late-2024 paper (arxiv:2411.08458) — symmetric simplicial sets — is being adopted on the cs.LG side as the right home for higher-order learning. Two communities converging on one input category is unusual and supports the categorical (Laplacianizer) framing.
2. The **degree-zero sheaf Laplacian** is doing the work, with the higher-degree pieces unused. This is a uniformity claim (the bottom of the graded family is enough for the application) that complements arxiv:2505.23993, where the bottom recovers an old operator and the higher pieces add information. The pattern is: the graded chain complex is the primary object, and applications consume it at varying depth.
3. **Resolving orientation ambiguity** is explicit. Orientation is one of the failure modes for "Laplacianization of hypergraphs" — the symmetric-simplicial-set lift is in part a structural fix for that failure.

## Bridges

- To `objects/symmetric-simplicial-set.md` (future) — co-anchor with arxiv:2411.08458.
- To `concepts/laplacianizability.md` — supports the Laplacianizer framing.
- To `questions/obstruction-to-laplacianization.md` — orientation-ambiguity is one specific obstruction the literature is *fixing* by lifting the input category.
