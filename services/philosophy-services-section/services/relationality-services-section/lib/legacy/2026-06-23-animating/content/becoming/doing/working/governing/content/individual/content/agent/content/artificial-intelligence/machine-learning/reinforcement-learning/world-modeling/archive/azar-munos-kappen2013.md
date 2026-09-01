---
type: reference
class: foundational
status: active
authors: ["Mohammad Gheshlaghi Azar", "Rémi Munos", "Hilbert J. Kappen"]
year: 2013
venue: "Machine Learning"
title: "Minimax PAC Bounds on the Sample Complexity of Reinforcement Learning with a Generative Model"
---

# Azar, Munos & Kappen 2013 — Minimax PAC bounds for RL

Azar, M. G., Munos, R., & Kappen, H. J. (2013). Minimax PAC
Bounds on the Sample Complexity of Reinforcement Learning with
a Generative Model. *Machine Learning*, 91(3), 325–349.

Establishes the minimax-optimal sample complexity for tabular
RL under generative-model access:
$\tilde{\Theta}(|S||A|H^3/\epsilon^2)$ samples per state-action
pair are necessary and sufficient to identify an
$\epsilon$-optimal policy. The plug-in model-based estimator —
build the empirical MDP from samples, plan optimally — achieves
the upper bound. Foundational for any modern claim about
model-based RL sample complexity.

Cited by:
[model-based-sample-complexity](../theorems/model-based-sample-complexity.md).
