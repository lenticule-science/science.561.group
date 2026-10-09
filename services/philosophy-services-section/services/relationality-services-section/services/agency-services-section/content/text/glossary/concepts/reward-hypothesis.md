---
type: concept
class: semantic-anchor
status: contested
see-also:
  - markov-decision-process.md
  - rlhf.md
  - ../theorems/reward-hacking-inevitability.md
  - teaching/explanations/why-reward-hacking-happens.md
references:
  - references/sutton-barto2018.md
  - references/skalse-reward-hacking2022.md
  - references/amodei-concrete-problems2016.md
title: Reward hypothesis
description: The reward hypothesis is the claim, attributed to Sutton, that "all of what we mean by goals and purposes can be well thought of as the maximization of the expected value of the cumulative sum of a received scalar signal (reward)."…
---

# Reward hypothesis

The **reward hypothesis** is the claim, attributed to Sutton, that
"all of what we mean by goals and purposes can be well thought of as
the maximization of the expected value of the cumulative sum of a
received scalar signal (reward)." Reinforcement learning takes the
reward hypothesis as its working premise: the agent's task is reduced
to a scalar-reward maximization problem, and the structure of an
MDP follows.

The reward hypothesis is **load-bearing** for the entire RL framework.
Without it, the Bellman recursion has no objective to optimize and the
convergence theorems lose their meaning.

## Status as of 2026

The reward hypothesis is contested in three distinct ways:

**Specification difficulty.** Even granting that the agent's goal can
*in principle* be expressed as scalar reward, specifying the actual
reward function for any non-toy task is an open problem. The
[reward-hacking-inevitability](../../documents/articles/notes/undated/reward-hacking-inevitability.md)
theorem makes precise the cost of misspecification.

**Multi-objective irreducibility.** Some authors argue that genuinely
multi-objective tasks (e.g. balancing safety, helpfulness, and
truthfulness in an LLM assistant) cannot be reduced to scalar reward
without losing essential structure. Scalarizing destroys Pareto
information.

**Preference-based formulations.** [RLHF](rlhf.md) sidesteps direct
reward specification by learning a reward model from human preference
comparisons. This avoids the specification problem at the cost of
introducing the reward-model approximation problem and the
[rlhf-overoptimization](../../documents/articles/notes/undated/rlhf-overoptimization.md)
pathology.

The reward hypothesis remains the default working assumption of the
field but is not unchallenged. Theories that drop it (preference-based
RL, multi-objective RL, constrained MDPs) form active research
programs.
