---
title: "Inter-session messaging is substrate cells"
description: "Typed messages between sessions (task-handoff, query, response, completed, conflict) are substrate cells with EAVT predicates, not entries in a separate inbox queue. The heartbeat surfaces unread messages on each tick."
kind: decision
date: "2026-05-02"
status: committed
---

# Inter-session messaging is substrate cells

## What

The OS's inter-session messaging discipline — the typed-message channel ECC2 (the captain's predecessor everything-claude-code Rust TUI at `operations/engineering/fars/src/everything-claude-code/ecc2/`) shipped against a SQLite store — is expressed as substrate cells, not as a separate inbox queue with its own consistency rules.

Specifically:

- Each message is a substrate entity of `kind = "session-message"` with EAVT cells encoding `from-session`, `to-session`, `msg-type`, `content-cell`, `read`, `authored-at-ord`.
- The five canonical `msg-type` values are `task-handoff`, `query`, `response`, `completed`, `conflict`.
  Apps MAY define their own subtypes by registering them via closure rules; the canonical kinds are normative.
- The recipient's "inbox" is the substrate fiber projected at `(session:<my-id>, has-unread-message, *)`.
  The heartbeat tick fires a periodic closure rule that asserts `has-unread-message` for each unread message addressed to an open session.
- `read` is a per-recipient predicate (`(session-message:<id>, read, session:<R>) = True`), so broadcast messages have one envelope and per-recipient read state.
- Threading is via `responds-to` predicates on the response's content-cell; the substrate's existing closure-rule traversal is sufficient.
- Cross-session messaging is bounded by capability — a sender needs `signal:session-message:<msg-type>` against the recipient.
  Federated messaging goes through the standard federation receive path.

The full normative content lives in [`specs/process/inter-session-messaging.md`](../specs/process/inter-session-messaging.md).
The captain's source idea is [`ecc2-feature-port.md`](../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) §1.

## Why

ECC2 implemented inter-session messaging as a SQLite table with sender, recipient, type, body, read-flag columns.
That works for a TUI shell talking to its own subprocess fleet.
It does not survive the OS's commitments to byte-identical replay, federation, capability discipline, signing, and audit.

The substrate already has every primitive ECC2's table needs:

- **EAVT cells** carry the message envelope.
  SHA-256 content addressing replaces the SQLite primary key.
- **Closure rules** replace the inbox query.
  The surfacing rule fires on the heartbeat tick; the inbox is a fiber projection, not a separate query language.
- **Capability fibers** replace ad-hoc "can session X message session Y" checks.
  The check is the substrate's $\Rightarrow$ algebra.
- **Federation protocol** replaces a separate sync layer.
  Messages cross peers under signed federation envelopes.
- **The event log** replaces the SQLite history table.
  Replay reproduces every message and every read flag byte-identically.

Re-implementing the inbox as a separate queue would duplicate state outside the substrate's algebra and lose every one of those properties.
Expressing messages as substrate cells preserves them all and surfaces no new disciplines for the captain to keep in their head.

The five canonical `msg-type` values come from ECC2's working vocabulary: those are the kinds the captain has actually needed when running multi-session TUI work.
They are committed to as the floor; subtype extensions are open per-deployment.

The heartbeat-driven surfacing matches [`decisions/heartbeat-is-the-scheduler.md`](heartbeat-is-the-scheduler.md).
The inbox is not a notification stream pushed by an event bus; it is the substrate at one tick.

Source: this conversation (2026-05-02); the captain's [`ecc2-feature-port.md`](../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) (2026-05-02); ECC2 source at `operations/engineering/fars/src/everything-claude-code/ecc2/` (referenced, not read).

## What it rules out

- A separate inbox table or queue with its own consistency rules.
  Messages are substrate cells.
- A push-notification bus that delivers messages outside the heartbeat.
  The heartbeat IS the delivery mechanism.
- Per-message ACL entries.
  Send authority is a capability fiber per [`capability-not-acl.md`](capability-not-acl.md).
- Mutating a message's body in place after authoring.
  Bodies are content-addressed cells; revisions are new cells with `supersedes` predicates.
- A global per-session unread count cell.
  Unread messages are derivable from the substrate; counting is a query, not a stored aggregate.
- Cross-session messaging that bypasses signing.
  Every authored message inherits its sender boundary's signing per [`signing-and-witnessing.md`](../specs/security/signing-and-witnessing.md).

## What it does not constrain

- The specific TUI/web GUI rendering of the inbox.
  The substrate provides the projection; the shell decides how to display it (per [`shell/tui-shell.md`](../specs/shell/tui-shell.md), [`shell/web-gui-shell.md`](../specs/shell/web-gui-shell.md)).
- Subtype vocabularies beyond the canonical five.
  Apps and offices MAY add their own `msg-type` values via closure rules.
- Per-recipient notification preferences (mute, do-not-disturb, urgency-only).
  Those are substrate cells on the recipient's session record; the surfacing rule's premise can compose with them.
- Whether messages may carry attachments larger than a few KiB.
  The `content-cell` is content-addressed; large bodies are normal substrate cells with whatever shape the message's app conventions require.
- Read-receipts vs. blind delivery.
  The `read` cell is the canonical receipt; a sender wanting blind delivery can suppress its own subscription to `(*, read, *)` for that recipient.
- Whether to retain `session-message` cells indefinitely or compact at archive.
  Retention follows the standard policy per [`observability/log-aggregation.md`](../specs/observability/log-aggregation.md) §3.
