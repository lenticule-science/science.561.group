---
aliases:
  - multi-agent systems
  - agentic AI
description: An architecture where two or more agentic systems coordinate to accomplish a shared goal, each with its own tools, state, and reasoning.
identity: multi-agent-system
name: multi-agent-system
provenance:
  date-created: 2026-03-29
  date-modified: 2026-03-29
relations:
  composed-of: agentic-system
  coordinated-by: agent-orchestration
  communication-via: agent-to-agent-protocol
  patterns: orchestrator-workers, peer-to-peer, pipeline, debate
  cost: coordination-overhead
  controlled-by: human-in-the-loop
  assessed-by: agent-observability
references:
  hansen2021:
    authors: [Jakob Hansen, Robert Ghrist]
    title: "Opinion Dynamics on Discourse Sheaves"
    year: 2021
    publication: "SIAM Journal on Applied Mathematics"
    doi: "10.1137/20M1341088"
---
A multi-agent system is an architecture where two or more [agentic systems](./agentic-system.md) coordinate to accomplish a shared goal. Each agent has its own tools, state, and reasoning process. The agents communicate through defined protocols — shared state, message passing, or inter-agent protocols like A2A — and their joint behavior produces outcomes no single agent achieves alone.

Four coordination patterns cover most multi-agent architectures:

**Orchestrator-workers.** A central agent decomposes a task, assigns subtasks to worker agents, collects results, and synthesizes a response. The orchestrator controls the workflow; workers execute in isolation. Claude Code's subagent model follows this pattern.

**Peer-to-peer.** Agents communicate directly without a central coordinator. Each agent publishes its capabilities and other agents invoke them as needed. Claude Agent SDK's TeammateTool implements this: agents message peers directly rather than routing through a parent.

**Pipeline.** Agents execute in sequence. Each transforms the output of the previous one. Agent A generates a draft, agent B reviews it, agent C formats it. The pipeline is a directed graph where each node is an agent rather than a function.

**Debate / consensus.** Multiple agents independently address the same problem, then compare or critique each other's outputs. Disagreement signals low confidence. This reduces hallucination at the cost of N× token consumption.

Three open problems have no solutions in any existing framework:

**Non-interference.** Two agents operating on overlapping resources can produce conflicting writes. Proving that agents on disjoint regions commute is a formal problem. No framework enforces non-interference guarantees at runtime.

**Coordination cost.** [Coordination overhead](./coordination-overhead.md) can exceed the benefit of specialization. The saturation threshold is approximately 4 agents.

**Accountability.** When a multi-agent system produces a wrong result, identifying which agent made the error requires tracing through inter-agent communication logs. Observability across agent boundaries is harder than within a single agent.

Discourse-sheaf research is a source-backed example in which agents expose
different projections through communication channels [@hansen2021]. It is not
evidence that every multi-agent system has a sheaf model.

See [Multi-Agent Failure Modes](../../documents/articles/notes/2026/03/29/2026-03-29-multi-agent-failure-modes.md) for the MASFT study's empirical findings on why multi-agent systems fail.
