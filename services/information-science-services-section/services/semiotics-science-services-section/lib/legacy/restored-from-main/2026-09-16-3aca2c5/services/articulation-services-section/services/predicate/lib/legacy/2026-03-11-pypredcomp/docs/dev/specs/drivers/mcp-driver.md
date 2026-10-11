---
title: "MCP surface"
description: "The Model Context Protocol tools the substrate exposes to agents."
kind: spec
status: normative
version: "0.1"
---


The substrate exposes its operations as MCP (Model Context Protocol) tools.
Agents call these tools the same way they call any other MCP server's tools.
This is the substrate's primary agent-facing surface.

This spec absorbs the captain's older `cce-rpc.md` and `cce-abi.md`; their underlying contracts (envelope shape, error mapping, evidence vector, transport-neutrality) carry forward.

## 1. Tool catalog

### Substrate primitives

| Tool | Inputs | Output | Effect |
|---|---|---|---|
| `respond` | `{target, payload, sender?, fuel?, evidence?}` | `{status, target_fiber, settled_at_ord, repair_log, evidence?}` | The primary primitive. See [respond.md](respond.md). |
| `query` | `{filter}` | `{matches: cell[]}` | Query cells matching a filter. Reduces to `respond(target=substrate, payload={action: "query", ...filter})`. |
| `get_cell` | `{cell_id}` | cell record | Direct content-addressed fetch. |
| `get_rule` | `{rule_id}` | rule record | Direct fetch. |
| `get_fiber` | `{entity}` | fiber JSON | Settled fiber for an entity. |
| `entity_history` | `{entity, since_ord?, until_ord?}` | event list | Event-log slice for an entity. |

### Substrate writes

| Tool | Inputs | Output | Effect |
|---|---|---|---|
| `add_rule` | rule record (without `id`) | `{rule_id, ord}` | Compute id, append `rule-add` event, return. |
| `retire_rule` | `{rule_id}` | `{ord}` | Append `rule-retire` event. |
| `set_alias` | `{name, cell_id}` | `{ord}` | Append `alias` event. |
| `remove_alias` | `{name}` | `{ord}` | Set alias to empty. |

### Witness and audit

| Tool | Inputs | Output | Effect |
|---|---|---|---|
| `witness` | `{cell_id}` | `{cell, history}` | Cell record + the events that produced it. |
| `evidence` | `{exec_id}` | evidence record | Returns `$ROOT/evidence/<exec-id>.json` if present. |
| `node_state` | `{}` | `{state, reason?, capabilities}` | Current runtime state. |

### Federation

| Tool | Inputs | Output | Effect |
|---|---|---|---|
| `peers` | `{}` | peer list with sync status | Federation peer health. |
| `sync_peer` | `{peer_id, since_ord?}` | `{merged_count, repair_log}` | Manual peer sync. Heartbeat does this automatically; tool is for ops. |

## 2. Envelope

MCP envelopes are JSON-RPC 2.0-style.
Each tool call is a request:

```json
{
  "id": "<client-uuid>",
  "method": "tools/call",
  "params": {
    "name": "respond",
    "arguments": {"target": "...", "payload": {...}, "sender": "..."}
  }
}
```

Response:

```json
{
  "id": "<client-uuid>",
  "result": {
    "content": [{"type": "text", "text": "<canonical JSON of the tool's output>"}]
  }
}
```

Or on error:

```json
{
  "id": "<client-uuid>",
  "error": {
    "code": -32603,
    "message": "PCC_ID_MISMATCH",
    "data": {"code": "PCC_ID_MISMATCH", "details": "..."}
  }
}
```

The textual `code` field in `data` is the source of truth (per [error-codes.md](error-codes.md)).
The numeric JSON-RPC code in `error.code` is a transport convention only.

## 3. Tool metadata

Each tool is an MCP-discoverable item with a JSON Schema for its inputs and outputs.
Tool metadata is itself a substrate entity:

```
(tool:respond, kind, "mcp-tool") = True
(tool:respond, input-schema, "<schema-cell-id>") = True
(tool:respond, output-schema, "<schema-cell-id>") = True
```

