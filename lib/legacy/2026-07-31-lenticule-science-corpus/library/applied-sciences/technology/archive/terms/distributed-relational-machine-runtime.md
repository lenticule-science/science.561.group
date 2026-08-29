---
id: distributed-relational-machine-runtime
description: "A DistributedRelationalMachineRuntime is a RelationalMachineRuntime implemented as a live, multi-node distributed service cluster: rqlite for the DataStore, NATS JetStream as the input boundary, Dapr virtual actors as the Engine workers, and FastMCP for the Observation Layer."
defines: DistributedRelationalMachineRuntime
implements: RelationalMachineRuntime
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  data-store: relational-universe
  input-boundary: relational-universe
  engine-workers: relational-universe
  observation-layer: relational-universe
output: relational-universe
ast:
  distributed-fiber-automaton:
    - data-store:
        - rqlite-fiber-table
    - input-boundary:
        - nats-jetstream-step-stream
    - engine-workers:
        - dapr-virtual-actor-per-history
    - observation-layer:
        - fastmcp-section-emitter
---

# Distributed Relational Machine Runtime

## What this is

A **DistributedRelationalMachineRuntime** is a [RelationalMachineRuntime](relational-machine-runtime.md) implemented as a live, multi-node distributed service cluster.

It is a fully independent distributed service implementing the full four-component [RelationalMachine](relational-machine.md) architecture across a network of nodes with no required central handler.

## Stack

- **DataStore:** rqlite — distributed SQLite over Raft consensus; holds H_t, H*_t, restriction maps, and nucleus results
- **Input Boundary:** NATS JetStream — ordered per-thread step streams; at-least-once delivery; idempotent step processing required
- **Engine workers:** Dapr Agents — stateless virtual actor per history thread; dapr-ext-langgraph wraps LangGraph inside Dapr workflow activities
- **Engine logic:** LangGraph — loop control, persistence, termination inside Kernel actors; PydanticAI — validated structured output at decision points
- **Algebraic constraint validation:** clingo (Answer Set Programming) — declarative enforcement of mathematical structure laws before the Engine runs
- **Authorization policy:** OPA (Open Policy Agent) + Rego — declarative authorization rules at trust boundaries
- **Workload identity:** SPIFFE/SPIRE — cryptographic identity for all workloads; mTLS between nodes
- **Capability delegation:** Biscuit — attenuable capability tokens for fine-grained authorization
- **Observation Layer:** FastMCP (per node) + IBM ContextForge gateway — MCP federation via mDNS/DNS-SD auto-discovery; A2A protocol for peer machine connections
- **HTTP endpoints:** FastAPI

## Four components

See [relational-machine](relational-machine.md) for the architecture spec.

- **[RelationalMachinePort](relational-machine-port.md)** — NATS stream/subject configuration; declares step vocabulary Σ and independence relation I as subject topology
- **[RelationalMachineInterface](relational-machine-interface.md)** — NATS JetStream publisher endpoint; receives steps from agents and peers, validates against Port schema, publishes to per-thread subjects
- **[RelationalMachineSteppingMap](relational-machine-stepping-map.md)** — JetStream sequence ordering; each sequence number advance is one γ_t application, advancing history t to s★t
- **DataStore** — rqlite cluster; holds H_t and H*_t
- **Algebraic Constraint Layer** — validates mathematical structure laws before the Engine runs; separate from but integrated with the Engine
- **Engine** — Dapr virtual actor per history t; stateless between invocations; applies π_t = σ∘Δ via a LangGraph graph wrapped by dapr-ext-langgraph
- **Observation Layer** — per-node FastMCP server emitting newly settled sections; aggregated by IBM ContextForge

## Implementation correspondence

How each math entity maps to the distributed stack:

### Presentation layer — Σ, I

| Math unit | SQLite | PydanticAI | LangGraph | Exactness |
|---|---|---|---|---|
| Step (s ∈ Σ) | row in `steps(name PK)` | — | Node name as identifier | Exact |
| Step set Σ | all rows in `steps` | — | set of Node names | Exact |
| Commutation I | `commutation(step_a, step_b)` symmetric junction | — | which Nodes may parallelize | Exact |

### History layer — T

