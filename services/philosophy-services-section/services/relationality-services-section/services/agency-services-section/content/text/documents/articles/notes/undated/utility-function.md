---
type: object
class: classical
status: active
depends-on:
  - decision-problem.md
see-also:
  - teaching/explanations/decision-theory.md
  - ../theorems/vnm-utility-theorem.md
references:
  - references/vnm1944.md
title: Utility function
description: A utility function is a real-valued function
---

# Utility function

A **utility function** is a real-valued function

$$ u : O \to \mathbb{R} $$

over outcomes, whose expected value the agent maximizes.
The agent's preference between two acts $a_1$ and $a_2$ is represented as

$$ a_1 \succeq a_2 \iff \mathbb{E}[u \circ o(a_1, \cdot)] \ge \mathbb{E}[u \circ o(a_2, \cdot)]. $$

## Existence

The [vnm-utility-theorem](vnm-utility-theorem.md) shows that any preference relation over lotteries satisfying four axioms (completeness, transitivity, continuity, independence) admits a utility-function representation.
The representation is unique up to *positive affine transformation*: $u'(o) = \alpha u(o) + \beta$ with $\alpha > 0$ represents the same preferences.

## What it is and is not

A utility function is *cardinal in differences but ordinal in levels*: the difference $u(o_1) - u(o_2)$ is meaningful (it trades off against probabilities in lottery comparisons), but the absolute level is not.
There is no fact of the matter about whether $u(o) = 5$ vs $u(o) = 7$.

Utility is *not the same as money* (utility of money is typically concave), *not the same as pleasure* (the formalism is silent on what outcomes are valued), and *not interpersonal*: there is no canonical way to compare one agent's utilities to another's.

## In agentic systems

A utility function is the substrate of:

- **The reward signal** of [reinforcement-learning](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/deciding/content/reinforcement-learning/_index.md): the agent maximizes expected discounted return, which is a particular utility-function shape over trajectories.
- **The base-objective** in [alignment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/deciding/content/alignment/_index.md): the principal specifies a utility function the agent is supposed to maximize.
- **The mesa-objective** that an inner optimizer learns: the inner optimizer maximizes some utility function, possibly not the base objective.
  See [mesa-objective](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/deciding/content/alignment/objects/mesa-objective.md).

## Limits

The utility-function abstraction obscures several important phenomena:

- **Ill-defined preferences.** Real agents do not, in general, have preferences satisfying the VNM axioms.
  Preference reversals, framing effects, and intransitivity are systematically observed in humans.
- **Risk preferences over higher moments.** VNM utility cannot represent agents who care about variance or skewness of outcomes independently of expectations.
- **Embedded agents.** An [embedded-agency](../../../../glossary/concepts/embedded-agency.md) argument suggests the utility-function abstraction itself may be inappropriate for agents that are physical subsystems of the worlds they value.
  See [can-embedded-agents-have-utility-functions](can-embedded-agents-have-utility-functions.md).
