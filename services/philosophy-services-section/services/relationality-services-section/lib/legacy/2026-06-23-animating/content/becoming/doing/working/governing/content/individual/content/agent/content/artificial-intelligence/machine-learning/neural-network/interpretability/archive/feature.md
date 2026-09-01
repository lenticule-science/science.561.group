---
type: concept
class: contemporary
status: active
depends-on: []
see-also:
  - circuit.md
  - superposition.md
  - sparse-autoencoder.md
  - linear-representation-hypothesis.md
references:
  - references/olah-circuits2020.md
  - references/elhage-toy-models2022.md
---

# Feature

A **feature** in mechanistic interpretability is a *direction*
(or a small subspace) in a network's activation space that
corresponds to a human-interpretable concept — a property of
the input the network has learned to detect or to manipulate.

## The vocabulary

The features-and-circuits program (Olah et al., Distill 2020)
adopted "feature" as the basic unit of analysis. A feature is
identified by a direction $\mathbf{v} \in \mathbb{R}^d$ in
activation space such that the activation magnitude in that
direction tracks an interpretable property: "is a curve,"
"is the token *the*," "is referring to a prior entity,"
"is unsafe content."

## Features vs neurons

Critically, features are not neurons. A neuron is a *fixed
basis direction* of activation space (the standard basis); a
feature is *any direction*, including ones that are not
aligned with any neuron. Empirically:

- Most neurons are *polysemantic* — they fire for multiple
  unrelated features.
- Most features are *not neuron-aligned* — recovering them
  requires changing basis.

The decoupling of features from neurons is what motivated
the [superposition](superposition.md) hypothesis and
[sparse-autoencoder](sparse-autoencoder.md) techniques.

## What makes a feature

A direction $\mathbf{v}$ qualifies as a feature when:

- **Interpretability.** Inputs that activate strongly along
  $\mathbf{v}$ share a recognizable common property.
- **Causal role.** Modifying activation along $\mathbf{v}$
  changes downstream behavior in a way consistent with the
  property.
- **Sparse activation.** The feature fires only on a small
  fraction of inputs (sparsity is essential for the
  superposition account).

Features that satisfy interpretability but not causal-role
may be *correlational features* (the network detects them
but does not act on them); features that satisfy causal-role
but not interpretability may be *action-only features* (the
network uses them but they have no clean human description).

## Operations on features

The interpretability literature has a vocabulary for what one
*does* with features:

- **Detection.** Identifying that a feature exists.
- **Visualization.** Synthesizing inputs that maximally
  activate the feature.
- **Steering.** Modifying activations along the feature
  direction to change network behavior.
- **Decomposition.** Expressing other features (or whole
  layer outputs) in terms of identified features.

## Why features are the primary unit

Earlier interpretability work used neurons or input gradients
as units. Both proved unsatisfactory:

- *Neurons* are basis-aligned but typically polysemantic;
  per-neuron explanations are misleading when neurons fire
  for multiple unrelated reasons.
- *Input gradients* (saliency maps) are noisy, not robust
  to input perturbations, and produce explanations that are
  hard to verify.

Features give a unit of analysis that is *interpretable* by
construction (a direction is a feature only if a property is
attached) and *causally meaningful* (interventions on
features have predictable effects). The program of mechanistic
interpretability is largely the program of identifying,
cataloging, and circuit-mapping features.
