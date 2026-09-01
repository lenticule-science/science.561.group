---
type: theorem
class: contemporary
status: informal
depends-on:
  - teaching/explanations/polysemanticity.md
  - teaching/explanations/superposition.md
  - superposition-feasibility.md
see-also: []
references:
  - references/elhage-toy-models2022.md
---

# Polysemanticity implies superposition

## Statement (informal)

The empirical observation that most neurons in trained
networks are polysemantic — fire for multiple unrelated
concepts — is the predicted observable consequence of
features stored in superposition (more features than
dimensions, encoded as non-orthogonal overlapping
directions). The implication is the inferential bridge from
empirical observation to theoretical hypothesis.

## The argument

If the network has $f > d$ features to represent in $d$
activation dimensions:

- It cannot give each feature a dedicated dimension (only
  $d$ are available).
- It must encode features as *directions*, with multiple
  features sharing dimensions.
- A single neuron (basis dimension) projects onto multiple
  feature directions.
- Therefore, that neuron's activation is a weighted sum of
  multiple features' presence — it fires when any of its
  contributing features fires.
- The result, viewed from the neuron's perspective, is
  polysemanticity: the neuron fires for multiple unrelated
  concepts (the multiple features it shares dimensions
  with).

The chain is: $f > d$ → non-orthogonal feature encoding →
neurons project onto multiple features → polysemantic
neurons.

## The reverse direction (weak)

Does polysemanticity *imply* superposition? Strictly speaking,
no — a network with monosemantic features could still have
polysemantic neurons under unusual encoding choices (e.g.,
features deliberately spread across multiple neurons). But
empirically:

- The cleanest *explanation* of widespread polysemanticity is
  feature count exceeding dimension count.
- Toy models (Elhage et al. 2022) confirm that polysemanticity
  emerges precisely when feature count exceeds dimension count
  with sparse features.
- Alternative explanations (training noise, architectural
  bias, dimensional waste) don't account for the observed
  patterns.

So polysemanticity *strongly suggests* superposition, even if
it doesn't logically entail it.

## Why this matters

The implication establishes the methodological link between
*empirical interpretability work* (observe polysemantic
neurons) and *theoretical interpretability work* (theorize
about superposition). Without the link, polysemanticity
would be just an observation; with it, polysemanticity is
*evidence* for a structural claim about how networks
represent information.

The link also justifies the SAE program: if polysemanticity
arises from features stored as non-orthogonal directions,
then changing basis to a (sparser, overcomplete) dictionary
should recover the features. The SAE empirical success then
*further* confirms the chain.

## What it doesn't establish

- *Whether* polysemanticity is the *only* possible
  observable of superposition. Maybe other observables exist.
- *Whether* every polysemantic neuron is the result of
  superposition; some may be intrinsically multi-purpose.
- *How much* superposition there is in any given network;
  the implication is qualitative.

## Status

Informal but widely accepted in the mechanistic
interpretability community as the standard explanation for
polysemanticity. Supported by toy-model results, by SAE
empirical success, and by the lack of competing
explanations.
