---
type: concept
class: foundational
status: active
depends-on:
  - environmental-action.md
  - goal-directed-planning.md
  - persistent-state.md
see-also:
  - tool-schema.md
  - coordination-topology.md
  - agentness-spectrum.md
  - ../objects/agent-session.md
  - ../theorems/three-condition-characterization.md
  - ../terms/agentic-system.md
  - ../texts/toward-a-falsifiable-definition-of-agentic-systems.md
references:
  - references/bent2025.md
  - references/anthropic2024.md
  - references/staufer2026.md
title: Agentic system
description: "An agentic system is a computational system satisfying three conditions jointly: environmental action, goal-directed planning, and persistent state."
---

# Agentic system

An agentic system is a computational system satisfying three conditions jointly: [environmental action](environmental-action.md), [goal-directed planning](goal-directed-planning.md), and [persistent state](persistent-state.md).
Each condition is individually necessary; all three are jointly sufficient.
A system satisfying fewer than three conditions is a tool, a workflow, a chatbot, or an automation — not an agentic system.

The concept is motivated by definitional instability in the 2023–2026 AI literature.
"Agent" was applied to everything from single-turn function-calling to fully autonomous multi-model pipelines.
A three-condition definition with falsifiable tests for each condition resolves the instability: a system is agentic if and only if it passes all three tests.

## The three conditions

**Environmental action.** The system performs actions that modify persistent state outside itself through [tool use](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/hacking/content/system/agentizing/content/agentic-system-b4/tool-schema.md). *Test:* remove the system and observe whether the changes it caused remain.
A system that writes files, calls APIs, or modifies databases passes.
A chatbot returning text does not.

**Goal-directed planning.** The system decomposes high-level objectives into sequences of actions through multi-step reasoning and selects among alternative sequences based on their expected contribution to the goal. *Test:* present a goal requiring at least two causally dependent actions (output of action A is required as input to action B).
A system that identifies and executes this dependency without external specification of execution order passes.
A system running a predefined script does not, regardless of how many tools it calls.

**Persistent state.** The system maintains representations of its environment and its own progress that survive interaction boundaries. *Test:* interrupt the system between actions and resume it.
A system that recovers its context and continues toward its goal without re-deriving its plan passes.
A stateless system that must restart from scratch does not.

## What the concept excludes

- **Chatbots.** Generate text; do not act on external environments.
  Fail environmental action.
- **Predefined workflows.** Act on environments but follow a developer-specified path; do not plan.
  Fail goal-directed planning.
- **Stateless tool-callers.** Act and may plan, but lose state at process termination.
  Fail persistent state.
- **RAG systems.** Retrieve and generate; do not modify external state.
  Fail environmental action.
- **Single-turn function-calling.** The model calls one function in response to a query but does not pursue a multi-step plan.
  Fails goal-directed planning.

## The workflow/agent distinction

Within agentic systems, a secondary distinction separates workflows from agents proper.
In a workflow, a developer specifies the execution path — the control flow is fixed code.
In an agent, the model selects and sequences its own tool calls — the model controls the path.
Both satisfy all three conditions.
The distinction is in the locus of control, not in the presence of environmental action or planning.

## Connection to cybernetics

An agentic system is a goal-seeking system with negative feedback in the cybernetic sense (Wiener 1948): it observes the gap between current state and goal state, selects actions to reduce the gap, and adjusts based on results.
Contemporary agentic AI differs from classical cybernetic controllers in two ways: goals are specified in natural language rather than as reference signals, and the action space is arbitrary tool calls rather than a fixed actuator set.
