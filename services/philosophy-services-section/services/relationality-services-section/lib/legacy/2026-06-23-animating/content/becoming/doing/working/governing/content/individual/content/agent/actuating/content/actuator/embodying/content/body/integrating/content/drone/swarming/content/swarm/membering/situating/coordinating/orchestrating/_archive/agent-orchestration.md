---
id: agent-orchestration
description: "The coordination layer that determines which steps an agentic system executes in what order, under what conditions, and with what state."
aliases: [orchestration]
coordinates: agentic-system
built-from: tool-use
decisions: state-management, control-flow, communication, observability
patterns: prompt-chaining, routing, parallelization, orchestrator-workers
controlled-by: human-in-the-loop
assessed-by: agent-evaluation, agent-observability
frameworks: langgraph, pydantic-ai
protocols: model-context-protocol, agent-to-agent-protocol
date-created: 2026-03-29
date-updated: 2026-03-29
---

Agent orchestration is the coordination of one or more [agentic systems](./agentic-system.md) through a defined execution topology.
The topology determines which steps execute in what order, under what conditions, and with what state.
Orchestration sits between the raw [tool use](./tool-use.md) primitive and the goal the system is pursuing.

The simplest orchestration is a linear chain: call tool A, feed the result to tool B, return.
The most complex involve graph-structured workflows with conditional branching, parallel execution, checkpointing, rollback, [human-in-the-loop](./human-in-the-loop.md) pauses, and dynamic subgraph composition.

Four design decisions define any orchestration:

**State management.** How is the running state represented, persisted, and recovered after failure?
The answer ranges from "conversation history in memory" (volatile, lost on crash) to "typed state object checkpointed to a database at every step" (durable, resumable, debuggable).
Durable state is what separates an orchestration from a script — the system can crash and pick up where it left off.

**Control flow.** Is the execution path predefined or model-directed?
Predefined paths are workflows.
Model-directed paths are agents.
Between them is a spectrum: [prompt chaining](./prompt-chaining.md) (fixed sequence), routing (model classifies, fixed handlers), parallelization (independent subtasks), orchestrator-workers (model delegates), and evaluator-optimizer (model judges its own output).
Each step gives the model more control over what happens next.

**Communication.** In multi-agent configurations, how do agents discover each other and exchange messages?
MCP standardizes agent-to-tool connections.
A2A standardizes agent-to-agent communication.
Within a single runtime, frameworks use function calls, shared state, or message queues.

**Observability.** Can the orchestration be inspected, replayed, and debugged?
This is not optional — without it, failures in multi-step workflows are opaque.
Checkpoint-based systems enable time-travel debugging (restore any prior state).
Event-sourced architectures enable deterministic replay.

No existing framework provides formal compositional guarantees — region-restricted execution, provable non-interference between concurrent agents, or skill admissibility conditions.
These remain open problems.

See [Agent Orchestration Ecosystem 2026](../domains/reports/agent-orchestration-ecosystem-2026.md) for the landscape of frameworks, and [Agent Reliability in Production](../texts/agent-reliability-in-production.md) for operational patterns.
