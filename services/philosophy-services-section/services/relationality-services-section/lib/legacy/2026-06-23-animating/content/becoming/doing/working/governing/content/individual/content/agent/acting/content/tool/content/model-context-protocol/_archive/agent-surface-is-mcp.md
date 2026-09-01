---
title: "Agent surface is MCP"
description: "Model Context Protocol is the substrate's agent-facing API. ABI/RPC concerns absorbed."
kind: decision
status: accepted
---


**Decision.** The substrate exposes its operations via Model Context Protocol (MCP).
MCP tools — `respond`, `query`, `add_rule`, etc. — are the canonical agent surface.
The captain's older spec corpus called this "CCE-RPC" and "CCE-ABI"; both concepts are absorbed into the MCP surface.

**Why.**

- **MCP is what agents already speak.** Claude Code, Codex, future agents all support MCP as their tool interface.
  The substrate exposing MCP tools is the lowest-friction agent integration.
- **Transport-neutral.** MCP can run over stdio (process-local), TCP, WebSocket.
  The substrate provides one tool catalog; the transport varies per deployment.
- **The captain's existing harness already uses MCP.** From `operations/engineering/triage/operations/command/personnel/emsenn/triage/projects/emsdeavor/.../plans/0015-mcp-tooling.md` and the `mcp-server.py` script.
  The agent ports the existing tool inventory.

The original CCE-RPC / CCE-ABI specifications carry forward as the *underlying contract* (canonical JSON envelopes, evidence vectors, error codes); the MCP surface is the protocol-level realization.
See the captain's annotation in `cce-abi.md` ("ABI replaced by MCP typed tools.
Concept absorbed.") and `cce-rpc.md` ("RPC replaced by MCP protocol.
Concept absorbed.").

**What this rules out.**

- A separate REST API as the agent's primary surface.
  (HTTP is fine for browsers and federation; agents talk MCP.)
- gRPC, GraphQL, or custom protocols as the agent surface.
- Agent-specific code paths in the substrate.
  Every agent talks the same MCP catalog.

**What this does not constrain.**

- The substrate MAY expose an HTTP surface for browsers and federation peers (per [http-addressing.md](../specs/http-addressing.md)).
  The HTTP surface and the MCP surface are different transports of the same underlying operations.
- Discovery mechanisms (`tools/list` MCP method) are standard; per-tool metadata MAY be enriched.
- Authentication mechanisms are configurable per-deployment.

**Tool catalog.**

The full catalog lives in [specs/mcp-surface.md](../specs/mcp-surface.md).
The captain has analyzed an inventory of ~50 verbs across the existing harness; that informs which tools land first.
The substrate exposes:

- Substrate primitives: `respond`, `query`, `get_cell`, `get_rule`, `get_fiber`, `entity_history`.
- Substrate writes: `add_rule`, `retire_rule`, `set_alias`, `remove_alias`.
- Witness/audit: `witness`, `evidence`, `node_state`.
- Federation: `peers`, `sync_peer`.

App-level tools (chat, ledger, tasks, etc.) compose these primitives; they are not separate MCP tools at the substrate layer.
App-specific MCP tools MAY be exposed by app-level interfacers if convenient.