| Math unit | SQLite | PydanticAI | LangGraph | Exactness |
|---|---|---|---|---|
| History (t ∈ T) | `histories(normal_form PK, depth INT)` | Foata algorithm as validator on write | thread execution path identifier | Near-exact |
| Prefix order (t ≤ t') | `extensions(source, target, step)` or recursive CTE | — | directed edge-path in graph | Near-exact |
| Foata normal form | the PK value | `normalize(steps) -> str` Tool | — | Exact as algorithm |

### Algebraic layer — H: T^op → HA_nucl

The finiteness axiom makes lookup-table storage exact: finite Heyting algebras have finite operation tables.

| Math unit | SQLite | PydanticAI | LangGraph | Exactness |
|---|---|---|---|---|
| Fiber H_t | `fiber_elements`, `fiber_meet`, `fiber_join`, `fiber_impl` lookup tables | `Fiber` BaseModel; validators enforce Heyting laws on write | — | Near-exact |
| SaturationNucleus σ_t | Python function querying fiber + restriction tables | `saturate(history, element) -> element` Tool | — | Near-exact |
| TransferNucleus Δ_t | Python function querying extension images | `transfer(history, element) -> element` Tool | — | Near-exact |
| Fixed fiber H_t* | SQL VIEW: elements where saturate = id AND transfer = id | computed field on `Fiber` model | — | Near-exact |
| Restriction map ρ_s | `restrictions(from_history, to_history, step, elem_in, elem_out)` | validator: HA homomorphism + nucleus-commutativity check on write | conservative (accumulating) State reducers | Near-exact |

### Accord layer — R = Sh(T, J)

State reducers MUST be conservative (accumulating, never overwriting prior sections) to satisfy the restriction map condition.

| Math unit | SQLite | PydanticAI | LangGraph | Exactness |
|---|---|---|---|---|
| Accord type F | schema of `accord_sections(accord_id, history_id, section_data)` | `AccordSection` TypedDict | State TypedDict class definition | Near-exact |
| Accord instance | all rows for one `accord_id` across histories | `Accord` BaseModel with cross-history gluing validators | complete checkpoint log for one thread | Near-exact |
| Local section F(t) | one row: `(accord_id, history_id, section_data)` | field values of State at one checkpoint | LangGraph State at a specific checkpoint | Near-exact |
| Sheaf / gluing condition | — | cross-history validators on `Accord` | conservative reducers that never overwrite prior sections | Near-exact |

### Dynamics layer — acts on R

| Math unit | SQLite | PydanticAI | LangGraph | Exactness |
|---|---|---|---|---|
| Process carrier forward step γ_t | — | `step_forward(section, step) -> section` | LangGraph Node (advances State) | Near-exact |
| Counit ε_s | restriction lookup via `restrictions` table | apply restriction map to a section | reading an earlier checkpoint | Near-exact |
| Concurrent act ⊛ | — | Python function combining two Accord instances | LangGraph fan-out via `Send` + reducer fan-in | Near-exact |
| Commuting acts G_s ≅ G_s' | commutation table entry (s, s') | — | parallel LangGraph branches | Near-exact |

### ClosureKind

| Kind | σ | Δ | PydanticAI | LangGraph |
|---|---|---|---|---|
| Process | stable | stable | pure Python function + `result_type=ContentModel` | deterministic Node |
| Derivation | open | stable | LLM Agent + `result_type=ContentModel` | LLM Node with structured output |
| Procedure | stable | open | function or constrained LLM returning `Command(goto=...)` | routing Node |
| Inquiry | open | open | LLM Agent, no `result_type` | open LLM Node |

## Algebraic Constraint Layer

PydanticAI field validators enforce type-level and structural constraints.
They do not and cannot enforce mathematical structure laws across entities — nucleus extensivity, idempotence, meet-preservation, Heyting algebra axioms, sheaf gluing conditions — because those require quantification over all elements in a fiber or all sections across a covering family.

The Algebraic Constraint Layer fills this gap using **clingo**, an Answer Set Programming (ASP) solver.
Constraints are written as `.lp` files in `src/service/constraints/` — declarative integrity rules, inspectable as data, outside any application code path.
Before the Engine runs, a Python bridge reads the relevant rqlite tables as ground facts and calls clingo to check all applicable constraint programs.

