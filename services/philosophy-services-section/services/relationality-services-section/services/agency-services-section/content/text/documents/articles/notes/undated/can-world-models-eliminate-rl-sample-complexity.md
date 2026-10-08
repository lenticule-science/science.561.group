---
type: question
class: open
status: partial
depends-on:
  - teaching/explanations/model-based-rl.md
  - ../theorems/model-based-sample-complexity.md
see-also:
  - ../theorems/model-error-compounds.md
references:
  - references/sutton-dyna1991.md
  - references/hafner-dreamerv3-2023.md
title: Can world models eliminate RL sample complexity?
description: Can a sufficiently good world model reduce the sample complexity of reinforcement learning to a small constant times the cost of learning the model itself, eliminating the further-sample- intensive policy-learning step?
---

# Can world models eliminate RL sample complexity?

## The question

Can a sufficiently good world model reduce the sample complexity
of reinforcement learning to a small constant times the cost of
*learning the model itself*, eliminating the further-sample-
intensive policy-learning step? Or does the compounding-error
limit fundamentally constrain how much sample-complexity
advantage model-based methods can extract?

## Why it is partial-status open

The theoretical bound is encouraging: under realizability,
[model-based-sample-complexity](model-based-sample-complexity.md)
shows model-based RL achieves the minimax-optimal sample
complexity in tabular MDPs, often with strictly better horizon
dependence than model-free methods.

The empirical evidence is more modest. State-of-the-art deep
MBRL (DreamerV3, MuZero) achieves 2–10× sample-efficiency
gains over model-free baselines on standard benchmarks, not the
asymptotic ideal. The gap is attributed to:

- **Realizability failure.** Deep models do not contain the
  true dynamics; the realizability assumption that makes the
  bound tight is violated.
- **Compounding error.** Even when the model is accurate
  per-step, [model-error-compounds](model-error-compounds.md)
  bounds the useful planning horizon. Beyond that horizon,
  imagination no longer improves the policy.
- **Distribution shift.** Models trained on early-policy data
  are inaccurate on later-policy data; continual model-
  retraining costs samples.
- **Exploration.** Even with a perfect model, the agent must
  visit the state space to know what's there. Pure imagination
  cannot discover unvisited regions.

## What would resolve it

- **Tighter realizability conditions.** Under what assumptions
  on the model class and the true dynamics is the
  realizability gap small in practice? This is a question
  about the *structural prior* of effective model classes
  (compositional, locally smooth, object-centric, ...).
- **Better trust-region methods.** If the policy can be
  reliably constrained to the model's trust region, the
  compounding-error penalty does not bite. The empirical
  question is how tightly trust regions can be characterized.
- **Theory matching empirical scaling.** Empirical sample-
  efficiency curves of MBRL methods should be derivable from a
  theoretical model that captures the realizability gap and
  the on-policy distribution shift. Currently they are not.
- **Regimes of dominance.** Identify formally when MBRL beats
  model-free by large margins (likely: stochastic but
  predictable dynamics, sparse rewards, expensive interaction)
  and when not (chaotic dynamics, dense rewards, cheap
  interaction).

## Why it matters

The answer determines whether the natural trajectory for sample-
expensive domains (robotics, autonomous vehicles, scientific
discovery) is increasingly model-based — with most policy
improvement happening in imagination — or whether model-free
methods with cleverer exploration ultimately dominate. The
former rewards investment in model architecture and training
infrastructure; the latter rewards investment in environment-
interaction throughput. The current evidence supports the
former but not as decisively as the realizability bound suggests
it could.
