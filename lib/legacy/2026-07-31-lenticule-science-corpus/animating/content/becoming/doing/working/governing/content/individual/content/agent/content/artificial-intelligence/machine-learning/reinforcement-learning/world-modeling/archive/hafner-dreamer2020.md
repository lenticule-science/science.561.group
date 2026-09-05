---
type: reference
class: foundational
status: active
authors: ["Danijar Hafner", "Timothy Lillicrap", "Jimmy Ba", "Mohammad Norouzi"]
year: 2020
venue: "ICLR"
title: "Dream to Control: Learning Behaviors by Latent Imagination"
---

# Hafner et al. 2020 — Dreamer

Hafner, D., Lillicrap, T., Ba, J., & Norouzi, M. (2020). Dream
to Control: Learning Behaviors by Latent Imagination. *ICLR
2020*.

Introduces Dreamer: a deep latent-dynamics model (RSSM) trained
from pixels, with policy and value networks trained by
backpropagation through imagined trajectories in latent space.
Achieves state-of-the-art sample efficiency on continuous-control
tasks, demonstrating that latent imagination can outperform
both pixel-prediction model-based methods and model-free
baselines.

Cited by:
[latent-world-model](teaching/explanations/latent-world-model.md),
[dreamer-style-world-model](teaching/explanations/dreamer-style-world-model.md),
[imagination-rollout](../objects/imagination-rollout.md),
[imagination](../morphisms/imagination.md),
[model-based-policy-improvement](../morphisms/model-based-policy-improvement.md),
[model-error-compounds](../theorems/model-error-compounds.md),
[from-mdp-to-world-model](teaching/explanations/from-mdp-to-world-model.md).
