---
name: Scaling Laws
description: Scaling laws are the empirical power-law relationships, first reported by Kaplan et al. (2020) as an unreviewed arXiv preprint and revised toward a different compute allocation by Hoffmann et al.'s peer-reviewed Chinchilla paper (NeurIPS 2022), between a language model's test loss and its parameter count, training-data size, and training compute.
date-created: 2026-08-22
aliases: [neural scaling laws, compute-optimal scaling, Chinchilla scaling laws]
instance-of: research-finding
---

Scaling laws describe how a language model's cross-entropy loss falls off as a smooth power-law function of three quantities — model parameter count, training-dataset size, and training compute — across many orders of magnitude, with other architectural choices (width, depth) mattering comparatively little within a wide range.
The finding was established in [Kaplan et al., "Scaling Laws for Neural Language Models" (2020)](https://arxiv.org/abs/2001.08361), which remains, as far as this library has verified, an arXiv preprint never accepted at a peer-reviewed venue — a tier fact worth stating explicitly given how load-bearing the paper became for training-budget decisions across the field.

Kaplan et al.'s original allocation favored scaling parameter count over data size.
[Hoffmann et al., "Training Compute-Optimal Large Language Models" (NeurIPS 2022)](https://arxiv.org/abs/2203.15556) — the Chinchilla paper — revised this, arguing that most contemporary models were undertrained relative to their size, and that compute-optimal training splits growth roughly evenly between parameters and tokens.
Unlike Kaplan et al., the Chinchilla paper is peer-reviewed, confirmed in the [NeurIPS 2022 proceedings](https://proceedings.neurips.cc/paper_files/paper/2022/hash/c1e2faff6f588870935f114ebe04a3e5-Abstract-Conference.html).

Both papers are treated here as scaling laws in the plural sense — an unreviewed founding claim and a peer-reviewed revision of its specific allocation — rather than as a single settled result; see the [study of foundation-model science](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-foundation-model-science.md) for the fuller tier discussion and its place beside in-context learning, emergent abilities, and the RLHF lineage.
