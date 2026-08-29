---
title: "Linear Logic as Interactive Computation"
description: "How Curry–Howard, game semantics, and linear logic programming connect proofs with interactive stateful computation."
date-created: 2026-04-06
type: explanation
article-kind: note
---

The Curry–Howard correspondence reads proofs as programs. For linear logic, the programs are resource-sensitive interactive processes: inputs are consumed, outputs are produced, and state transitions are represented by rules that consume old propositions and produce new ones.

Abramsky's computational interpretation (1993) reads intuitionistic linear logic as a lambda calculus in which variables are used exactly once, while classical linear logic can be read as concurrent processes in a chemical abstract machine. Tensor is parallel composition; linear implication is a reaction consuming one resource and producing another; cut elimination is computation. Abramsky and Jagadeesan's game semantics (1994) identify proofs with winning strategies, and Hyland and Ong's fully abstract model of PCF (2000) shows that this supports ordinary branching and recursion.

Martens's Ceptre language makes the correspondence operational for interactive fiction and games. A game state is a multiset of linear propositions; a player action is an inference rule; and changing a door from closed to open consumes `door_state(closed)` and produces `door_state(open)`. The type discipline prevents resources from being silently duplicated or lost. This is a useful interpretation of bilattice-valued predication: fusion extends a resource state, while the residual tests or restricts it.
