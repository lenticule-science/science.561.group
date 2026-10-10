---
title: "Inter-session messaging"
description: "Typed messages between sessions as substrate cells: task-handoff, query, response, completed, conflict. Read/unread tracking via EAVT predicates; the heartbeat surfaces unread messages on each tick."
kind: spec
status: normative
version: "0.2"
---


Sessions exchange **typed messages** with each other.
Each message is a substrate cell whose predicates encode sender, recipient, message-kind, content, and read-state.
The heartbeat tick surfaces unread messages to subscribed sessions; the inbox view of a session is a predicate filter over the substrate, not a separate queue.

This spec layers on top of [ipc/message-passing.md](../ipc/message-passing.md) (which specifies the substrate's general `respond`-as-IPC primitive).
Inter-session messaging is the *typed-message* discipline used between sessions for task handoff, queries, responses, completion notification, and conflict surfacing — the discipline ECC2 (the captain's predecessor everything-claude-code Rust TUI at `operations/engineering/fars/src/everything-claude-code/ecc2/`) shipped against a SQLite store and that this OS expresses as substrate cells.

Per [decisions/inter-session-messaging-is-substrate-cells.md](../../decisions/inter-session-messaging-is-substrate-cells.md).
The captain's source idea is [`ecc2-feature-port.md`](../../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) §1.

## 1. Message envelope

A message is a substrate entity of `kind = "session-message"`:

```json
{
  "kind": "session-message",
  "id": "<sha256>",
  "slug": "session-message:<short-id>",
  "ord": 12345
}
```

The cells produced at message-author time are the EAVT shape:

```json
{"s": "session-message:<id>", "p": "kind", "o": "session-message", "v": "True"}
{"s": "session-message:<id>", "p": "from-session", "o": "session:<sender-id>", "v": "True"}
{"s": "session-message:<id>", "p": "to-session", "o": "session:<recipient-id>", "v": "True"}
{"s": "session-message:<id>", "p": "msg-type", "o": "<msg-type>", "v": "True"}
{"s": "session-message:<id>", "p": "content-cell", "o": "cell:<body-id>", "v": "True"}
{"s": "session-message:<id>", "p": "read", "o": "session:<recipient-id>", "v": "False"}
{"s": "session-message:<id>", "p": "authored-at-ord", "o": "12345", "v": "True"}
```

Fields:

| Predicate | Meaning |
|---|---|
| `from-session` | Sender session-id. The session's `boundary` and `acting-as` are recoverable via the standard session-attribution chain ([process/session-as-process.md](session-as-process.md) §9). |
| `to-session` | Recipient session-id. May be a single session, an entity referencing multiple sessions (broadcast — see §6), or a duty/role pattern. |
| `msg-type` | One of the typed kinds in §2. |
| `content-cell` | A content-addressed cell holding the message body. Bodies are themselves substrate cells so they participate in audit, federation, and signing. |
| `read` | Per-recipient read flag. `True` after the recipient surfaces the message; `False` until then. The four-valued bilattice keeps `read` honest under concurrent surfacing (multi-session recipients). |
| `authored-at-ord` | Event-ordinal of the message-author event. |

Messages are content-addressed; the `id` is SHA-256 over the canonical bytes per [decisions/content-hash-via-sha256.md](../../decisions/content-hash-via-sha256.md).

## 2. Typed message kinds

The substrate ships five canonical `msg-type` values.
Apps and offices MAY define their own subtypes; the canonical kinds are normative.

| `msg-type` | Meaning | Required predicates on `content-cell` |
|---|---|---|
| `task-handoff` | Sender is delegating a task to recipient. | `task-id`, `handoff-reason`, optional `expected-completion-ord` |
| `query` | Sender is asking a question that expects a `response` reply. | `question-cell`, optional `awaits-response-by-ord` |
| `response` | Reply to a prior `query`. | `responds-to` (the query message-id), `answer-cell` |
| `completed` | Sender is reporting a previously-handed-off task as done. | `task-id`, `completion-cell`, optional `produced-cells` |
| `conflict` | Sender has detected a `(s, p, o)`-disagreement that needs cross-session resolution. | `conflict-on` (the cell-id), `claimed-value`, `observed-value` |

A `msg-type` outside this set is rejected with `PCS_MESSAGE_TYPE_UNKNOWN` unless the recipient session has registered an extension subtype via a closure rule; subtype extensions live in app spec.

## 3. Authoring a message

A session sends a message via `respond`:

```
respond(target=session:<recipient-id>, payload={
  msg-type: "task-handoff",
  content: { task-id: "task:abc", handoff-reason: "..." }
}, sender=session:<sender-id>)
```

The substrate:

1. Verifies the sender's capability fiber permits `signal:session-message:<msg-type>` against the recipient ([security/capability-model.md](../security/capability-model.md) §3).
  Cross-session messaging is a capability-bounded operation.
2. Computes the canonical `content-cell` and writes it.
3. Computes the canonical `session-message` cells (§1) with `read = False` for the recipient.
4. Appends the events; the heartbeat picks up on the next tick (§4).

This is structurally [ipc/message-passing.md](../ipc/message-passing.md) §1's direct-send pattern; the session-message envelope is the typed layer above the raw inbox cells.

## 4. Heartbeat-driven unread surfacing

On each heartbeat tick, the substrate fires a periodic closure rule:

```json
{
  "kind": "rule",
  "name": "surface-unread-session-messages",
  "premise": [
    {"s": "$msg", "p": "kind", "o": "session-message", "v": "True"},
    {"s": "$msg", "p": "to-session", "o": "$recipient", "v": "True"},
    {"s": "$msg", "p": "read", "o": "$recipient", "v": "False"},
    {"s": "$recipient", "p": "state", "o": "open", "v": "True"}
  ],
  "conclusion": [
    {"s": "$recipient", "p": "has-unread-message", "o": "$msg", "v": "True"}
  ]
}
```

The `has-unread-message` predicate is the recipient's inbox surface.
Subscribers (the recipient's TUI shell, web GUI shell, or an `await` from inside the session) see the cell appear and react.
The recipient marks the message read by appending `(session-message:<id>, read, session:<recipient-id>) = True`, which the σ-pass propagates and the surfacing rule no longer fires.

The heartbeat-driven model means there is no separate inbox queue with its own consistency rules; the inbox IS the substrate fiber projected at `(*, has-unread-message, *)`.

## 5. Reading a message

A session reads its inbox via the standard cell read:

```
respond(target=session:<my-id>, payload={
  action: "list-unread",
  msg-types: ["task-handoff", "query", "completed", "conflict"]
}, sender=session:<my-id>)
```

This reduces to `query({s: "session:<my-id>", p: "has-unread-message", o: "*"})` filtered by the session's chosen `msg-types`.
The query is read-only and does not change the `read` flag.

To mark messages read, the session sends:

```
respond(target=session-message:<id>, payload={
  action: "mark-read",
  reader: session:<my-id>
}, sender=session:<my-id>)
```

The substrate appends `(session-message:<id>, read, session:<my-id>) = True`; the surfacing rule from §4 stops firing for that recipient.

## 6. Broadcast and pattern delivery

A message MAY be addressed to multiple sessions:

- **Explicit list:** the `to-session` cell is a list-valued cell pointing at multiple session-ids.
  The surfacing rule fires per-recipient.
- **Pattern delivery:** the `to-session` cell points at a duty or role (e.g., `duty:incident-response`); a closure rule expands the duty to current incumbent sessions and asserts per-recipient `has-unread-message` cells.

Broadcast messages have one `session-message` envelope but per-recipient `read` cells.
The bilattice allows distinct recipients to read at distinct times; the `(session-message:<id>, read, session:<R>)` cell is per-recipient.

Broadcast is bounded by the sender's authority: a `signal:session-message` capability against `to-session: duty:incident-response` requires the sender to have authority over that duty.
[security/capability-model.md](../security/capability-model.md) §3 enforces.

## 7. Conversation threads

`response` messages reference their `query` via the `responds-to` predicate on the response's content-cell.
A thread is the closure of `responds-to`-related messages; querying `(*, responds-to, session-message:<id>)` returns immediate replies; recursing produces the full thread.

Threads are not a separate entity kind.
The substrate's existing closure-rule traversal is sufficient.

## 8. Persistence and federation

Session messages are substrate cells; they persist in the event log under [decisions/event-log-is-jsonl.md](../../decisions/event-log-is-jsonl.md) and federate per [network/federation-protocol.md](../network/federation-protocol.md).
A peer sending a message to a local session goes through the standard federation receive path:

1. The remote session's `respond(target=session:<local-recipient>, ...)
  ` is signed by the remote session's boundary key ([security/signing-and-witnessing.md](../security/signing-and-witnessing.md)).
2. The local substrate verifies signature, validates the sender's federation-trust capability ([security/federation-trust.md](../security/federation-trust.md)), bounds the message via $\Rightarrow$ against the remote sender's authority.
3. The bounded message envelope is appended; the surfacing rule fires for the local recipient on the next tick.

Read state is per-substrate; a federated message is `read` independently on each peer that has the recipient's session locally.

## 9. Errors

| Code | Meaning |
|---|---|
| `PCS_MESSAGE_TYPE_UNKNOWN` | `msg-type` is not in §2 and no extension subtype is registered for the recipient. |
| `PCS_MESSAGE_RECIPIENT_INVALID` | `to-session` does not resolve to a session-id (or list/duty pattern). |
| `PCS_MESSAGE_RECIPIENT_CLOSED` | All resolved recipient sessions are `closed` or `archived`. |
| `PCS_MESSAGE_RESPONDS_TO_INVALID` | A `response` message's `responds-to` does not point at a `query` message authored to this session. |
| `PCA_SCOPE_INSUFFICIENT` | Sender lacks `signal:session-message:<msg-type>` for the recipient. (Standard capability error per [security/capability-model.md](../security/capability-model.md) §8.) |

## 10. Implementation

### Python (v0.2+)

- Session-message envelopes as pydantic `SessionMessage` models; content-cells as `MessageContent` models per `msg-type`.
- The surfacing rule is a periodic closure rule firing each tick under `runtime/heartbeat.py`.
- `respond` for session-message authoring lives in `substrate/session_messaging.py`.
- Inbox queries reduce to standard `project` stdlib calls.

### Rust (v0.2+)

- Same envelope as serde-derived structs.
- Surfacing rule registered against the closure-rule engine at boot.
- The TUI shell ([shell/tui-shell.md](../shell/tui-shell.md)) embeds an inbox panel that subscribes to `(session:<my-id>, has-unread-message, *)` over WebSocket per [network/websocket.md](../network/websocket.md).

## 11. Conformance

Inter-session messaging passes:

1. **Round-trip.** Sender authors a `task-handoff` message; recipient's `has-unread-message` cell appears within one heartbeat tick; recipient marks read; cell stops appearing.
2. **Typed kinds.** Each of the five `msg-type` values round-trips with the required content-cell predicates; an unknown `msg-type` is rejected with `PCS_MESSAGE_TYPE_UNKNOWN`.
3. **Capability-bounded send.** A sender lacking `signal:session-message:<msg-type>` against the recipient returns `PCA_SCOPE_INSUFFICIENT`; partial repair log preserved.
4. **Broadcast.** A message addressed to a duty resolves to per-incumbent recipients; each recipient surfaces independently; per-recipient `read` cells do not interfere.
5. **Threading.** A `response` referencing a prior `query` via `responds-to` is reachable from the query via the standard closure-rule traversal.
6. **Federation.** A federated message authored on peer A and addressed to a local session is admitted under federation-trust, surfaced locally, and the `read` cell is per-substrate.
7. **Replay.** Replaying the event log reproduces every `session-message` cell and every `read`/`has-unread-message` cell byte-identically.
8. **Cross-language equivalence.** Python and Rust produce byte-identical session-message and surfacing-rule output for byte-identical inputs.

## 12. Plan 9 / Unix analogue

| Unix concept | Inter-session-messaging analogue |
|---|---|
| `talk(1)` / `write(1)` to a tty | `query` / `task-handoff` to a session |
| `mail(1)` mbox | `(session:<id>, has-unread-message, *)` projection |
| `mail` flags (read/unread/replied) | `read` predicate per-recipient |
| `expect` script handing off to another | `task-handoff` between two sessions |
| `wait(2)` for a child to complete | Subscription to `completed` messages from a child session |
| Conflict-of-interest escalation in a workflow tool | `conflict` message surfaced to a coordinating session |
