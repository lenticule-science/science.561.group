---
name: dispatch-witness-record
description: A cell appended to code/logs/tool-uses/YYYY-MM-DD.jsonl by every layer of the dispatch chain when work crosses its boundary. Names the layer, the workitem cells the layer saw, the receiver the layer picked, the outcome, and on error the diagnostic — making the whole hop-sequence of a single workitem reconstructible from the log.
category: kernel
fields: []
title: dispatch-witness-record
derives-from: work
---

A dispatch-witness is what makes the dispatch chain auditable.
Per the [`dispatching`](dispatching.md) transformer's domain-and-codomain definition, every dispatch returns a response cell **plus a witness record naming the chosen receiver and the hop**.
The witness is the second half of that codomain.

The witness is appended as one JSONL line per hop.
A single workitem flowing through the layered chain — `dispatching-work` → kind-dispatcher → `dispatching-logical-inference` → model picker → `sending-...
` — produces one line per layer, with shared `workitem-skill` and `workitem-kind` cells so the lines for one workitem can be grouped by replay.

## Required cells

- `ts` — ISO 8601 timestamp the witness was appended.
  Always present; the harness's general tool-use log also carries `ts`, so dispatch-witness lines are time-orderable against other tool-use lines.
- `skill` — the slug of the dispatch-layer skill emitting the witness.
  One of: `dispatching-work`, `dispatching-a-process`, `dispatching-a-procedure`, `dispatching-a-derivation`, `dispatching-an-inquiry`, `dispatching-a-script`, `dispatching-logical-inference`, `dispatching-to-a-logical-inference-model`, `dispatching-to-a-logical-inference-model-on-the-web`, `sending-a-message-to-a-logical-inference-model-on-the-web`, `receiving-a-message-from-a-logical-inference-model-on-the-web`.
  (Naming this field `skill` matches the existing tool-use log convention so general queries on `skill:` work uniformly.)
- `workitem-skill` — the `skill` cell of the workitem this layer was processing.
  Lets multi-line replays group by workitem.
- `workitem-kind` — the `kind` cell of the workitem.
- `chosen-receiver` — the slug or repo path of the receiver this layer routed to.
  For `dispatching-work`, the kind-dispatcher slug.
  For the kind-dispatchers, the next layer down.
  For `dispatching-to-a-logical-inference-model`, the model record's slug.
  For `sending-...
  `, the adapter path.
- `outcome` — one of `ok`, `error`, `forwarded`.
  `ok` for terminal success (the receiver returned content); `error` for a failure at this hop; `forwarded` when the layer simply handed the workitem to the next layer and the result will be witnessed by that next layer.

## Optional cells

- `error` — diagnostic string.
  Required when `outcome: error`.
- `attempts` — list of `{receiver, outcome, error?}
  ` entries the layer tried before settling on `chosen-receiver`.
  Used by the model picker to record fall-through attempts when one model fails and another succeeds.
- `length` — for terminal `ok` outcomes that returned text content, the byte length of the response.
  Cheap to log; useful for cost auditing.

## Relation to other structures

- The general tool-use log convention (`code/logs/tool-uses/<date>.jsonl`) was originally one line per MCP tool call emitted by the harness.
  Dispatch-witnesses extend the same log file with finer-grained lines, one per dispatch-layer hop, sharing the `ts` and `skill` field names.
- Dispatch-witnesses are written by the helper `doing/working/inferring/_witness.mjs` (Phase 2 of the dispatch-architecture work).
  All dispatch-layer scripts import the helper and call it at the boundaries; the helper is the single point where the dispatch-witness shape is enforced.
