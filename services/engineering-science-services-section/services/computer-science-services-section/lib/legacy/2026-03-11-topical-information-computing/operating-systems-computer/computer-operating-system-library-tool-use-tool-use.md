---
name: tool-use
description: The MCP-surface-side witness of one tool call — one row in code/logs/tool-uses/YYYY-MM-DD.jsonl recording the JSON-RPC request and response that crossed the MCP harness boundary, signed by the invoking character's identity-key.
specializing: computer-operating-system
realizes: harness-boundary-witness
on-disk-location: code/logs/tool-uses/YYYY-MM-DD.jsonl
---

A **tool-use** is the cell-level record of one tool call as observed at the MCP harness boundary.
Per [agent.md:42–43 and 67–68](../../../../../../../../../../code/structures/agent.md), every skill invocation produces a witness signed by the invoking entity's identity-key; the witness chain accumulates as the entity's operative history.
The on-disk realization of the chain is the per-day file `code/logs/tool-uses/YYYY-MM-DD.jsonl` — each line one tool-use row.

## Tool-use vs skill-use

A tool-use is the *boundary* event — the JSON-RPC request that arrived at the MCP harness, the response that left it.
A [skill-use](../skill-use/skill-use.md) is the *internal* morphism firing — the closure-rule application that ran the skill's body and produced its output.
One MCP tool call produces one tool-use witness and one skill-use witness; the two are linked but distinct cells, with the tool-use carrying the wire-side facts (request id, transport, request/response envelopes) and the skill-use carrying the morphism-side facts (input parameters, output, scope, deps).

## On-disk format

Per the [per-day witness log convention](../../../../../../../../../../code/logs/tool-uses/), each row is a JSON object containing at minimum:

- `t` — ISO-8601 timestamp.
- `tool` — slug of the tool that was called.
- `character` — slug of the character whose MCP server received the call.
- `request` — the JSON-RPC request envelope (or a content-addressed reference to it).
- `response` — the JSON-RPC response envelope (or reference).
- `signature` — the identity-key signature over the row's content-address.

The log file is append-only; older entries are immutable.
The per-day partition keeps log sizes bounded for casual reading while preserving the full history.

## Distinguishing predication-shape

- `tool-slug(tool-use, slug)` — which tool was called.
- `character(tool-use, character)` — which character's MCP server received the call.
- `request(tool-use, envelope)` — the JSON-RPC request.
- `response(tool-use, envelope)` — the JSON-RPC response.
- `signature(tool-use, identity-key-signature)` — the witness signature.
- `at-time(tool-use, time)` — when the boundary event happened.

## Not synonymous with

- **Skill-use** — see above.
- **Witness-chain** — the witness-chain is the full DAG of accumulated witnesses; a tool-use is one node in that chain.
