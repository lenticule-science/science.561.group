---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/probe.md
see-also:
  - teaching/explanations/linear-representation-hypothesis.md
  - ../theorems/linear-probe-correlation-vs-causation.md
references: []
title: Probing
description: Probing is the procedure of training a small classifier (a probe) on a layer's activations to test whether a chosen property is encoded in those activations.
---

# Probing

**Probing** is the procedure of training a small classifier
(a [probe](probe.md)) on a layer's activations to
test whether a chosen property is encoded in those
activations. It is the oldest and most common
interpretability method, predating the mechanistic
interpretability program.

## The procedure

Given a target network, a layer of interest, and a property
$P$:

1. Build a labeled dataset
   $\{(x_i, P(x_i))\}_{i=1}^N$ of inputs and property
   labels.
2. Run inputs through the target network; collect
   activations $\mathbf{a}_i$ at the target layer.
3. Train a classifier (the probe) to predict $P(x_i)$ from
   $\mathbf{a}_i$.
4. Evaluate probe accuracy on held-out data.
5. High accuracy → the property is encoded in the layer.

## Choices

- **Probe architecture.** Linear, MLP, more complex. Linear
  probes test linear encoding (the standard for testing
  the [linear-representation-hypothesis](../../../../glossary/concepts/linear-representation-hypothesis.md)).
- **Layer.** Different layers may encode different
  properties. Probing all layers traces a property's
  "emergence" through the network.
- **Property granularity.** Coarse (binary class) vs fine
  (multi-class, regression). Coarser is easier; finer is
  more informative.

## What probing shows

A successful probe shows:

- The property is *available* — sufficient information
  exists in the activation to recover it.
- The property is encoded in a shape compatible with the
  probe (linear, for linear probes).
- *Some* downstream consumer *could* read the property.

## What probing doesn't show

A successful probe does NOT show:

- That the network *uses* the property in its computation.
  See [linear-probe-correlation-vs-causation](linear-probe-correlation-vs-causation.md).
- That the encoding is *causally responsible* for any
  particular behavior.
- That the encoding is *deliberate*; the property may be
  decodable as a side effect of the network's encoding of
  related properties.

## Diagnostic limits

- **Probe-as-classifier confound.** A complex probe might
  be doing the classification *itself*, with the network
  contributing little. Linear probes mitigate this; deep
  probes don't.
- **Spurious correlations.** A probe may exploit features
  correlated with $P$ in the training distribution but not
  causally related to $P$.
- **Selection bias.** Researchers tend to probe for
  properties they expect to find encoded, biasing the
  literature toward positive results.

## Combining probing with intervention

A robust claim about property encoding combines:

- **Probing evidence.** The property is decodable.
- **Intervention evidence.** Modifying the encoding (via
  steering, ablation, or patching) changes downstream
  behavior in the predicted direction.
- **Naturalness evidence.** The encoding appears across
  models, training runs, or related domains.

A claim resting on probing alone is treated as preliminary;
intervention evidence is required to establish causal role.

## In agent interpretability

Probing has been used to test for:

- **Sentiment, syntax, factuality** in language model
  activations.
- **Spatial geometry** in chess and Othello-playing models.
- **Truthfulness vs deception** distinctions in instruction-
  tuned models (with mixed results).
- **Goal-directed behavior** features in trained agents.

Most contemporary interpretability work treats probing as a
*starting point* for investigation rather than a stand-alone
result.
