---
type: reference
class: foundational
status: active
authors: ["Julian Schrittwieser", "Ioannis Antonoglou", "Thomas Hubert", "Karen Simonyan", "Laurent Sifre", "Simon Schmitt", "Arthur Guez", "Edward Lockhart", "Demis Hassabis", "Thore Graepel", "Timothy Lillicrap", "David Silver"]
year: 2020
venue: "Nature"
title: "Mastering Atari, Go, Chess and Shogi by Planning with a Learned Model"
description: Schrittwieser, J., Antonoglou, I., Hubert, T., Simonyan, K., Sifre, L., Schmitt, S., Guez, A., Lockhart, E., Hassabis, D., Graepel, T., Lillicrap, T., & Silver, D.
---

# Schrittwieser et al. 2020 — MuZero

Schrittwieser, J., Antonoglou, I., Hubert, T., Simonyan, K.,
Sifre, L., Schmitt, S., Guez, A., Lockhart, E., Hassabis, D.,
Graepel, T., Lillicrap, T., & Silver, D. (2020). Mastering
Atari, Go, Chess and Shogi by Planning with a Learned Model.
*Nature*, 588, 604–609.

Demonstrates that MCTS-based planning combined with a *learned*
latent dynamics model — trained end-to-end on reward, value, and
policy targets without any observation-reconstruction objective —
achieves state-of-the-art across board games and Atari. Removes
the assumption (held by AlphaZero predecessors) that a perfect
simulator is required for tree-search-based planning.

Cited by:
[model-based-policy-improvement](../notes/undated/model-based-policy-improvement.md),
[model-based-rl](../../../glossary/concepts/model-based-rl.md),
[from-mdp-to-world-model](../notes/undated/from-mdp-to-world-model.md).
