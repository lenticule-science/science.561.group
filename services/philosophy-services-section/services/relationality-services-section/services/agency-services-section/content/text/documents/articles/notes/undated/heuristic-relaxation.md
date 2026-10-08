---
type: morphism
class: structural
status: stable
depends-on:
  - ../objects/heuristic-function.md
  - ../objects/planning-problem.md
see-also:
  - ../theorems/heuristic-relaxation-admissibility.md
  - teaching/explanations/heuristic-search.md
references:
  - references/ghallab-nau-traverso2016.md
title: Heuristic relaxation
description: Heuristic relaxation is the operation of constructing a heuristic function for a planning problem by solving a simpler version of the problem and using the simpler-problem's optimal cost as the heuristic estimate.
---

# Heuristic relaxation

**Heuristic relaxation** is the operation of constructing a heuristic function for a planning problem by *solving a simpler version* of the problem and using the simpler-problem's optimal cost as the heuristic estimate.

## The general schema

Given planning problem $\Pi = \langle S, A, T, s_0, G \rangle$ and a *relaxation* $\Pi' = \langle S, A, T', s_0, G \rangle$ where $T' \supseteq T$ (the relaxed problem permits at least every transition the original does), define

$$h_{\Pi'}(s) = \mathrm{cost}^*_{\Pi'}(s, G)$$

— the optimal cost of reaching the goal from $s$ in $\Pi'$.
Then $h_{\Pi'}$ is admissible for $\Pi$: any plan in $\Pi$ is a plan in $\Pi'$, so the optimal $\Pi'$-plan is no longer than the optimal $\Pi$-plan.
The [heuristic-relaxation-admissibility](heuristic-relaxation-admissibility.md) theorem makes this precise.

## Standard relaxations

**Delete relaxation** ($h^+$).
Drop the delete-list of every action, so atoms can never become false.
The relaxed problem is still NP-hard but admits cheap approximations: - $h^{\text{FF}}$: the length of a relaxed-plan extracted by the FF planner's lazy procedure.
Empirically very effective; not admissible (it can overestimate). - $h^{\text{add}}$ (additive heuristic): sums the per-atom costs.
Admissible; weaker than $h^{\text{max}}$ on some domains. - $h^{\text{max}}$ (max heuristic): max over per-atom costs.
Admissible; weaker than $h^+$ but cheap.

**State abstraction**.
Project the state space onto a coarser space: ignore some atoms entirely.
The relaxed problem has fewer states ($|S|/2^k$ if $k$ atoms are ignored); store the optimal-cost table for the abstract problem in a *pattern database*.
Lookup at search time is $\mathcal{O}(1)$.

**Action abstraction**.
Group similar actions; the relaxed problem has fewer action types but loses the ability to distinguish their effects.

**Landmark heuristics**.
Identify *landmarks*: atoms that must hold at some point on every plan.
The cost of achieving the landmarks is a lower bound on plan cost; this gives admissible heuristics like $h^{LM-cut}$.

**Cartesian / merge-and-shrink**.
More sophisticated abstractions that combine multiple variables in controlled ways and merge them back together with bounded blow-up.
Among the strongest admissible heuristics for general STRIPS planning.

## Composing relaxations

Multiple admissible heuristics can be combined while preserving admissibility:

- **Max combination**: $h(s) = \max_i h_i(s)$.
  Trivially admissible and dominates each component.
- **Cost-partitioning**: split action costs into per-heuristic shares such that the *sum* of heuristics on the partitioned costs remains admissible.
  More powerful than max in many domains.

These are the principal techniques of modern admissible-heuristic planning.

## Why relaxation matters

Relaxation is the principal *automatic* source of heuristics for classical planning: it generates admissible heuristics from the problem description without domain-specific authoring.
The domain-independent planning literature is largely the literature on better relaxations.

In MDPs and RL, the analogue is *value-function abstraction*: the agent's value estimate at a state is computed in some abstracted state space.
The abstraction-relaxation parallel is exact; the admissibility property in classical planning corresponds to the *upper bound* (or *under-approximation*) property in value estimation.

In LLM planning, relaxation is rare in the explicit form.
The LLM's internal "value estimate" of a partial reasoning trace is implicit in its continuation distribution; there is no explicit relaxed problem being solved.
A research direction is to make the LLM's implicit relaxation explicit — for instance, by fine-tuning a value model to predict the success of a partial plan, which is structurally a learned relaxed-problem solver.
