---
type: narrative
status: active
see-also:
  - ../teaching/explanations/sparse-autoencoder.md
  - ../objects/sparse-feature.md
  - ../theorems/sae-reconstruction-faithfulness-tradeoff.md
title: The SAE revolution
description: In late 2023 the mechanistic interpretability community adopted sparse autoencoders as the dominant method for recovering interpretable features from polysemantic networks.
---

# The SAE revolution

In late 2023 the mechanistic interpretability community
adopted *sparse autoencoders* as the dominant method for
recovering interpretable features from polysemantic
networks. Within eighteen months the SAE program had
produced the largest catalogs of identified features in any
neural network and reshaped what feature-level
interpretability looked like. This is the narrative of that
shift, what it delivered, and what it didn't.

## The problem the revolution solved

After [the-superposition-hypothesis](the-superposition-hypothesis.md)
diagnosed polysemanticity as features-stored-densely, the
methodological question was: how do we recover those
features? The answer is implicit in the hypothesis: change
basis. If features are stored as non-orthogonal directions
in the neuron basis, find a different (overcomplete, sparse)
basis in which features are individually identifiable.

Compressed-sensing theory said this should work given
feature sparsity. The methodological move: train an
overcomplete sparse dictionary on the network's activations,
read off the dictionary directions as features.

## The breakthrough papers

**Bricken et al. 2023 (Anthropic), *Towards Monosemanticity*.**
Trained sparse autoencoders on a one-layer transformer's
activations. Recovered thousands of clearly monosemantic
features — the first systematic large-scale recovery. The
paper documented features for specific topics, syntactic
constructions, and abstract concepts; established the
methodology of feature analysis (activating examples,
direct effects, steering); and demonstrated that SAEs are a
viable practical method, not just a theoretical proposal.

**Cunningham et al. 2023, concurrent.** Independent
demonstration on similar models. The convergent results
gave the field confidence that SAEs work robustly, not
just in one lab's hands.

**Templeton et al. 2024 (Anthropic), *Scaling Monosemanticity*.**
Trained SAEs on Claude 3 Sonnet, recovering tens of millions
of features. Famous demonstrations: the "Golden Gate Bridge
feature" steered Claude into discussing the bridge in nearly
every response; abstract features for concepts like
deception, sycophancy, and security vulnerabilities were
identified. The paper established that SAEs scale to
frontier-model representations.

**Marks et al. 2024.** Used SAE features as the unit of
*circuit-level* analysis, building feature-circuit graphs
across multiple layers. Demonstrated that SAE features
support the circuit picture, not just the feature
inventory.

## What the revolution delivered

- **Feature catalogs.** For the first time, networks have
  *named feature inventories* with thousands to millions of
  entries.
- **Steering capability.** SAE features are usable as
  steering directions; behavior can be modified by feature
  manipulation in a principled way.
- **Concept localization.** Specific concepts (named
  entities, abstract properties, behaviors) are now locatable
  in network representations.
- **Cross-model comparison.** Features can be matched across
  models or training runs, enabling new comparative
  research.
- **Methodology infrastructure.** Tools (TransformerLens,
  SAELens, Neuronpedia), datasets, and trained SAEs are now
  shared infrastructure.

## What the revolution didn't deliver

- **Complete reconstruction.** SAEs typically explain 80-95%
  of activation variance; the residual is not negligible
  and may contain important computation. See
  [sae-reconstruction-faithfulness-tradeoff](sae-reconstruction-faithfulness-tradeoff.md).
- **All features interpretable.** A nontrivial fraction of
  recovered features defy human interpretation; the
  catalog has gaps that grow with scale.
- **Cross-layer features.** SAEs decompose single-layer
  activations. Features that span layers require additional
  methodology (transcoders, etc.).
- **Computation explanation.** SAEs decompose
  *representations*, not *computations*. How features are
  combined by the network's components is not directly
  addressed.
- **Atomicity guarantees.** Are SAE features atomic, or do
  they further decompose? See
  [do-features-decompose-cleanly](do-features-decompose-cleanly.md).

## Architectural evolution

The SAE program has rapidly evolved its architecture:

- **Vanilla SAE.** $\ell_1$ sparsity penalty. The original.
- **JumpReLU SAE.** Hard-threshold activation, better
  sparsity-faithfulness tradeoff.
- **Top-$k$ SAE.** Exact sparsity bound by hard selection.
- **Gated SAE.** Separates gating from magnitude estimation.
- **Crosscoder.** Spans multiple layers or models.

The field has not converged; new SAE architectures continue
to appear.

## What's open

- **Faithfulness at scale.** Do recovered features faithfully
  represent the network's actual computation, or are some
  features SAE training artifacts?
- **Cross-SAE consistency.** Features recovered by different
  SAE configurations don't perfectly match. How to
  reconcile?
- **Computation bridging.** Decomposing representations is
  partial; bridging to circuit-level explanations is in
  early days.
- **Frontier-model coverage.** Templeton 2024 was Claude
  Sonnet. Whether the methodology scales to current
  frontier models with similar coverage is an open
  empirical question.

## The shift's significance

Before SAEs, mechanistic interpretability was largely
*case-study* work: pick a behavior, manually trace its
circuit. After SAEs, the field has *infrastructure*:
feature catalogs that anyone can use as a starting point,
shared tooling, automated interpretation methods. The shift
is the difference between artisanal and industrial
interpretability — neither replaces the other, but they
operate at different scales.

Whether the SAE revolution leads to the *complete*
mechanistic understanding of trained networks that the
program ultimately seeks — that remains the open question
the field is working through.
