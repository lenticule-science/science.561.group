---
type: object
class: classical
status: active
depends-on: []
see-also:
  - teaching/explanations/polysemanticity.md
  - teaching/explanations/feature.md
references: []
---

# Neuron

A **neuron** in interpretability terminology is a single
hidden unit of a neural network — a scalar output of the
network, computed as a (typically nonlinear) function of an
upstream linear projection of the previous layer's activation.

## In transformers

The "neurons" most discussed in transformer interpretability
are the *MLP neurons*: the post-activation outputs of the
intermediate layer of each MLP block. For a transformer with
hidden dimension $d$ and MLP expansion factor $4$, each layer
has $4d$ such neurons.

Attention output dimensions are sometimes also called
"neurons," though "attention head output dimensions" is more
precise.

## The naive interpretation

The intuition (carried over from connectionism): each neuron
*represents* something. If neuron $i$ fires for inputs of
type $X$, then neuron $i$ "is the $X$-detector."

## Why this is mostly wrong

Empirically, neurons in trained transformers are
**polysemantic**: a typical neuron fires for multiple
unrelated input types, with no single coherent
interpretation. See [polysemanticity](teaching/explanations/polysemanticity.md).

The mistake in the naive interpretation: assuming the network
*uses the standard basis* of activation space. There is no
training pressure to align features with neuron axes; only
to encode features somehow. The features end up at arbitrary
directions, projecting onto multiple neurons simultaneously.

## Why neurons remain useful as a unit

Despite polysemanticity, neurons remain a useful unit because:

- They are *what the network is built from*. The
  computational graph is naturally indexed by neurons.
- They are *targets of intervention*. Ablating, patching, or
  scaling a neuron is a well-defined operation.
- They are *upper bounds on capacity*. The number of
  features a layer can store is bounded (in some sense) by
  the number of neurons.
- They are *the substrate of features*. Features live in the
  span of neurons; understanding features requires
  understanding the neuron substrate.

The shift to [features](teaching/explanations/feature.md) as the
explanatory unit does not eliminate neurons; it adds a layer
above them.

## Monosemantic neurons

A minority of neurons are *monosemantic* — they have a single
clean interpretation. These are easier to study, often
appear at the input or output of the network, and are
disproportionately represented in early interpretability case
studies. They are the exception, not the rule.

## In other architectures

- **CNN neurons** (convolutional channels) are also
  polysemantic in modern networks, though early-layer
  channels (edge detectors, color blobs) are often
  monosemantic.
- **RNN neurons** (hidden state dimensions) are similarly
  polysemantic.
- **Sparse-autoencoder dictionary directions** are designed
  to be monosemantic; whether they succeed is the empirical
  question SAE work asks.
