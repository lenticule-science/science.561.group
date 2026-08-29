---
type: concept
class: classical
status: active
depends-on:
  - forward-model.md
  - observation-model.md
see-also:
  - dreamer-style-world-model.md
  - ../objects/latent-state-space.md
  - ../theorems/latent-world-model-identifiability.md
  - ../morphisms/latent-inference.md
references:
  - references/ha-schmidhuber-world-models2018.md
  - references/hafner-dreamer2020.md
  - references/lecun-jepa2022.md
---

# Latent world model

A **latent world model** is a world model whose state space is a
*learned compressed representation* rather than the raw observation
space. Formally, it consists of:

- A latent state space $Z$, typically much smaller than the
  observation space $O$.
- An **encoder** $e : O \to Z$ (or, when the latent state must
  integrate history, $e : O^* \to Z$) inferring latent state from
  observations.
- A **transition function** $T : Z \times A \to Z$ (or $\Delta(Z)$)
  on the latent state.
- A **decoder / observation model** $d : Z \to O$ predicting what
  observations a latent state would generate, used as a training
  signal.

## Why work in latent space

Two reasons.

**Computational tractability.** Pixel observations are
high-dimensional ($H \times W \times 3$ per frame, often
$\sim 10^5$ dimensions). Predicting next-pixel from current-pixel
is hard, expensive, and mostly wastes capacity on irrelevant
detail (texture, lighting, background). A learned latent of
dimension $\sim 10^2$–$10^3$ can capture the dynamics-relevant
content far more efficiently.

**Markovian state.** Raw observations are rarely Markovian
(a single video frame does not encode velocity). The latent
state is *trained* to be Markovian — the model is penalized when
its next-step prediction depends on history beyond the current
latent. The learned latent is therefore an approximate sufficient
statistic of the observation history for prediction.

## The training objective

Latent world models are typically trained by some combination of:

- **Reconstruction loss.** Decode latent states to observations
  and penalize reconstruction error.
- **Prediction loss.** Predict next-step latent and penalize
  divergence from the encoded next observation.
- **Variational regularization.** Penalize KL-divergence between
  the inferred latent posterior and a prior, to prevent the
  latent from collapsing onto the observation.
- **JEPA-style joint-embedding** (LeCun 2022). Predict the
  *latent* of the next observation directly, without reconstructing
  pixels — avoids spending capacity on irrelevant detail.

## The fundamental difficulty

Latent representations are **not identifiable** from observations
alone (see
[latent-world-model-identifiability](../theorems/latent-world-model-identifiability.md)).
Any invertible transformation of the latent space yields an
equivalent model. This means a latent world model has no
*intrinsic* alignment with any external semantics — its latent
dimensions do not necessarily correspond to physical quantities,
object identities, or causal variables. This is a limit on
interpretability and on transfer: the same physical situation
encoded by two independently trained latent models will live in
incommensurable representational spaces.

## Where latent world models appear

- **Dreamer family** (Hafner et al. 2020, 2023): RSSM-based
  latent dynamics with reconstruction loss, used for behavior
  learning by rollout in latent space. See
  [dreamer-style-world-model](dreamer-style-world-model.md).
- **Ha-Schmidhuber World Models** (2018): VAE-encoded frames,
  MDN-RNN latent dynamics, controller trained in imagination.
- **MuZero** (Schrittwieser et al. 2020): latent dynamics
  learned end-to-end with value/reward prediction targets, no
  reconstruction loss.
- **JEPA** (LeCun 2022): joint-embedding predictive architecture,
  no decoder.
