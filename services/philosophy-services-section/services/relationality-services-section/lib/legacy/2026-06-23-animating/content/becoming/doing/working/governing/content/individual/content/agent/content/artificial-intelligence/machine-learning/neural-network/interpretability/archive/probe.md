---
type: object
class: classical
status: active
depends-on: []
see-also:
  - ../morphisms/probing.md
  - teaching/explanations/linear-representation-hypothesis.md
  - ../theorems/linear-probe-correlation-vs-causation.md
references: []
---

# Probe

A **probe** is a small classifier (typically a linear model
or a shallow MLP) trained to predict a property from a
network layer's activations. It tests whether the property
is *encoded* in those activations — *available* for some
downstream consumer to read.

## The setup

Given a target neural network and a property $P$ defined
over inputs (e.g. "input is grammatical English," "input
mentions a person," "input expresses positive sentiment"):

1. Collect activations at some layer of the target network
   over a labeled dataset $\{(x_i, P(x_i))\}$.
2. Train a probe to predict $P(x)$ from the activation.
3. Evaluate probe accuracy on held-out activations.

If the probe achieves high accuracy, the property is said to
be *encoded* in the layer.

## Linear probes

The most common probe is a *linear classifier*: weight vector
$\mathbf{w}$ and bias $b$, with prediction
$\sigma(\mathbf{w}^\top \mathbf{a} + b)$ for activation
$\mathbf{a}$. Linear probes test the
[linear-representation-hypothesis](teaching/explanations/linear-representation-hypothesis.md):
if a linear probe achieves high accuracy, the property is
linearly encoded.

## What a successful probe shows

If a probe accurately predicts $P$ from layer $l$:

- The activations at layer $l$ contain enough information
  to predict $P$.
- Some downstream consumer of layer $l$ *could* use this
  information.
- The information is encoded in a shape compatible with the
  probe (linear, for linear probes).

## What a successful probe does *not* show

A central caveat (see
[linear-probe-correlation-vs-causation](../theorems/linear-probe-correlation-vs-causation.md)):

- The network *might not actually use* this information.
  The presence of decodable information does not establish
  causal role.
- The probe might be picking up *spurious* information that
  the network has no downstream use for (residual-stream
  artifacts, training-data correlations).
- A successful probe is *necessary but not sufficient* for
  the network to use the property; *causal* tests
  (intervention, ablation) are needed for sufficiency.

## Probe complexity matters

The complexity of the probe is part of the result:

- A *linear* probe succeeding means the property is encoded
  linearly.
- A *deep MLP* probe succeeding only means the property is
  encoded *somewhere* — the MLP may be doing the
  classification work itself, with little of it relying on
  the network's encoding.

For interpretability, simple probes are more informative;
complex probes risk attributing encoding to the network when
the probe does the work.

## Variants

- **Concept probes** — predict a single concept's presence.
- **Selectivity probes** — measure how *uniquely* a property
  is decodable from a layer.
- **Causal probes** — combine linear classification with
  intervention to test causal role.
- **Information-theoretic probes** — measure
  $I(\text{activation}; P)$ rather than fit a classifier.

## Probes vs sparse features

Probes and sparse-autoencoder features are complementary:

- A probe is *targeted* — picks out a specific known
  property's encoding.
- An SAE is *exploratory* — finds many features, some of
  which may correspond to known properties.

A robust interpretability claim about property $P$ typically
combines probe evidence (information is decodable),
intervention evidence (modifying the encoding changes
behavior), and ideally SAE evidence (a feature
corresponding to $P$ exists in the dictionary).

## Status

Probing is the oldest method in the contemporary
interpretability stack and remains widely used. It is
treated as *first-pass evidence* of feature encoding —
necessary for further investigation but not sufficient to
claim mechanistic understanding.
