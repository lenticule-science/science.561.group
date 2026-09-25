---
type: question
class: open-problem
status: open
see-also:
  - ../../swarm-intelligence/_index.md
  - ../../swarm-intelligence/concepts/swarm-coordinated-system.md
  - ../../swarm-intelligence/theorems/llm-swarms-fail-classical-conditions.md
  - teaching/explanations/markov-decision-process.md
references:
  - references/sutton-barto2018.md
title: Multi-agent RL as swarm
description: Multi-agent reinforcement learning (MARL) studies populations of RL agents learning concurrently in a shared environment.
---

# Multi-agent RL as swarm

Multi-agent reinforcement learning (MARL) studies populations of
RL agents learning concurrently in a shared environment. The
[swarm-intelligence theory](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/_index.md)
studies populations of fixed-rule agents producing coherent global
behavior. The two formalisms describe different regimes — one with
learning, one without — but address structurally similar
multi-agent populations.

**Question.** Under what conditions does a multi-agent RL system
satisfy the
[swarm-coordinated conditions](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/concepts/swarm-coordinated-system.md)
in the limit (after learning has converged)? Conversely, when does
the learning dynamics itself satisfy a swarm-style scalability
property?

## What is at stake

The [swarm-intelligence](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/_index.md) theory
gets its $O(N)$ scaling from agents executing **fixed** local rules
of bounded cost. A MARL system in which each agent maintains and
updates a learned policy has per-agent cost dominated by the policy
update step, which is generally not bounded in $N$. The naive
prediction is that MARL fails the
[scalability premise](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/concepts/scalability-premise.md)
in the same way LLM swarms do (cf.
[llm-swarms-fail-classical-conditions](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/theorems/llm-swarms-fail-classical-conditions.md)),
even though the per-agent cost is much lower than for LLM agents.

The interesting subquestion is whether *converged* MARL — after
learning has terminated and the agents execute fixed learned policies
— satisfies the swarm conditions. If so, MARL is a *training procedure*
for swarms: classical swarm theory governs deployment, MARL theory
governs how the local rules were obtained.

## Specific subquestions

**Q1.** For independent Q-learners with shared environment but no
communication, does the converged joint policy satisfy
[homogeneity](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/concepts/homogeneity.md) when
the agents are initialized identically and the environment is
symmetric?

Standard MARL theory says: with appropriate symmetry, yes — but the
convergence of independent Q-learners in a multi-agent environment
is itself not guaranteed (the environment from each agent's
perspective is non-stationary).

**Q2.** When MARL agents learn communication protocols, do the
emergent protocols satisfy the
[stigmergy](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/concepts/stigmergy.md) condition
(communication mediated through environment) or the orchestration
condition (direct messaging)?

Empirically (Foerster et al. 2016, subsequent work): both regimes
emerge depending on the architecture. Architectures that constrain
communication to environment-mediated channels recover stigmergy;
architectures that allow direct messaging produce orchestrated
coordination patterns.

**Q3.** Does the
[stigmergy-decouples-coordination-cost](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/theorems/stigmergy-decouples-coordination-cost.md)
theorem apply to converged MARL systems where the agents have learned
stigmergic coordination protocols? The theorem's premises are about
*per-step* coordination cost, which at deployment is bounded for any
fixed policy regardless of how the policy was obtained.

Naive analysis: yes. The learning is amortized over deployment.

**Q4.** Multi-agent RLHF: does training a population of LLM agents
jointly with shared preference signals produce different
overoptimization behavior than training a single agent? Open; very
little theoretical work as of 2026.

## Connection to the agents theory

A satisfactory answer to Q1–Q3 would clarify when a deployed
multi-agent system is best modeled as an
[agentic system](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/agents/_index.md) (orchestrated, expensive)
versus a
[swarm-coordinated system](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/_index.md)
(stigmergic, cheap). Currently the literature uses both framings
freely without such criteria; the absence of clear criteria is one
reason the
[swarm-vs-orchestration-dichotomy](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/multiagent-systems/swarm-intelligence/theorems/swarm-vs-orchestration-dichotomy.md)
theorem matters in practice.