This means the MCP tool list is computable from the substrate; adding a tool is appending substrate events; the system carries its own protocol surface.

## 4. Authorization

Tools accept an optional `sender` argument.
When the MCP transport authenticates the caller (e.g., bearer token mapped to a substrate entity), the runtime substitutes that entity as `sender` if not explicitly provided.
Unauthenticated callers default to system-as-sender (no scope restriction); deployments wishing to require auth configure the runtime to reject unauthenticated calls (`PCA_SCOPE_INSUFFICIENT`).

The sender's authority fiber is composed with the call's payload via $\Rightarrow$ before the substrate processes it.
See [respond.md](respond.md) §4.

## 5. Streaming

Some tools produce streaming output:

- `entity_history` — paginates by `ord` ranges.
- `query` with large result sets — streams cells as they're matched.
- A future `subscribe` tool — pushes fiber updates as they happen, for live UI rendering.

Streaming uses MCP's standard streaming response shape (multiple `content` chunks with the same `id`).
The sequence of chunks, given identical inputs and substrate state, is byte-identical (deterministic).

## 6. Conformance

A conforming MCP surface implementation:

1. Implements the tools in §1 with the spec'd semantics.
2. Routes every tool call through the [respond](respond.md) primitive (or, for read-only tools, through the storage cycle).
3. Surfaces error codes verbatim per [error-codes.md](error-codes.md).
4. Preserves canonical bytes through encoding/decoding (no pretty-printing, no key reordering).
5. Carries the response's `evidence` vector unchanged when requested.
6. Matches the [conformance vectors](conformance-vectors.md) round-trip fixtures.

## 7. Discovery

Standard MCP discovery (`tools/list`) returns the catalog.
Each entry includes:

- `name` (matches §1)
- `description` (one-line)
- `inputSchema` (JSON Schema)
- `outputSchema` (JSON Schema; non-standard but useful)

The schemas are queryable as substrate cells (§3) so external tooling can inspect them programmatically.

## 8. Bundled MCP catalog

Beyond the substrate's own MCP surface (§§1–7), the OS ships a **bundled MCP catalog** of agent-facing servers wired into office work by default.
The catalog is normative per [decisions/bundled-mcp-catalog-is-normative.md](../../decisions/bundled-mcp-catalog-is-normative.md); a v0.2 deployment claiming OS-class compatibility includes these four.
The captain's source idea is [`ecc2-feature-port.md`](../../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) §4.

### 8.1 Catalog entries

| Slug | Purpose | Default tools | Default risk band (per tool) |
|---|---|---|---|
| `mcp:sequential-thinking` | Step-by-step reasoning scaffolding for Tier-3 dispatch. Lets the LLM lay out a plan before acting. | `think` | `low` |
| `mcp:playwright` | Headless browser automation for office work that needs DOM-level interaction. | `browser-open`, `browser-navigate`, `browser-click`, `browser-fill`, `browser-screenshot`, `browser-extract` | `low` (open/navigate/screenshot/extract), `medium` (click/fill) |
| `mcp:evalview` | Substrate-aware code/data evaluation; the captain's existing `evalview` discipline ported to MCP. | `eval`, `view`, `inspect-cell` | `medium` (`eval`), `low` (`view`/`inspect-cell`) |
| `mcp:omega-memory` | Long-term cross-session memory store, bounded by personnel/persona/office boundaries per [identity-is-boundary-projection](../../decisions/identity-is-boundary-projection.md). | `remember`, `recall`, `forget`, `list` | `low` (`recall`/`list`), `medium` (`remember`), `high` (`forget`) |

Each catalog entry is a substrate cell:

