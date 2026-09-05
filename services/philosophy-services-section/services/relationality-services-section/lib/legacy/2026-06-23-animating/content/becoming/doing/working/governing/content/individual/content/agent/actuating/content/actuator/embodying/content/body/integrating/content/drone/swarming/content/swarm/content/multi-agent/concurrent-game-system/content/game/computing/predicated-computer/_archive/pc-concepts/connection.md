---
type: concept
class: transport-state
depends-on: [transport, identity-record, signature]
see-also: [message-queue]
---

# Connection

A *live transport channel* between two substrate instances or between a substrate and an external system. Connections carry the byte-streams that compose [reified messages](reification.md), [witnesses](../objects/witness.md), and other federated substrate content; they exist as long as the underlying transport mechanism keeps them open and as long as the substrate's federation policy admits the peer.

A connection has substrate-recorded state:

- **`endpoints`** — the two sides of the connection: typically a local outpost / inbox and a remote peer's identity-record reference.
- **`transport`** — which transport mechanism the connection uses (per [transport](transport.md)).
- **`opened-at`** — substrate ordinal at which the connection was established.
- **`peer-identity`** — the remote peer's verified identity (per [signature](signature.md), authenticated at handshake).
- **`tls-state`** — for TLS-bearing transports, the negotiated cipher suite, certificate chain, and session resumption state.
- **`backpressure`** — the connection's current send-buffer state; whether the recipient is keeping up with byte delivery.
- **`heartbeat-status`** — for long-lived connections, the last successfully-exchanged heartbeat. Connections without recent heartbeats are presumed broken and subject to reconnect.

Three engineering properties:

- **Connections are substrate-observable.** Per [self-representation](self-representation.md), the substrate's audit can answer "who are we connected to right now?" via traversal. A substrate without substrate-recorded connection state is opaque on its own networking.
- **Connections are not message-storage.** A connection is the *channel*; messages in flight on the connection are *content*. Per [federation-convergence](../theorems/federation-convergence.md), the substrate's eventual convergence does not depend on connection persistence — a partition that closes the connection is recovered by reconnect-and-resync, not by buffering messages on the closed connection.
- **Connections are authenticated at handshake.** Per [signature](signature.md), the peer's identity is verified by signature-exchange when the connection opens. Per [federation-handshake](theories/agential-orchestration-platform/morphisms/federation-handshake.md), the handshake also negotiates which closure-rule-system version each side runs and which federation-bridges (if any) are needed for vocabulary translation.

A connection's lifecycle: open (handshake, identity verification) → active (byte-streaming) → closed (graceful close or partition-detected). On close, any in-flight messages that didn't reach the recipient are retransmitted on the next connection (per the substrate's retry policy). Per [federation-convergence](../theorems/federation-convergence.md)'s order-independence, retries are safe — the substrate's deduplication-by-canonical-hash handles repeated delivery without semantic effect.

Connections compose with [message-queue](message-queue.md): when the underlying transport is a message queue, the "connection" is the substrate's link to the broker (which then handles per-message delivery to actual recipients). For direct transports (TCP, WebSocket), the connection is point-to-point.
