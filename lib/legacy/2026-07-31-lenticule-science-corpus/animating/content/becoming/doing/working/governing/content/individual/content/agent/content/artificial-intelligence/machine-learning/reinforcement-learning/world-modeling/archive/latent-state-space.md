---
type: object
class: classical
status: active
depends-on:
  - observation-space.md
see-also:
  - world-model.md
  - teaching/explanations/latent-world-model.md
  - ../theorems/latent-world-model-identifiability.md
  - ../morphisms/latent-inference.md
references:
  - references/ha-schmidhuber-world-models2018.md
  - references/lecun-jepa2022.md
---

# Latent state space

A **latent state space** $Z$ is a learned representation in which
a [latent-world-model](teaching/explanations/latent-world-model.md)'s
dynamics are expressed. It is *latent* because it is not observed
directly — it is inferred from observation history by an encoder
and used internally by the world model.

## Why a learned latent

The case for working in a learned latent rather than the raw
observation space rests on three observations:

1. **Compression.** Pixels are massively redundant for prediction
   purposes. A latent of dimension 100–1000 can capture the
   dynamics-relevant content of frames of dimension $10^5$+.
2. **Markov-ification.** Raw observations rarely encode the state
   sufficient for one-step prediction. The latent can be *trained*
   to be Markovian by penalizing the model when next-step
   prediction depends on history beyond the current latent.
3. **Abstraction.** Operating at a level above raw observations
   enables transfer: latent dynamics that are correct in one
   setting may transfer to another without re-learning the pixel
   detail.

## Structural choices

Designs vary along several axes:

- **Continuous vs discrete.** Continuous latents (Gaussian VAE,
  Dreamer's stochastic state) versus discrete categorical latents
  (DreamerV2's discrete code, VQ-VAE-style). Discrete latents
  are easier to plan over symbolically but harder to optimize.
- **Stochastic vs deterministic.** A stochastic latent represents
  uncertainty about the underlying state; a deterministic latent
  is a point estimate. Hybrid approaches (Dreamer's RSSM) maintain
  both.
- **History-conditional vs history-free.** Whether the latent at
  time $t$ depends only on observation $o_t$ (Markov assumption
  on observations, often false) or on the history $o_{1:t}$
  (typical, requires recurrence).
- **Reconstruction vs prediction-only.** Whether the training
  objective requires the latent to be sufficient to reconstruct
  the observation (autoencoder-style) or only to predict future
  latents and rewards (JEPA, MuZero-style).

## Identifiability

Latent state spaces are **fundamentally non-identifiable** from
observations alone (see
[latent-world-model-identifiability](../theorems/latent-world-model-identifiability.md)).
For any learned latent dynamics $(Z, T, e, d)$ and any invertible
$\phi : Z \to Z$, the model $(Z, \phi T \phi^{-1}, \phi e,
d \phi^{-1})$ produces identical observations and identical
predictions but operates in a different latent space.

This means:
- Two independently trained models on the same data have
  unrelated latent representations.
- The latent dimensions do not correspond to physical quantities
  unless additional structural constraints (sparsity, causality,
  invariance) are imposed.
- Interpretability via probing is informative but cannot ground
  the latent in any external semantics without an external
  reference.
