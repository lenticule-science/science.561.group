---
type: reference
class: foundational
status: active
authors: ["David Ha", "Jürgen Schmidhuber"]
year: 2018
venue: "NeurIPS"
title: "World Models"
---

# Ha & Schmidhuber 2018 — World Models

Ha, D., & Schmidhuber, J. (2018). World Models. *Advances in
Neural Information Processing Systems* 31.

The paper that revived deep model-based RL. Demonstrates that a
VAE-encoded latent dynamics model trained from pixels supports
controllers learned *entirely in imagination* — never on real
frames during policy training. Established the pattern that
Dreamer and successors generalize: train a latent world model
from observations; train the policy in latent-space rollouts.

Cited by:
[latent-world-model](teaching/explanations/latent-world-model.md),
[dreamer-style-world-model](teaching/explanations/dreamer-style-world-model.md),
[imagination-rollout](../objects/imagination-rollout.md),
[imagination](../morphisms/imagination.md),
[latent-state-space](../objects/latent-state-space.md),
[latent-inference](../morphisms/latent-inference.md),
[latent-world-model-identifiability](../theorems/latent-world-model-identifiability.md),
[from-mdp-to-world-model](teaching/explanations/from-mdp-to-world-model.md).
