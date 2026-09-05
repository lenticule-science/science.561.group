---
part-of:
  - reports

title: "Agent orchestration ecosystem survey (March 2026)"
date-created: 2026-03-07T00:00:00
keywords:
  - agential-semioverse
  - progressive-automation
  - mcp
description: "Survey of agent orchestration frameworks, protocols, and tooling as of March 2026, assessed against the emsemioverse's tech stack requirements."
---

This text surveys the agent orchestration ecosystem as of March 2026, assessed against the requirements of the [agential semioverse tech stack](../agential-semioverse-tech-stack.md): a Python service that loads skills from a library, exposes them via HTTP and MCP, and enforces a library/engine boundary where all admissible operators live in the library.

## Frameworks surveyed

### Claude Agent SDK (Anthropic)

The SDK that powers Claude Code.
Provides a conversation loop, built-in file/shell tools, automatic context compaction, session persistence, subagent spawning, and MCP extensibility.
As of early 2026 it includes "agent teams" (TeammateTool) for peer-to-peer messaging between agents, removing the parent-relay bottleneck of the subagent model.
Locked to Claude models.
MIT license (Python SDK).

### PydanticAI

Python agent framework emphasizing type safety.
Model-agnostic (Claude, GPT, Gemini, open-source).
Supports MCP (client and server), the A2A protocol for agent-to-agent interoperability, durable execution across failures, and dynamic toolsets.
MIT license.
The strongest candidate for a model-agnostic agent-side layer.

### CrewAI

Role-based multi-agent orchestration.
Agents have roles, goals, and backstories; they are organized into crews with sequential, hierarchical, or consensual coordination.
Model-agnostic.
Has a memory system (short-term, long-term, entity, contextual).
MIT license.
Designed for multi-agent workflows but does not provide the service-kernel pattern.

### AutoGen / Microsoft Agent Framework

Event-driven multi-agent conversation framework, merging with Semantic Kernel into the Microsoft Agent Framework (RC, GA targeted Q1 2026).
Adds graph-based workflows, session management, middleware, and telemetry.
Model-agnostic.
Security proxies support role-based tool access.
MIT license.
Enterprise-grade but architecturally heavy.

### LangGraph

Graph-based stateful agent workflows.
Nodes are agent steps, edges are transitions.
Built-in checkpoint persistence (SQLite, Postgres), time travel (rollback to any state), and human-in-the-loop.
Model- agnostic via LangChain.
MIT license.
The checkpoint system is its distinctive feature.

### OpenHands (formerly OpenDevin)

Open-source coding-agent platform.
Agents write code, run shells, browse web.
Sandboxed Docker execution.
Event-sourced state model with deterministic replay.
Model-agnostic (100+ providers).
Hierarchical agent delegation.
MIT license.
Designed for software engineering, not knowledge-repository management.

### OpenClaw

Open-source personal AI assistant platform built around a persistent Gateway process that runs on hardware the operator controls.
The repository describes the assistant as reachable through many channels, including WhatsApp, Telegram, Slack, Discord, Google Chat, Signal, iMessage, BlueBubbles, Matrix, and WebChat, plus companion surfaces on macOS, iOS, and Android.
The Gateway acts as the control plane for sessions, routing, tools, and configuration.

The project is Node-based, installed through npm, and documented as terminal-first.
Optional capability is pushed into plugins, with memory treated as a special plugin slot.
Skills exist as a separate extension layer, and MCP support is intentionally decoupled from core through the `mcporter` bridge rather than built as a first-class MCP runtime inside OpenClaw itself.

The architecture -- local-first gateway + agent execution + skills + pluginized capability -- is essentially a consumer-grade implementation of the pattern described in the [tech stack plan](../agential-semioverse-tech-stack.md).
Key difference: OpenClaw is designed for personal assistant tasks; the emsemioverse engine needs the library/engine boundary, typed skill schemas, and region-restricted execution.
OpenClaw's emphasis is personal deployment, channel reach, and operator-controlled security boundaries rather than formal execution guarantees.

### Others surveyed

- **OpenAI Swarm / Agents SDK**: Lightweight handoff-based coordination.
  Locked to OpenAI.
  Swarm was educational; Agents SDK is production.
- **Mastra**: TypeScript-first agent framework.
  MCP client AND server support.
  Not Python.
- **smolagents** (HuggingFace): Minimalist, ~1000 lines.
  Agents write Python code.
  Apache 2.0.
  Good for prototyping.

## Protocols

### MCP (Model Context Protocol)

