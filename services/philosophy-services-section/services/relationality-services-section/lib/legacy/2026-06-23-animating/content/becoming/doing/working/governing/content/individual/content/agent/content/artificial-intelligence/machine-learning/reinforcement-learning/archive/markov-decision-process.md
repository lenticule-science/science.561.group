---
type: concept
class: semantic-anchor
status: stable
see-also:
  - policy.md
  - value-function.md
  - reward-hypothesis.md
  - ../objects/mdp.md
  - ../theorems/bellman-optimality.md
references:
  - references/bellman1957.md
  - references/sutton-barto2018.md
---

# Markov decision process

A **Markov decision process** (MDP) is the formal substrate over which
reinforcement-learning theory is stated. An MDP is a tuple
$(S, A, P, R, \gamma)$ where $S$ is a set of states, $A$ is a set of
actions, $P : S \times A \to \Delta(S)$ is a transition kernel,
$R : S \times A \to \mathbb{R}$ is a reward function (sometimes
$R : S \times A \times S \to \mathbb{R}$), and $\gamma \in [0, 1)$ is a
discount factor. Time is discrete; at each step the agent observes
the current state, chooses an action, receives a reward, and the
environment transitions to a new state.

The defining property is the **Markov property**: the distribution of
the next state given the current state-action pair is independent of
the history. The Markov property is what makes the Bellman recursion
well-defined and is the load-bearing assumption behind every classical
convergence result in this theory.

The agent's task is to find a [policy](policy.md) maximizing expected
discounted return $\mathbb{E}\big[\sum_{t=0}^{\infty} \gamma^t R(s_t,
a_t)\big]$. The discount factor $\gamma < 1$ guarantees the sum is
finite for bounded reward and biases the agent toward near-term reward.

**Variants and extensions.** Partially observable MDPs (POMDPs) drop the
assumption that the state is directly observed; the agent observes only
emissions and must maintain a belief state. Continuing vs. episodic
MDPs differ in whether the process terminates. Average-reward MDPs
replace the discount factor with an averaging criterion. Each variant
modifies the convergence theory in known ways but does not change the
basic shape of the problem.

**Why this is the right substrate.** The MDP framework is the unique
formalism that simultaneously (i) makes sequential decision-making
mathematically tractable, (ii) admits the dynamic-programming recursion
that gives [bellman-optimality](../theorems/bellman-optimality.md), and
(iii) is broad enough to contain almost every problem the literature
treats as "reinforcement learning." Departures from the MDP framework
(e.g. non-Markovian rewards, adversarial environments, multi-agent
games) generally require explicit re-derivation of any guarantee.
