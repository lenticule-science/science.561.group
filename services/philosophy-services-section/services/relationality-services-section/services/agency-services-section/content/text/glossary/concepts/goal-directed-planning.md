---
type: concept
class: foundational
status: active
depends-on:
  - agentic-system.md
  - tool-schema.md
see-also:
  - ../objects/action-space.md
  - ../morphisms/task-decomposition.md
  - ../theorems/three-condition-characterization.md
  - ../terms/agent-orchestration.md
  - ../terms/prompt-chaining.md
references:
  - references/bent2025.md
  - references/yao2023.md
  - references/anthropic2024.md
title: Goal-directed planning
description: Goal-directed planning is the capacity of an agentic system to decompose high-level objectives into sequences of causally-dependent actions and to select among alternative sequences based on their expected contribution to the goal.
derives-from: acting
---

# Goal-directed planning

Goal-directed planning is the capacity of an agentic system to decompose high-level objectives into sequences of causally-dependent actions and to select among alternative sequences based on their expected contribution to the goal.
It is the second of the three conditions constituting an [agentic system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/goal-directed-planning/agentic-system.md).

## Structure of planning

Planning in an agentic system has three structural components:

**Goal representation.** The system holds a representation of the target state — in contemporary LLM-based systems, this is typically a natural-language instruction specifying the desired outcome.

**Causal decomposition.** The system identifies a set of actions whose joint execution would achieve or advance toward the goal, and orders them according to their data dependencies: action B cannot execute until action A's output is available.

**Alternative selection.** When multiple action sequences would achieve the goal, the system selects among them.
Selection criteria may include expected cost, time, reliability, or confidence.
A system that cannot select among alternatives — that follows a unique specified path — is executing a fixed workflow, not planning.

## What distinguishes planning from execution

The critical test: present the system with a goal requiring two causally dependent actions and observe whether the system identifies and executes the dependency without external specification of the execution order.
A planning system discovers the dependency.
An execution system is given it.

This distinction matters because it separates agent behavior from workflow behavior: a workflow is a planning artifact (the developer planned, the system executes), while an agentic system plans and executes.

## Planning horizon

Goal-directed planning ranges along a horizon dimension:

- **Short-horizon:** Two to five action sequences, typically within a single model context window.
  Common in coding assistants and research agents.
- **Long-horizon:** Dozens of steps across multiple sessions, requiring persistent state to maintain the plan.
  Common in software engineering agents (Devin, OpenHands) operating over hours or days.

Long-horizon planning requires intersection with [persistent state](persistent-state.md): the plan itself must survive process boundaries.

## Relation to Ng's design patterns

Andrew Ng (BUILD 2024) identified planning as one of four design patterns characterizing agentic AI, alongside reflection, tool use, and multi-agent collaboration.
Planning is not a standalone pattern — it is the capacity that makes tool use agentic (rather than reactive) and multi-agent collaboration purposeful (rather than coincidental).

## Relation to ReAct

The ReAct framework (Yao et al., arXiv 2210.03629, 2023) interleaves reasoning traces with action calls: the model generates a thought about what to do, calls a tool, observes the result, and generates the next thought.
ReAct is a realization of goal-directed planning: the reasoning trace is the plan representation, and the interleaving with actions is the causal decomposition made step-by-step rather than upfront.
