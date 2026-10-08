---
type: theorem
class: contemporary
status: empirical
depends-on:
  - teaching/explanations/sparse-autoencoder.md
  - ../morphisms/feature-extraction.md
see-also:
  - attribution-faithfulness-bound.md
references:
  - references/bricken-monosemanticity2023.md
  - references/templeton-scaling-mono2024.md
title: SAE reconstruction-faithfulness tradeoff
description: "Sparse-autoencoder feature dictionaries trade off three quality axes that cannot all be simultaneously maximized at fixed compute and dimension:"
---

# SAE reconstruction-faithfulness tradeoff

## Statement (empirical)

Sparse-autoencoder feature dictionaries trade off three
quality axes that cannot all be simultaneously maximized at
fixed compute and dimension:

- **Reconstruction accuracy.** How well the SAE
  reconstructs the original activation
  ($\|\mathbf{x} - \hat{\mathbf{x}}\|^2$).
- **Sparsity.** How few features are active per input.
- **Monosemanticity.** How interpretable individual
  features are.

Improving any one of these typically degrades at least one of
the others. The tradeoff defines a Pareto frontier on which
practitioners must choose a point.

## The tradeoffs

- **Reconstruction ↔ sparsity.** Lower sparsity (more
  features active per input) gives better reconstruction; the
  SAE has more degrees of freedom to fit. Higher sparsity
  forces the SAE to reconstruct from fewer features,
  increasing reconstruction error.
- **Sparsity ↔ monosemanticity.** Tighter sparsity penalty
  forces each input to use few features; surviving features
  tend to be more monosemantic but the dictionary may not
  capture rare features.
- **Reconstruction ↔ monosemanticity.** Allowing better
  reconstruction by relaxing sparsity often produces
  *splits* (the same concept across multiple slightly-
  different dictionary directions) and *composites*
  (multiple concepts in single directions) that hurt
  monosemanticity.

## Why this is a problem

A faithful explanation of the network's behavior requires
all three:

- **Reconstruction faithfulness** so that the SAE features
  capture what the network actually represents (not just a
  cherry-picked subset).
- **Sparsity** so that individual features have meaning
  (a non-sparse decomposition is just a basis change).
- **Monosemanticity** so that individual features can be
  interpreted as concepts.

A point on the Pareto frontier sacrifices one axis. Common
choices:

- **High-monosemanticity SAEs** (top-$k$ at small $k$):
  good for catalog-building, poor for full-network
  reconstruction.
- **High-reconstruction SAEs** (large $k$ or relaxed
  sparsity): good for downstream uses requiring faithful
  decomposition, poor for individual feature interpretation.

## Quantitative form

Empirically (Bricken 2023, Templeton 2024, others), the
relationship across configurations is roughly:

- Per-feature monosemanticity declines with feature count
  beyond a threshold (more features → more splits and
  composites).
- Reconstruction error declines with feature count and
  capacity (slowly, with diminishing returns).
- Sparsity is approximately fixed by the training penalty.

The exact numbers depend on the SAE architecture (vanilla,
top-$k$, JumpReLU, gated), the target network, and the
training data.

## Why this is "empirical" not "proved"

The tradeoff is observed in every published SAE study but
has no formal proof. A general theorem would have to specify:

- The SAE architecture.
- The target network's true feature distribution.
- The metric for monosemanticity.
- The notion of "fixed compute."

In the absence of these specifications, the result is a
robust empirical pattern guiding architectural choices.

## Implications for the interpretability program

- **No "the" feature dictionary.** Different SAE
  configurations yield different feature catalogs; comparing
  results requires matched configurations.
- **Multi-SAE pipelines.** Some workflows train multiple
  SAEs at different sparsity levels and combine them.
- **Cross-validation.** Features that appear stably across
  configurations are higher-confidence than features only
  visible at one point on the frontier.
- **Reconstruction matters.** A "100% monosemantic"
  dictionary that explains 30% of the variance leaves the
  network's actual computation largely unexplained.

## Status

Robust empirical observation across all major SAE work.
The tradeoff is the binding constraint on SAE-based
interpretability, and the central design problem in the
ongoing SAE methodological evolution.
