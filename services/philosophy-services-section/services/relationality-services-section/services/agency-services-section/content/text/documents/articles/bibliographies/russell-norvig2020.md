---
type: reference
class: book
status: active
cites:
  - teaching/explanations/agentic-system.md
  - ../objects/observation-space.md
  - ../objects/action-space.md
title: "Russell and Norvig (2020) — Artificial Intelligence: A Modern Approach"
description: "Full citation: Russell, S."
---

# Russell and Norvig (2020) — Artificial Intelligence: A Modern Approach

**Full citation:** Russell, S. and Norvig, P. *Artificial Intelligence: A Modern
Approach.* 4th edition. Pearson, 2020. (First edition: 1995.)

## Summary

The standard textbook reference for AI, covering intelligent agents, search,
planning, knowledge representation, learning, and reasoning. Chapter 2 defines
agents via the PEAS framework (Performance measure, Environment, Actuators,
Sensors) and the agent function mapping percept sequences to actions.

Russell and Norvig's agent taxonomy: simple reflex, model-based reflex, goal-
based, utility-based, and learning agents. The taxonomy is structural rather than
behavioral, classifying agents by their internal architecture.

## Contribution to the agents theory

The PEAS framework provides the structural vocabulary used in the
[observation-space](../notes/undated/observation-space.md) and
[action-space](../notes/undated/action-space.md) objects: sensors map to observation
space (what the agent can perceive), actuators map to action space (what the
agent can do). The PEAS framing is adapted for LLM-based agents where "sensors"
are read tool calls and "actuators" are write tool calls.

The Russell-Norvig agent concept predates LLM-based agentic systems. The
three-condition characterization in this theory is narrower and more applied: it
characterizes specifically LLM-based systems with tool use, not agents in the
general PEAS sense. A simple reflex agent satisfying the PEAS framework would
not necessarily satisfy the three conditions (particularly goal-directed
planning) — the agents theory applies specifically to the class of LLM-based
systems active in 2024–2026.
