---
type: example
status: documented
instantiates: [reification, read-discipline, driver-substrate-split]
---

# A substrate exposed over Model Context Protocol

A working JavaScript implementation pairs the substrate's algebra and event-log model with a Model Context Protocol (MCP) server: a JSON-RPC transport over stdin/stdout exposing one tool, `message`. Clients (e.g. Claude Code, Zed, an HTTP gateway) connect, send sender-attributed message envelopes, and receive structured responses. The MCP server is a worked example of the substrate's [reification](teaching/explanations/reification.md), [read-discipline](teaching/explanations/read-discipline.md), and [driver-substrate-split](teaching/explanations/driver-substrate-split.md) disciplines applied at a remote-protocol boundary.

This example traces the MCP server's responsibilities and what each substrate discipline rules out at the boundary.

## The single tool

The MCP server exposes one tool: `message`. Its input shape is the substrate's reification envelope:

```json
{
  "from": {
    "identifying": [
      { "predicate": "name", "object": "alice" }
    ]
  },
  "asserts": [
    { "subject": "widget", "predicate": "is-a", "object": "tool" }
  ],
  "queries": [
    { "subject": "widget" }
  ]
}
```

Three structural commitments embedded in this shape:

- **Sender attribution is content-addressed.** The `from.identifying` field is a set of predications declaring the sender's identity. The server's `deriveSenderId` function canonicalizes the pairs and hashes them with SHA-256: identical identifying pairs always produce the same `senderId` across sessions, processes, machines. Per [reification](teaching/explanations/reification.md), every claim entering the substrate is sender-attributed; the MCP boundary makes the sender's identity explicit and content-hash-stable.

- **Asserts go through admission.** The `asserts` field carries the predications the sender is admitting. The server's dispatch pipeline reifies the message, accepts the claims through the substrate's admission primitive, settles the substrate, and produces the response. Admission cannot be bypassed; ad-hoc state insertion is not in the protocol.

- **Queries are walks of substrate responses.** The `queries` field carries patterns whose results the caller wants. The server walks the post-settlement geometry and serializes the matching claims as the response. Per [read-discipline](teaching/explanations/read-discipline.md), the queries are output-producing walks at the substrate's I/O surface — not decision-driving reads inside the substrate's algebra.

## The dispatch pipeline

The server's `dispatch` function decomposes into named stages:

- `reifyMessage(input, options)` — derive sender/message IDs, build identity and message-record claims. The output is a reified envelope per the [reification](teaching/explanations/reification.md) discipline.
- `accept(model, claims)` — assert claims through the substrate's admission primitive, track new contradictions ($\top$ values surfacing from the substrate's value-domain join).
- `evaluateQueries(geometry, queries)` — walk the post-settlement geometry for query patterns. Returns substrate-resident claim configurations, not summaries.
- `serializeResponse({...})` — build the JSON response object combining accepted claims, new contradictions, and query results.

Each stage is exposed as a separate function so a custom client can compose them differently. The default `dispatch` runs the pipeline end-to-end.

## What the MCP server does *not* do

Per [driver-substrate-split](teaching/explanations/driver-substrate-split.md), the server is a thin pump:

- **No domain-specific dispatch logic.** The server does not know what predicates mean. It admits whatever the client sends, settles whatever closure rules the substrate carries, walks whatever queries the client asks. Domain logic lives in substrate content (closure rules, shapes, vocabulary), not in the server's code.

- **No authentication beyond content-addressing.** The server does not implement an authentication subsystem. The sender's identity is content-addressed: identical identifying pairs produce the same senderId, and the substrate can carry signed-witness predications that authenticate particular senderIds against external keys. The authentication discipline is substrate-resident; the server is the channel.

- **No client-side state.** The server is stateless beyond its substrate connection. Client requests are independent; session-like behavior (across multiple `message` calls from the same sender) emerges from the sender's content-addressed identity, not from a per-client session record on the server.

- **No protocol-layer ordering.** Two `message` calls in the same MCP session are processed in arrival order at the server, but the substrate's state at any moment is determined by the canonical order of admitted events in the log, not by the server's processing order. Per [settlement-determinism](../theorems/settlement-determinism.md), two substrates that admit the same event set in the same canonical order settle to the same state regardless of the server's processing.

## The hypothetical-and-aggregate primitives

The server exposes two primitives beyond the basic `dispatch`:

- `hypothetically(model, claims)` — try claims without mutating the substrate. Returns the hypothetical geometry and any new contradictions. Used by a client that wants to ask "if I asserted this, what would happen?" without actually admitting the claim. The substrate's response is the hypothetical state alongside the original; the client decides whether to commit.

- `aggregate(model, pattern, mode)` — count / unanimous / majority / custom-fn over matching claims. The aggregation is an output-producing walk; per [read-discipline](teaching/explanations/read-discipline.md), the aggregation does not gate substrate computation — it is a shape of read at the I/O surface, returning a configuration of cells.

## Position as an example

The MCP-exposed substrate demonstrates the boundary discipline at a *remote* protocol surface, complementing the [filesystem-backed-substrate](filesystem-backed-substrate.md) example's filesystem boundary. Both are interfacer-mediated boundaries to the same substrate algebra; the substrate's interior does not change because of which boundary is in use. The same substrate can be exposed over MCP and over a filesystem simultaneously — the two boundaries are independent of the substrate's content. Per [substrate-universality](teaching/explanations/substrate-universality.md), this is what makes the substrate composable with arbitrary external systems: every external system gets its own interfacer at the boundary; the substrate's algebra is the same on all sides.
