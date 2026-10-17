---
type: object
class: system
description: The OpenClaw Gateway service as it exists in version 2026.05.07.
status: draft
depends-on: []
---

# Gateway (v2026.05.07)

The **Gateway** is the central orchestration service in OpenClaw 2026.05.07.
It is a long-running Node.js process that provides:

## Core Responsibilities

1. **Agent Turn Orchestration**
   - Accepts agent turn prompts via WebSocket (`connect` → `agent` flow) or HTTP (`/v1/chat/completions`, `/v1/responses`)
   - Executes prompts using the configured agent model with access to enabled skills and tools
   - Returns immediate `accepted` acknowledgment followed by streaming `agent` events and final `ok`/`error` response
   - Supports session targets: `main`, `isolated`, `current`, or named sessions (`session:<id>`)

2. **Skill Management**
   - Loads skills from multiple precedence locations (workspace > project-agent > personal-agent > managed/local > bundled > extra dirs)
   - Applies load-time gating based on `metadata.openclaw` (required bins, env vars, config flags, OS)
   - Injects skill-specific environment variables and API keys into agent turn processes
   - Maintains per-agent skill allowlists via `agents.defaults.skills` and `agents.list[].skills`
   - Supports hot reloading of skills via file watcher (debounced at 250ms)

3. **Heartbeat & Cron System**
   - Runs a periodic heartbeat check (default interval: 10 seconds, configurable via `heartbeat.intervalMs`)
   - Evaluates cron jobs using standard cron expressions (in local timezone unless TZ specified)
   - Supports three schedule types:
     - `at`: One-shot at absolute ISO-8601 timestamp
     - `every`: Recurring interval with optional anchor
     - `cron`: Standard cron expression with optional timezone
   - Jobs can target different sessions:
     - `main`: System events injected into main session
     - `isolated`: Ephemeral agent turns in background sessions
     - `current`: Bound to session where cron was created
     - `session:<id>`: Persistent named session
   - Supports delivery modes: `none`, `announce` (to chat), `webhook` (HTTP POST)
   - Includes failure alerting, retry policies, and delete-after-run options

4. **API Surface**
   - OpenAI-compatible endpoints on main port:
     - `GET /v1/models` (returns `openclaw`, `openclaw/default`, `openclaw/<agentId>`)
     - `POST /v1/embeddings`
     - `POST /v1/chat/completions`
     - `POST /v1/responses`
   - WebSocket control/RPC protocol (first frame must be `connect`)
   - HTTP APIs for gateway control, secrets management, and plugin operations

4.1 **WebSocket Protocol Specification**
   - **Transport**: Text frames with JSON payloads over WebSocket
   - **Handshake**: 
     - First frame MUST be a `connect` request
     - Gateway responds with `hello-ok` containing protocol version, server info, features, snapshot, auth, and policy
   - **Message Framing**:
     - Request: `{"type":"req", "id": "<string>", "method": "<string>", "params": <object>}`
     - Response: `{"type":"res", "id": "<string>", "ok": <boolean>, "payload|error": <object>}`
     - Event: `{"type":"event", "event": "<string>", "payload": <object>}`
   - **Key Method Families**:
     - System & Identity: `health`, `status`, `system-presence`, `system-event`, `last-heartbeat`, `set-heartbeats`
     - Models & Usage: `models.list`, `embeddings`, `chat/completions`, `responses`
     - Sessions: `sessions.list`, `sessions.history`, `sessions.send`
     - Agent Control: `agent` (for agent turns), with streaming `agent` events during execution
     - Tools: `tools.list`, `tools.invoke` (for direct tool execution)
     - Skills: `skills.list`, `skills.refresh`
     - Cron: `cron.jobs`, `cron.run`
     - Presence: `node.list`, `system-presence`
     - Approvals: `exec.approvals` (for tool approval workflows)
   - **Event Types**:
     - `agent`: Streaming tokens during agent turn execution
     - `tool`: Tool call requests and results
     - `heartbeat`: Periodic heartbeat events (every 10s by default)
     - `presence`: Presence updates for connected nodes/clients
     - `session.message`: New messages in sessions
     - `session.tool`: Tool usage within sessions
     - `health`: Health status updates
     - `connect`: Connection lifecycle events
   - **Authentication & Scopes**:
     - Roles: `operator` (control plane), `node` (capability host)
     - Operator scopes: `operator.read`, `operator.write`, `operator.admin`, `operator.approvals`, `operator.pairing`, `operator.talk.secrets`
     - Method scope checking: Some methods require specific scopes (e.g., persistent `/config set` requires `operator.admin`)
   - **Policy Limits** (from hello-ok):
     - `maxPayload`: Maximum frame size (default: 26214400 bytes / 25MB)
     - `maxBufferedBytes`: Maximum buffered bytes (default: 52428800 bytes / 50MB)
     - `tickIntervalMs`: Heartbeat interval (default: 15000ms)

5. **Runtime Model**
   - Single multiplexed port (default: 18789) for WebSocket, HTTP, Control UI, and hooks
   - Bind modes: `loopback` (default), `lan`, or explicit IP
   - Auth required by default (shared-secret or trusted-proxy for reverse proxies)
   - Hot reload modes: `off`, `hot` (hot-safe only), `restart` (on required changes), `hybrid` (default)
   - Supervision support for launchd (macOS), systemd (Linux), Scheduled Tasks (Windows)

6. **State & Configuration**
   - Configuration loaded from `openclaw.json` (resolved via profile/state defaults or `OPENCLAW_CONFIG_PATH`)
   - State stored in `OPENCLAW_STATE_DIR` (default: `~/.openclaw/state`)
   - Workspace defaults configurable via `agents.defaults.workspace`
   - Skills configured via `skills.entries` (enabled flags, env injection, config overrides)
   - Plugins managed via `plugins.entries` (enabled state, config)

## Version Specifics (2026.05.07)

- Version identifier: `2026.5.7` (commit eeef486)
- Gateway port resolution: `--port` flag → `OPENCLAW_GATEWAY_PORT` env → `gateway.port` config → default 18789
- Bind mode resolution: CLI/override → `gateway.bind` config → default `loopback`
- Hot reload default mode: `hybrid`
- Heartbeat default interval: 10000ms (10 seconds)
- Cron evaluation uses local wall-clock time (does not convert requested local time to UTC first)
- Maximum context messages for cron jobs: 0-10 previous messages
- Agent turn timeout: configurable per job (`timeoutSeconds`, 0 means no timeout)
