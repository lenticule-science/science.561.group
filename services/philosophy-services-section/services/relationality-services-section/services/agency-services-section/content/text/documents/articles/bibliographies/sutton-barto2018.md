---
type: reference
class: textbook
status: stable
title: "Sutton & Barto 2018 — Reinforcement Learning: An Introduction (2nd ed.)"
description: Sutton, Richard S., and Andrew G.
---

# Sutton & Barto 2018 — Reinforcement Learning: An Introduction (2nd ed.)

Sutton, Richard S., and Andrew G. Barto. *Reinforcement Learning: An
Introduction*. 2nd edition. MIT Press, 2018.

The canonical textbook of reinforcement learning. Covers MDPs, dynamic
programming, Monte Carlo methods, TD-learning, eligibility traces,
function approximation, policy gradient, and the deadly triad. Free
PDF is officially distributed by the authors at incompleteideas.net.

The book is structured around three families of algorithms: Monte
Carlo, dynamic programming, and TD-learning. The unifying view is
**generalized policy iteration**: every algorithm interleaves
evaluation and improvement, and they differ in *how* the evaluation
and improvement steps are realized.

The book is the source for the canonical formulations of:

- The Bellman equations and operators (used throughout this theory)
- Q-learning, SARSA, and the TD($\lambda$) family ([td-update](../notes/undated/td-update.md))
- The policy-gradient theorem in textbook form ([policy-gradient-theorem](../notes/undated/policy-gradient-theorem.md))
- The deadly triad ([deadly-triad](../../../glossary/concepts/deadly-triad.md))
- The exploration-exploitation tradeoff ([exploration-exploitation](../../../glossary/concepts/exploration-exploitation.md))

Cited from essentially every concept, object, morphism, and theorem
in this theory. The principal background reference for anyone reading
this theory cold.
