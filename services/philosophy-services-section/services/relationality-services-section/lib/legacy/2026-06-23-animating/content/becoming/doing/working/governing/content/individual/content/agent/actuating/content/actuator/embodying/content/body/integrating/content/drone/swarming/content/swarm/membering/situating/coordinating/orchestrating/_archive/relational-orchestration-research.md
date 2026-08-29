---

description: "Relational orchestration: how work enters, gets stored, gets executed, and gets verified done in the relational machine context."
defines: RelationalOrchestration
extends: Orchestration
component-of: FlatfileAgentialResourceSystemLocale
date-modified: 2026-03-19
introduces: specification
---

# Relational Orchestration

**RelationalOrchestration** is [Orchestration](orchestration.md) as implemented in a relational machine context — where work units are typed markdown entries and stores are locale context files.

## Work storage

Work lives as markdown files.
Two kinds of work files exist in every locale:

- **INBOX.md** — incoming messages not yet acted on.
  Each entry is a [FlatfileAgentialResourceSystemMessage](flatfile-agential-resource-system-message.md).
- **PLANS.md** — work items with explicit done conditions.
  Each entry is a [OperationItem](operation-item.md).

There is no separate state store — reading INBOX and PLANS gives the full picture.

## Loop closure

Every locale has two loops that must stay closed:

**Triage loop** — INBOX messages → OperationItems in PLANS.
Done when INBOX is empty or every message has a corresponding OperationItem.

**Improvement loop** — open OperationItems → completed OperationItems.
Done when no open non-blocked OperationItems remain.

A loop is closed when its done condition holds.
Stale OperationItems and unread INBOX messages are worse than ignorance — they actively misdirect.

## Open questions