```json
{
  "kind": "mcp-server-record",
  "slug": "mcp:playwright",
  "version": "1.x.y",
  "transport": "stdio",
  "start-command": ["pnpm", "exec", "mcp-playwright"],
  "tools": ["browser-open", "browser-navigate", "browser-click", "browser-fill", "browser-screenshot", "browser-extract"],
  "default-capability-profile": "capability-profile:bundled-mcp-default",
  "default-risk-profile-per-tool": {
    "browser-open": "risk-profile:browser-read-default",
    "browser-navigate": "risk-profile:browser-read-default",
    "browser-screenshot": "risk-profile:browser-read-default",
    "browser-extract": "risk-profile:browser-read-default",
    "browser-click": "risk-profile:browser-mutation-default",
    "browser-fill": "risk-profile:browser-mutation-default"
  },
  "wired-to-offices": ["office:browse", "office:publish", "office:scrape"]
}
```

Entries live in the `boot/mcp-servers/` namespace of the boot image.
Updates to a bundled server's version are a substrate event with `supersedes` pointing at the prior version cell.

### 8.2 Default office wiring

Each catalog entry declares `wired-to-offices`.
The dispatch scheduler ([`process/dispatch-as-scheduler.md`](../process/dispatch-as-scheduler.md)) treats these as default tool availability for those offices: a session opened under one of the named offices has the entry's tools available via standard MCP discovery within the session.

Per-deployment overrides — restricting a tool from an office, adding a tool to additional offices, replacing the default risk profile — are substrate edits per [decisions/self-representation-everywhere.md](../../decisions/self-representation-everywhere.md).

### 8.3 Federation

Bundled MCP servers run locally per peer.
A peer MAY expose a bundled server's tools to a remote peer via the `mcp-server-record`'s `federate-to-peer` capability cell:

```json
{"s": "mcp:omega-memory", "p": "federate-to-peer", "o": "peer:other-node", "v": "True"}
```

Without the cell, a remote peer cannot invoke a bundled server on the local node.
Cross-peer wiring respects sovereignty per [security/federation-trust.md](../security/federation-trust.md).

### 8.4 Lifecycle

Bundled servers attach at boot per [drivers/driver-model.md](driver-model.md) §4.
Restart policy defaults:

- `mcp:sequential-thinking`, `mcp:evalview`: `always`.
  Stateless; cheap to restart.
- `mcp:playwright`: `bounded-with-backoff` (5 attempts, exponential).
  Browser launch is heavier; transient failures should not loop.
- `mcp:omega-memory`: `always-with-backoff`.
  Stateful but the state is in substrate cells; restart is safe.

### 8.5 Versioning

Each bundled server has a substrate-cell version pin per `(mcp:<slug>, version, "<semver>") = True`.
The boot image declares the pinned version; per-deployment overrides are substrate events.

A version mismatch between the runtime's installed binary and the declared version surfaces `PCS_MCP_VERSION_MISMATCH` at attach time; the supervisor follows restart policy.

### 8.6 Errors

| Code | Meaning |
|---|---|
| `PCS_MCP_SERVER_MISSING` | A bundled catalog entry references a server binary not present on the host. |
| `PCS_MCP_VERSION_MISMATCH` | The installed server's reported version does not match the catalog cell. |
| `PCS_MCP_TOOL_UNREGISTERED` | An office-wired tool is not in the server's `tools/list` response at attach time. |
| `PCS_MCP_TRANSPORT_FAILED` | The configured transport (stdio/TCP/WebSocket) failed to connect. |

### 8.7 Conformance

The bundled MCP catalog passes:

1. **Boot-time attach.** Each of the four bundled servers attaches successfully on a fresh v0.2 boot; failures are surfaced with appropriate `PCS_MCP_*` codes.
2. **Tool availability.** A session opened under each `wired-to-offices` office sees the server's tools via standard MCP discovery.
3. **Risk profile defaults.** Each tool's first audit-log cell carries the documented default risk band per §8.1; closure rules on `high`/`critical` bands fire correctly per [security/tool-risk-scoring.md](../security/tool-risk-scoring.md) §4.
4. **Capability bounding.** A session whose boundary lacks `read:mcp-server:<slug>` cannot invoke the server's tools; surfaces `PCA_SCOPE_INSUFFICIENT`.
5. **Restart policy.** A simulated server crash triggers the documented restart policy; consecutive failures escalate per the policy variant.
6. **Per-deployment override.** A substrate event removing a tool from an office's wiring takes effect on the next session-open under that office.
7. **Federation negotiation.** A peer with `federate-to-peer` invokes a bundled server's tool over the federation transport and receives the same response shape as a local invocation.

