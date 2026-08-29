---
type: object
class: contemporary
status: active
depends-on:
  - teaching/explanations/sparse-autoencoder.md
  - teaching/explanations/feature.md
see-also:
  - ../morphisms/feature-extraction.md
references:
  - references/bricken-monosemanticity2023.md
  - references/templeton-scaling-mono2024.md
---

# Sparse feature

A **sparse feature** is a single dictionary direction
extracted by a [sparse-autoencoder](teaching/explanations/sparse-autoencoder.md)
trained on a layer's activations: a vector
$\mathbf{d}_i \in \mathbb{R}^d$ that the SAE has learned
fires sparsely (active on a small fraction of inputs) and
is conjectured to correspond to a single interpretable
concept.

## Structure

Each SAE has $m$ dictionary directions
$\mathbf{d}_1, \ldots, \mathbf{d}_m$ (with $m \gg d$). Each
input activation $\mathbf{x}$ is decomposed as
$\hat{\mathbf{x}} = \sum_i z_i \mathbf{d}_i$ where most $z_i$
are zero. A *sparse feature* is the pair
$(\mathbf{d}_i, z_i(\cdot))$: the direction in activation
space and the function from input to its activation
magnitude.

## Properties

A useful sparse feature has:

- **Sparsity.** Active on a small fraction of inputs
  (typically <1%, often <0.01%).
- **Interpretability.** Activating inputs share a
  recognizable common property.
- **Causal effect.** Modifying the feature's activation
  produces a predictable behavioral change downstream.
- **Stability.** The feature appears in SAEs trained on
  related models or related data subsets, in similar form.

Not all SAE-recovered directions satisfy all four. The
fraction that do is an empirical measure of SAE quality.

## Cataloging

The Anthropic Templeton et al. 2024 paper cataloged tens of
millions of features in a Claude-scale SAE. Features ranged
from concrete (specific named entities, concrete objects,
syntactic constructions) to abstract (deception, sycophancy,
specific reasoning patterns, multilingual concept clusters).

The catalog grew large enough that interpretation became a
bottleneck — most features are *findable* but not yet
*interpreted*. This is the substrate of contemporary
*automated feature interpretation* methods (use a separate
LLM to label features by reading activating examples).

## Atomicity

A central question: is each sparse feature *atomic* — a
single concept that the network treats as a unit — or is it
a composite that further factors? Empirical answer:

- Some features are atomic (the "Golden Gate Bridge feature"
  fires for the bridge and very little else).
- Some features are *near-atomic but with subdimensions*
  (a feature for "deception" decomposes into different
  flavors of deception).
- Some features are *splits* of an underlying concept
  across multiple SAE directions (the same concept
  recovered as several near-duplicate features).
- Some features are *composites* that further decompose at
  higher SAE expansion.

The atomicity question is unresolved and varies feature by
feature. See [do-features-decompose-cleanly](questions/do-features-decompose-cleanly.md).

## Steering with sparse features

Sparse features are usable as steering vectors: adding
$\alpha \mathbf{d}_i$ to a layer's activations during
generation causes the model to produce outputs that exhibit
the feature's concept more (or less, for negative $\alpha$).

The "Golden Gate Claude" demonstration steered Claude to
mention the Golden Gate Bridge in nearly every response by
amplifying the Golden Gate Bridge feature. This validated
both the feature's interpretation and its causal role.

## Limits

- **Reconstruction error.** What the SAE doesn't capture is
  in the residual; downstream computation depends on parts
  the SAE doesn't see.
- **Cross-layer alignment.** Features in different layers
  recovered by different SAEs are not automatically aligned.
- **Layer-dependence.** A concept may have different
  representations at different layers; "the feature for X"
  depends on which layer's SAE is asked.
- **Coverage gaps.** Not every concept the network
  represents may be recoverable as an SAE feature, especially
  rarely-occurring or context-dependent concepts.
