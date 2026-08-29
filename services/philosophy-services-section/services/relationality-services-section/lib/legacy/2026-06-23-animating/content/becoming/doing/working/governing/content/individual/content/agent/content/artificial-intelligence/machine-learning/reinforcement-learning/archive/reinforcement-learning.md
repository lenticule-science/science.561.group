---
title: "Reinforcement Learning"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: >
  The formal study of sequential decision-making by agents that learn from
  scalar reward signals. The theory covers the mathematical substrate
  (Markov decision processes, Bellman optimality, value functions and
  policies), the classical convergence results for tabular and
  function-approximation algorithms (Q-learning, SARSA, policy gradient,
  actor-critic), and the structural pathologies that arise when reward
  signals are learned from human preferences rather than specified
  directly (reward hacking, specification gaming, reward-model
  overoptimization). It engages both the classical literature
  (Bellman 1957, Sutton-Barto 2018, Watkins 1989) and the contemporary
  RLHF/alignment critique (Amodei et al. 2016, Skalse et al. 2022,
  Casper et al. 2023, Gao et al. 2023).
position: >
  This theory is a sibling of [agents](../agents/_index.md) and
  [swarm-intelligence](../swarm-intelligence/_index.md) within the
  artificial-intelligence branch. Where the agents theory addresses
  coordination among multiple deliberative agents and swarm-intelligence
  addresses coordination among many simple agents, reinforcement-learning
  addresses how a single agent (or learner) updates its policy in
  response to environmental reward. The three theories compose: an RL
  agent can be one node in an orchestrated multi-agent system (agents
  theory) or one particle in a swarm (swarm-intelligence theory). The
  reinforcement-learning theory provides the formal substrate for "how
  an agent improves" that the other two theories assume but do not
  develop. The theory is positioned to coordinate with the math-side
  bilattice-valued-progress study plan in predication-categories
  without depending on it.
---

The reinforcement-learning theory gives formal structure to the family
of learning systems whose policies are updated through interaction with
an environment that returns scalar reward. It answers four questions
precisely:

**What is the formal substrate of reinforcement learning?** A Markov
decision process: a tuple of states, actions, transition kernel,
reward function, and discount factor. The agent's task is to choose a
policy that maximizes expected discounted return. The Bellman optimality
equation characterizes the optimal value function as the unique fixed
point of the Bellman optimality operator. See
[markov-decision-process](concepts/markov-decision-process.md) and
[bellman-optimality](theorems/bellman-optimality.md).

**When does a reinforcement-learning algorithm converge?** Tabular
Q-learning converges to the optimal action-value function with
probability one under the standard Robbins–Monro step-size conditions
and infinite visitation of every state-action pair (Watkins–Dayan 1992).
The policy-gradient theorem (Sutton et al. 2000) gives an unbiased
estimator of the policy-performance gradient, supporting convergence
of stochastic-gradient policy optimization to a stationary point under
standard conditions. Function approximation breaks both guarantees in
general; the deadly triad (off-policy learning, function approximation,
bootstrapping) can produce divergence. See
[q-learning-convergence](theorems/q-learning-convergence.md) and
[policy-gradient-theorem](theorems/policy-gradient-theorem.md).

**Why does RLHF training of LLM agents exhibit reward hacking and
specification gaming?** A learned reward model is a proxy for the
human-preference distribution; optimizing the policy against the
proxy is mathematically equivalent to Goodhart's law applied to the
proxy. Skalse et al. (2022) give a precise definition of reward
hacking and prove its inevitability for any non-trivial reward
proxy under sufficiently strong optimization. The RLHF pipeline is
a particularly clean case: the proxy is explicitly learned and the
optimizer is explicitly strong. See
[reward-hacking-inevitability](theorems/reward-hacking-inevitability.md)
and
[rlhf-overoptimization](theorems/rlhf-overoptimization.md).

**What does the reinforcement-learning regime buy that imitation
learning and direct optimization do not?** Reinforcement learning
makes the agent's behavior dependent on consequences, not on
demonstrations of correct behavior, allowing the agent to discover
policies that no demonstrator could exhibit. The cost is that the
reward signal must be either specified by hand (vulnerable to
specification gaming) or learned from feedback (vulnerable to
reward-model overoptimization). See
[reward-vs-imitation-tradeoff](narratives/reward-vs-imitation-tradeoff.md).

## Structure

- **[concepts/](concepts/_index.md)** — semantic anchors: MDPs,
  rewards, policies, value functions, exploration-exploitation,
  the deadly triad, RLHF.
- **[objects/](objects/_index.md)** — defined structures: MDP,
  policy, value function, replay buffer, reward model, trajectory.
- **[morphisms/](morphisms/_index.md)** — operators: Bellman backup,
  policy improvement, TD update, importance sampling, policy-gradient
  step.
- **[theorems/](theorems/_index.md)** — proved claims grounded in
  the classical literature and in the 2022–2025 RLHF critique.
- **[narratives/](narratives/_index.md)** — rhetorical walk-throughs.
- **[references/](references/_index.md)** — annotated bibliography.
- **[questions/](questions/_index.md)** — open problems and research
  targets.

## Relationship to the agents and swarm-intelligence theories

The reinforcement-learning theory provides the substrate for "how a
single agent learns" that the other two AI theories use without
developing. An agent in the [agents theory](../agents/_index.md)
sense (a deliberative LLM-based agent in an orchestrated topology) is
typically not trained by classical RL during deployment, but the LLM
policy at the heart of such an agent was, in current 2026 practice,
trained with [RLHF](concepts/rlhf.md). The pathologies established in
[reward-hacking-inevitability](theorems/reward-hacking-inevitability.md)
and [rlhf-overoptimization](theorems/rlhf-overoptimization.md)
therefore propagate into the agents theory: an RLHF-trained LLM
inside an orchestrated multi-agent system inherits the proxy-reward
pathologies of its training pipeline.

A particle in the [swarm-intelligence theory](../swarm-intelligence/_index.md)
sense executes a fixed local rule rather than a learned policy.
Reinforcement learning over a swarm (multi-agent reinforcement learning,
MARL) is a different regime: each particle updates its policy from
reward, and the swarm-coordinated conditions of homogeneity and
local-rule determinism interact non-trivially with the individual
learning dynamics. See
[multi-agent-rl-as-swarm](questions/multi-agent-rl-as-swarm.md).
