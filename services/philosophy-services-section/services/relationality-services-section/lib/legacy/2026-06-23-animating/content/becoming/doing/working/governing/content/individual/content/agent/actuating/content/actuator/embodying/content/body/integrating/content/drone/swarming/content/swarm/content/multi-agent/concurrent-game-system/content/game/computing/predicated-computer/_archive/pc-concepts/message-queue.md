---
type: concept
class: transport-mechanism
depends-on: [transport, connection, federation-as-substrate-join]
see-also: [reification, federation-graph]
---

# Message queue

A *broker-mediated transport* in which messages are delivered to a broker that holds them until the recipient is available, then delivers asynchronously. Message queues are one [transport](transport.md) family among several; the substrate uses them when recipients may be temporarily offline, when delivery should be persistent across substrate restarts, or when many-to-many fanout is needed.

Common message-queue systems the substrate may use:

- **NATS** — lightweight, low-latency, in-memory by default with optional JetStream persistence.
- **RabbitMQ** — full AMQP 0-9-1, persistent queues, exchange routing.
- **Apache Kafka** — log-structured, partitioned, high-throughput; well-suited to substrate event-log replication.
- **Redis pub/sub / Streams** — co-located cache + queue.
- **Cloud-managed (AWS SQS/SNS, GCP Pub/Sub, Azure Service Bus)** — managed delivery with cloud-native integration.

Two distinct delivery semantics queue systems offer:

- **Pub/sub fanout.** A message published to a topic is delivered to every subscriber. Suitable for substrate events that all federated peers should see (rule-system version updates, identity-record rotations, public announcements).
- **Point-to-point queue.** A message enqueued is delivered to exactly one consumer. Suitable for work-distribution patterns where the substrate dispatches work-items to one of many candidate handlers.

The substrate's choice between transports and queues is a federation-graph configuration concern. Per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md), the substrate's algebra handles ordering and convergence independently of transport — message queues are admissible because per [federation-convergence](../theorems/federation-convergence.md), substrate convergence holds under any delivery order and any retry pattern the queue may produce.

A queue introduces an additional party (the broker) into the federation graph. The broker is structurally a transport-implementation, not a substrate participant — it carries bytes but doesn't execute substrate operators. Per [encryption](encryption.md), substrate content sent through a queue should typically be encrypted-in-transit at the substrate layer (not just transport-layer TLS to the broker), so the broker — and any other party with broker access — cannot read the content. The substrate's [federation-bridge](../objects/federation-bridge.md) records that route through queues should declare the queue as the transport and the recipient identity-records for substrate-level encryption.
