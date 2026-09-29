---
type: object
class: contemporary
status: active
depends-on:
  - agent-population.md
see-also:
  - teaching/explanations/equilibrium-concept.md
  - teaching/explanations/multi-agent-system.md
references: []
---

# Joint policy

A **joint policy** in a multi-agent system is a combined strategy specification across all agents — a function mapping joint observation histories to joint action distributions.
It is the multi-agent generalization of a single-agent policy.

## Structure

For an $n$-agent system with per-agent observation spaces $O_i$ and action spaces $A_i$:

- A *single-agent policy* for agent $i$ is $\pi_i : O_i \to \Delta(A_i)$.
- A *joint policy* is $\boldsymbol{\pi} = (\pi_1, \ldots, \pi_n)$, with each agent's policy specified.
- A *centralized joint policy* is $\boldsymbol{\pi} : O_1 \times \cdots \times O_n \to \Delta(A_1 \times \cdots \times A_n)$ — a single function over joint observations and joint actions, used when agents can be treated as a single combined decision-maker.

## Decentralized vs centralized

A central distinction:

- **Decentralized joint policy** — each agent has its own policy depending only on its local observations.
  Realistic for distributed multi-agent systems.
- **Centralized joint policy** — a single policy can condition on all agents' observations jointly.
  Idealized for analysis; sometimes feasible during training but not deployment.

The "centralized training, decentralized execution" paradigm in multi-agent RL trains a centralized policy then deploys decentralized projections of it.

## Equilibria as joint policies

[Equilibrium concepts](teaching/explanations/equilibrium-concept.md) characterize joint policies that are stable.
Nash equilibrium: no agent can improve unilaterally given others' policies.
The set of equilibrium joint policies is the multi-agent analog of single-agent optimal policies.

## Joint vs marginal optimality

A joint policy may be:

- **Pareto optimal** — no joint policy improves all agents simultaneously.
- **Socially optimal** — maximizes total welfare (sum of agent utilities).
- **Nash equilibrium** — stable to unilateral deviation.

These often disagree:

- The Pareto frontier may not coincide with Nash equilibria.
- Social optimum may not be a Nash equilibrium (prisoner's dilemma is the canonical example).
- The [price-of-anarchy](../theorems/price-of-anarchy.md) measures the gap between worst Nash and social optimum.

## Joint policy spaces

The joint policy space is the *Cartesian product* of per-agent policy spaces — exponentially larger than any single agent's.
Search and learning in this space face combinatorial explosion.
This is why centralized analysis of multi-agent systems is hard and why decentralized approximations (independent learners, partial-information methods) dominate practice.

## In contemporary systems

Joint policies in LLM agent orchestration are typically:

- **Implicit.** Defined by the orchestration framework and agent prompts rather than explicitly written.
- **Asymmetric.** Different agents have different roles, policies, and capabilities.
- **Dynamic.** Joint behavior may change as agents update prompts, retrieve different context, or invoke different tools.

The classical joint-policy formalism applies imperfectly; contemporary multi-agent AI systems are often analyzed at the orchestration-pattern level rather than the joint- policy level.