## 9. Skill manifest exposure

Beyond the substrate's own tools (§§1–7) and the bundled MCP catalog (§8), the MCP surface exposes the **skill manifest** aggregated by [`stdlib/skill-manifest.md`](../stdlib/skill-manifest.md) §4.
Agents inside the OS enumerate skills the same way they enumerate any MCP tool; the catalog is computed from the substrate, not maintained as a separate registry.

Per [decisions/skills-have-manifest-contracts.md](../../decisions/skills-have-manifest-contracts.md).
The captain's source idea is [`skill-manifest-implementation.md`](../../../../engineering/triage/operations/command/ideas/triage/skill-manifest-implementation.md).

### 9.1 Skill-discovery tools

| Tool | Inputs | Output | Effect |
|---|---|---|---|
| `skills/list` | `{filter?: {part-of?, runtime?, executable?}, limit?: integer}` | `{skills: SkillSummary[]}` | Project the `skill-record` cells (per [stdlib/skill-manifest.md](../stdlib/skill-manifest.md) §2) into a list of summaries (`name`, `description`, `version`, `runtime`, `manifest-version`, `executable`). Reduces to `respond(target=substrate, payload={action: "query", filter: {kind: "skill-record"}})`. |
| `skills/get` | `{name: string, manifest-version?: string}` | full manifest record | Return the complete manifest cell for a single skill. If `manifest-version` is supplied and does not match the substrate's current cell, returns `PCS_SKILL_MANIFEST_VERSION_MISMATCH`. |
| `skills/select-for-task` | `{task: TaskCell, session-id?: string, max-candidates?: integer, include-advisory?: boolean, office?: string}` | ranked candidate list | Wraps the agential-layer `select-skill-for-task` per [agential/skill-registry.md](../agential/skill-registry.md) §2. Available at v0.8; at v0.2 the surface is registered but returns `PCS_AGENTIAL_LAYER_NOT_READY` when invoked outside an agential session. |

The skill-manifest tools follow the standard MCP envelope (§2) and authorisation (§4) disciplines.
`skills/list` is read-only and broadly available; `skills/get` returns the manifest-cell SHA-256 in the response so the caller can pin subsequent invocations; `skills/select-for-task` is bounded by the calling session's boundary projection per [decisions/identity-is-boundary-projection.md](../../decisions/identity-is-boundary-projection.md).

### 9.2 Schema discoverability

The skill-manifest JSON Schema (per [stdlib/skill-manifest.md](../stdlib/skill-manifest.md) §1) is itself a substrate cell at `boot/schemas/skill-spec-v1.schema.json`; clients fetch it via `get_cell` (§1) and validate manifests offline.
The schema's content-addressed id is the canonical reference; revisions ship as new `spec-version` const values and new schema cells.

### 9.3 Conformance

The skill-manifest exposure surface passes:

1. **Enumeration.** A fresh boot followed by `tools/list` returns the documented `skills/list`, `skills/get`, `skills/select-for-task` tool descriptors; `tools/call` against `skills/list` returns the documented bundled-skill catalog with the documented `manifest-version` SHA-256s.
2. **Inspection.** `tools/call` against `skills/get` for a known skill returns the full manifest cell; the response's `manifest-version` matches the substrate's `(skill:<name>, manifest-version, *)` cell.
3. **Pinning.** `tools/call` against `skills/get` with a stale `manifest-version` returns `PCS_SKILL_MANIFEST_VERSION_MISMATCH` per [agential/skill-registry.md](../agential/skill-registry.md) §5.
4. **Capability bounding.** A session whose boundary lacks `read:skill-record` (default-allowed) cannot enumerate skills; surfaces the standard `PCA_SCOPE_INSUFFICIENT` per [security/capability-model.md](../security/capability-model.md) §8.
5. **Schema fetch.** `get_cell` against the schema's content-addressed id returns the canonical schema bytes; the bytes hash to the documented SHA-256.
