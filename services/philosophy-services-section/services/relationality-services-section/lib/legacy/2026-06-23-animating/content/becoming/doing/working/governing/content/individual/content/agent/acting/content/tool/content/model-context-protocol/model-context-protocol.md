---
title: "Model Context Protocol"
description: "An open protocol standardizing how language models connect to external tools and data sources — the agent-to-tool complement to A2A's agent-to-agent communication."
domain: agents
dual-of: agent-to-agent-protocol
enables: tool-use
requires: json-schema
delivers: tool-use
acts-on: agentic-system
date-created: 2026-03-29
date-updated: 2026-03-29
references:
  - id: anthropic-mcp-2024
    type: document
    title: Introducing the Model Context Protocol
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2024
    URL: https://www.anthropic.com/news/model-context-protocol
  - id: aaif-2025
    type: document
    title: Linux Foundation Announces the Formation of the Agentic AI Foundation
    author:
      - literal: Linux Foundation
    container-title: Linux Foundation
    issued:
      - year: 2025
    URL: https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation
cites:
  - anthropic-mcp-2024
  - aaif-2025
---

The Model Context Protocol (MCP) is an open protocol standardizing how [agentic systems](../../terms/agentic-system.md) connect to external tools and data sources.
Anthropic released MCP in **November 2024**.
On **December 9, 2025**, it became a founding project of the Linux Foundation's Agentic AI Foundation (AAIF), alongside [AGENTS.md](../../terms/agents-md.md) and Block's goose.
As of early 2026, the ecosystem includes 5,800+ servers, 300+ clients, and 97M+ monthly SDK downloads.
OpenAI, Google, Microsoft, and all major IDEs have adopted it.

MCP follows a client-server architecture.
The **MCP server** exposes capabilities — tools, resources, and prompts — through a standardized interface.
The **MCP client** (embedded in the agent runtime) discovers and invokes those capabilities.
The protocol uses JSON-RPC 2.0 for message exchange, with transport over stdio (for local processes) or HTTP with Server-Sent Events (for remote servers).

### Core primitives

**Tools.** Functions the model can invoke.
Each tool has a name, description, and input schema defined in [JSON Schema](../../../../terms/json-schema.md).
The model decides when to call a tool based on the conversation context; the client executes the call against the server and returns the result.
This is the same [tool use](../../terms/tool-use.md) pattern that providers implement natively, but MCP makes tool definitions portable across providers and runtimes.

**Resources.** Data the model can read — files, database records, API responses, structured documents.
Resources have URIs and MIME types.
The client fetches resources on behalf of the model, injecting their content into the [context window](../../../terms/context-window.md).
Resources extend what the model can see; tools extend what the model can do.

**Prompts.** Reusable prompt templates that servers can expose for common tasks.
The client can list available prompts and fill in their parameters.

### Relationship to A2A

MCP and [A2A](../../terms/agent-to-agent-protocol.md) address orthogonal concerns.
MCP connects an agent to its tools — databases, file systems, APIs, code execution environments.
A2A connects agents to other agents — systems with their own tools, models, and implementations.
An agent uses MCP to act on its environment and A2A to coordinate with peers.
[PydanticAI](../../terms/pydantic-ai.md) integrates both natively.

### Relationship to native tool use

Every major LLM provider (OpenAI, Anthropic, Google) implements [tool use](../../terms/tool-use.md) through proprietary API parameters.
MCP sits above this layer: it defines how tools are described, discovered, and invoked regardless of which provider's API the agent uses.
A [LangGraph](../../terms/langgraph.md) workflow, a [PydanticAI](../../terms/pydantic-ai.md) agent, and a Claude Code session can all connect to the same MCP server and use the same tools, even though they use different models and different runtimes.

## Related terms

- [Tool use](../../terms/tool-use.md) — the mechanism MCP standardizes
- [A2A](../../terms/agent-to-agent-protocol.md) — the agent-to-agent complement to MCP
- [JSON Schema](../../../../terms/json-schema.md) — the format MCP uses for tool definitions
- [Agentic system](../../terms/agentic-system.md) — the systems MCP equips with tools
