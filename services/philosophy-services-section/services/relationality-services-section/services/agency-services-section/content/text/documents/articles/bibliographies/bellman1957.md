---
type: reference
class: foundational-text
status: stable
title: Bellman 1957 — Dynamic Programming
description: Bellman, Richard.
---

# Bellman 1957 — Dynamic Programming

Bellman, Richard. *Dynamic Programming*. Princeton University Press,
1957.

The book that introduced dynamic programming as a unified mathematical
framework for sequential decision-making. Defines what would later be
called the **Bellman equation** and the **principle of optimality**:
"An optimal policy has the property that whatever the initial state
and initial decision are, the remaining decisions must constitute an
optimal policy with regard to the state resulting from the first
decision."

The principle of optimality is the structural reason the Bellman
recursion is well-defined. The
[bellman-optimality](../notes/undated/bellman-optimality.md) theorem is
the modern, contraction-mapping-based statement of Bellman's
original result.

The book's framing is broader than reinforcement learning: it covers
optimal control, resource allocation, inventory management, and
many other applied-mathematics settings. The MDP formulation that RL
inherits is one specialization.

Cited by the [markov-decision-process](../../../glossary/concepts/markov-decision-process.md)
concept, the [mdp](../notes/undated/mdp.md) object, the
[bellman-backup](../notes/undated/bellman-backup.md) morphism, and the
[bellman-optimality](../notes/undated/bellman-optimality.md) theorem.
