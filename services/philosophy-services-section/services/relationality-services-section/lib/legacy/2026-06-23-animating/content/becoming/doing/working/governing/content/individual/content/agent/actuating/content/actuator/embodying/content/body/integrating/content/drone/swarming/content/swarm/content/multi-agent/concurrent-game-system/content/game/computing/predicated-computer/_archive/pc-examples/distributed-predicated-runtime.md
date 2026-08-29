---
type: example
status: documented
instantiates: [engine, port, predication-graph-store, event-log, predicated-arena, algebraic-constraint-validation, federation-as-substrate-join]
---

# A distributed predicated runtime over a multi-node service cluster

A predicated computer realized as a multi-node distributed service cluster, with each [four-component](teaching/explanations/substrate-anatomy-as-four-components.md) responsibility mapped to a discrete piece of distributed-systems infrastructure. The example documents one published architecture (the *distributed relational machine runtime* archived in the relationality research program) and shows how each substrate-level concept becomes a concrete service-cluster commitment.

The example's purpose is to demonstrate that the abstract four-component anatomy is realizable across a service cluster — not just in a single-process implementation. It also makes explicit which concerns are substrate-level (preserved across implementations) and which are deployment-level (specific to this realization).

## The realization at a glance

| Component | Stack |
|---|---|
| [Port](teaching/explanations/port.md) (input vocabulary + independence) | NATS JetStream subject topology — subjects encode message kind; subject independence encodes the port's independence relation |
| [Boundary](teaching/explanations/boundary.md) admission | NATS publisher endpoint with Pydantic schema validation; OPA/Rego authorization; clingo sheaf-condition pre-commit checks |
| [Predication-graph store](../objects/predication-graph-store.md) | rqlite — distributed SQLite over Raft consensus; holds fibers, restriction maps, and settled subfibers as relational tables |
| [Event log](../objects/event-log.md) | NATS JetStream's durable streams (replayable from sequence 0); plus rqlite-side audit tables for derived events |
| [Engine](teaching/explanations/engine.md) | Dapr virtual actors — one stateless actor per history thread; LangGraph for inner settlement loop control; PydanticAI for structured-output decision points |
| [Algebraic constraint validation](teaching/explanations/algebraic-constraint-validation.md) | clingo (Answer Set Programming) reading rqlite tables as ground facts; constraints stored as `.lp` files declared in substrate content |
| Observation surface | Per-node FastMCP servers; IBM ContextForge as MCP federation gateway; A2A protocol for [arena](../objects/predicated-arena.md)-to-arena peer connections |
| Identity and authorization | SPIFFE/SPIRE for workload identity; Biscuit tokens for capability delegation; mTLS between all nodes |

Each row is a concrete realization of the substrate-level concern at left. The substrate's algebra and disciplines do not change; what changes is the engineering of how each responsibility is hosted across nodes.

## How the port maps to NATS subjects

The port's typed message vocabulary becomes a subject topology in NATS JetStream:

- Each message kind in the port has a NATS subject. Submitting a port-typed message is publishing to its subject.
- The port's independence relation maps to NATS subject independence: independent message kinds publish to independent subjects, which are consumed by different engine actors and naturally parallelize.
- Dependent message kinds publish to subjects with a shared per-history thread key. JetStream's per-subject sequence ordering enforces the dependent ordering at the transport level.

The substrate-level commitment is per [port](teaching/explanations/port.md): the port's independence relation is what makes parallel admission safe. The deployment-level realization is that NATS' subject machinery enforces this at the transport, not in application code.

A consequence is that *replay* is straightforward: the JetStream durable streams are themselves the substrate's [event log](../objects/event-log.md). Replaying the substrate is replaying the streams from sequence 0; the engine actors re-process each step idempotently and reconstruct the same fibers.

## How the engine becomes Dapr virtual actors

Each history thread has a dedicated Dapr virtual actor. The actor:

- Is stateless between invocations — durable state lives in rqlite per [predication-graph store](../objects/predication-graph-store.md).
- Receives messages for its history sequentially from the per-thread NATS stream.
- Applies the substrate's settle loop via a LangGraph graph wrapped by `dapr-ext-langgraph`. The LangGraph graph's nodes correspond to the engine's per-rule settlement steps; PydanticAI provides validated structured output where a decision step needs typed conclusions.
- Writes settled fibers back to rqlite with the witness chain produced.

