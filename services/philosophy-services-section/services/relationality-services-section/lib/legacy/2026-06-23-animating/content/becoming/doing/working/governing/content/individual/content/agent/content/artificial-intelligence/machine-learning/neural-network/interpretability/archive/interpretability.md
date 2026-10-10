---
title: "Interpretability"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: >
  The formal study of how to understand the internal computation
  of a trained neural network in mechanistic terms — what
  representations the network has learned, what algorithms it
  implements, and what causal structure connects its inputs to
  its outputs. The theory comprises the *mechanistic
  interpretability* program initiated by the Distill circuits
  thread (Olah et al. 2020) and Anthropic / Apollo / EleutherAI
  follow-ups; the *features-and-circuits* vocabulary; the
  *superposition hypothesis* explaining why neurons are
  polysemantic (Elhage et al. 2022); the *sparse autoencoder*
  approach to feature decomposition (Bricken et al. 2023,
  Cunningham et al. 2023); attribution and intervention
  methods (activation patching, ablation, causal tracing);
  and the *linear representation hypothesis* about how
  high-level concepts are encoded. Engages classical work on
  feature visualization and saliency, contemporary
  mechanistic-interpretability literature (Olah-Cammarata
  circuits 2020, Elhage toy-models 2022, Bricken
  monosemanticity 2023, Templeton scaling-monosemanticity
  2024, Wang IOI 2022, Meng ROME 2022, Conmy ACDC 2023, Marks
  feature-circuits 2024).
position: >
  This theory is a sibling of [agents](../agents/_index.md),
  [alignment](../alignment/_index.md), [memory](../memory/_index.md),
  and the other AI theories. Interpretability is methodologically
  upstream of alignment: a precondition for many alignment
  proposals (eliciting latent knowledge, deceptive-alignment
  detection, reward-model auditing) is the ability to read off
  what a network has learned. It is also methodologically
  related to [agent-foundations](../agent-foundations/_index.md)
  in that both theories ask "what is the computational structure
  of this agent really doing?" — interpretability empirically,
  agent-foundations formally. The theory has its own questions
  beyond alignment: scientific understanding of what neural
  networks compute is a research program in its own right.
---

The interpretability theory gives formal structure to how an
external observer can come to understand a trained neural
network's internal computation. It answers four questions
precisely:

**What are the units of analysis?** The mechanistic
interpretability program has settled on
*[features](concepts/feature.md)* (directions in activation
space corresponding to interpretable concepts) and
*[circuits](concepts/circuit.md)* (subgraphs of the network
implementing recognizable algorithms) as primary units, with
*[neurons](objects/neuron.md)*, *[attention-heads](objects/attention-head.md)*,
and the *[residual-stream](objects/residual-stream.md)* as
the substrate.

**Why are neurons polysemantic?** Most neurons in trained
networks respond to multiple unrelated concepts — the
*polysemanticity* problem. The
*[superposition-hypothesis](concepts/superposition.md)*
(Elhage et al. 2022) explains this structurally: the network
has more features than dimensions, so features are stored as
overlapping non-orthogonal directions. See
[superposition-feasibility](theorems/superposition-feasibility.md).

**How can features be recovered?** The
*[sparse-autoencoder](concepts/sparse-autoencoder.md)*
approach (Bricken et al. 2023) trains an overcomplete
dictionary on activations, recovering more interpretable
features than the network has neurons. See
[sae-reconstruction-faithfulness-tradeoff](theorems/sae-reconstruction-faithfulness-tradeoff.md).

**What does intervention show?** *Activation patching*,
*ablation*, *causal tracing*, and *probing* let observers
test whether a candidate circuit is actually responsible for
a behavior. The methods come with their own faithfulness
caveats. See [activation-patching](morphisms/activation-patching.md)
and [attribution-faithfulness-bound](theorems/attribution-faithfulness-bound.md).

The theory remains in active flux. Foundational hypotheses
(linear representation, superposition, sparse-feature
decomposition) are partially supported by evidence and
partially contested. Open questions about scaling and
faithfulness are tracked in
[questions](questions/_index.md).
