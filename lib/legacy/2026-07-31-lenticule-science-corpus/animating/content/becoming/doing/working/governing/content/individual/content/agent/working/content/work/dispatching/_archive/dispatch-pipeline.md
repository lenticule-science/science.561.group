# Dispatch pipeline

The MCP server's request-handling pipeline collapses to a thin shell over PAM's reification primitives.

```
MCP client
   │
   ▼  (JSON-RPC over stdin)
┌──────────────────────────────────────────────────────────────────┐
│  pam.reify        → sender id, message id, identity claims,      │
│                     message-record claims, asserts-claim/claim-* │
│                     introspection                                │
└──────────────────────────────────────────────────────────────────┘
   ▼
┌──────────────────────────────────────────────────────────────────┐
│  pam.messageBatch → wavefront-asserts identity → message-record  │
│                     → payload, settles via the functor, diffs    │
│                     contradictions before/after                  │
└──────────────────────────────────────────────────────────────────┘
   ▼
┌──────────────────────────────────────────────────────────────────┐
│  query            → walk the post-batch geometry for the         │
│                     requested SPO patterns (lawful read)         │
└──────────────────────────────────────────────────────────────────┘
   ▼
┌──────────────────────────────────────────────────────────────────┐
│  serialize        → JSON response: sender id, message id,        │
│                     accepted, new contradictions, query results  │
└──────────────────────────────────────────────────────────────────┘
   │
   ▼  (JSON-RPC over stdout)
MCP client
```

Every successful dispatch also appends a `messages/dispatch` event to the log carrying `{ input, reified }`.
Acceptance (which contradictions are new) is recomputed at replay time, so the log is the source of truth (principle 5).
Live and replay run the same `pam.messageBatch` code path and cannot diverge.

## Stage details

### Reify

In `packages/predication-algebra-model-context-protocol-server/message-reification.js`.

Input: the parsed MCP message with `from.identifying[]`, `asserts[]`, `queries[]`.
Output: an object with: - `senderId` — content-addressed from identifying pairs (see below) - `messageId` — content-addressed from `(senderId, sentAt, assertedAddresses)` - `identityClaims` — `(senderId, pred, obj)` for each identifying pair - `messageClaims` — `(messageId, type, "message")`, `(messageId, from-sender, senderId)`, `(messageId, sent-at, timestamp)`, `(messageId, asserts-claim, claimAddress)` for each asserted claim, `(messageId, queries-claim, queryPattern)` for each query - `assertedClaims` — the user's assertions, content-addressed - `queries` — pass-through

**Content-addressed senders** are a core commitment: identical identifying pairs always produce the same `senderId` across sessions, processes, machines.
Two agents presenting the same identifying facts are the same substrate entity.
See `content-addressed-sender.js`.

### Accept

In `accept.js`.

Apply user assertions to the working model.
Mutates in place (the earlier "clone once per dispatch" shape was too expensive at 200k+ claims).
Contradictions before/after the batch are diffed; new ones are reported.

Two kinds of contradictions surface: - **Cell-level concentrations** — a single `(subject, predicate, object)` cell has reached `⊤` (told both true and false) - **Aggregate-level (s, p) conflicts** — the projection π_{s,p} over all objects resolves to `⊤` because different channels disagree

Contradictions are witnessing, not failures.
Every claim is always accepted.
Contradictions are reported in the response so the sender sees what the substrate now holds.

### Settle

Not a separate stage of the pipeline — it happens **inside** `pam.assert` as part of the accept step.
The fiber functor dispatcher in `settlement.js` runs the morphism cascade to fixpoint on each assertion.

See [principles §2](../../../docs/architecture/principles.md#2-the-algebra-governs-everything): the algebra's morphism dispatch is the only computational primitive, so "settle" is implicit in "assert."

### Query

In `query.js`.

Pattern matching over the post-assertion geometry.
A query is an SPO pattern with at least one field set, plus an optional `depth` for one-hop traversal through the object side.
Results are a flat deduplicated claim list.

This is the lawful read primitive: `pam.match` takes a geometry (returned by `message()`), never a model.
See [principles §4](../../../docs/architecture/principles.md#4-reads-are-walks-of-message-responses-never-bypasses).

### Serialize

In `serialize.js`.

JSON response shape:
```json
{
  "senderId": "sender:<sha256>",
  "messageId": "message:<sha256>",
  "sentAt": "2026-04-13T...",
  "accepted": [ ... user claims ... ],
  "newConcentrations": [ ... cell-level ⊤ contradictions ... ],
  "newAggregates": [ ... (s,p) projection conflicts ... ],
  "claims": [ ... query results, as a sub-model ... ]
}
```

The `claims` array IS a sub-PAM — the receiver can feed it back into `createModel()` to get a local working model of just the queried portion.
This is how clients do further reasoning over query results without bypassing the substrate.

## Event logging

After successful dispatch, the server appends a `messages/dispatch` event with the full reified + acceptance record.
On replay, the message-event reducer re-applies the dispatch by asserting the identity + message + user claims back into the model.

Retractions are possible via `messages/retract` events; the elision pass in replay filters out dispatches with matching retracts.
See [event-log.md § The elision pass](../../predication-algebra-model/docs/event-log.md#the-elision-pass).
