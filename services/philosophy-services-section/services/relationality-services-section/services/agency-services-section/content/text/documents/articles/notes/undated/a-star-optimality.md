---
type: theorem
class: algorithmic-foundation
status: proved
depends-on:
  - ../objects/heuristic-function.md
  - teaching/explanations/heuristic-search.md
see-also:
  - heuristic-relaxation-admissibility.md
references:
  - references/hart-nilsson-raphael1968.md
  - references/ghallab-nau-traverso2016.md
title: A optimality
description: Theorem (Hart, Nilsson, Raphael 1968).
---

# A* optimality

**Theorem (Hart, Nilsson, Raphael 1968).** Let $\Pi$ be a classical planning problem with non-negative action costs and a heuristic function $h: S \to \mathbb{R}_{\geq 0}$ that is *admissible* ($h(s) \leq h^*(s)$ for all $s$, where $h^*(s)$ is the true optimal cost from $s$ to a goal).
Then A* with $f(n) = g(n) + h(n)$ as the frontier ordering returns a cost-optimal plan if any plan exists, or reports failure if no plan exists.
Furthermore, if $h$ is *consistent* ($h(s) \leq c(a) + h(s')$ for every applicable transition $(s, a, s')$), the algorithm never needs to re-expand a closed node.

The result extends to the *optimal efficiency* claim: among algorithms expanding only nodes reachable through paths satisfying $f(n) \leq C^*$ (where $C^*$ is the optimal-plan cost), A* with a given admissible heuristic expands the fewest possible nodes, breaking ties consistently.

## Proof sketch

**Optimality.** Suppose A* terminates returning the plan corresponding to a goal node $n_G$, with $g(n_G) = C$.
We show $C = C^*$ (the optimal cost).

Let $\pi^*$ be an optimal plan with cost $C^*$.
Consider the state of the frontier at the moment A* extracts $n_G$.
There exists some node $n^*$ on the frontier corresponding to a state on $\pi^*$ (specifically, the deepest such node yet generated; if $s_0$ is on $\pi^*$ and the root is closed, some descendant of the root on the $\pi^*$ trajectory has been generated, since A* generates all successors of every expanded node).

For this node $n^*$: $$f(n^*) = g(n^*) + h(n^*) \leq g(n^*) + h^*(n^*) = C^*$$

(the inequality uses admissibility; the equality uses that $g(n^*) + h^*(n^*) = C^*$ since $n^*$ is on an optimal path).

Since A* extracted $n_G$ before $n^*$, the priority order gives $$f(n_G) \leq f(n^*) \leq C^*.$$

But $h(n_G) = 0$ (goal nodes have zero remaining cost), so $f(n_G) = g(n_G) = C$.
Hence $C \leq C^*$.
Since no plan can have cost less than $C^*$, $C = C^*$. $\square$

**Completeness.** If a plan exists, the cost of the cheapest such plan is finite.
Every node $n$ on the frontier has $f(n) \geq g(n)$, and for any cost bound $C$, only finitely many nodes can have $g(n) \leq C$ (since action costs are non-negative and bounded below — assume strictly positive or use the standard bounded-positive cost assumption).
Therefore A* will eventually extract every reachable node up to cost $C^*$ and find the goal.

**No re-expansion under consistency.** With a consistent heuristic, the $f$-values along any optimal path are monotonically non-decreasing: $$f(n') = g(n) + c(a) + h(n') \geq g(n) + h(n) = f(n)$$ (by consistency).
Hence the first time A* extracts a node for a state, it has been reached via the optimal path; any later generation of the same state can be discarded by the closed list without losing optimality. $\square$

**Optimal efficiency.** Sketched here: any algorithm that returns an optimal plan must distinguish that plan from competing plans, which requires expanding any node $n$ with $f(n) < C^*$ (since without expanding $n$, the algorithm cannot rule out the existence of a cheaper plan through $n$).
A* expands exactly the nodes with $f(n) \leq C^*$, which (modulo tie-breaking) is the minimum.

## What this theorem does and does not say

**Does say.** With an admissible heuristic, A* is correct, complete, and optimal.
With a consistent heuristic, it is additionally efficient (no re-expansion) and optimal among all algorithms using the same heuristic.

**Does not say.** That A* is *fast*.
The runtime depends on the quality of the heuristic.
With $h \equiv 0$, A* reduces to uniform-cost search and is exponential in plan length.
With $h = h^*$, A* expands only nodes on the optimal path and is linear in plan length.
The space between is the territory the heuristic-design literature explores.

**Does not say.** That A* is the right algorithm in memory-constrained settings.
A* stores the entire frontier, which can be exponential in plan depth; IDA* and other memory-bounded variants trade expansion count for memory.

**Does not say.** That A* is appropriate when the heuristic is not admissible.
Inadmissible heuristics (including most learned heuristics) can produce suboptimal plans under A*; if optimality matters, admissibility is required.

## Relationship to other results

The theorem is foundational for the entire heuristic-search side of classical planning.
It establishes that *the* problem to be solved in classical planning is finding a good admissible heuristic; given one, A* turns it into an optimal plan.
The [heuristic-relaxation-admissibility](heuristic-relaxation-admissibility.md) theorem provides the principal means of constructing such heuristics.

In the LLM-planning context, the theorem does *not* directly apply: LLM-based search rarely uses admissible heuristics (the LLM's self-evaluation is empirically biased).
The structural lesson — "a good lower bound on remaining cost makes search optimal" — is what carries over, even though LLM systems do not implement A* strictly.
