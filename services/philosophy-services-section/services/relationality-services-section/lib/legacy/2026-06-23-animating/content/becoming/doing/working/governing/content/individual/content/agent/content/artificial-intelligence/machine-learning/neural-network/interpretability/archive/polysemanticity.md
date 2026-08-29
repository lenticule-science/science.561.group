---
type: concept
class: contemporary
status: active
depends-on: []
see-also:
  - feature.md
  - superposition.md
  - ../theorems/polysemanticity-implies-superposition.md
references:
  - references/olah-circuits2020.md
  - references/elhage-toy-models2022.md
---

# Polysemanticity

**Polysemanticity** is the empirical observation that most
neurons in trained neural networks respond to *multiple
unrelated concepts* — there is no single human-interpretable
property that explains a typical neuron's firing pattern.

## The empirical finding

When researchers attempt to interpret individual neurons by
finding inputs that maximally activate them (Olah et al.
*Distill: Circuits* 2020 and prior visualization work), most
neurons do not have clean interpretations:

- A typical mid-layer neuron in a vision model might fire for
  "cat faces" *and* "car wheels" *and* "wood texture."
- A typical mid-layer neuron in a language model might fire
  for "the token *the*" *and* "definite reference" *and*
  "British English spelling."

A small minority of neurons are *monosemantic* — clean
correspondences to single concepts — but they are the
exception. Most neurons defy single-property interpretation.

## Why polysemanticity is a problem

If we want to *explain* what a network does, neuron-level
explanations are unsatisfactory:

- "This neuron fires for X, Y, and Z" is not a coherent
  algorithmic description.
- Per-neuron interventions affect multiple unrelated
  behaviors, frustrating causal analysis.
- The vocabulary of the explanation has the wrong basis;
  human concepts don't align with neurons.

Polysemanticity was the *substrate problem* that motivated
moving from neurons to [features](feature.md) (any direction,
not just basis-aligned) and seeking [sparse-autoencoder](sparse-autoencoder.md)
decompositions that recover monosemantic features in a
different basis.

## The superposition explanation

The [superposition](superposition.md) hypothesis (Elhage
et al. 2022) proposes that polysemanticity is the *expected
observable* of features stored in non-orthogonal directions.
If features outnumber dimensions, no basis can represent each
feature on a single axis; some axes must mix multiple
features. Empirical observation of polysemanticity
*confirms* what superposition predicts.

The implication: polysemanticity is not a bug of training,
not a symptom of insufficient capacity, not an artifact of
incomplete optimization. It is a *structural* consequence of
storing features densely. Removing it requires either
expanding capacity or accepting fewer features.

## Monosemantic neurons

Some neurons *are* monosemantic. Why?

- **High-importance features** that warrant a dedicated
  neuron — often features at the start or end of the
  network (input recognition, output generation).
- **Naturally axis-aligned features** that the architecture
  or initialization happens to align with a basis direction.
- **Features without close semantic neighbors** — "comma" is
  more isolated than "definite article," and may end up
  monosemantic.

Identifying which features get dedicated neurons vs which
share dimensions is an ongoing empirical project.

## What changes with sparse autoencoders

Sparse autoencoders attempt to *recover* monosemantic features
by changing basis: project activations into an overcomplete
sparse dictionary, where each dictionary direction is
trained to fire for a single concept. The success of SAEs at
recovering interpretable features is the strongest empirical
evidence that polysemanticity is a *basis* problem, not a
*content* problem — the features are there, just not aligned
with neurons.

## Status

Polysemanticity is a robust empirical finding across model
families and scales. The superposition explanation is the
dominant theoretical account. Whether *all* polysemanticity
admits the superposition explanation, or whether some
neurons are intrinsically multi-purpose, is an open question.
