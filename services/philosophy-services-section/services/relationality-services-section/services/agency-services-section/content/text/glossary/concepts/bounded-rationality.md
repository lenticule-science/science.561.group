---
type: concept
class: classical
status: active
depends-on:
  - decision-theory.md
see-also:
  - embedded-agency.md
  - ../objects/decision-algorithm.md
references: []
title: Bounded rationality
description: Bounded rationality is the family of theories of choice for agents with limited computational resources — limited time, memory, knowledge, and reasoning capacity.
derives-from: acting
---

# Bounded rationality

**Bounded rationality** is the family of theories of choice for agents with limited computational resources — limited time, memory, knowledge, and reasoning capacity.
The term is due to Herbert Simon (1957).

## Why it is needed

Classical [decision-theory](decision-theory.md) is normatively clean but computationally inert: maximizing expected utility over a large state space is intractable in general.
A chess-playing agent that "maximizes expected utility" by enumerating all game trees is not a real agent.
Real agents must satisfice, prune, approximate, or heuristically search.

For an [embedded-agency](embedded-agency.md) framework this is not optional: an agent that is part of physics has only the computational resources physics provides.

## Three traditions

**Simon's satisficing.** Choose any act whose expected utility exceeds an aspiration threshold, rather than the maximum.
The threshold itself adapts based on what the agent has been able to achieve.
Practical, vague.

**Russell-Subramanian (1995) bounded optimality.** Define rationality with respect to *the program*, not *the act*: a program is bounded-optimal if no other program implementable on the same resources achieves higher expected utility.
This makes the optimality target sensitive to the agent's computational substrate.

**Anytime algorithms.** Algorithms that produce a usable answer at any point of interruption, with quality improving monotonically with computation time.
The decision-theoretic framework: at each instant, decide whether to act now or deliberate further.
The optimal stopping rule is itself a decision problem.

## Connection to AI

Bounded rationality is implicit in essentially every operational AI system:

- **MCTS / heuristic search** in [planning](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/deciding/planning/_index.md) approximates expected value over game trees with finite computation.
  See [inference-time-search](inference-time-search.md).
- **Reinforcement learning** approximates the expected-utility-maximizing policy from finite samples.
- **LLM inference-time compute** trades latency for answer quality in a way that is precisely an anytime-algorithm tradeoff.

## Where it sits

Bounded rationality is the *practical* substrate of agent behavior.
Classical decision theory specifies the limit toward which a resource-unbounded agent would converge; bounded rationality specifies what real agents actually do.
Modern agent-foundations work — including FDT and embedded-agency — implicitly assumes bounded rationality, since unbounded deliberation would dissolve many of the problems they study.

## Open

A complete bounded-rationality theory would specify: - a model of the agent's computational substrate, - the cost of deliberation in the same units as utility, - the optimal decision procedure as a function of available resources.

No such theory exists for general settings.
Bounded rationality is best understood as a perspective, not a finished framework.