| `.lp` file | Mathematical law enforced |
|---|---|
| `nucleus_laws.lp` | Extensive: x ≤ j(x); idempotent: j(j(x)) = j(x); meet-preserving: j(x∧y) = j(x)∧j(y) |
| `heyting_axioms.lp` | Distributivity, Heyting condition (a∧b ≤ c iff a ≤ b⇒c), top/bottom completeness |
| `prefix_order.lp` | Transitivity and antisymmetry of the prefix order on histories |
| `sheaf_conditions.lp` | Compatible local sections assemble uniquely to a global section |
| `restriction_maps.lp` | Restriction maps preserve meet, join, implication, top, bottom; commute with nuclei |

A write to the DataStore that would violate any constraint MUST be rejected before it is committed.

clingo is used for runtime validation, not theorem proving.
The finite fiber axiom ensures constraint checking terminates over bounded fact sets.

## Trust boundary model

Incoming steps and peer sections pass through three sequential gates before entering the system:

1. **Pydantic schema validation** — structural correctness; malformed messages are rejected before any processing.
2. **OPA/Rego authorization** — declarative policy rules govern what a given peer or client is permitted to submit.
3. **clingo sheaf condition check** — claimed sections from peer machines are checked against `sheaf_conditions.lp` before being committed to the DataStore.

## Security model

**Workload identity.** SPIFFE/SPIRE issues each workload a cryptographic identity (SVID).
Dapr's sidecar uses these for mTLS between all nodes.

**Capability delegation.** Biscuit tokens carry fine-grained authorization as attenuable, offline-verifiable Datalog policies.
SPIFFE SVIDs serve as bootstrap credentials to obtain a Biscuit token from the issuing service.

**External clients.** MCP clients authenticate via OAuth 2.1 Client Credentials through ContextForge.
A2A peer machines declare `MutualTlsSecurityScheme` in their AgentCard.

**NATS.** Untrusted peers are provisioned as separate NATS accounts with subject-scoped publish permissions.
Account-level isolation is enforced at the NATS server before messages reach any application code.

## Distribution model

The independence relation I in M(Σ, I) is the distribution blueprint.
Commuting steps s I s' produce the same history class regardless of order and are safe to process on separate nodes without coordination.
Foata normal form tiers are the scheduling unit: steps within a tier parallelize, tiers sequence.

**Input Boundary.** Each step is published to a NATS JetStream subject keyed by thread.
Commuting steps go to independent subjects and are consumed by different Engine actors.
Non-commuting steps are ordered by JetStream sequence number within the same subject.
Replaying a stream from sequence 0 reconstructs the full history.
Step processing MUST be idempotent.

**Engine.** Each history t has a dedicated Dapr virtual actor.
Kernel actors are stateless between invocations — all durable State lives in the DataStore; the actor is a pure compute unit.
The actor processes messages for t sequentially; actors for independent histories run concurrently across the cluster.
Dapr's Raft-backed placement service assigns actors to nodes with no central routing process.

**DataStore.** rqlite exposes distributed SQLite over Raft.
The Raft leader serializes all writes; read replicas serve reads from any worker node.
All fiber algebra tables, restriction maps, and nucleus results live here.

**Observation Layer.** Each node runs a FastMCP server.
IBM ContextForge aggregates all per-node servers using mDNS/DNS-SD discovery and Redis-backed session affinity.
External clients connect to the ContextForge gateway.

## Content unit storage

Skills, runbooks, and other RelationalEntities are stored as typed rows in rqlite.
Each unit type has an `id` column, a `locale` column, and a `content` column (serialized body).
These are this runtime's own units — not imported from any other system.

## Peer connections

Two DistributedRelationalMachineRuntime instances MAY be connected by a structure-preserving map between their fiber systems.
The A2A Protocol (Agent2Agent, Linux Foundation) is the candidate implementation: JSON-RPC 2.0 over HTTP with SSE streaming, no central broker required.
The correct category of morphisms between relational machines remains an open mathematical question; A2A provides the transport once that question is resolved.

## What it is not

A DistributedRelationalMachineRuntime is not a [RelationsSystem](relations-system.md).
It is not a runtime for the [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md).
The two systems are categorically different — FARS is a static RelationsSystem; this is a live RelationalMachineRuntime.
They share no content, no history, and no operational connection.

## Status

Not yet implemented.
Architecture specified in [relational-machine](relational-machine.md).

## Open questions

