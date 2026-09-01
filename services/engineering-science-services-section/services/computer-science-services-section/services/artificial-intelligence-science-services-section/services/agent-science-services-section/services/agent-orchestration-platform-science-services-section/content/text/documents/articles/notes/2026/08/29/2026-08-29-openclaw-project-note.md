---
title: "OpenClaw project note"
date-observed: 2026-08-29
type: project-note
status: source-indexed
project: openclaw/openclaw
license: MIT
---

# OpenClaw

OpenClaw is observed here as an integrated, operator-owned agent gateway and
runtime. It owns prompt assembly, model/tool execution, session management,
workspace/bootstrap context, channel delivery, routing among configured agents,
and bounded background subagents.

Its per-agent workspaces and SQLite stores are useful state partitions. They do
not establish hostile multi-tenancy, corporate authority, or hard filesystem
isolation without an enforcing sandbox. A completion handoff is a transport
event, not capability-delivery evidence.

## Verified topology and recovery boundary

**Repository documentation, not an independent deployment assay.** The current
database-first design describes a global SQLite database as the owner of agent
discovery, gateway and pairing state, device/node state, task and flow ledgers,
plugin state, scheduler runtime state, and backup/migration metadata. Separate
per-agent databases own session and transcript state, including transcript
events, snapshots, compaction and virtual-file-system material. That is a real
state partition and gives a concrete recovery/migration surface; it is not a
claim that a gateway restart makes a remote provider call exactly once.

The memory configuration documents an agent-local index using SQLite FTS5 and
`sqlite-vec` by default, with an in-process cosine fallback and an optional QMD
backend. Searchability is therefore a derived representation of local state,
not proof that retrieved text is authoritative corporate memory. The `doctor`
procedure documents importing older session/transcript material into per-agent
SQLite; it is operational migration support, not an archival provenance model.

## Authority, protocol, and operator surface

**Project security documentation.** OpenClaw explicitly frames the gateway as
one trusted operator boundary. Its security guide locates credentials in
configuration, a global state database (including MCP OAuth tokens), and
per-agent state; it recommends restrictive filesystem permissions and a
dedicated operating-system account. The same guide cautions that configured
workspaces are not a hard sandbox and that a shared channel can induce tool use
within its policy. Thus an OpenClaw agent identity, sender allowlist, channel
binding, or workspace must not be mistaken for a 561 Group office, delegated
authority, or independently enforced containment.

MCP/OAuth and channel delivery are concrete integration paths, while the
gateway's routing and subagent handoff remain runtime coordination paths. The
repository material inspected does not establish an approval record that binds
a human authorization to a particular external side effect, or an evaluation
regime that verifies a delivered artifact.

## 561 Group inference

OpenClaw is best studied as an operator-run execution edge: it can project
work into channels, tools, sessions, and subagents, but should consume scoped
authority and emit evidence-bearing receipts to a separate corporate record.
The documented shared-operator threat model rules out treating its local
database as a multi-party institutional ledger without additional controls.

Primary sources observed 2026-08-29:

- [runtime and workspace](https://github.com/openclaw/openclaw/blob/main/docs/concepts/agent.md)
- [multi-agent routing](https://github.com/openclaw/openclaw/blob/main/docs/concepts/multi-agent.md)
- [subagents](https://github.com/openclaw/openclaw/blob/main/docs/tools/subagents.md)
- [security model](https://github.com/openclaw/openclaw/blob/main/SECURITY.md)
- [database-first state design](https://github.com/openclaw/openclaw/blob/main/docs/refactor/database-first.md)
- [memory configuration](https://github.com/openclaw/openclaw/blob/main/docs/reference/memory-config.md)
- [migration/doctor procedure](https://github.com/openclaw/openclaw/blob/main/docs/cli/doctor.md)
- [gateway security guide](https://github.com/openclaw/openclaw/blob/main/docs/gateway/security/index.md)

Change watch: session storage, workspace attestation, subagent policy, sandbox
defaults, tool policy, plugin/MCP boundaries, and gateway security assumptions.
