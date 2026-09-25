---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/world-model.md
  - ../objects/model-error.md
see-also:
  - latent-inference.md
  - teaching/explanations/model-based-rl.md
  - ../theorems/model-based-sample-complexity.md
references:
  - references/sutton-dyna1991.md
  - references/hafner-dreamerv3-2023.md
title: Model learning
description: Model learning is the procedure by which the transition and observation functions of a world model are induced from interaction data.
---

# Model learning

**Model learning** is the procedure by which the transition and
observation functions of a world model are induced from interaction
data. It is the morphism

$$
\text{(transitions)} \;\longrightarrow\; \text{(world model)}
$$

producing a usable [world-model](world-model.md) from
$(s, a, s', r, o)$ tuples.

## Inputs

The data is a set of trajectories
$\tau_i = (s_0^i, a_0^i, r_0^i, o_0^i, s_1^i, \ldots)$
collected from real environment interaction (online RL),
historical logs (offline RL), or expert demonstrations
(behavior cloning of dynamics). The learned object is some
combination of:

- A transition function $\hat{T}_\theta(s' \mid s, a)$.
- An observation function $\hat{O}_\theta(o \mid s)$ (only when
  state is hidden).
- A reward function $\hat{R}_\theta(s, a)$ (when used in RL).
- An encoder $e_\phi(s \mid o)$ or $e_\phi(s \mid o_{1:t})$
  for latent models.

## Training objectives

**Maximum likelihood.** Minimize negative log-likelihood of
observed transitions under the model. The default for transition
learning. Sensitive to the parameterization of the output
distribution (Gaussian assumption, mixture density, etc.).

**Reconstruction.** Minimize reconstruction error of observations
through the encoder-decoder pipeline. The default for autoencoder-
style latent models including Dreamer.

**Prediction-only / JEPA.** Predict the *latent* of next
observation under a target encoder, without reconstructing the
observation itself. Avoids spending capacity on irrelevant
visual detail. LeCun's preferred architecture for self-supervised
world-model learning.

**End-to-end value/reward targets.** As in MuZero: the model's
hidden states are trained to predict observed rewards, values,
and policy targets, with no observation-reconstruction objective.
The model has no obligation to reconstruct anything — only to
support good planning.

## The on-policy distribution problem

Models trained on data from policy $\pi_0$ may be inaccurate on
states visited by improved policy $\pi_1$. This is *covariate
shift* applied to dynamics learning. Standard remediations:

- **Continual data collection.** Update the model on data from
  the current policy.
- **Pessimism.** Penalize the policy for visiting states the
  model is uncertain about — keeps the policy in the trust
  region.
- **Optimism for exploration.** The dual: encourage visits to
  uncertain states to gather data the model needs.

## Sample complexity

Under realizability and standard regularity conditions, learning
a transition function on $S \times A$ requires $\tilde{O}(|S||A|/
\epsilon^2)$ samples to achieve $\epsilon$ TV-distance error per
state-action pair. This is the basis of the
[model-based-sample-complexity](model-based-sample-complexity.md)
advantage over model-free methods. In practice realizability is
the binding assumption; with deep models on natural environments
the realizability gap tends to dominate the sample-complexity
advantage.
