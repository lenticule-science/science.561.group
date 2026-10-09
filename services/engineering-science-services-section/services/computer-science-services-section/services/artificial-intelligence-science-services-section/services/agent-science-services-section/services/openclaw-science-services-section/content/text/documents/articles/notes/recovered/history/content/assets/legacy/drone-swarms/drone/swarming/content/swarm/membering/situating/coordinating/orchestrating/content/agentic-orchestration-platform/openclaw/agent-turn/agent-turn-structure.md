---
type: object
class: operator
description: An agent turn in OpenClaw 2026.05.07 - a single execution of the agent runtime with a prompt.
status: draft
depends-on: []
---

# Agent Turn (v2026.05.07)

An **agent turn** is one execution cycle of the OpenClaw agent runtime: the gateway receives a prompt, runs the agent model on that prompt (with access to enabled skills and tools), and returns the resulting output.

## Lifecycle

1. **Ingress**
   - Prompt received via:
     - WebSocket: client sends `agent` message with `prompt` and optional `sessionTarget`
     - HTTP: POST `/v1/chat/completions` or `/v1/responses` (OpenAI-compatible)
     - Cron job: gateway injects prompt as part of job payload
     - Internal: e.g., skill implementation or subagent turn

2. **Session Resolution**
   - Determines session context based on:
     - Explicit `sessionTarget` in request (main, isolated, current, session:<id>)
     - Defaults: `main` for systemEvent payloads, `isolated` for agentTurn payloads
   - Session types:
     - `main`: long-lived session where the user interacts directly
     - `isolated`: ephemeral background session created for the turn, destroyed after completion
     - `current`: bound to the session where the requesting turn originated (if any)
     - `session:<id>`: persistent named session reused across turns

3. **Skill & Tool Preparation**
   - Gateway loads eligible skills based on:
     - Workspace/agent skill precedence
     - Load-time gates (metadata.openclaw.requires.*)
     - Per-agent allowlist (agents.list[].skills or agents.defaults.skills)
   - For each eligible skill:
     - Environment variables and API keys injected from `skills.entries.<name>.env` and `.apiKey`
     - Skill instructions added to system prompt (XML format, ~97 chars per skill)
   - Tools made available based on skill declarations and global tool allowlists

4. **Model Invocation**
   - Agent model called with:
     - System prompt (includes skill/tool descriptions, identity, SOUL/IDENTITY/USER if present)
     - Conversation history (if session retains memory)
     - User prompt
   - Model can:
     - Generate text responses
     - Request tool invocations via structured output (e.g., `{ "name": "tool", "args": {...} }`)
     - Emit `NO_REPLY` to suppress output

5. **Tool Execution Loop**
   - For each tool request:
     - Gateway validates tool is allowed (by skill or global allowlist)
     - Executes tool (read, write, exec, web_search, etc.) with provided arguments
     - Returns tool result to model as `tool` event
     - Model may request further tools or produce final answer

6. **Egress**
   - Streaming: intermediate `agent` events sent as model generates text
   - Completion: final response sent as `status: "ok"` (or `"error"` on failure) with accumulated output
   - If model emits `NO_REPLY`, gateway may send a fallback short reply (configurable)

## Session State

- Each session maintains:
  - Message history (limited by config, typically last N turns)
  - Workspace directory (inherited from agent defaults or overridden)
  - Active skill snapshot (refreshed on session start or via skills watcher)
  - Tool usage metrics (for billing/limits)
- Sessions are isolated: memory and state do not leak between sessions unless explicitly shared (e.g., via files in workspace)

## Version Specifics (2026.05.07)

- Default session timeout: none (sessions persist until explicitly killed or process exit)
- Max concurrent agent turns: limited by system resources; no hard cap in gateway
- Tool execution: each tool runs in a sandbox if `agents.defaults.sandbox` is configured (Docker container)
- Environment injection: scoped to the agent turn process; host environment restored after turn
- Prompt size limit: approximately 8k characters for system+user combined (model-dependent)
- Streaming: agent events sent as Server-Sent Events over WebSocket or HTTP chunked encoding
- Error handling: tool failures returned as `tool` events with `error` field; model can retry or abort
