---
type: concept
class: structural
status: stable
depends-on:
  - classical-planning.md
see-also:
  - ../objects/abstraction-hierarchy.md
  - ../morphisms/plan-decomposition.md
  - ../theorems/hierarchical-decomposition-soundness.md
references:
  - references/erol-hendler-nau1994.md
  - references/ghallab-nau-traverso2016.md
title: Hierarchical planning
description: Hierarchical planning is the family of planning techniques that exploit decomposition of abstract tasks into networks of sub-tasks.
---

# Hierarchical planning

**Hierarchical planning** is the family of planning techniques that exploit decomposition of abstract tasks into networks of sub-tasks.
Instead of searching directly over primitive actions, the planner searches over a hierarchy: high-level tasks decompose into mid-level sub-tasks, which decompose into primitive actions.
The decomposition library encodes domain knowledge about *how* to accomplish things; the planner uses this knowledge to prune the search space.

## Hierarchical Task Networks (HTN)

The principal hierarchical-planning formalism.
An HTN planning problem extends a classical planning problem with:

- **Compound tasks** $\tau$: tasks that are not directly executable but must be decomposed.
- **Methods** $m$: rules of the form "compound task $\tau$ can be decomposed into network $w$ of sub-tasks (compound or primitive), provided some precondition holds."

A *task network* is a partially-ordered set of tasks.
Planning proceeds by repeatedly choosing a compound task in the current network, choosing a method to decompose it, and replacing it with the method's sub-task network.
The plan is complete when all tasks are primitive and the resulting action sequence is executable.

The formal foundations were established by Erol, Hendler, and Nau (1994), who introduced UMCP (the first sound and complete HTN planner) and the formal semantics of HTN planning.
SHOP, SHOP2, and JSHOP are widely-used implementations in subsequent decades.

## The options framework (RL-side analogue)

In reinforcement learning, the corresponding structure is the **options framework** (Sutton, Precup, Singh 1999).
An *option* is a triple $(I, \pi, \beta)$:

- $I \subseteq S$: the set of states where the option can be initiated.
- $\pi: S \to \mathrm{Dist}(A)$: a policy executed while the option is in effect.
- $\beta: S \to [0, 1]$: a termination function giving the probability of stopping the option in each state.

Options extend the action space of an MDP: the agent chooses among primitive actions and options, the latter being temporally-extended actions.
The MDP becomes a *semi-MDP* whose value function and policy can be learned by standard methods extended to handle variable-duration actions.

## Why hierarchy helps

**Search-space reduction.** Without hierarchy, planning over $n$-step horizons searches $\mathcal{O}(b^n)$ trajectories where $b$ is the branching factor.
With hierarchy, the same horizon at the abstract level requires only $\mathcal{O}(b_{\text{high}}^{n/k})$ trajectories where $k$ is the average primitive-actions-per-method count.
Even modest $k$ produces dramatic reductions.

**Knowledge engineering.** Domain experts often know "how to" do high-level tasks (e.g., "to travel from $A$ to $B$, choose a mode of transport, then plan within that mode").
Encoding this as decomposition methods is more natural than encoding it as primitive heuristics, and the resulting plans are more legible.

**Reusability.** A method library written for one problem instance generalizes to other instances of the same domain.
The cost of authoring methods amortizes across many planning problems.

## Costs

**Loss of completeness/optimality.** A standard classical planner finds a plan if one exists; an HTN planner finds a plan if one exists *that is expressible by the method library*.
If the optimal plan requires a decomposition not in the library, the HTN planner will not find it.
The [hierarchical-decomposition-soundness](../../documents/articles/notes/undated/hierarchical-decomposition-soundness.md) theorem precisifies the relationship between method library expressivity and planner completeness.

**Knowledge-engineering burden.** Writing a comprehensive method library is labor-intensive and requires domain expertise.
The classical "knowledge acquisition bottleneck" of expert systems applies.

**Brittleness.** A method library encodes assumptions about the environment (preconditions, sub-task ordering, sub-task effects).
When the environment violates these, the planner's plans are ill-formed.

## Connection to LLM planning

Modern LLM-based planning agents (ReAct, AutoGPT-style scaffolds, agentic frameworks) implement an *implicit* hierarchical planner: the LLM decomposes high-level tasks into sub-tasks and (often recursively) sub-sub-tasks, then executes primitive actions.
The decomposition library is *implicit* in the LLM's training data and the prompt scaffolding rather than explicit.

This has structural advantages (no manual method authoring; broad domain coverage) and disadvantages (no soundness guarantees about what decompositions the LLM produces; limited debuggability of decomposition failures).
Bridging classical-HTN soundness with LLM-based decomposition flexibility is an active research direction; see [can-classical-and-llm-planning-be-unified](../../documents/articles/notes/undated/can-classical-and-llm-planning-be-unified.md).
