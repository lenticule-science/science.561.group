---
type: theorem
class: classical
status: informal
depends-on:
  - teaching/explanations/byzantine-fault-tolerance.md
see-also:
  - byzantine-bound.md
references: []
---

# CAP coordination impossibility

## Statement (informal)

A distributed system cannot simultaneously guarantee all three of:

- **Consistency (C).** Every read returns the most recent write or an error.
- **Availability (A).** Every request receives a non- error response (without guaranteeing freshness).
- **Partition tolerance (P).** The system continues operating despite network partitions.

In the presence of a network partition (which real distributed systems must handle), the system must choose between C and A.
Hence the colloquial summary: "Pick two."

## Brewer's conjecture, Gilbert-Lynch theorem

Eric Brewer conjectured the tradeoff in 2000; Seth Gilbert and Nancy Lynch (2002) proved a precise formulation: in an asynchronous network model, no protocol can achieve both consistency (linearizability) and availability when arbitrary network partitions occur.

## What "pick two" means

The popular formulation is misleading.
More accurately:

- **In the absence of partitions**, both consistency and availability are achievable.
- **In the presence of partitions**, the system *must choose* between C and A — providing both is impossible.

So the choice is not about giving up partition tolerance (real systems can't avoid partitions) but about how to behave *during* partitions:

- **CP systems** (consistency-favoring): refuse requests during partition; preserve consistency at cost of availability.
  Examples: Spanner, etcd, Zookeeper.
- **AP systems** (availability-favoring): respond to requests during partition with possibly-stale data; reconcile after partition heals.
  Examples: Cassandra, Dynamo, CouchDB.

## What it implies

- **No universal best architecture.** The right choice depends on application semantics — financial transactions favor CP; social media feeds favor AP.
- **Hybrid systems.** Real systems often layer CP for metadata atop AP for bulk data, or vice versa.
- **Tunable consistency.** Systems like Cassandra allow per-operation tuning of consistency vs availability.
- **Eventual consistency.** AP systems often promise *eventual* consistency: if updates stop, replicas eventually agree.

## In multi-agent AI

The CAP theorem constrains:

- **Distributed AI inference.** When AI services run across distributed infrastructure, partition handling forces CP-vs-AP choices.
- **Federated AI training.** Coordination across nodes during partial network failures requires explicit CAP positioning.
- **Decentralized AI marketplaces.** Shared state across autonomous AI services faces the same fundamental tradeoff.
- **Multi-region AI deployment.** Cross-region coordination is partition-prone; CAP applies.

## Limits

- **The "pick two" formulation is misleading.** P is forced; the choice is C vs A during partition.
- **PACELC** refines CAP: under partitions choose between Availability and Consistency; *else* (no partition) choose between Latency and Consistency.
- **Linearizability vs other consistency models.** CAP is formulated for strong consistency; weaker consistency models (causal, sequential) admit different tradeoffs.

## Why "informal"

The Gilbert-Lynch formulation is rigorous, but the *colloquial* CAP framing covers a family of related results with varying precise statements.
The principle is robust; the precise theorem depends on definitions of consistency, availability, and partition.

## Status

Informally foundational, formally proved (Gilbert & Lynch 2002).
Refinements (PACELC, Highly Available Transactions, etc.) extend the basic insight.
The CAP/PACELC framework governs distributed-systems design decisions and applies directly to distributed AI architectures.
