---
title: "Network"
description: "The OS's network stack. Federation protocol, HTTP, WebSocket, Matrix, SMTP/IMAP, CalDAV, ActivityPub, XMPP, IRC, MQTT, Modbus, Gemini. Real protocol bindings citing public RFCs."
kind: index
---

# Network

The network stack.
Where a protocol is publicly documented (RFC, W3C, vendor spec), this directory's spec cites the public spec and binds it to the substrate.
We don't reinvent SMTP.

## Sibling-theory grounding (per [`references/theories.md` §"Sibling computing theories"](../../references/theories.md))

The network stack draws on two computing-theory siblings outside the predication chain:

- [`internet`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/internet/) — JSON-LD, schema.org, structured data, robots.txt.
  Direct authority for the federation surface when the substrate publishes content to the public web; structured-data conventions ground how cell-projections render to peers and to web crawlers.
  Future `structured-data.md` under this directory cites this sibling.
- [`blockchain`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/blockchain/) — distributed-ledger consensus theory.
  Cited as a *contrast*: the substrate's federation discipline shares structural ground with blockchain consensus (both are distributed witness-chain disciplines) but the substrate explicitly does **not** use blockchain consensus.
  Per the existing federation decisions, [`federation-convergence`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) plus [`federation-trust-bilattice-graded`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-trust-bilattice-graded.md) deliver convergence and trust without the consensus overhead.
  The blockchain literature is the cited ground for *what the substrate is not doing and why*.

## Specs

### Already shipped (v0.1)

- [federation-protocol.md](federation-protocol.md) — peer-to-peer record sync.
  The algebra IS the protocol.
- [http-addressing.md](http-addressing.md) — URL conventions for cells, rules, events, fibers.

### To be written at v0.2

- `tcp-binding.md` — raw TCP connections via the substrate.
- `websocket.md` — WebSocket as a first-class transport (citing RFC 6455).
- `http2.md` — HTTP/2 server (citing RFC 9113).
- `web-api.md` — browser-facing HTTP/WebSocket protocol (extends http-addressing).

### To be written at v0.3 (bundled userland)

- `smtp.md` — outbound email (citing RFC 5321/5322); SMTP submission (RFC 6409); STARTTLS (RFC 3207); AUTH (RFC 4954); SPF (RFC 7208); DKIM (RFC 6376); DMARC (RFC 7489).
- `imap.md` — inbound email (citing RFC 9051); IMAP IDLE (RFC 2177).
- `pop3.md` — alternate inbound email (citing RFC 1939).
- `caldav.md` — calendar (citing RFC 4791, RFC 6638).
- `carddav.md` — contacts (citing RFC 6352).
- `icalendar.md` — calendar event format (citing RFC 5545).
- `matrix-cs-api.md` — Matrix client-server API (citing https://spec.matrix.org/latest/client-server-api/).
- `xmpp.md` — Extensible Messaging and Presence Protocol (citing RFC 6120/6121).
- `irc.md` — Internet Relay Chat (citing RFC 1459/2811/2812/2813).

### To be written at v0.4 (federation)

- `matrix-s2s.md` — Matrix server-server federation (citing https://spec.matrix.org/latest/server-server-api/).
- `activitypub.md` — Fediverse federation (citing W3C ActivityPub https://www.w3.org/TR/activitypub/).
- `http-signatures.md` — HTTP message signatures (citing draft-cavage-http-signatures-12).
- `github-rest-and-webhooks.md` — GitHub REST API and webhooks surface (citing https://docs.github.com/en/rest and https://docs.github.com/en/webhooks); used by [drivers/github-issues-driver.md](../drivers/github-issues-driver.md).
  Per [decisions/external-systems-get-drivers-peers-get-federation.md](../../decisions/external-systems-get-drivers-peers-get-federation.md), GitHub is bridged as an external-system driver, not a federation peer; this network spec documents only the wire-layer binding.

### To be written at v0.5 (industrial control)

- `mqtt.md` — pub/sub messaging (citing MQTT 5.0 https://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html).
- `modbus.md` — industrial control (citing https://modbus.org/specs.php).

### To be written later

- `gemini.md` — small-web protocol (citing gemini.circumlunar.space spec); v0.6+ if relevant.
- `9p.md` — Plan 9 file protocol (citing http://9p.cat-v.org/); v0.6+ if implemented.

## Theory grounding

The network stack implements:

- `web-server-platform/` (HTTP, REST, GraphQL, webhooks, middleware) — explicit material.
- `predicated-computing/morphisms/federation-handshake` — abstract federation primitive.
- `predicated-computing/concepts/transport` — abstract transport.
- `distributed-coordination-platform/` (cluster-membership, failure-detection) — abstract peer-discovery.

For protocols beyond HTTP/REST/GraphQL (federation, SMTP, CalDAV, Matrix, etc.), the library is silent or sparse.
This directory cites public RFCs and writes binding-to-substrate specs fresh.

## Algebraic contract

Every wire spec in this directory — present and to-be-written — conforms to the [`network-algebraic-contract.md`](network-algebraic-contract.md) one-pager: $\Box_R^{\mathrm{net}}$ surface for admit/reject, quantale-graded rate envelope, regime-meet at handshake.
Wire specs cite the contract; the contract is not a wire format.

## Conformance

The network stack passes:

1. HTTP server returns byte-identical canonical responses for content-addressed reads.
2. Each protocol-binding driver passes a test against an RFC-conformant peer (e.g., Postfix for SMTP, Dovecot for IMAP, Radicale for CalDAV, Synapse/Conduit for Matrix, Mastodon for ActivityPub).
3. WebSocket subscriptions deliver fiber updates with deterministic ordering.
4. Federation peer protocol round-trips signed events byte-identically.

## Plan 9 / Unix analogue

The substrate's network stack is closer to Plan 9's `/net` than to Berkeley sockets.
A network connection is a substrate cell (or set of cells) with a driver responsible for the wire protocol.
The substrate doesn't have a separate "socket" abstraction; it has driver records.
