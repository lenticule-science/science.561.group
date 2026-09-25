---
type: concept
class: classical
status: active
depends-on:
  - forward-model.md
see-also:
  - dreamer-style-world-model.md
  - ../objects/imagination-rollout.md
  - ../morphisms/model-based-policy-improvement.md
  - ../theorems/model-based-sample-complexity.md
  - ../theorems/dyna-convergence.md
references:
  - references/sutton-dyna1991.md
  - references/hafner-dreamerv3-2023.md
  - references/schrittwieser-muzero2020.md
title: Model-based reinforcement learning
description: Model-based reinforcement learning (MBRL) is the family of RL methods that maintain an explicit world model and use it for some combination of planning, value computation, or training data augmentation.
---

# Model-based reinforcement learning

**Model-based reinforcement learning (MBRL)** is the family of RL
methods that maintain an explicit world model and use it for some
combination of planning, value computation, or training data
augmentation. It contrasts with *model-free* RL (Q-learning,
policy gradient) which learns the value function or policy directly
from environment interaction without modeling dynamics.

## The principal architectures

**Dyna** (Sutton 1991). Interleave three operations:
1. Real interaction with the environment, updating both the value
   function and the world model.
2. Model-based planning: sample a state-action pair, apply the
   model to predict next-state and reward, perform a Bellman
   update.
3. Repeat. The value function thus benefits from both real and
   simulated experience. See
   [dyna-convergence](../../documents/articles/notes/undated/dyna-convergence.md).

**Model-predictive control (MPC).** At each timestep, plan a
short-horizon action sequence using the model, execute the first
action, then re-plan. Avoids horizon-compounding error by
re-planning frequently. The dominant approach in continuous-control
robotics.

**Imagination-augmented agents** (Dreamer family). Train a latent
world model. Generate long trajectories in latent space
("imagination rollouts"). Train policy and value networks
*entirely on imagined trajectories*, using reality only to update
the model and provide grounding samples. See
[imagination](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/world-modeling/morphisms/imagination.md).

**Tree search with learned models** (MuZero). Combine MCTS
([planning](monte-carlo-tree-search.md))
with a learned latent dynamics model. The model is trained
end-to-end with reward and value prediction targets — no
observation reconstruction. State-of-the-art in board games and
Atari without a given simulator.

## The sample-complexity argument

The classical motivation for MBRL is sample efficiency. Under
the realizability assumption (the model class contains the true
dynamics), MBRL can in principle achieve sample complexity
$\tilde{O}(|S|^2 |A| / \epsilon^2)$ — the cost of learning the
model — independent of horizon, while model-free methods
typically pay an additional horizon factor. See
[model-based-sample-complexity](../../documents/articles/notes/undated/model-based-sample-complexity.md).

In practice the realizability assumption is rarely met. Deep
model-based methods (Dreamer, MuZero) pay for model error with
performance loss that compounds over the planning horizon
([model-error-compounds](../../documents/articles/notes/undated/model-error-compounds.md)),
and the empirical sample-complexity advantage over model-free
methods is real but more modest than the realizability bound
suggests — typically a factor of 2–10× rather than the asymptotic
ideal.

## When MBRL pays off

MBRL is most valuable when:
- Real-environment interaction is **expensive** (robotics,
  autonomous vehicles, drug discovery) so model-based imagination
  is much cheaper than additional samples.
- The dynamics are **learnable from limited data** — moderate-
  dimensional, locally smooth, weakly stochastic.
- The planning horizon is **short or amenable to re-planning** so
  compounding model error doesn't dominate.

It is least valuable when dynamics are extremely high-dimensional,
chaotic, or when a near-perfect simulator is already available
(in which case the simulator is the model and the question is
sim-to-real, not MBRL).
