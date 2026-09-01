---
type: concept
class: contemporary
status: active
depends-on:
  - latent-world-model.md
  - model-based-rl.md
see-also:
  - ../objects/imagination-rollout.md
  - ../morphisms/imagination.md
references:
  - references/ha-schmidhuber-world-models2018.md
  - references/hafner-dreamer2020.md
  - references/hafner-dreamerv3-2023.md
---

# Dreamer-style world model

The **Dreamer family** (Hafner et al. 2020, 2021, 2023) is the
canonical contemporary architecture for learned latent world
models in deep RL. It descends from Ha-Schmidhuber World Models
(2018) and now constitutes the state of the art for sample-efficient
RL from pixels across many domains, with DreamerV3 notably solving
diverse domains (Atari, DMControl, Minecraft) with a single
hyperparameter setting.

## The architecture

Three components, all learned jointly:

**Recurrent State-Space Model (RSSM).** A recurrent latent
dynamics model with both a deterministic recurrent state $h_t$
and a stochastic latent $z_t$. The transition is:

$$
h_t = f_\theta(h_{t-1}, z_{t-1}, a_{t-1}),\quad
z_t \sim p_\theta(z_t \mid h_t)
$$

The deterministic component carries history; the stochastic
component handles environment randomness and aleatoric
uncertainty.

**Encoder and decoder.** The encoder $q_\phi(z_t \mid h_t, o_t)$
infers latent state from current observation and history; the
decoder $p_\phi(o_t \mid h_t, z_t)$ reconstructs observations,
providing the training signal.

**Reward and value heads.** A reward predictor
$\hat{r}_\theta(h_t, z_t)$ and a value predictor $\hat{v}_\psi(h_t,
z_t)$ are trained on real reward and bootstrapped value targets.

## The training loop

1. Collect a trajectory in the real environment with the current
   policy.
2. Train the world model (RSSM, decoder, reward) on real
   transitions to minimize reconstruction loss + KL regularization
   + reward-prediction loss.
3. Sample states from real trajectories. From each sampled state,
   roll the latent dynamics forward $H$ steps (typically
   $H = 15$–$50$) using the *learned* dynamics, producing
   imagination rollouts entirely in latent space.
4. Train the actor and critic on the imagination rollouts using
   $\lambda$-returns of the predicted reward.
5. Repeat.

The key efficiency point: real environment interaction provides
the model and grounding samples; the policy is improved primarily
through imagination, which costs only forward passes through the
learned dynamics — no environment steps.

## Why DreamerV3 generalized

Earlier Dreamer versions required per-domain hyperparameter
tuning. DreamerV3 (Hafner et al. 2023) introduced **symlog
predictions** (transforming targets to a log-symmetric scale to
handle wildly varying reward scales across domains), **fixed
entropy targets**, **return normalization**, and **architectural
regularizations** that stabilized training. The result: a single
algorithm that learns to play Minecraft from scratch, controls
quadrupeds, plays Atari, and solves manipulation, with the same
hyperparameters.

This is significant because *generality* — performance across
domains without per-domain engineering — is the main thing that
distinguishes mature engineering from research. DreamerV3 marks a
transition for model-based RL from "carefully tuned for a domain"
to "drop-in algorithm".

## Limits

- The compounding-error horizon
  ([model-error-compounds](../theorems/model-error-compounds.md))
  still bites: imagination rollouts of length $\gg 100$ degrade
  quickly. Dreamer compensates with frequent re-grounding in
  real states.
- Reconstruction-based training spends capacity on irrelevant
  visual detail. JEPA-style joint-embedding (LeCun 2022) is the
  alternative that may eventually replace it.
- The latent state is not identifiable
  ([latent-world-model-identifiability](../theorems/latent-world-model-identifiability.md))
  and not interpretable. Two independently trained Dreamers on
  the same task have unrelated latent representations.
