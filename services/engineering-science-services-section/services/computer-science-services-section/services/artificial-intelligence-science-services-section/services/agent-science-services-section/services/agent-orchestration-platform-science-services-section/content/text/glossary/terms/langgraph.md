---
description: A graph-based agent orchestration framework by LangChain for building stateful, multi-step AI agent workflows with checkpoint persistence, time-travel debugging, and human-in-the-loop support.
identity: langgraph
name: LangGraph
provenance:
  date-created: 2026-03-29
  date-modified: 2026-03-29
relations:
  instance-of: agent-orchestration
  requires: directed-graph
  enables: durable-execution, human-in-the-loop
  contrasts-with: pydantic-ai
---
LangGraph is a graph-based [agent orchestration](../../../../../../content/text/glossary/terms/agent-orchestration.md) framework for building stateful, multi-step AI agent workflows. It is developed by the LangChain team (Harrison Chase et al.) and released under the MIT license. Development began in summer 2023, with an initial release in January 2024 and a **v1.0 stable release on October 22, 2025**, committing to no breaking changes until v2.0. The current version as of March 2026 is 1.1.0.

LangGraph's core abstraction is a [directed graph](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/directed-graph.md) where **nodes** are processing steps (Python functions or LangChain runnables), **edges** define transitions between them (static or conditional based on state), and **state** is a typed object (TypedDict or Pydantic model) that persists across the graph's execution. Every node receives the current state as input and returns state updates as output. The graph structure is the control flow; the state object is the data flow.

The framework's distinctive feature is its **checkpoint system**. At every step, LangGraph automatically serializes the graph state to a persistent store (SQLite, Postgres, or custom backends). This enables:

- **Failure recovery.** A crashed workflow resumes from its last checkpoint rather than restarting.
- **Time-travel debugging.** Any prior state can be restored and re-executed. The operator can inspect the exact state at any point in a workflow's history.
- **Human-in-the-loop.** Execution pauses at designated nodes, presents state to a human operator for review or modification, and resumes with the updated state. Human-in-the-loop is a first-class API.

LangGraph supports **subgraphs** (nested graphs for modular composition), **streaming** (token-level, node-level, and custom event streaming), and MCP integration. It is model-agnostic through its parent project LangChain, which provides provider abstractions for Claude, GPT, Gemini, open-source models, and others.

The relationship between LangGraph and LangChain is layered: LangChain provides high-level agent abstractions built on top of LangGraph's runtime. Developers can use LangChain's prebuilt agents for common patterns and "drop down" to LangGraph for fine-grained control when needed. As of v1.0, prebuilt agent functionality migrated from `langgraph.prebuilt` to `langchain.agents`.

Notable adopters include Uber, LinkedIn, and Klarna. LangChain (the parent company) raised funding at a $1.25 billion valuation in 2025.

### Assessment

LangGraph's checkpoint-and-replay model solves durable, inspectable workflows well. The graph-as-control-flow abstraction makes execution topology explicit where imperative agent loops leave it implicit. The cost is coupling to the LangChain ecosystem and an abstraction layer that adds weight when the underlying operations are simple. LangGraph provides runtime plumbing; formal compositional guarantees (region restriction, non-interference proofs) must be built on top.

## Related terms

- [Agent orchestration](../../../../../../content/text/glossary/terms/agent-orchestration.md) — the problem LangGraph addresses
- [PydanticAI](./pydantic-ai.md) — alternative framework emphasizing type safety
- [Agentic system](../../../../../../content/text/glossary/terms/agentic-system.md) — what LangGraph helps build
- [Tool use](../../../../../../content/text/glossary/terms/tool-use.md) — the primitive LangGraph coordinates
