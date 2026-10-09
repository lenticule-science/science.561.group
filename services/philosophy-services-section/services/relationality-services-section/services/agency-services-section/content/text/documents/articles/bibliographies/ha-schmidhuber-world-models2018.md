---
type: reference
class: foundational
status: active
authors: ["David Ha", "Jürgen Schmidhuber"]
year: 2018
venue: "NeurIPS"
title: "World Models"
description: Ha, D., & Schmidhuber, J.
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
[latent-world-model](../../../glossary/concepts/latent-world-model.md),
[dreamer-style-world-model](../../../glossary/concepts/dreamer-style-world-model.md),
[imagination-rollout](../notes/undated/imagination-rollout.md),
[imagination](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/world-modeling/morphisms/imagination.md),
[latent-state-space](../notes/undated/latent-state-space.md),
[latent-inference](../notes/undated/latent-inference.md),
[latent-world-model-identifiability](../notes/undated/latent-world-model-identifiability.md),
[from-mdp-to-world-model](../notes/undated/from-mdp-to-world-model.md).
