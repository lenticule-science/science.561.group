---
title: "MCP and Claude Agent SDK: Deep Dive"
description: "Analysis of the Model Context Protocol specification and Claude Agent SDK — what capabilities exist, what we use, what we don't, and how our MCP server and agent harness could be enriched."
date-created: 2026-04-04
sources:
  - "https://modelcontextprotocol.io/specification/2025-11-25"
  - "https://platform.claude.com/docs/en/agent-sdk/overview"
  - "https://github.com/modelcontextprotocol/modelcontextprotocol"
  - "https://github.com/anthropics/claude-agent-sdk-python"
---

This text examines the Model Context Protocol (MCP) specification (version 2025-11-25) and Anthropic's Claude Agent SDK to identify capabilities we are not using, patterns for multi-agent orchestration, and concrete opportunities to enrich our 561-datastore MCP server and agentic harness.

## Part 1: The Model Context Protocol

MCP is a JSON-RPC 2.0 protocol connecting hosts (LLM applications), clients (connectors within the host), and servers (services providing context). The architecture enforces isolation: each client-server pair is a stateful session, and servers never see the full conversation or each other's state. The host mediates everything.

### The Three Server Primitives

MCP servers expose three kinds of things, each with a different control model:

1. **Resources** (application-controlled): Structured data the host attaches to context. Resources have URIs, MIME types, optional sizes, and support templates (RFC 6570 URI templates), subscriptions (real-time change notifications), and pagination. Resources can be text or binary, and carry annotations for audience (`user`, `assistant`), priority (0.0–1.0), and last-modified timestamps. The host decides which resources to include; the model does not directly request them.

2. **Prompts** (user-controlled): Templated message sequences with named arguments. These are intended for user-initiated invocation — slash commands, menu items. A prompt returns an array of role/content messages that seed a conversation. Arguments support auto-completion via the completion API.

3. **Tools** (model-controlled): Functions the LLM can call. Tools have JSON Schema input definitions, optional output schemas (for structured content validation), annotations, and support both text and structured responses. Tool results can embed resources, return resource links, or include images/audio. The 2025-11-25 spec adds `outputSchema` for typed structured results, `execution.taskSupport` for long-running tasks, `title` and `icons` fields for UI display, and tool annotations for behavior metadata.

### Client-Side Features (What the Host/Client Offers to Servers)

These are the features our MCP server could *request from* the host:

1. **Sampling**: Servers can ask the client to make LLM calls on their behalf — no API key needed on the server side. The server sends messages, model preferences (intelligence/speed/cost priority hints plus model name hints), and optionally tools. The client maintains human-in-the-loop approval. This enables *agentic server behavior*: an MCP server that reasons, not just responds. The 2025-11-25 spec adds tool use within sampling — the server can provide tool definitions and the client's LLM can call them, creating a multi-turn tool loop within a single sampling request.

2. **Roots**: Servers can query what filesystem boundaries the client has declared. Roots are `file://` URIs with optional names. Clients send `notifications/roots/list_changed` when they change. This lets servers respect workspace boundaries.

3. **Elicitation**: Servers can request structured user input. Two modes:
   - **Form mode**: JSON Schema-constrained form fields (strings, numbers, booleans, enums, multi-select). The client renders a form, validates input, and returns structured data.
   - **URL mode**: Server directs the user to an external URL for sensitive interactions (OAuth, payment, API key entry). Data never passes through the MCP client. Supports completion notifications.

### What Our 561-datastore Server Uses vs. What Exists

| MCP Feature | Spec Supports | Our Server Uses |
|-------------|--------------|-----------------|
| Tools | Yes | **Yes** — 16 tools |
| Prompts | Yes | **Yes** — 5 prompts |
| Resources | Yes | **No** |
| Resource Templates | Yes | **No** |
| Resource Subscriptions | Yes | **No** |
| Sampling | Yes | **No** |
| Roots | Yes | **No** |
| Elicitation | Yes | **No** |
| Tool Output Schemas | Yes | **No** |
| Tool Annotations | Yes | **No** |
| Pagination | Yes | **No** |
| Progress Tracking | Yes | **No** |
| Cancellation | Yes | **No** |
| Logging | Yes | **No** |
| Capability Negotiation | Yes | **Implicit** (no explicit declaration) |

