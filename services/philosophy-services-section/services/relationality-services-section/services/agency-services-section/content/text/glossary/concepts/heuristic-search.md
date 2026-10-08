---
type: concept
class: algorithmic
status: stable
depends-on:
  - classical-planning.md
see-also:
  - ../objects/heuristic-function.md
  - ../objects/search-tree.md
  - ../theorems/a-star-optimality.md
  - ../theorems/heuristic-relaxation-admissibility.md
references:
  - references/hart-nilsson-raphael1968.md
  - references/ghallab-nau-traverso2016.md
title: Heuristic search
description: Heuristic search is the family of search algorithms that order node expansion by an evaluation function combining the actual cost to reach a node and an estimated cost to reach a goal from it.
---

# Heuristic search

**Heuristic search** is the family of search algorithms that order node expansion by an *evaluation function* combining the actual cost to reach a node and an *estimated* cost to reach a goal from it.
Without heuristic guidance, search is uninformed (breadth-first, depth-first, uniform-cost) and scales poorly on planning problems whose state spaces are exponential in problem size.
With a good heuristic, the same search procedures become tractable for problems whose state spaces would otherwise be unsearchable.

## A* as the canonical algorithm

A* (Hart, Nilsson, Raphael 1968) orders the frontier by

$$f(n) = g(n) + h(n)$$

where $g(n)$ is the actual cost from the start to $n$ and $h(n)$ is a [heuristic estimate](../../documents/articles/notes/undated/heuristic-function.md) of the cost from $n$ to the nearest goal.
The frontier is a priority queue keyed by $f$; expansion picks the lowest-$f$ node, generates its successors, and updates the queue.

A* has two key properties (the [a-star-optimality](../../documents/articles/notes/undated/a-star-optimality.md) theorem):

- **Optimality**: if $h$ is *admissible* (never overestimates the true cost-to-go), A* returns an optimal plan.
- **Optimal efficiency**: among algorithms expanding only nodes reachable through paths satisfying $f(n) \leq C^*$ (where $C^*$ is the optimal cost), A* expands the fewest possible nodes for any given heuristic.

These two properties make A* the default choice for cost-optimal classical planning when an admissible heuristic is available.

## Variants

**IDA* (Iterative Deepening A\*).** Memory-bounded variant that performs cost-bounded depth-first search, increasing the bound when no solution is found.
Sacrifices A*'s memory efficiency in node-reuse for the ability to handle problems whose A* frontier would not fit in memory.

**Greedy best-first search.** Orders by $h$ alone, ignoring $g$.
Not optimal but often very fast; useful when any plan suffices and time is constrained.

**Weighted A*.** Orders by $g + w \cdot h$ for $w > 1$.
Trades optimality for speed; bounded suboptimality results give plans within factor $w$ of optimal.

**RRT and PRM.** Sample-based search variants for continuous state spaces (robotic motion planning); the heuristic is implicit in the sampling distribution rather than explicit.

## Where heuristics come from

The art of heuristic-search-based planning is in the [heuristic-function](../../documents/articles/notes/undated/heuristic-function.md).
Three sources:

**Domain-independent heuristics from problem structure.** The planning literature has produced many techniques for deriving admissible heuristics automatically from the problem description: the *delete-relaxation* family ($h^+$, FF, additive heuristics), the *landmark* family ($h^{LA}$), the *abstraction* family ($h^{PDB}$, merge-and-shrink).
Each is a way of solving a *relaxed* version of the problem whose cost lower-bounds the true cost.
See [heuristic-relaxation-admissibility](../../documents/articles/notes/undated/heuristic-relaxation-admissibility.md).

**Domain-specific heuristics.** Hand-crafted heuristics encoding domain knowledge.
Often dramatically better than domain-independent heuristics on the specific domain; not transferable.

**Learned heuristics.** Train a function approximator (often a neural network) to predict $h^*$ from features of the state.
Learned heuristics are typically *not* admissible, sacrificing optimality guarantees for empirical speed.
AlphaZero's value network is the canonical instance in modern usage.

## Why heuristic search matters for the broader theory

Heuristic search is the principal *tractability* technique for classical planning.
Without it, the [classical-planning-complexity](../../documents/articles/notes/undated/classical-planning-complexity.md) theorem (PSPACE-complete in general; NP-complete bounded) makes the problem hopeless.
With it, much of the problem space becomes solvable in practice.

The technique generalizes well beyond classical planning: stochastic shortest-path, MDP planning (RTDP, LAO*), Monte Carlo tree search (implicit heuristics from the simulation policy), and LLM-based inference-time search (the language-model logits as an implicit search heuristic over plan continuations) all build on the heuristic-search template.
