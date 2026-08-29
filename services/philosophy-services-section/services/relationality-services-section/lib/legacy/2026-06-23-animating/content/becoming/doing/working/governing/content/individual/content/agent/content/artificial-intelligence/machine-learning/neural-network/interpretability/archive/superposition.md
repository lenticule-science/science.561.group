---
type: concept
class: contemporary
status: active
depends-on:
  - feature.md
  - polysemanticity.md
see-also:
  - ../theorems/superposition-feasibility.md
  - ../theorems/polysemanticity-implies-superposition.md
  - sparse-autoencoder.md
references:
  - references/elhage-toy-models2022.md
---

# Superposition

The **superposition hypothesis** (Elhage et al. 2022) is the
claim that neural networks store *more* features than they
have dimensions, by representing each feature as a non-
orthogonal direction in activation space. The features
overlap; perfect separation is sacrificed for capacity.

## The setup

Suppose a layer has $d$ neurons and the world has $f$
features ($f > d$) that the network needs to detect. With
$d$ orthogonal directions available, only $d$ features can
be represented unambiguously. To represent $f > d$ features,
the network must use *non-orthogonal* directions — features
overlap, and any feature's activation is partially
indistinguishable from the linear combination of overlapping
features.

The hypothesis: networks do this, exploiting the *sparsity*
of features (most features are inactive on most inputs) to
recover individual features despite their overlap.

## Why sparsity matters

If only one feature is active at a time, even non-orthogonal
features are recoverable: the activation pattern uniquely
identifies the active feature. As the number of
*simultaneously* active features grows, ambiguity grows. The
sparser the features, the more can fit in superposition with
acceptable error. See
[superposition-feasibility](../theorems/superposition-feasibility.md)
for the formal statement.

## Empirical evidence

- **Toy models.** Elhage et al. construct small networks with
  controlled feature counts and show superposition appears
  exactly when features are sparse and feature count
  exceeds dimensionality.
- **Polysemantic neurons.** Most neurons in trained
  transformers respond to multiple unrelated concepts —
  consistent with the prediction that features are stored
  as non-axis-aligned directions.
- **Sparse-autoencoder recovery.** When SAEs are trained
  on activations, they recover many more features than the
  underlying dimension — direct evidence that features were
  stored in superposition.
- **Phase transitions.** As feature density crosses a
  threshold, networks transition between dedicated-neuron
  and superposition regimes — predicted by the hypothesis.

## What the hypothesis explains

- **Polysemanticity.** Why neurons fire for unrelated
  features — they project onto multiple stored feature
  directions.
- **Feature interference.** Why activating one concept
  weakly activates correlated others — the directions
  overlap.
- **Capacity scaling.** Why larger networks store more
  features near-linearly with parameters but not strictly
  per-neuron — superposition allows extra features beyond
  the per-neuron count.

## What it does not explain

- **Why the specific overlapping structure.** The hypothesis
  predicts overlap exists, not how overlap is organized.
- **Computation in superposition.** It is one thing to
  *store* features in superposition, another to *compute
  with them*. How attention and MLP layers operate on
  superposed features is incompletely understood.

## Status

The superposition hypothesis is widely accepted in the
interpretability community as the best current explanation
for polysemanticity and the structural reason SAE
decomposition recovers more features than the network has
neurons. It is supported by toy models and consistent with
empirical observations on real models. A *proof* — even
informal — that real networks operate in superposition
across all relevant components is incomplete.
