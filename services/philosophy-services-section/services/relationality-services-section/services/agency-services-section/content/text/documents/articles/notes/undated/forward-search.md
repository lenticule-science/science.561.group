---
type: morphism
class: algorithmic
status: stable
depends-on:
  - ../objects/planning-problem.md
  - ../objects/search-tree.md
see-also:
  - backward-search.md
  - teaching/explanations/heuristic-search.md
references:
  - references/ghallab-nau-traverso2016.md
title: Forward search
description: Forward search is the planning technique that explores the state space progressing from the initial state toward a goal state.
---

# Forward search

**Forward search** is the planning technique that explores the state space *progressing* from the initial state toward a goal state.
The search tree is rooted at $s_0$; expansion of a node $n$ generates the states reachable in one step from $\mathrm{state}(n)$ via applicable actions; the search terminates when a goal state is found on the frontier.

## Algorithm template

```
frontier ← {root with state = s₀}
closed ← ∅
loop:
    if frontier is empty: return failure
    n ← frontier.extract()
    if state(n) ∈ G: return reconstruct-plan(n)
    if state(n) ∈ closed: continue
    closed ← closed ∪ {state(n)}
    for each action a applicable in state(n):
        s' ← apply(a, state(n))
        n' ← new node with state = s', parent = n, action = a, g = g(n) + c(a)
        frontier.add(n')
```

The algorithm is parameterized by the *frontier ordering* (uniform cost / heuristic / etc.) and the *closed-list policy* (always / when consistent / never).

## Forward-search variants

| Variant | Frontier ordering |
|---|---|
| Breadth-first search | FIFO |
| Depth-first search | LIFO |
| Uniform-cost search | by $g(n)$ |
| Greedy best-first | by $h(n)$ |
| A* | by $f(n) = g(n) + h(n)$ |
| IDA* | iterative deepening on $f$ |

All of these are forward-search instances; they differ in how the frontier is prioritized.

## Why forward

Forward search has several practical advantages over the backward alternative:

- **State representation is concrete**: each search node corresponds to an actual state, not a state set or formula.
  State-based reasoning (heuristic evaluation, dead-end detection) is simpler.
- **Heuristics are well-developed**: most modern planning heuristics (FF, landmarks, abstraction) operate on concrete states forward from the root.
- **Successor generation is straightforward**: applying an action's effect to a state is a simple, well-defined operation.

These advantages have made forward search the dominant paradigm in classical-planning research and competitions since the late 1990s.

## Limits

**Branching factor.** Forward search expands every applicable action at every state; in domains where many actions are applicable, the frontier explodes quickly.
Heuristics are the principal mitigation.

**Goal-directedness.** Forward search has no inherent bias toward the goal except via the heuristic.
Without a strong heuristic, it explores irrelevant parts of the state space.

**State-space size.** Forward search must in principle visit a state to know whether it leads to a goal; in state spaces with many unrelated regions, this is wasteful.

## In LLM planning

LLM-based forward search (the typical case for chain-of-thought) incrementally extends a partial reasoning trace toward a goal (answer).
The "successor function" is "what does the LLM produce next given this partial trace"; the "goal predicate" is "this trace contains a final answer that satisfies the verifier."

This is structurally forward search, but with the unusual property that the "state" (token sequence) is enormous and the successor function is a learned probabilistic kernel (the LLM's continuation distribution).
The frontier ordering is implicit in the sampling strategy (greedy, sampling, beam search) rather than a designed heuristic.
