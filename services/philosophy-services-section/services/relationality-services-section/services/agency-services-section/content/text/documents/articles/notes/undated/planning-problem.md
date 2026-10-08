---
type: object
class: foundational
status: stable
depends-on:
  - teaching/explanations/classical-planning.md
see-also:
  - plan.md
  - teaching/explanations/planning-under-uncertainty.md
references:
  - references/ghallab-nau-traverso2016.md
  - references/fikes-nilsson-strips1971.md
title: Planning problem
description: A planning problem is the input to a planner.
---

# Planning problem

A **planning problem** is the input to a planner.
The classical formulation:

$$\Pi = \langle S, A, T, s_0, G \rangle$$

where:

- $S$ is a (possibly infinite) **state space**.
- $A$ is an **action set**, with each $a \in A$ associated with a *precondition* $\mathrm{pre}(a) \subseteq S$ (states where $a$ is applicable) and an *effect* function $\mathrm{eff}(a)$.
- $T \subseteq S \times A \times S$ is the **transition relation**: $(s, a, s') \in T$ iff $s \in \mathrm{pre}(a)$ and $s' = \mathrm{eff}(a)(s)$.
  Deterministic in classical planning; stochastic in MDP planning; non-deterministic in conformant planning.
- $s_0 \in S$ is the **initial state**.
  In conformant/contingent planning, replaced by an initial belief state $b_0 \in \Delta(S)$.
- $G \subseteq S$ is the **goal set**, often specified as a predicate on states (e.g., a conjunction of atoms in STRIPS).

Optional cost structure:

- $c: A \to \mathbb{R}_{\geq 0}$ — the **action cost function**.
  When present, the planner seeks a *minimum-cost* plan rather than *any* plan.

## Variants

| Setting | Substitution |
|---|---|
| Classical (deterministic, fully observable) | as above |
| MDP (stochastic, fully observable) | $T$ is a stochastic kernel $T: S \times A \to \Delta(S)$; reward replaces cost; goal often replaced by maximizing expected discounted return |
| Conformant (nondeterministic, no observations) | $T$ may be one-to-many; $s_0$ is a belief; plan must succeed for all consistent realizations |
| Contingent (nondeterministic, partial observations) | as conformant + observation function $O: S \to \Omega$ |
| POMDP | as MDP + observation function $O: S \to \Delta(\Omega)$; plan is a policy over belief states |

## Representation

Three principal representational families:

**Atomic**: $S$ is an opaque finite set; $T$ given by an explicit table.
Tractable only for tiny state spaces; the canonical theoretical setting.

**Factored**: $S$ is a Cartesian product of variable domains; actions described by their effects on individual variables (STRIPS, SAS+, PDDL).
Allows compact representation of state spaces exponential in the number of variables.
The standard form for classical planning research and competitions.

**Continuous / hybrid**: $S \subseteq \mathbb{R}^n$ or a mixed continuous-discrete space.
Required for robotics, control.
Planner must handle infinite branching; sample-based methods (RRT, PRM) dominate.

## Hardness

The size of the *representation* of $\Pi$ is the input to a planner.
The size of $S$ is typically exponential in the representation.
The [classical-planning-complexity](classical-planning-complexity.md) result is in terms of the representation size.

## Why this object matters

The planning problem is the formal handle that lets us state every question of interest about planning: *which* problems are tractable, *what* heuristics are admissible *for* a problem, *whether* a plan *for* a problem exists, *how to compose* problems hierarchically.
Every other object in the planning theory is defined relative to a planning problem.