Dapr's Raft-backed placement service assigns actors to nodes without a central routing process. Two actors for independent histories run concurrently across the cluster; the substrate's [stepping](teaching/explanations/stepping.md) discipline says this parallel execution produces canonical-form-identical fibers regardless of node assignment.

The substrate-level [engine](teaching/explanations/engine.md) commitments — statelessness, locality-respecting application, witness emission, determinism under canonical input — are preserved by this realization: actors carry no durable state, settlement is per-history (locality-respecting at the actor level), every settle produces a witness chain in rqlite, and the engine's output is determined by the message stream and the rule-system version, not by which actor instance handled the work.

## How the algebraic constraint layer fires before commit

The substrate's [algebraic constraint validation](teaching/explanations/algebraic-constraint-validation.md) discipline becomes a clingo invocation in the commit path:

1. A candidate write reaches rqlite via the engine actor.
2. Before the write is committed, a Python bridge reads the relevant rqlite tables as ground facts and runs clingo over the constraint catalog (`.lp` files declaring [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) laws, [bilattice](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md) axioms, sheaf gluing conditions, restriction-map preservation).
3. If clingo finds the candidate write violates any constraint, the write is rejected with the constraint identifier and a witness; the substrate's audit trail records the rejection.
4. If all constraints pass, the write commits.

This realization keeps the constraint catalog as substrate content (`.lp` files declared as predications), not as imperative code. The substrate's commit path is uniform: every write traverses the same clingo gate, so the substrate's invariants are enforced in one place rather than scattered across application code.

## How peer federation realizes arena composition

When two distributed runtimes federate, the connection is at the [arena](../objects/predicated-arena.md) level: one runtime's observation type must be expressible as the other's input type, possibly via translation. The realization uses the A2A protocol (Agent2Agent, Linux Foundation): JSON-RPC 2.0 over HTTP with SSE streaming, no central broker.

Each runtime publishes its arena as an A2A AgentCard — the AgentCard declares the input port, the observation type, the authorization scheme (`MutualTlsSecurityScheme` from SPIFFE SVIDs). Two runtimes inspecting each other's AgentCards can determine connection compatibility before any messages cross. Once connected, peer messages cross as ordinary substrate-bound steps; the receiving runtime's boundary admission gate (Pydantic + OPA + clingo) applies to peer messages exactly as it applies to local messages.

The substrate-level [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) discipline holds: federation is byte exchange between drivers, with each substrate's engine producing convergence locally. The deployment-level realization is that A2A is the byte-exchange protocol of choice and the arena alignment is checked against AgentCard documents.

## What the example does *not* commit to

The substrate's commitments are preserved across other realizations of the same architecture. The example's specific choices are deployment concerns:

- The choice of rqlite over CockroachDB, FoundationDB, or another distributed store is a deployment trade-off (operational simplicity, query language, operational maturity). Any store satisfying the substrate's [two-store coherence](teaching/explanations/two-store-coherence.md) and [hash-discipline](teaching/explanations/hash-discipline.md) commitments is admissible.
- The choice of Dapr over a custom actor framework, Akka, or an in-process runtime is a trade-off (sidecar maturity, multi-language support). Any actor mechanism preserving engine statelessness and locality is admissible.
- The choice of NATS JetStream over Kafka, Pulsar, or RabbitMQ is a trade-off (per-subject ordering, replay primitives). Any durable, replayable, per-thread-ordered transport is admissible.
- The choice of clingo over a different ASP solver, a Datalog engine, or a SAT-based constraint checker is a trade-off (declarative expressiveness, evaluation time). Any declarative termination-guaranteed evaluator is admissible.
- The choice of A2A over MCP-only federation, gRPC, or a custom protocol is a trade-off (broker-free operation, JSON-RPC familiarity). Any protocol carrying typed arena messages is admissible.

Each substitution is a different example of the same substrate. The substrate-level theory is what is invariant; the example is one concrete way the invariants are realized.
