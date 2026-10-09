---
type: theorem
class: structural-claim
status: proved
depends-on:
  - ../objects/heuristic-function.md
  - ../morphisms/heuristic-relaxation.md
see-also:
  - a-star-optimality.md
references:
  - references/ghallab-nau-traverso2016.md
title: Heuristic relaxation admissibility
description: Theorem (folklore; canonical statement in Ghallab-Nau-Traverso 2016).
---

# Heuristic relaxation admissibility

**Theorem (folklore; canonical statement in Ghallab-Nau-Traverso 2016).** Let $\Pi = \langle S, A, T, s_0, G, c \rangle$ be a classical planning problem with non-negative action costs $c$.
Let $\Pi' = \langle S, A, T', s_0, G, c' \rangle$ be a *relaxation* of $\Pi$ satisfying:

1. **Transition weakening**: $T \subseteq T'$.
  Every transition permitted in $\Pi$ is permitted in $\Pi'$ (the relaxed problem permits at least as much).
2. **Cost lower bounding**: $c'(a) \leq c(a)$ for every action $a$.
  The relaxed problem charges no more for any action than the original.

Define the **relaxation heuristic**

$$h_{\Pi'}(s) = \mathrm{cost}^*_{\Pi'}(s, G)$$

— the optimal cost of reaching the goal from $s$ in the relaxed problem $\Pi'$ (or $0$ if no path exists).

Then $h_{\Pi'}$ is **admissible** for $\Pi$: $h_{\Pi'}(s) \leq h^*_\Pi(s)$ for all $s \in S$, where $h^*_\Pi(s)$ is the true optimal cost in $\Pi$.

If, moreover, $T'$ is closed under composition with $T$ (i.e., if $(s, a, s_1) \in T$ and $(s_1, a', s_2) \in T'$ then there is a $T'$-path from $s$ to $s_2$ via $a$ and $a'$), then $h_{\Pi'}$ is also **consistent**.

## Proof

**Admissibility.** Let $\pi^* = \langle a_1, a_2, \ldots, a_k \rangle$ be an optimal $\Pi$-plan from $s$ to a goal state $g$, with cost $h^*_\Pi(s) = \sum_i c(a_i)$.
By premise (1), every transition in $\pi^*$ is also a $\Pi'$-transition; therefore $\pi^*$ is also a $\Pi'$-plan from $s$ to $g$.
Its $\Pi'$-cost is $\sum_i c'(a_i)$; by premise (2), $c'(a_i) \leq c(a_i)$ for each $i$.
Hence the $\Pi'$-cost of $\pi^*$ is at most $h^*_\Pi(s)$.

But $h_{\Pi'}(s)$ is the *optimal* $\Pi'$-cost from $s$ to a goal, which is at most the cost of any specific $\Pi'$-plan from $s$ to a goal.
In particular, $$h_{\Pi'}(s) \leq \mathrm{cost}_{\Pi'}(\pi^*) \leq \mathrm{cost}_{\Pi}(\pi^*) = h^*_\Pi(s).$$ $\square$

**Consistency** (under the closure premise).
For an applicable transition $(s, a, s')$ in $\Pi$, we need $h_{\Pi'}(s) \leq c(a) + h_{\Pi'}(s')$.
Let $\pi'$ be an optimal $\Pi'$-plan from $s'$ to a goal, with cost $h_{\Pi'}(s')$.
By the closure premise, $a$ followed by $\pi'$ is a valid $\Pi'$-trajectory from $s$ to a goal, with cost $c'(a) + h_{\Pi'}(s')$.
By premise (2), $c'(a) \leq c(a)$.
Hence $$h_{\Pi'}(s) \leq c'(a) + h_{\Pi'}(s') \leq c(a) + h_{\Pi'}(s'). \quad \square$$

## Examples

**Delete relaxation.** Let $\Pi'$ be obtained from $\Pi$ by deleting the *delete-list* of every action, so atoms once true remain true.
Both premises hold: every $\Pi$-transition is a $\Pi'$-transition (adding "atoms remain true" only enables more); costs are unchanged.
Hence the optimal cost in the delete-relaxed problem is admissible.
This is $h^+$, the canonical admissible heuristic of modern classical planning.

**State abstraction.** Let $\Pi'$ project $\Pi$ onto a subset of atoms (ignore the others).
Every $\Pi$-trajectory projects to a $\Pi'$-trajectory; costs are preserved.
The optimal cost in the abstract problem (precomputed as a *pattern database*) is admissible.

**Cost relaxation.** Set all action costs in $\Pi'$ to zero.
Then $h_{\Pi'} \equiv 0$, which is trivially admissible (and trivially useless).

These examples illustrate that the theorem produces admissible heuristics from a wide range of relaxations, and that the *tightness* of the relaxation determines the strength of the heuristic.

## What this theorem does and does not say

**Does say.** Any relaxation that preserves transitions and lower-bounds costs gives an admissible heuristic.
This is the principal *automatic* technique for heuristic generation in classical planning.

**Does not say.** That solving the relaxed problem is easy.
The delete-relaxed problem $h^+$ is NP-hard to solve exactly; the "FF heuristic" is a polynomial-time approximation that loses admissibility (it can overestimate).
Similarly, computing pattern databases requires precomputing the abstract problem in full, which itself takes time and space exponential in the abstract state count.

**Does not say.** That relaxation is the *only* source of admissible heuristics.
Landmark heuristics, critical-path heuristics, and LP-based relaxations also produce admissible heuristics through related but distinct mechanisms.

**Does not say.** That admissibility is sufficient for fast search.
Admissibility ensures A*-optimality but not A*-speed; the *tightness* of the heuristic — how close to $h^*$ — determines the search's efficiency.
Trivially admissible heuristics ($h \equiv 0$) are useless.

## Relationship to other results

This theorem is the supplier; [a-star-optimality](a-star-optimality.md) is the consumer.
Together they constitute the formal foundation of heuristic-search-based classical planning: the relaxation theorem produces admissible heuristics, and A* turns them into optimal plans.

The theorem also bears on the question of how to build heuristics for non-classical planning.
In MDP planning, the analogous construction is *value-function under-approximation*: any value function that is below $V^*$ everywhere is a "lower-bound heuristic" analogous to admissibility, and similar guarantees can be derived for value-iteration-style algorithms.

In LLM planning, the theorem does not have a direct analogue: the "relaxation" notion presupposes a problem structure (transition relation, cost function) that is not explicit in LLM planning.
Whether a meaningful notion of "relaxed LLM planning problem" exists is an open research question.
