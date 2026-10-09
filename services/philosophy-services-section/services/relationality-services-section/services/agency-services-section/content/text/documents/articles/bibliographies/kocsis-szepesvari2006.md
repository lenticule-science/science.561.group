---
type: reference
class: foundational
status: published
year: 2006
authors: ["Kocsis, Levente", "Szepesvári, Csaba"]
title: Kocsis & Szepesvári 2006
description: Bandit Based Monte-Carlo Planning.
---

# Kocsis & Szepesvári 2006

**Bandit Based Monte-Carlo Planning.** In: Machine Learning: ECML 2006, Lecture Notes in Computer Science 4212, pp.
282–293.
Springer.

## What the paper does

Introduces the UCT (Upper Confidence bounds applied to Trees) algorithm: Monte Carlo tree search with UCB1 as the tree-policy selection rule.
Proves that UCT converges to the optimal action at the root of a finite-horizon MDP, with logarithmic regret growth.

## Key contributions

1. **The UCT algorithm.** Combine bandit-based exploration (UCB1) with rollout-based value estimation in a tree search.
  Each node in the tree is treated as a bandit problem over its children; the tree policy uses UCB1 to balance exploration and exploitation.
2. **Convergence proof.** UCT's value estimate at the root converges to the true optimal value; its action selection converges in probability to the optimal action.
3. **Logarithmic regret.** Per-step regret grows only logarithmically in the number of simulations.
4. **Generality.** UCT requires only a simulator (the ability to sample next states) and rewards on terminal states; no analytic model or admissible heuristic is needed.

## Why this paper matters

UCT was the algorithmic kernel of the AlphaGo / AlphaZero family that achieved superhuman performance in Go and other strategic games.
Beyond games, UCT and its variants are widely used in planning under uncertainty, automated theorem proving, robotics, and (with extensions) inference-time search in LLMs.

The paper established that *anytime convergence to optimality is achievable without explicit heuristics* — a substantial departure from the heuristic-search tradition.
This made planning tractable in domains (huge branching, weak heuristics) where systematic search had been hopeless.

## Cited where

- [monte-carlo-tree-search](../../../glossary/concepts/monte-carlo-tree-search.md) — primary reference.
- [uct-convergence](../notes/undated/uct-convergence.md) — the convergence theorem proved here.
- [simulation-rollout](../notes/undated/simulation-rollout.md) — for the rollout-based value estimation pattern.
- [inference-time-compute-tradeoff](../notes/undated/inference-time-compute-tradeoff.md) — UCT's convergence is a particular instance of the general inference-time-compute tradeoff.
