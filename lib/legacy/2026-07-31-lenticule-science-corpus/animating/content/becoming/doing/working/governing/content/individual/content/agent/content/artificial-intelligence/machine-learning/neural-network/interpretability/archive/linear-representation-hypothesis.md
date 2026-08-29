---
type: concept
class: contemporary
status: active
depends-on:
  - feature.md
see-also:
  - superposition.md
  - ../objects/probe.md
  - questions/is-the-linear-representation-hypothesis-true.md
references:
  - references/meng-rome2022.md
---

# Linear representation hypothesis

The **linear representation hypothesis** is the claim that
high-level concepts in trained neural networks are encoded
as *linear directions* in activation space: each concept
corresponds to a vector $\mathbf{v}$ such that the
activation magnitude along $\mathbf{v}$ tracks the concept's
presence and intensity.

## The claim, sharpened

Three closely-related forms:

- **Weak form.** Many human-interpretable concepts admit
  linear probes — there exists a direction $\mathbf{v}$
  such that $\langle \mathbf{a}, \mathbf{v} \rangle$
  predicts the concept from activations $\mathbf{a}$.
- **Strong form.** The network *uses* the linear
  representation: concepts are encoded as linear directions,
  and the network's downstream computation operates on those
  directions linearly (translation, addition, suppression).
- **Steering form.** Adding $\alpha \mathbf{v}$ to
  activations causally manipulates the concept in the
  network's output, in proportion to $\alpha$.

The forms imply each other under additional assumptions but
are distinct claims with different evidence.

## Empirical support

- **Word embeddings** famously support analogy via linear
  arithmetic ($\mathrm{king} - \mathrm{man} + \mathrm{woman}
  \approx \mathrm{queen}$), the original evidence for
  linear-direction encoding.
- **Linear probes** succeed on a wide range of concepts in
  transformer activations: sentiment, syntax, factual
  associations, agent-relative geometry.
- **Activation steering** (Subramani et al., Turner et al.,
  others) shows adding concept vectors to activations
  produces predictable behavioral changes.
- **ROME** (Meng et al. 2022) edits factual associations by
  modifying weights at a single layer, consistent with
  facts encoded as linear-rank-1 updates.
- **SAE recovery** of features as dictionary *directions*
  presupposes linear encoding; SAEs work as well as they do
  partly because the hypothesis appears to hold.

## Empirical complications

- **Probes can succeed without causation.** A linear probe
  shows information is *available*, not that the network
  *uses* it. See [linear-probe-correlation-vs-causation](../theorems/linear-probe-correlation-vs-causation.md).
- **Some features are non-linear.** Multi-token features,
  context-dependent features, and features that interact
  multiplicatively may not have clean linear directions.
- **Polysemanticity complicates direction identification.**
  In superposition, the "linear direction" for a concept may
  be entangled with directions for other concepts.
- **Probing geometry varies.** The same concept may have
  different probing accuracies in different layers, with no
  clear "the" linear direction.

## Why the hypothesis matters

If true:

- Mechanistic interpretability has a tractable formal
  substrate — linear algebra of features.
- Steering, editing, and probing are principled rather than
  serendipitous.
- Sparse-autoencoder decomposition is justified.
- Many alignment proposals (eliciting latent knowledge,
  honesty steering, deception detection) become tractable.

If false:

- Interpretability becomes much harder; non-linear
  decomposition methods are required.
- Concept editing methods that work on small models may
  fail on large ones or vice versa.
- The current SAE program is partial at best.

## Status

The hypothesis is *partially confirmed and partially
contested*. Linear probes work for many concepts; some do
not admit clean linear probes. Steering works for many
concepts; some require non-linear interventions. SAE
decomposition succeeds; not all features factor cleanly.

The hypothesis is best treated as an *operating
approximation* that holds well in practice for many
concepts, with explicit attention to the cases where it
breaks. See [is-the-linear-representation-hypothesis-true](questions/is-the-linear-representation-hypothesis-true.md)
for the open form.
