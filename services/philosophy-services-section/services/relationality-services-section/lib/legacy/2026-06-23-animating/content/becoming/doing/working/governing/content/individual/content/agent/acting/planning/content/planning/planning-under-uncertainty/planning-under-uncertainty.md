---
type: concept
class: foundational
status: stable
depends-on:
  - classical-planning.md
see-also:
  - monte-carlo-tree-search.md
  - plan-execution-monitoring.md
  - ../../reinforcement-learning/concepts/markov-decision-process.md
references:
  - references/ghallab-nau-traverso2016.md
---

# Planning under uncertainty

**Planning under uncertainty** is the family of formalisms that relax classical planning's assumptions of determinism and full observability.
It encompasses several distinct sub-paradigms, distinguished by *what* is uncertain and *when* the uncertainty is resolved.

## The taxonomy

| Paradigm | Action effects | Initial state | Observations during execution |
|---|---|---|---|
| Classical | Deterministic | Known | Full / not needed |
| Conformant | Nondeterministic | Uncertain | None |
| Contingent | Nondeterministic | Uncertain | Partial |
| MDP planning | Stochastic | Known | Full |
| POMDP planning | Stochastic | Uncertain | Partial |

Each paradigm changes the *type* of plan the planner must produce and the *nature* of the search space.

## Conformant planning

Plan with no execution-time observations.
The plan is a single *action sequence* that must achieve the goal *for every possible* initial state and *every possible* nondeterministic outcome.
The plan is a sequence (no branching) but its correctness must hold under all uncertainty resolutions.

Computationally harder than classical planning by one quantifier alternation: classical asks $\exists \pi \forall \text{(nothing)}$; conformant asks $\exists \pi \forall \text{(initial states, outcomes)}$.

## Contingent planning

Plan with execution-time partial observations.
The plan is a *policy tree* or *contingent graph*: at each step, the agent observes some features of the state and branches the plan accordingly.
Each leaf of the tree must achieve the goal under the corresponding observation sequence.

The plan-tree size can grow exponentially in the depth and number of observable features; tractable contingent planning typically requires strong domain structure.

## MDP planning

Stochastic dynamics, full observability, known model.
The plan is a *policy* $\pi: S \to A$ (or $\pi: S \to \mathrm{Dist}(A)$).
The planner computes the optimal policy by solving the Bellman equations via value iteration, policy iteration, or related dynamic-programming algorithms.

This is the substrate of model-based reinforcement learning when the model is given.
When the model is not given, the agent must learn it from interaction (see the [reinforcement-learning theory](../../reinforcement-learning/_index.md)).

## POMDP planning

Stochastic dynamics, partial observability, known model.
The plan is a policy over *belief states*: probability distributions over the true underlying state.
The belief state is a sufficient statistic for optimal action under the POMDP; the optimal policy can be expressed as a piecewise-linear convex function over belief space.

POMDP planning is in general PSPACE-hard for finite horizons and undecidable for infinite horizons.
Approximate techniques — point-based value iteration (PBVI), belief-space sampling, Monte Carlo tree search over beliefs (POMCP) — are the practical recourse.

## Why this matters

Real environments do not satisfy classical planning's restrictions.
Every deployable planning system addresses uncertainty in some form; the question is which form and how rigorously.
Production implementations often use:

- **Replanning**: plan classically against the current best estimate; re-plan when observations contradict the plan.
  See [plan-execution-monitoring](plan-execution-monitoring.md).
- **MDP/POMDP approximation**: solve a coarse-grained MDP/POMDP for policy structure; refine details by classical planning at execution time.
- **Sampling-based**: MCTS or POMCP, which handle uncertainty by averaging over sampled outcomes rather than reasoning analytically.

## Connection to RL

Planning under uncertainty is the *known-model* counterpart of reinforcement learning.
In an MDP with known dynamics, planning (value iteration) and learning (Q-learning) converge to the same optimal policy; planning is generally more sample-efficient because it uses the model directly rather than estimating it from interaction.

The boundary blurs in **model-based RL**: the agent learns the model from interaction, then plans against the learned model.
The planning component is then identical to MDP planning; the novelty is in the model-learning component.
See [planning-vs-learning](teaching/explanations/planning-vs-learning.md).

## Connection to LLM planning

LLM-based agents in real environments are nearly always operating under uncertainty: the LLM's "model" of the environment is its prior probability distribution over completions, which is substantially more uncertain than a typical MDP model.
Inference-time LLM search is therefore more closely related to POMCP / sampling-based POMDP planning than to classical planning, in spite of the classical-search vocabulary often used to describe it.
