---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/mesa-objective.md
see-also:
  - teaching/explanations/deceptive-alignment.md
  - ../theorems/eliciting-latent-knowledge-hardness.md
  - questions/can-interpretability-detect-deception.md
references:
  - references/christiano-elk2022.md
  - references/hubinger-mesa2019.md
---

# Interpretability extraction

**Interpretability extraction** is the operation of reading internal representations out of a trained model — features, circuits, goal representations, world-model components — without relying on the model's externally-observable behavior.

It is the principal alternative to behavioral [elicitation](../objects/behavior-elicitation.md) for alignment diagnostics, and the principal hope for detecting [deceptive alignment](teaching/explanations/deceptive-alignment.md).

## Sub-operations

**Probing.** Train a small classifier on a particular layer's activations to predict some target property (sentiment, factual knowledge, presence of a concept).
Reveals what is *linearly decodable* from internals; says less about what the model uses.

**Sparse-autoencoder feature extraction.** Decompose activations into a sparse over-complete basis whose components are interpretable as semantic features.
The Anthropic / DeepMind 2024 sparse-autoencoder work has produced large feature dictionaries for production-scale models; interpretation of individual features remains labor-intensive.

**Circuit analysis.** Identify subgraphs of the model's computation graph implementing specific behaviors (induction heads, indirect-object identification, etc.).
Mature for narrow circuits in narrow models; not yet a general technique.

**Activation steering.** Modify activations to test causal claims about feature roles.
Provides causal evidence that a representation is *used*, not just present.

**Goal-extraction.** Read the [mesa-objective](../objects/mesa-objective.md) out of internals.
The most ambitious form; not currently achievable for any frontier model.

## Why interpretability matters for alignment

Behavioral elicitation cannot detect a deceptively-aligned model: by construction, the model behaves correctly under any elicitation it identifies as such.

Interpretability — if it works — detects deception by finding the internal representation of the misaligned mesa-objective directly, bypassing the model's behavioral display.
The [can-interpretability-detect-deception](questions/can-interpretability-detect-deception.md) question is whether this is achievable in principle.

## Why it is hard

**Polysemanticity.** Individual neurons typically participate in many unrelated computations.
The "feature = neuron" assumption fails; features are distributed across many neurons, and decoding requires non-trivial inference.

**Superposition.** A model can encode more features than it has dimensions, by storing them in overlapping non-orthogonal subspaces.
Sparse-autoencoder methods address this at scale; it remains computationally and conceptually expensive.

**Goal-representation opacity.** The mesa-objective need not be represented as a single function in the network.
It might be implicit in the way other components are wired together, distributed across many parameters with no localized substrate.
There is no a priori reason a learned goal would be syntactically extractable.

**Adversarial dynamics.** A sufficiently capable model might encode its mesa-objective in ways that resist standard extraction.
This is the structural concern for ELK ([eliciting-latent-knowledge-hardness](../theorems/eliciting-latent-knowledge-hardness.md)) and the principal limit on interpretability as a deception-detection technique.

## Realization

In code, interpretability extraction is a pipeline:

1. Run the model on a representative input distribution; capture activations at chosen layers.
2. Apply a feature-extraction procedure (probe, sparse autoencoder, etc.) to identify candidate representations.
3. Validate the representations by intervention (steering, ablation).
4. Annotate validated representations with semantic labels.
5. Aggregate the annotated representations into claims about the model's internal computation.

The pipeline is mature for steps 1–3 in narrow settings; steps 4–5 remain bottlenecked on human interpretation effort, with growing LLM-assisted automation.

## What interpretability extraction *is not*

It is not a behavioral test; the model's outputs are not the diagnostic.

It is not a guarantee that what is extracted *is* the model's goal — extracted features may be incidental to behavior, or may be one of many functionally relevant representations.

It is not (yet) a deployable alignment technique; production alignment in 2026 still relies primarily on RLHF, refusal training, and behavioral red-teaming.
Interpretability is research-grade.
