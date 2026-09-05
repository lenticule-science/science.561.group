---
type: concept
class: networking-discipline
depends-on: [federation-as-substrate-join, reification, hash-discipline]
see-also: [connection, message-queue]
---

# Transport

The substrate's *byte-delivery layer*: the network mechanism by which canonical-form-serialized substrate content (reified messages, witnesses, snapshots, encrypted regions) crosses substrate boundaries between deployments. Transport is structurally below federation — federation is *what* messages mean and how they converge; transport is *how* the bytes get from sender to receiver.

Per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md), the substrate's algebra is the federation protocol; transport carries no semantic responsibility. Transport's only obligations are:

- **Eventual delivery.** Bytes sent eventually arrive at the recipient (modulo network partition that requires substrate-level retry).
- **Integrity in transit.** Bytes arrive byte-identical to bytes sent. Per [hash-discipline](hash-discipline.md), the recipient verifies the canonical-form hash; transport-layer corruption is detected.
- **No semantic interpretation.** Transport does not parse content beyond what the underlying protocol requires (HTTP headers, TCP framing). Transport does not reorder messages on semantic grounds, does not dedupe by content, does not branch on content. Per [federation-convergence](../theorems/federation-convergence.md), the substrate's closure-merge commutation handles ordering and duplicates at the substrate level.

The substrate does not commit to a specific transport. Common choices:

- **HTTP/HTTPS** — the most universal; works through firewalls, CDNs, load balancers; per-request overhead. Suitable for low-frequency federation, public-internet substrates.
- **WebSocket** — bidirectional, persistent connection over HTTP. Suitable for substrates with frequent bidirectional messaging (interactive sessions, real-time collaboration).
- **TCP / TLS-over-TCP** — raw streams, low overhead, requires direct connectivity. Suitable for high-throughput substrate-to-substrate links inside a data center.
- **Message queues (NATS, RabbitMQ, Kafka, Redis pub/sub)** — broker-mediated delivery with built-in retry and persistence. Suitable for substrates whose recipients may be temporarily offline.
- **gRPC** — schema-typed RPC over HTTP/2. Suitable for substrates with strict typing requirements at the transport layer.

The substrate's [federation-bridge](../objects/federation-bridge.md) records typically reference a transport mechanism in their routing predications (which outpost ↔ which inbox via which transport). The transport choice is a deployment-target-and-network-conditions concern; per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md), substrate behavior is transport-agnostic — the same federation between two substrates produces byte-identical convergence regardless of which transport delivers the bytes.

Transport-layer security (TLS, mTLS, in-protocol encryption) provides confidentiality on the wire. Per [encryption](encryption.md), substrate-level encryption is orthogonal: even with TLS-secured transport, substrate content may additionally be encrypted-in-transit at the substrate layer when intermediaries should not be able to read content. Transport security protects the *channel*; substrate encryption protects the *content*.
