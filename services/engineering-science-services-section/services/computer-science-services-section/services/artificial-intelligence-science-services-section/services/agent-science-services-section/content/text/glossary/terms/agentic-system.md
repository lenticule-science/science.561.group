---
aliases:
  - agent
  - agentic systems
description: A computational system that acts on its environment through tool use, pursues goals through multi-step planning, and maintains state across interactions.
identity: agentic-system
name: agentic-system
keywords:
  - agent-orchestration
provenance:
  date-created: 2026-03-29
  date-modified: 2026-03-29
conditions: [environmental-action, goal-directed-planning, persistent-state]
acts-through: tool-use
state-kept-by: agent-memory
coordinated-by: agent-orchestration
controlled-by: human-in-the-loop
assessed-by: agent-evaluation
workflow-variant: prompt-chaining
---
An agentic system is a computational system that meets three conditions. It acts on its environment through [tool use](./tool-use.md) — it writes files, calls APIs, modifies databases. It pursues goals through multi-step planning — it decomposes objectives into sequences of actions and selects among alternatives. It maintains state that persists across interactions — it remembers what it has done and can resume after interruption.

All three conditions are necessary. A chatbot generates text but does not act on its environment. A script calls APIs but follows a fixed path — it does not plan. A stateless tool-calling system acts and may plan but forgets between invocations. Each satisfies at most two conditions. An agentic system satisfies all three.

Each condition is testable. Remove the system and observe whether the state changes it caused remain — that tests environmental action. Present the system with a goal requiring two causally dependent actions and observe whether it identifies and executes the dependency without external specification — that tests planning. Interrupt the system between actions and resume it, observing whether it recovers its context without re-deriving its plan — that tests persistent state.

Within agentic systems, the locus of control varies. A **workflow** orchestrates tool calls through predefined code paths — the developer specifies the execution order. An **agent** lets the model direct its own tool calls — the model selects and sequences actions. Both satisfy the three conditions. They differ in who controls the path. This is a spectrum, not a binary.

The term "agentic" entered AI discourse in 2023-2024. The computer science literature previously used "software agent" (distributed systems) and "autonomous agent" (artificial life) with overlapping meanings. The current usage is narrower: LLM-based systems that use tool calling for environmental interaction, orchestrated through frameworks like [LangGraph](../../../../services/agent-orchestration-platform-science-services-section/content/text/glossary/terms/langgraph.md) or [PydanticAI](../../../../services/agent-orchestration-platform-science-services-section/content/text/glossary/terms/pydantic-ai.md) and connected to tools via protocols like MCP and A2A.

An agentic system is a goal-seeking system with negative feedback: it observes the gap between current state and goal state, selects actions to reduce that gap, and adjusts based on results. This is the cybernetic formulation applied to a new substrate. Contemporary agentic AI differs from classical cybernetic controllers in the generality of goal specification (natural language instead of a reference signal) and the breadth of the action space (arbitrary tool calls instead of a fixed actuator).

See [Toward a Falsifiable Definition of Agentic Systems](../../documents/articles/notes/2026/03/29/2026-03-29-toward-a-falsifiable-definition-of-agentic-systems.md) for the full survey of competing definitions and the argument for these three conditions.
