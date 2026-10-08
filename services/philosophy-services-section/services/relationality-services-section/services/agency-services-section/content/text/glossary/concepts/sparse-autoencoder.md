---
type: concept
class: contemporary
status: active
depends-on:
  - feature.md
  - superposition.md
see-also:
  - ../objects/sparse-feature.md
  - ../morphisms/feature-extraction.md
  - ../theorems/sae-reconstruction-faithfulness-tradeoff.md
  - teaching/explanations/the-sae-revolution.md
references:
  - references/bricken-monosemanticity2023.md
  - references/cunningham-sae2023.md
  - references/templeton-scaling-mono2024.md
title: Sparse autoencoder
description: A sparse autoencoder (SAE) is an overcomplete dictionary- learning method that decomposes a layer's activations into a sum of sparse feature activations, with the goal of recovering the features that the network has stored in superposition.
---

# Sparse autoencoder

A **sparse autoencoder** (SAE) is an overcomplete dictionary-
learning method that decomposes a layer's activations into
a sum of *sparse* feature activations, with the goal of
recovering the [features](feature.md) that the network has
stored in [superposition](superposition.md).

## Architecture

Given an activation vector $\mathbf{x} \in \mathbb{R}^d$
from some layer of a target network, the SAE has:

- An **encoder** $E: \mathbb{R}^d \to \mathbb{R}^m$ with
  $m \gg d$ (overcomplete) producing latent codes
  $\mathbf{z} = E(\mathbf{x})$.
- A **decoder** $D: \mathbb{R}^m \to \mathbb{R}^d$ producing
  reconstruction $\hat{\mathbf{x}} = D(\mathbf{z})$.

The training objective is reconstruction loss
$\|\mathbf{x} - \hat{\mathbf{x}}\|^2$ plus a sparsity
penalty (typically $\ell_1$ on $\mathbf{z}$, or top-$k$
hard-thresholding) that forces most components of
$\mathbf{z}$ to be zero on most inputs.

The columns of $D$ are the *dictionary directions*; each is
hypothesized to correspond to a single feature in the target
network's representation.

## Why it works (the hypothesis)

If features are stored in superposition (more features than
dimensions, sparsely activated), then:

- The *true* feature directions are non-orthogonal.
- Any single input activates only a few features.
- An overcomplete dictionary trained with sparsity can
  recover those true directions, given enough data and
  capacity.

The SAE recovers monosemantic features by *expanding* the
basis (more dictionary directions than activation
dimensions) and *constraining* each input to use few
directions (sparsity).

## Empirical findings

- **Bricken et al. 2023** (Anthropic) trained SAEs on a one-
  layer transformer and recovered thousands of monosemantic
  features — the first large-scale demonstration.
- **Cunningham et al. 2023** (concurrent) showed similar
  recovery on language models.
- **Templeton et al. 2024** (Anthropic) scaled to Claude
  Sonnet, recovering tens of millions of features including
  abstract concepts (the "Golden Gate Bridge feature,"
  "deception feature").
- **Marks et al. 2024** showed SAE features can be combined
  into circuit-level explanations.

## What SAEs deliver

- A *feature vocabulary* with thousands-to-millions of
  candidate features per layer.
- Each feature with associated *activating examples* and
  *direct effects* on output (via patching).
- Some features are interpretable; others are not; the
  fraction varies by layer, model, and SAE configuration.

## What SAEs don't deliver

- **Reconstruction is lossy.** SAEs do not perfectly
  reconstruct the original activation; the residual matters
  for downstream computation. See
  [sae-reconstruction-faithfulness-tradeoff](../../documents/articles/notes/undated/sae-reconstruction-faithfulness-tradeoff.md).
- **Many features are uninterpretable.** A nontrivial
  fraction of recovered features defy human description.
  Whether they correspond to real-but-alien features or to
  SAE artifacts is debated.
- **Computation is not explained.** SAEs decompose
  *representations* into features. They do not explain how
  features are *combined* by attention and MLP layers into
  downstream features.
- **Cross-layer alignment.** Features in different layers
  recovered by different SAEs are not automatically aligned;
  building circuit-level explanations across layers requires
  additional alignment work.

## Variants

- **JumpReLU SAE** — uses a hard-threshold activation
  function, improving sparsity-faithfulness tradeoff.
- **Top-$k$ SAE** — selects the $k$ largest activations
  per input, exact sparsity bound.
- **Gated SAE** — separates the gating decision from the
  magnitude estimation.
- **Transcoder** — generalizes the SAE to map across layers,
  recovering features that span multiple layers.

The architectural literature is rapidly evolving; the field
has not converged on a canonical SAE design.

## Status

SAEs are the dominant feature-decomposition method in
contemporary mechanistic interpretability. They have produced
the strongest empirical evidence for the superposition
hypothesis and have generated the largest catalog of
identified features in any model. Whether they will scale to
fully decompose frontier models, and whether their features
faithfully represent the network's actual computation, are
open questions. See
[the-sae-revolution](../../documents/articles/notes/undated/the-sae-revolution.md).
