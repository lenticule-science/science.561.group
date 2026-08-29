---
type: narrative
class: rhetorical-walkthrough
status: stable
see-also:
  - ../teaching/explanations/markov-decision-process.md
  - ../teaching/explanations/rlhf.md
  - ../theorems/bellman-optimality.md
  - ../theorems/rlhf-overoptimization.md
references:
  - ../references/bellman1957.md
  - ../references/sutton-barto2018.md
  - ../references/christiano-rlhf2017.md
  - ../references/gao-overoptimization2023.md
---

# From Bellman to RLHF

The arc of reinforcement learning from Bellman's 1957 dynamic
programming to the 2023 RLHF pipeline traces a single mathematical
idea — sequential decision-making by value iteration — through three
regimes that progressively trade theoretical guarantees for practical
applicability.

## Regime 1: Dynamic programming (1950s–1980s)

Bellman's *Dynamic Programming* (1957) introduced the Bellman equation
and the value-iteration algorithm. The setting was small,
fully-known [MDPs](../objects/mdp.md): the agent has access to the
transition kernel $P$ and reward function $R$ and computes the
optimal value function by repeated application of the
[bellman-backup](../morphisms/bellman-backup.md). The
[bellman-optimality](../theorems/bellman-optimality.md) theorem
guarantees this works.

The limitation is the requirement of a known model. For most
real-world problems the model is not known and may not be
representable in closed form even if known.

## Regime 2: Tabular learning (1980s–1990s)

Sutton's TD-learning (1988), Watkins's Q-learning (1989), and the
SARSA algorithm shifted the paradigm from "compute the value function
from the model" to "estimate the value function from samples." The
agent no longer needs the model; it interacts with the environment,
observes transitions, and updates its value estimates by
[td-update](../morphisms/td-update.md).

The [q-learning-convergence](../theorems/q-learning-convergence.md)
theorem (Watkins–Dayan 1992) showed that this works in finite MDPs
with sufficient exploration. The agent can learn an optimal policy
without ever knowing the model.

The limitation is the tabular assumption: every state-action pair
gets its own table entry. For state spaces of any practical size
this is computationally infeasible.

## Regime 3: Function approximation (1990s–2010s)

Replacing the value table with a parameterized function — linear
features, then neural networks — addressed the scaling problem.
TD-Gammon (Tesauro 1995) was an early demonstrator: a neural-network
value function trained by self-play TD-learning achieved world-class
backgammon play. DQN (Mnih et al. 2015) generalized the recipe to
Atari games.

The cost was theoretical: the [deadly-triad](../teaching/explanations/deadly-triad.md)
of function approximation, bootstrapping, and off-policy data can
diverge ([deadly-triad-divergence](../theorems/deadly-triad-divergence.md)).
The DQN-era engineering toolkit — replay buffers, target networks,
gradient clipping — empirically contains the divergence without
proving it cannot occur. The "deep RL" of the 2010s ran in this regime.

## Regime 4: Policy gradient at scale (2015–2020)

The [policy-gradient-theorem](../theorems/policy-gradient-theorem.md)
gave an unbiased estimator of the performance gradient, enabling
direct optimization of parameterized policies. TRPO (Schulman 2015)
and PPO (Schulman 2017) added trust-region machinery to stabilize
the updates. AlphaGo (Silver et al. 2016) combined Monte-Carlo tree
search with policy and value networks; AlphaZero (Silver et al. 2017)
showed that a single self-play pipeline could master Go, chess, and
shogi from scratch.

By 2020, the open question was: can these techniques transfer from
games (where reward is unambiguous) to open-ended tasks (where
reward is not?).

## Regime 5: RLHF (2017–present)

Christiano, Leike, et al. (2017) introduced [RLHF](../teaching/explanations/rlhf.md):
train a [reward model](../objects/reward-model.md) from human
preference comparisons, then use it as the reward signal for PPO.
InstructGPT (Ouyang et al. 2022) demonstrated the recipe at scale on
a language model. Every major LLM trained 2022–2026 has used some
RLHF variant.

The achievement is significant: RLHF makes language models follow
instructions, refuse harmful requests, and present information in
preferred formats — behaviors that supervised fine-tuning alone
cannot reliably induce.

The cost is theoretical and practical: the
[reward-hacking-inevitability](../theorems/reward-hacking-inevitability.md)
theorem applies, and Gao et al. (2023) demonstrated that
[overoptimization](../theorems/rlhf-overoptimization.md) is not
hypothetical but empirically measurable. Modern RLHF deploys a
KL-budget mechanism to operate close to but not past the
true-preference peak; how to operate *past* the peak — to keep
improving true preference once the proxy is exhausted — is open.

## What the arc reveals

Each regime shift trades theoretical guarantees for practical reach.
Dynamic programming has clean theorems and trivial reach. Tabular RL
has clean theorems and modest reach. Function-approximation RL has
weak theorems and broad reach. RLHF has near-zero theoretical
guarantees and unprecedented reach.

The agentic systems of the [agents theory](../../agents/_index.md) are
the inheritors of this trajectory. The LLMs at their core were
trained at the far end of this arc — the regime with the broadest
practical reach and the weakest theoretical foundation. The
[reward-hacking-inevitability](../theorems/reward-hacking-inevitability.md)
and [rlhf-overoptimization](../theorems/rlhf-overoptimization.md)
theorems are the structural reason that an agentic system's reliability
is bounded above by the reliability of the RLHF training pipeline that
produced its underlying model.