### Concrete Enrichment Opportunities

#### 1. Resources: Expose the Knowledge Graph as Browsable Resources

Instead of requiring tool calls to access entities, expose them as resources with URIs like `entity://library/1234` or `file:///path/to/term.md`. Benefits:

- The host can automatically include high-priority resources in context
- Resource templates like `entity://library/{id}` let the host parameterize access
- Subscriptions would let the host know when the knowledge graph is rebuilt
- Annotations with `audience: ["assistant"]` and priority scores could guide context inclusion

Example: a resource template `entity://library/{type}/{name}` that resolves to entity data, with `listChanged` notifications when the graph is regenerated.

#### 2. Sampling: Let the MCP Server Reason

Our server currently executes tools passively. With sampling, the server could:

- Accept a `graph_search` query, use sampling to ask the LLM to refine the search, and return better results
- Implement a `smart_dispatch` tool that uses LLM reasoning to match tasks to agents
- Run multi-step graph analysis where the server iterates: search → reason → refine → answer
- Implement a `research` tool that uses sampling to read sources and synthesize

This is the biggest architectural shift available: moving from dumb data access to intelligent data access, where the MCP server itself has agency.

#### 3. Elicitation: Interactive Workflows

Our server could use form-mode elicitation for:

- Asking the user to confirm before recording financial transactions
- Requesting classification when triage content is ambiguous
- Collecting task metadata (priority, assignee, deadline) during task creation
- Confirmation dialogs for destructive operations (session termination, data deletion)

#### 4. Tool Output Schemas: Typed Structured Responses

Our tools return unstructured text. Adding `outputSchema` to tools like `graph_search`, `graph_query_attr`, and `graph_stats` would:

- Enable downstream tools and agents to parse results programmatically
- Allow validation of tool outputs
- Provide type information for integration with typed code

Example: `graph_search` could return `{ results: [{ eid: number, title: string, type: string, path: string, source: string }] }` with a matching output schema.

#### 5. Tool Annotations: Behavioral Metadata

Tool annotations let the server declare behavioral properties. We could annotate:

- `record_event` and `start_session` as having side effects
- `graph_search` and `graph_entity` as read-only/idempotent
- `cargo_build` as long-running with progress tracking

#### 6. Progress Tracking and Cancellation

Long operations like `cargo_build`, `install_harness`, and `run_command` should support progress tokens so the client can show build progress and allow cancellation.

#### 7. Logging

The MCP spec supports structured logging from server to client. Our server could emit log messages for graph reload events, event recording, and session management — visible in the host's UI rather than buried in stderr.

## Part 2: The Claude Agent SDK

The Agent SDK (Python: `claude-agent-sdk`, TypeScript: `@anthropic-ai/claude-agent-sdk`) wraps Claude Code's capabilities into a programmable library. The core API is a `query()` function that returns an async generator of typed messages as the agent works.

### Architecture

The SDK bundles the Claude Code CLI and communicates with it via subprocess transport. The agent loop — tool selection, execution, retries, context management — is handled internally. You provide a prompt and options; the SDK handles everything else.

Two interfaces:

- **`query()`**: Stateless, one-shot. Fire a prompt, consume the stream of messages.
- **`ClaudeSDKClient`**: Stateful, bidirectional. Maintains conversation context across multiple exchanges. Supports interrupts, session resumption, and forking.

### Key Capabilities

**Built-in Tools**: Read, Write, Edit, Bash, Glob, Grep, WebSearch, WebFetch, AskUserQuestion, Agent, and more. These are referenced by string name, not defined as JSON schemas.

