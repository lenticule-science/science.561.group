---
type: narrative
status: active
see-also:
  - ../teaching/explanations/feature.md
  - ../teaching/explanations/circuit.md
  - ../teaching/explanations/mechanistic-interpretability.md
title: From saliency to circuits
description: The contemporary mechanistic interpretability program took shape over roughly fifteen years, through a sequence of methodological shifts each responding to limits of the preceding generation.
---

# From saliency to circuits

The contemporary mechanistic interpretability program took
shape over roughly fifteen years, through a sequence of
methodological shifts each responding to limits of the
preceding generation.

## Saliency maps (~2013-2017)

The first generation of neural-network interpretability work
asked: *which inputs matter for this output?* The answer was
a *saliency map* — a per-input-pixel score derived from the
gradient of the output with respect to the input.

Methods proliferated: vanilla gradients, GradCAM,
integrated gradients, SmoothGrad, LIME, SHAP. They produced
heatmaps over inputs that supposedly explained the
network's decision.

The methods worked, in the weak sense that the heatmaps
correlated with what humans expected. They failed in deeper
ways:

- Heatmaps are fragile to small input perturbations.
- Different methods produce different heatmaps for the same
  input/output pair.
- The heatmaps explain *what input region matters*, not
  *what computation the network performs*.
- Adversarial-input research showed networks can rely on
  features humans don't notice — saliency maps were
  reassuring rather than informative.

By the late 2010s, the limits of saliency-based
interpretability were widely acknowledged.

## Feature visualization (~2015-2020)

The next move (Zeiler & Fergus, Olah et al., Distill
"Feature Visualization" article): synthesize inputs that
maximally activate individual neurons, to discover what each
neuron "represents." The visualizations were striking —
recognizable textures, objects, abstract patterns.

But the program ran into [polysemanticity](../../../../glossary/concepts/polysemanticity.md):
most neurons in mid-layers of trained networks fire for
multiple unrelated concepts, and per-neuron visualization
produced incoherent composites.

Feature visualization remained useful for monosemantic
neurons (often at the input or output of the network) but
could not explain mid-layer behavior.

## The Distill Circuits thread (2020)

Olah and collaborators' Distill *Circuits* sequence (2020)
made two methodological commitments:

- **Features over neurons.** A feature is a *direction* in
  activation space, not a neuron. Most features are not
  axis-aligned.
- **Circuits as explanations.** Behaviors are explained by
  *subgraphs* of components implementing recognizable
  algorithms.

The thread documented several circuits in InceptionV1
(curve detectors, high-low frequency detectors, dog detectors)
with explicit feature identification, weight analysis, and
algorithmic descriptions. It established the methodological
template for mechanistic interpretability.

## The transformer circuits work (~2021-2022)

Elhage et al.'s *Mathematical Framework for Transformer
Circuits* (2021) recast transformer interpretability in terms
of QK and OV circuits per attention head and residual-stream
subspaces. The framework allowed precise analysis of
attention-head function.

Wang et al.'s *Indirect Object Identification* (2022)
demonstrated the framework: identified a circuit of ~26
heads in GPT-2 small implementing a recognizable algorithm
for IOI tasks. The paper became the canonical mechanistic-
interpretability case study and established that the
methodology produces actual algorithmic explanations of
trained-network behavior.

## The superposition turn (2022)

Elhage et al.'s *Toy Models of Superposition* (2022)
diagnosed why polysemanticity is universal: networks store
more features than dimensions, in non-orthogonal
superposition, exploiting feature sparsity. The result
established that polysemanticity is *expected* and that
interpretation requires recovering features in a *different
basis* than the neuron basis.

The diagnosis pointed at the next methodological move:
sparse-autoencoder feature recovery.

## The SAE revolution (2023-)

Bricken et al.'s *Towards Monosemanticity* (2023, Anthropic)
and Cunningham et al.'s concurrent work established sparse
autoencoders as the practical method for recovering
monosemantic features from polysemantic networks. Templeton
et al. 2024 scaled to Claude Sonnet, recovering tens of
millions of features.

The SAE program is the dominant contemporary methodology.
See [the-sae-revolution](the-sae-revolution.md) for that
narrative in detail.

## Where this leaves the field

The arc — saliency → feature visualization → circuits →
superposition → sparse autoencoders — represents *increasing
mechanistic ambition*. Each generation explained more about
*what the network is doing* and less about *what the input
correlates with*. Each generation also exposed limits of the
previous one.

The contemporary frontier asks:

- Can features and circuits scale to frontier models? (See
  [can-mechanistic-interp-scale](can-mechanistic-interp-scale.md).)
- Are SAE features faithful to the network's actual
  computation, or is the recovery partly artifact?
- What does *complete* mechanistic interpretability look
  like, and is it achievable?

The arc has not ended; the field continues to develop new
methods (transcoders, attribution patching, automated
feature interpretation, model diffing) addressing remaining
limits.
