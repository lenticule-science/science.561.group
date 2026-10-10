---
name: message
description: A unit in the free monoid on bytes carrying a wire-protocol envelope — direction, sender, recipient, content, optionally signature and timestamp. The carrier the sending and receiving morphisms operate on.
specializing: computer-operating-system
carries-envelope: wire-protocol
---

A **message** is one structured unit of communication between two computational endpoints.
Mathematically it is an element of the free monoid $\Sigma^*$ on a byte-alphabet $\Sigma$ equipped with an envelope-projection: the byte sequence factors into a header (direction, sender, recipient, content-type, optionally signature and timestamp) and a body (the content payload).
The factorization is the wire-protocol's responsibility — HTTP, SMTP, IMAP, MQTT, Modbus, XMPP, IRC, Matrix, ActivityPub, and the Anthropic JSON-RPC wire all impose their own envelope shape.

## Why message is a single structure rather than per-protocol

The math distinguishes *message* (the carrier) from *envelope-shape* (the per-protocol factorization).
A single message structure with an `envelope-protocol` cell covers all wire-protocols by treating the envelope as a $\mathcal{P}$-object parameterized by the protocol.
Per-protocol specializations live under [the library subdir](library/) when their byte-level constraints differ enough to warrant their own structure.

## Carrier of sending and receiving

The sending and receiving morphisms both have message as either their domain or codomain.
A sending morphism takes a message and an endpoint and produces a delivery-witness (or a delivery-failure); a receiving morphism takes an endpoint and produces a message (or a no-message signal).
Per [transformer.md:25–27](../../../../../transformer/transformer.md), a morphism that wants multiple inputs (e.g., sending takes both a message and an endpoint) decomposes into a constructor transformer building the carrier pair followed by a unary morphism on the carrier.

## Distinguishing predication-shape

- `has-direction(message, {inbound | outbound})` — which way across the boundary the message crosses.
- `has-sender(message, endpoint)` — the originating endpoint.
- `has-recipient(message, endpoint)` — the destination endpoint.
- `has-content(message, byte-sequence)` — the body.
- `envelope-protocol(message, protocol-slug)` — names the wire protocol that fixes the envelope shape.
- `has-signature(message, signature?)
  ` — optional cryptographic signature (e.g., Ed25519).
- `sent-at(message, iso8601)` / `received-at(message, iso8601)` — timestamps.

## Not synonymous with

- **Turn** — a turn (see [the turn structure](../session/library/turn/turn.md)) is one round of inference inside a session — one user message + one assistant response + tool calls.
  A message is the byte-level wire unit; a turn is the session-level pair of messages with tool call sequence.
- **Witness** — a witness is the EAVT row recording that an act fired; it is not transmitted across a wire.
  Messages carry payload across endpoints; witnesses accumulate in the per-day log.