**Hooks**: Callback functions at lifecycle points — PreToolUse, PostToolUse, Stop, SessionStart, SessionEnd, UserPromptSubmit. Hooks can validate, log, block, or transform behavior.

**Subagents**: Spawned via the Agent tool. Each runs in an isolated context window. Key properties:

- Context isolation: intermediate tool calls stay inside the subagent; only the final message returns
- Parallelization: multiple subagents can run concurrently
- Tool restriction: subagents can be limited to specific tools
- Model override: each subagent can use a different model tier
- MCP server access: subagents can have their own MCP server connections
- Subagents cannot spawn sub-subagents (single level of nesting)
- Subagent transcripts persist independently and survive main conversation compaction

**Sessions**: Capture session IDs to resume conversations with full context. Sessions can be forked for parallel exploration.

**MCP Integration**: MCP servers are passed as configuration. Tools are namespaced as `mcp__<server>__<tool>`. In-process MCP servers can be created via `create_sdk_mcp_server()` with the `@tool` decorator.

**Permission Modes**: `default` (prompt for dangerous tools), `acceptEdits` (auto-accept edits), `plan` (plan only), `bypassPermissions`, `dontAsk`.

**Settings Sources**: Can load Claude Code's filesystem configuration (CLAUDE.md, skills, commands) via `setting_sources=["project"]`.

**Task Budgets**: API-side token budgets that make the model aware of remaining capacity so it can pace tool use and wrap up before limits.

**Plugins**: Extend with custom commands, agents, and MCP servers programmatically.

### What We Already Do vs. What the SDK Enables

| SDK Feature | Available | We Use (via harness) |
|-------------|-----------|---------------------|
| Subagents | Yes | **Yes** — 27 agent definitions in `.claude/agents/` |
| MCP servers | Yes | **Yes** — 4 servers in `.mcp.json` |
| Hooks | Yes | **Yes** — hooks in `.claude/settings.json` |
| Skills | Yes | **Yes** — 54 skills in `.claude/skills/` |
| Commands | Yes | **Yes** — extensive command set |
| Sessions (resume) | Yes | **Partial** — mash-engine dispatches sessions but we don't programmatically resume via SDK |
| In-process MCP servers | Yes | **No** — our server is external (Node.js process) |
| Task budgets | Yes | **No** |
| Dynamic agent definitions | Yes | **No** — agents are filesystem-based, not runtime-configured |
| ClaudeSDKClient (bidirectional) | Yes | **No** — we use CLI, not SDK programmatic interface |
| Model routing per subagent | Yes | **Yes** — agent definitions specify model |
| Hook callbacks (Python/TS) | Yes | **No** — our hooks are shell scripts |

### Orchestration Patterns from the SDK

The SDK documentation and examples reveal several patterns relevant to our harness:

#### 1. The Orchestrator-Worker Pattern

A main agent delegates to specialized subagents. The main agent has broad tool access including the Agent tool. Workers have restricted tools. The orchestrator decides what to delegate based on descriptions.

This is exactly what we do with our agent harness. The SDK formalizes it.

#### 2. Context-Budget-Aware Work

The `TaskBudget` feature lets the model know its remaining token budget. This maps directly to our need for autonomous loops that don't run out of context. A mash-engine session could pass a task budget so the agent wraps up cleanly.

#### 3. Session Continuity

The SDK supports resuming sessions by ID. Subagents can be resumed by their agent ID within a session. Transcripts persist independently. This suggests our mash-engine dispatch could be enriched to:

- Track session IDs for resume
- Allow follow-up queries to running agents
- Fork sessions for parallel exploration of approaches

#### 4. In-Process MCP for Tight Integration

The `create_sdk_mcp_server()` pattern lets you define MCP tools as Python functions with the `@tool` decorator. This is simpler than running a separate Node.js process. If we moved to SDK-based orchestration, we could define our datastore tools as Python functions with direct access to our data structures.