Open standard (now under Linux Foundation's Agentic AI Foundation, co-founded by Anthropic, OpenAI, and Block).
Agent-to-tool protocol.
5,800+ servers, 300+ clients, 97M+ monthly SDK downloads.
Adopted by OpenAI, Google, Microsoft, and major IDEs.
The correct protocol for the engine's agent-facing interface.

### Google A2A (Agent-to-Agent)

Open protocol for agent interoperability.
Agents discover each other via Agent Cards (JSON capability descriptions), exchange Tasks with lifecycle states, and communicate via HTTP/gRPC.
Contributed to the Linux Foundation in June 2025.
100+ enterprise partners.
PydanticAI integrates it.
A2A is the complement to MCP: MCP connects agents to tools; A2A connects agents to agents.

### ANP (Agent Network Protocol)

Community-driven protocol for decentralized agent networks.
Three- layer architecture: identity/encryption, meta-protocol negotiation, application protocol.
IETF draft exists.
Less mature than A2A, not production-ready.

## What no framework provides

Three things the emsemioverse has formalized that no existing framework implements:

1. **Region-restricted agents.** The [multi-agent coordination](../../../../specifications/agential-semioverse-repository/theory/multi-agent-coordination.md) spec defines directory regions with non-interference guarantees (commutativity of operators on disjoint regions, proven via the sheaf condition).
  No framework formalizes this.
  The closest mechanisms are Claude Code's worktree isolation, AutoGen's security proxies, and PydanticAI's dynamic toolsets.

2. **Skills as mathematical operators.** All frameworks have "tools" (functions with schemas).
  None treat them as interaction operators with formal admissibility conditions (fragment- preservation, closure-compatibility, provenance extension, failure monotonicity).
  The formal theory is the emsemioverse's contribution.

3. **The library/engine boundary.** Most frameworks blur agent runtime, tool definitions, and orchestration logic.
  The emsemioverse's insistence that all operators live in the library and the engine is a thin execution kernel is an architectural choice that must be implemented on top of any framework.

## Assessment for the emsemioverse

### What we should build

A minimal custom Python service.
Use the MCP Python SDK to expose skills as MCP tools.
Use FastAPI for HTTP.
Write a skill loader that reads SKILL.md files and colocated schemas.
This IS the engine described in the [tech stack plan](../agential-semioverse-tech-stack.md).
No framework provides it; we build it.

### What we should adopt

- **MCP** (already using) as the agent-to-tool protocol.
- **A2A** as the agent-to-agent protocol, when inter-agent coordination moves beyond Claude Code's subagent model.
- **PydanticAI** as the agent-side layer if/when we need model- agnostic agent capabilities or durable execution.

### What we should NOT adopt

- Heavyweight orchestration frameworks (CrewAI, LangGraph, Microsoft Agent Framework) unless coordination complexity exceeds the existing coordination grammar.
  The formal theory in the multi-agent coordination spec is more rigorous than what these frameworks provide; they add plumbing, not guarantees.
- OpenAI-locked tooling (Swarm, Agents SDK).
- TypeScript-only frameworks (Mastra).

### What we're doing right

- The SKILL.md-as-configuration pattern is converging across the industry.
  Claude Code uses `.md` files for skills.
  OpenHands uses `SOUL.md` for agent identity.
  GitHub Agentic Workflows define workflows in markdown.
- The formal theory (regions, non-interference, fan-out, pipeline, coordination terms) is more rigorous than anything commercial frameworks provide.
  The frameworks provide runtime plumbing; the emsemioverse provides compositional guarantees.
- MCP as first-class transport is correct and timely.

### What we're missing

- The engine itself.
  We have the spec; we do not have the service.
  Plan 0015 (MCP tooling) is the path here.
- A2A for agent-to-agent communication.
  Currently all agent coordination goes through Claude Code's subagent model, which requires Claude.
  A2A would allow heterogeneous agents.
- Persistent state across sessions beyond what Claude Code provides.
  LangGraph's checkpoint model is instructive: save state at every step, enable rollback.
  Our working-notes approach is a manual approximation.
- Typed skill schemas.
  SKILL.md frontmatter declares input/output types but nothing validates them at execution time.
  PydanticAI's approach (Pydantic models as tool schemas) is the right pattern.

## Sources

Research conducted via web search, March 2026.
Primary sources: Anthropic platform docs, PydanticAI docs, CrewAI docs, Microsoft Agent Framework docs, LangGraph docs, OpenHands docs, MCP specification, A2A specification.
