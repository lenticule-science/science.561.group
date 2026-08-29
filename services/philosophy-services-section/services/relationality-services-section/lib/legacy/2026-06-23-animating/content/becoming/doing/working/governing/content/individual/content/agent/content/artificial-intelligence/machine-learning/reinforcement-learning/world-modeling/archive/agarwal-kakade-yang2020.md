---
type: reference
class: foundational
status: active
authors: ["Alekh Agarwal", "Sham Kakade", "Lin F. Yang"]
year: 2020
venue: "COLT"
title: "Model-Based Reinforcement Learning with a Generative Model is Minimax Optimal"
---

# Agarwal, Kakade & Yang 2020 — Model-based RL is minimax optimal

Agarwal, A., Kakade, S., & Yang, L. F. (2020). Model-Based
Reinforcement Learning with a Generative Model is Minimax
Optimal. *Conference on Learning Theory (COLT)*.

Sharpens the minimax sample complexity of plug-in model-based
RL: the empirical MDP yields an $\epsilon$-optimal policy with
$\tilde{O}(|S||A|H^3/\epsilon^2)$ samples per state-action,
matching the lower bound across the full $\epsilon$-range
(removing prior small-$\epsilon$ restrictions). Demonstrates
that the model-based plug-in approach is not just sample-
efficient but minimax-optimal up to log factors.

Cited by:
[model-based-sample-complexity](../theorems/model-based-sample-complexity.md).
