---
type: morphism
class: contemporary
status: active
depends-on:
  - teaching/explanations/sparse-autoencoder.md
  - ../objects/sparse-feature.md
see-also:
  - ../theorems/sae-reconstruction-faithfulness-tradeoff.md
references:
  - references/bricken-monosemanticity2023.md
  - references/templeton-scaling-mono2024.md
---

# Feature extraction

**Feature extraction** is the procedure of training a
[sparse-autoencoder](teaching/explanations/sparse-autoencoder.md) (or
related dictionary-learning method) on activations from a
target network's chosen layer, to recover an overcomplete
dictionary of [sparse-features](../objects/sparse-feature.md).

## The procedure

1. Choose a target network and a layer.
2. Generate activations: run the network on a large dataset,
   collect activations at the chosen layer.
3. Train a sparse autoencoder with $m \gg d$ dictionary
   directions, optimizing reconstruction loss plus sparsity
   penalty.
4. Inspect each dictionary direction:
   - Find inputs that maximally activate it.
   - Test causal effect via steering or ablation.
   - Label with a human-readable description (manually or via
     LLM-assisted automated interpretation).

The output is a *feature dictionary*: $m$ directions, each
with associated activating examples and (if successful) a
human description.

## Configuration choices

- **Expansion ratio** $m/d$. Higher expansion → more
  features but slower training and more potential redundancy.
  Common: 8×, 32×, 128×.
- **Sparsity penalty.** $\ell_1$, top-$k$, JumpReLU. Each
  yields different feature sparsity-monosemanticity profile.
- **Training data.** What corpus of activations to use; this
  affects which features are recovered.
- **Initialization.** Random, kaiming, or initialized from
  a previous SAE; affects training dynamics.
- **Layer choice.** Different layers yield different feature
  vocabularies (input-near layers: lexical/syntactic;
  middle layers: semantic; output-near layers: task-relevant).

## Quality criteria

A useful SAE has:

- **Low reconstruction error.** SAE outputs reconstruct
  activations well. Tradeoff with sparsity.
- **High sparsity.** Each input activates few features.
- **High monosemanticity.** Each feature corresponds to a
  single interpretable concept.
- **Good coverage.** The dictionary captures most of the
  features the network uses.

These criteria *trade off*; see
[sae-reconstruction-faithfulness-tradeoff](../theorems/sae-reconstruction-faithfulness-tradeoff.md).

## Automated feature interpretation

For SAEs with millions of features, manual interpretation
is infeasible. *Automated feature interpretation* uses a
separate LLM to:

1. Read activating examples for the feature.
2. Propose a human-readable description.
3. Optionally validate by predicting which novel inputs
   should activate the feature, then checking.

The fraction of automatically-interpreted features that
hold up under careful manual review is a quality metric.
Modern reports (Templeton et al. 2024) find a substantial
majority of SAE features admit reasonable interpretations.

## Limits

- **Reconstruction error matters.** What the SAE doesn't
  reconstruct is in the residual; downstream computation
  uses the residual. A "feature dictionary" that explains
  90% of activation variance leaves 10% unexplained, and
  the unexplained part may be where important computation
  happens.
- **Cross-layer features unaddressed.** SAEs decompose
  single-layer activations. Features that span layers
  require cross-layer methods (transcoders).
- **Composition unaddressed.** SAEs decompose
  representations. How features are *combined* by attention
  and MLPs to produce downstream features is not directly
  addressed.
- **Stability across training runs.** Features recovered by
  one SAE run may not match features recovered by another;
  reproducibility is an active concern.

## Status

Feature extraction via SAEs is the dominant method for
recovering interpretable units from trained networks. The
method is rapidly evolving; architectural improvements
(JumpReLU, top-$k$, gated SAEs) and scale (Templeton et al.
2024 reaching tens of millions of features in a Claude-scale
model) are pushing what is recoverable.
