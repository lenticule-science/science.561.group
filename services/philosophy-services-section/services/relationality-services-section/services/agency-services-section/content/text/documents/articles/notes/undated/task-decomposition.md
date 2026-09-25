---
type: morphism
class: planning-operation
status: active
depends-on:
  - teaching/explanations/goal-directed-planning.md
  - teaching/explanations/agentic-system.md
  - ../objects/action-space.md
see-also:
  - ../morphisms/tool-invocation.md
  - ../morphisms/delegation.md
  - ../objects/coordination-graph.md
  - ../theorems/three-condition-characterization.md
  - ../terms/agent-orchestration.md
  - ../terms/prompt-chaining.md
references:
  - references/anthropic2024.md
  - references/yao2023.md
title: Task decomposition
description: Task decomposition is the operation by which an agentic system maps a high-level goal to an ordered set of subtask assignments.
---

# Task decomposition

Task decomposition is the operation by which an agentic system maps a high-level goal to an ordered set of subtask assignments.
It is the primary realization of [goal-directed planning](../../../../glossary/concepts/goal-directed-planning.md): the agent takes an objective and produces a plan — a structured sequence of actions or sub-goals whose joint completion achieves the objective.

## Operational structure

Task decomposition has three phases:

**Analysis.** The agent reasons about the goal: what final state is required, what information is currently available, what capabilities are available in the [action space](action-space.md), and what sequences of actions could bridge the gap between current state and goal state.

**Decomposition.** The agent identifies a set of subtasks and orders them by their data dependencies.
A subtask $B$ depends on subtask $A$ if $B$ requires $A$'s output as input.
The dependency graph of subtasks is a directed acyclic graph in well-formed decompositions.

**Assignment.** In single-agent systems, the agent assigns all subtasks to itself and executes them sequentially (or in parallel where dependencies permit).
In multi-agent systems, subtasks are assigned to worker agents via [delegation](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/planning/task-decomposition/delegation.md) acts, producing child [delegation records](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/planning/objects/delegation-record.md).

## Domain and codomain

As a morphism:

- **Domain:** (goal specification, current state, action space)
- **Codomain:** (ordered set of subtask assignments with dependency graph)

The codomain is a plan.
A plan is not itself execution — it is a specification of what to execute.
Execution of the plan proceeds through [tool invocations](tool-invocation.md) that operationalize each subtask.

## Decomposition strategies

**Sequential decomposition.** Subtasks are ordered in a linear chain.
Simple to reason about; cannot exploit parallelism; each subtask blocks on the previous.

**Parallel decomposition.** Subtasks with no dependency between them are executed concurrently.
Requires multi-agent infrastructure or async tool calling.
Reduces wall-clock time at the cost of coordination overhead.

**Hierarchical decomposition.** Complex subtasks are themselves decomposed into sub-subtasks.
Produces a tree of sub-goals.
Common in long-horizon planning where top-level objectives are too coarse to execute directly.

**ReAct-style decomposition.** Decomposition is interleaved with execution: the agent produces one reasoning step, executes one tool call, observes the result, and produces the next reasoning step.
The "plan" is not produced upfront but emerges from the interleaving.
More adaptive; harder to inspect; more likely to recover from unexpected results.

## Failure modes

The MASFT study (arXiv 2503.13657) identified specification failures (FC1) as a distinct category: failures in how the task is specified to the multi-agent system.
Many FC1 failures occur at the decomposition step: the agent decomposes a vague goal in a way that misses critical constraints, producing subtask assignments that technically complete but fail to achieve the actual objective.
Precise goal specifications reduce FC1 failures.