## Part 3: How Our MCP Server Could Be Enriched

Based on the gap analysis above, here is a prioritized list of enrichments:

### High Priority

1. **Add Resources for knowledge graph entities**. Expose terms, texts, plans, and tasks as resources with URIs, MIME types, and annotations. Enable the host to include relevant context automatically rather than requiring explicit tool calls.

2. **Add Tool Output Schemas**. Start with `graph_search`, `graph_entity`, `graph_query_attr`, and `sessions_list`. Return structured JSON alongside text. This makes our tools composable — downstream tools and agents can parse results without string-matching.

3. **Add Tool Annotations**. Declare which tools are read-only, which have side effects, which are long-running. This helps the host make better safety and UX decisions.

### Medium Priority

4. **Implement Sampling for intelligent tools**. Create tools that use the host's LLM to reason about data — a `smart_search` that refines queries, a `smart_dispatch` that evaluates task-agent fit with reasoning, a `summarize_entity` that reads and synthesizes.

5. **Add Progress Tracking** for `cargo_build`, `install_harness`, and other long operations. The MCP spec supports progress tokens — the server sends `notifications/progress` with `progressToken`, `progress`, and `total`.

6. **Expose Resource Templates** for parameterized access: `entity://{graph}/{type}/{id}`, `file:///{path}`. This lets the host auto-complete entity access.

### Lower Priority

7. **Add Elicitation** for interactive confirmation of financial transactions and destructive operations.

8. **Add Logging** for structured operational visibility — graph reload events, session starts, error conditions.

9. **Implement Resource Subscriptions** so the host is notified when the knowledge graph changes, when new sessions start, when tasks change status.

## Part 4: What the Official Guidance Says About Multi-Agent Orchestration

Anthropic's guidance through the SDK reveals a clear vision:

**Single-level delegation**: Subagents cannot spawn sub-subagents. The architecture is orchestrator → workers, not a deep hierarchy. This is deliberate — it keeps context flow predictable and prevents runaway agent chains.

**Description-driven routing**: The orchestrator decides which subagent to invoke based on the subagent's `description` field. Clear, specific descriptions are the primary routing mechanism. This matches our agent definitions in `.claude/agents/`.

**Context isolation is a feature**: Subagents get a fresh context window. They don't inherit the parent's conversation history. The only input channel is the Agent tool's prompt string. This means agent prompts must be self-contained with all necessary context — file paths, error messages, decisions.

**Model routing per task**: Different subagents can use different model tiers. This maps to our existing model field in agent definitions. The guidance is to use more capable models for high-stakes work and lighter models for routine tasks.

**MCP servers as agent infrastructure**: Subagents can have their own MCP server connections. This means specialized agents could connect to specialized data sources without polluting the orchestrator's tool list.

**Session persistence over conversation persistence**: Subagent transcripts survive main conversation compaction. This is important for long-running work — the subagent's full context is preserved even as the orchestrator's context is compressed.

**Hook-based control**: Hooks provide the control plane — validating tool calls, logging actions, blocking dangerous operations. The SDK supports Python/TypeScript callback functions as hooks, not just shell scripts. This is more flexible than our current shell-script hooks.

## Conclusion

Our current MCP server uses approximately 20% of the MCP specification's capabilities. The largest gaps are Resources (which would let the host manage context inclusion automatically), Sampling (which would let the server reason), and structured outputs (which would make tools composable).

The Agent SDK formalizes patterns we already use — orchestrator/worker delegation, model routing, tool restriction, context isolation. The main things we don't use are task budgets, session resume, in-process MCP servers, and programmatic hook callbacks.

The path forward is clear: enrich the MCP server with Resources and structured outputs first (these improve every tool call), then add Sampling for intelligent tools (this changes the server from passive to active), then layer in the SDK's session management for better mash-engine integration.
