---
type: definition
class: substrate-entity
realizes: [transport, connection]
depends-on: [transport, connection, message-queue, federation-graph, identity-record]
see-also: [federation-bridge]
---

# Transport record

A **transport record** is the substrate-entity formal definition of one [transport](teaching/explanations/transport.md) configuration: the substrate-recorded specification of a transport mechanism, its endpoints, its security configuration, and its operational state.

## Structural fields

- **`id`** — kebab-case identifier; commonly naming the transport's role (e.g., `federation-https-public`, `internal-nats-cluster`, `dev-local-tcp`).
- **`description`** — one-line summary.
- **`transport-kind`** — declared kind: `http`, `https`, `websocket`, `tcp`, `tls-tcp`, `nats`, `rabbitmq`, `kafka`, `redis-pubsub`, `gcp-pubsub`, `aws-sqs`, etc.
- **`endpoints`** — references to the transport's endpoints. For point-to-point transports: source and target addresses. For broker-mediated transports: the broker's address and the relevant topics / queues / partitions.
- **`security`** — references to TLS configuration, cipher suite preferences, certificate authorities, and per-peer mTLS identity-records (when applicable).
- **`message-format`** — declaration of the wire-format for messages on this transport: `canonical-form-bytes`, `json-wrapped`, `msgpack`, `protobuf`. Per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md), transport-format conversion must be doctrine-fidel.
- **`reliability`** — declared reliability properties: `at-least-once`, `at-most-once`, `exactly-once`, `best-effort`. Per [federation-convergence](../theorems/federation-convergence.md), substrate convergence holds under at-least-once; at-most-once is admissible only for transports the substrate uses for non-content cross-talk (heartbeats, observability).
- **`backpressure-policy`** — what to do when the recipient is too slow: `drop-oldest`, `drop-newest`, `block-sender`, `disconnect`. Substrate operations producing federated content respect the backpressure policy.
- **`active-connections`** — derived references to currently-open [connections](teaching/explanations/connection.md) using this transport. Updated as connections open and close.
- **`closure-kind`** — `transport`.

## Invariants

- **Substrate-recorded.** The transport configuration is substrate content, not host configuration alone. A transport in use without a corresponding transport-record breaks [self-representation](teaching/explanations/self-representation.md).
- **Reliability-compatible with use.** A transport-record marked `best-effort` cannot be used for federation that requires convergence — the substrate refuses such routing per [federation-convergence](../theorems/federation-convergence.md)'s eventual-delivery requirement.
- **Endpoints resolvable.** The cited endpoint addresses must be resolvable from the substrate's deployment-target's networking position. Unresolvable endpoints surface as transport-failures.
- **Security-coherent with use.** A transport carrying substrate content over an untrusted intermediary (public internet, third-party broker) must declare TLS-or-equivalent transport security, plus typically substrate-level encryption (per [encryption](teaching/explanations/encryption.md)) for content the intermediary should not read.

## Operations

- *Configure.* Create or update a transport-record. The substrate's federation discipline begins routing through the transport once it's configured and reachable.
- *Open-connection.* Establish a connection over the transport (per [connection](teaching/explanations/connection.md)). The connection-opening is a substrate operation producing a witness.
- *Close-connection.* Gracefully close a connection. Federation messages in flight are subject to retransmission per the transport's reliability.
- *Audit.* Querying the transport's active connections, message-throughput, error-rate, and security state are substrate traversals (per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md)).
- *Retire.* Mark the transport-record retired; future routing through it is rejected. Active connections drain or are torn down per policy.

## Position in the substrate

Transport records are the substrate's *networking-configuration registry*. Without them, transport choices are ambient host configuration, not auditable substrate content; with them, the substrate's federation routing is queryable and replayable. Per [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md), federation-graph routing predications reference transport-records by id.

The pattern composes with [transport](teaching/explanations/transport.md) (the abstract), [connection](teaching/explanations/connection.md) (the live channels), [message-queue](teaching/explanations/message-queue.md) (the broker-mediated kind), and [federation-bridge](federation-bridge.md) (which routes through transport records).
