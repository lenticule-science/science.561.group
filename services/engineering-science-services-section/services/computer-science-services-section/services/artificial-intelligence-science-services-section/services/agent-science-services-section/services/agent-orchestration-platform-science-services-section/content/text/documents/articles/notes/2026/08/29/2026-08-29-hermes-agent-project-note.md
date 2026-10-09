---
title: "Hermes Agent project note"
date-observed: 2026-08-29
type: project-note
status: source-indexed
project: NousResearch/hermes-agent
license: MIT
date-created: 2026-08-29
description: Hermes Agent combines a local agent runtime with a SQLite-backed Kanban board shared across named profiles.
---

# Hermes Agent

Hermes Agent combines a local agent runtime with a SQLite-backed Kanban board
shared across named profiles. Its documentation makes a scientifically useful
distinction: `delegate_task` is a short-lived fork/join reasoning call, while
Kanban is a durable work queue and state machine with claims, dependencies,
comments, attachments, blockage, review, reclaim, and human intervention.

The board provides durable coordination, not proof of artifact correctness,
exactly-once effects, or distributed-system isolation. Its documented local
workspace modes operate within a trusted-user envelope.

## Verified queue and intervention mechanics

**Current Kanban documentation.** Hermes stores boards and tasks in
`~/.hermes/kanban.db`; a task claimed by a worker is scoped through
`HERMES_KANBAN_TASK`. Workers are full operating-system processes, rather than
an abstract distributed executor. The dispatcher uses heartbeats and a
configurable stale timeout (documented default: four hours): an unresponsive
claimed task can return to `ready`, while a terminal `complete` or `block`
operation records a different outcome. A process that exits successfully while
leaving a task running is documented as a protocol violation and may receive
synthetic nudges before terminal handling.

Those mechanics make abandonment visible and recovery possible, but recovery
can rerun work whose external side effect already occurred. A Kanban task needs
an effect idempotency key and an artifact/evidence admission rule outside the
board to support institutional work.

## Tool, authority, and deployment boundary

**Project security and MCP documentation.** Hermes exposes an MCP client and
server surface. Its embedded MCP server is documented as stdio-only and reads
session data from local session files and SQLite; it is therefore an
operator-local integration boundary, not a networked corporate service by
default. The project describes pairing allowlists, command approvals,
container/remote execution options, MCP credential environment filtering and
context-injection defenses. Its approval modes (`smart`, `manual`, `off`) and
default cron restrictions are useful operator controls, but configuration and
the trusted host still govern the actual authority exercised by a tool call.

Named profiles and the board organize local collaborators; they do not prove
office identity, separation of duties, or a human authorization bound to a
particular tool effect. The project sources inspected do not establish a
formal artifact evaluator or cross-host exactly-once protocol.

## 561 Group inference

Hermes is a strong comparative example of a durable local work queue coupled to
agent execution. Its reclaim/heartbeat behavior helps name the missing
institutional contracts: effect receipts, retry policy, authoritative task
ownership, and reviewable artifact admission must be explicit above the local
SQLite board.

Primary sources observed 2026-08-29:

- [Kanban reference](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/kanban.md)
- [toolsets](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/reference/toolsets-reference.md)
- [security](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/security.md)
- [MCP integration](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/mcp.md)
- [CLI/MCP commands](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/reference/cli-commands.md)

Change watch: claim/reclaim semantics, idempotency, board isolation, scratch
artifact admission, dispatcher failure policy, human approval, and credentials.
