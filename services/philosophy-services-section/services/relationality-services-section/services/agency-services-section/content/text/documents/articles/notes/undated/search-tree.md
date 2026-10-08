---
type: object
class: algorithmic
status: stable
depends-on:
  - planning-problem.md
see-also:
  - teaching/explanations/heuristic-search.md
  - teaching/explanations/monte-carlo-tree-search.md
references:
  - references/ghallab-nau-traverso2016.md
title: Search tree
description: A search tree is the data structure search procedures construct and traverse to find a plan.
---

# Search tree

A **search tree** is the data structure search procedures construct and traverse to find a plan.
Its nodes correspond to (typically) states visited during search; its edges correspond to actions; its root corresponds to the initial state.

## Structure

A search tree node $n$ typically carries:

- $\mathrm{state}(n)$: the planning state at this node.
- $\mathrm{parent}(n)$: the node from which $n$ was generated (or $\bot$ for the root).
- $\mathrm{action}(n)$: the action whose application to $\mathrm{state}(\mathrm{parent}(n))$ produced $\mathrm{state}(n)$.
- $g(n)$: the cumulative cost from root to $n$.
- $h(n)$: the heuristic estimate of cost from $n$ to a goal (when using heuristic search).
- For MCTS: $N(n)$ visit count and $\bar{Q}(n)$ mean value estimate.

A *frontier* (open list) is the set of generated-but-not-yet-expanded nodes.
A *closed list* is the set of expanded nodes (used to avoid revisiting).

## Tree vs graph

If the same state is reached via multiple paths, the *search tree* contains multiple nodes for it (paths to the same state are distinct tree branches), while the *search graph* contains one.
Operating over the graph saves space but requires a closed-list mechanism to detect re-visits; operating over the tree is simpler but can exponentially explode on graph-like state spaces.

A* with a consistent heuristic over a graph behaves correctly with a simple closed list (never reopen).
A* with an admissible-but-not-consistent heuristic over a graph requires a more complex *reopen* mechanism.
A* over the tree avoids this issue but pays in node-count.

## Asymmetric trees in MCTS

The MCTS search tree is *asymmetric*: only nodes on the path to high-value rollouts get repeatedly visited and expanded, while unpromising branches receive few or no expansions.
The exploration-exploitation balance in the tree policy determines how asymmetric the tree becomes.

This asymmetry is the source of MCTS's tractability on enormous state spaces (Go: $\sim 10^{170}$ states): the tree never explicitly represents most of the space; it explicitly represents only a narrow corridor of plausibly-optimal play.

## Memory profile

Search-tree memory footprint is the principal scalability bottleneck of systematic-search planning:

- BFS / Dijkstra / A*: store the entire frontier (which can be exponential).
- IDA*: store only the current branch (linear in depth).
- Beam search: prune to the top-$k$ frontier (bounded; not optimal).
- MCTS: store the explicitly-expanded subtree (asymmetric; bounded by iteration count).

The choice among these is largely a memory-tractability choice.
A* gives the best expansion count for a given heuristic but the worst memory profile.

## In LLM planning

In tree-of-thoughts and similar LLM search, the search tree explicitly represents the considered reasoning paths.
Each node's state is a partial reasoning trace; expansion costs an LLM call.
The frontier is typically managed by beam-search-style pruning because the cost-per-expansion is high enough that exhaustive expansion is infeasible.

The search-tree size in LLM planning is therefore tightly budget-bound, in contrast to classical planning where the tree expands until completion (or memory exhaustion).
The research question is then: given a fixed inference-budget, what tree-search strategy expands the most informative nodes?
See [inference-time-search](../../../../glossary/concepts/inference-time-search.md).
