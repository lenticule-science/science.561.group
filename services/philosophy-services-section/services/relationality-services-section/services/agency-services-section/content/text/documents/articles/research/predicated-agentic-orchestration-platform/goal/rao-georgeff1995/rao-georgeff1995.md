---
type: reference
class: academic
status: cited
authors: [Rao, Anand S., Georgeff, Michael P.]
year: 1995
title: "BDI Agents: From Theory to Practice"
venue: "Proceedings of the First International Conference on Multi-Agent Systems (ICMAS-95), 312–319"
description: A.S.
---

## Source

A.S. Rao, M.P. Georgeff.
"BDI Agents: From Theory to Practice."
In *Proceedings of the First International Conference on Multi-Agent Systems (ICMAS-95)*, V.
Lesser (ed.), AAAI Press / MIT Press, 1995, pp.
312–319.

## Form

Conference paper.
The canonical reference for the *belief-desire-intention* agent architecture and its lift from formal theory to practical implementations (PRS, dMARS, JACK).

## Content summary

Lifts the BDI logical theory (Rao and Georgeff's earlier work on CTL$^*$-based BDI logics) into a practical agent architecture.
An agent maintains three explicit data structures: a *belief base* (the agent's representation of the world's current state), a *desire / goal set* (the states of affairs the agent wants to bring about), and an *intention set* (the goals the agent has committed to pursuing, paired with the partial plans it is executing toward them).
The agent's reasoning loop reads the belief base, considers options (desires whose preconditions are believed to hold), filters to a deliberation step that selects new intentions, and selects-and-executes a step from a current intention's plan.
The architecture's load-bearing engineering commitment is *commitment to intentions* — once adopted, an intention persists until it is achieved, the agent believes it impossible, or its motivating reason expires — which gives BDI agents their characteristic practical-reasoning shape and distinguishes them from purely-reactive architectures.
