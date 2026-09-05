---

description: "Superseded. This concept has been renamed and re-chained. See distributed-relational-machine-runtime.md."
introduces: specification
---

> **Superseded.** This spec has been replaced by [DistributedRelationalMachineRuntime](distributed-relational-machine-runtime.md).
> The name was wrong on two counts: it called itself a "System" when it is a live Runtime, and it placed itself on the System chain (AgentialRelationsSystem) when it belongs on the Machine chain (RelationalMachine → RelationalMachineRuntime → DistributedRelationalMachineRuntime).
> All content has been moved to the new file.
> This file is kept to avoid broken links until references are updated.

# Distributed Agential Relations System

A **DistributedAgentialRelationsSystem** is an [AgentialRelationsSystem](agential-relations-system.md) whose substrate is a live distributed service stack.

## What it is

A fully independent distributed service implementing the full four-component relational machine architecture as a live, queryable system across a network of nodes with no required central handler.
It is not a runtime for the [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md) — it is a separate machine with its own content, steps, and history.

## Stack

- **Hot store:** rqlite — distributed SQLite over Raft consensus; holds H_t, H*_t, restriction maps, nuclei results
- **Typed LLM output:** PydanticAI — validated structured output at decision points; schema validation at trust boundaries
- **State machines:** LangGraph — loop control, persistence, termination (via dapr-ext-langgraph inside Kernel actors)
- **Step stream:** NATS JetStream — input boundary message bus; ordered per-thread streams; at-least-once delivery (idempotent step processing required)
- **Kernel workers:** Dapr Agents — stateless virtual actor per history; dapr-ext-langgraph wraps LangGraph inside Dapr workflow activities
- **Algebraic constraint validation:** clingo (Answer Set Programming) — declarative enforcement of mathematical structure laws
- **Authorization policy:** OPA (Open Policy Agent) + Rego — declarative authorization rules at trust boundaries
- **Workload identity:** SPIFFE/SPIRE — cryptographic identity for all workloads; mTLS between nodes
- **Capability delegation:** Biscuit — attenuable capability tokens for fine-grained authorization
- **External interface:** FastMCP (per node) + IBM ContextForge gateway — MCP federation via mDNS/DNS-SD auto-discovery; A2A protocol for peer machine connections
- **HTTP endpoints:** FastAPI

## Four components

See [relational-machine](relational-machine.md) for the architecture spec.

- **Input Boundary** (`src/service/frontier/`) — NATS JetStream publisher; receives steps, publishes to per-thread streams, advances history via sequence ordering
- **State Store** — rqlite cluster; holds H_t and H*_t
- **Algebraic Constraint Layer** (`src/service/constraints/`) — validates mathematical structure laws before the Kernel runs
- **Normalization Kernel** (`src/service/normalization_kernel/`) — Dapr virtual actor per history t; stateless between invocations; applies π_t = σ∘Δ via a LangGraph graph wrapped by dapr-ext-langgraph
- **Observation Layer** (`src/service/observation_layer/`) — per-node FastMCP server emitting newly settled sections; aggregated by IBM ContextForge

## Implementation correspondence

How each math entity maps to the Distributed ARS stack:

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

PydanticAI field validators enforce type-level and structural constraints (required fields, cardinality, format).
They do not and cannot enforce mathematical structure laws across entities — nucleus extensivity, idempotence, meet-preservation, Heyting algebra axioms, sheaf gluing conditions — because those require quantification over all elements in a fiber or all sections across a covering family.

The Algebraic Constraint Layer fills this gap using **clingo**, an Answer Set Programming (ASP) solver.
Constraints are written as `.lp` files in `src/service/constraints/` — declarative integrity rules, inspectable as data, outside any application code path.
Before the Normalization Kernel runs, a Python bridge reads the relevant rqlite tables as ground facts and calls clingo to check all applicable constraint programs.

Constraint files and their mathematical correspondence:

| `.lp` file | Mathematical law enforced |
|---|---|
| `nucleus_laws.lp` | Extensive: x ≤ j(x); idempotent: j(j(x)) = j(x); meet-preserving: j(x∧y) = j(x)∧j(y) |
| `heyting_axioms.lp` | Distributivity, Heyting condition (a∧b ≤ c iff a ≤ b⇒c), top/bottom completeness |
| `prefix_order.lp` | Transitivity and antisymmetry of the prefix order on histories |
| `sheaf_conditions.lp` | Compatible local sections assemble uniquely to a global section |
| `restriction_maps.lp` | Restriction maps preserve meet, join, implication, top, bottom; commute with nuclei |

Constraint files are the authoritative statement of what the Distributed ARS is required to enforce.
A write to the State Store that would violate any constraint MUST be rejected before it is committed.

clingo is used for runtime validation, not theorem proving.
The finite fiber axiom (fibers are finite Heyting algebras) ensures constraint checking terminates over bounded fact sets.

## Trust boundary model

Incoming steps and peer sections pass through three sequential gates before entering the system:

1. **Pydantic schema validation** — structural correctness; malformed messages are rejected before any processing.
2. **OPA/Rego authorization** — declarative policy rules govern what a given peer or client is permitted to submit.
  Policies are `.rego` files, inspectable as data, deployed as an OPA sidecar.
  A step that passes schema validation but violates authorization policy is rejected here.
3. **clingo sheaf condition check** — claimed sections from peer machines are checked against `sheaf_conditions.lp` before being committed to the State Store.
  A section that fails to glue is rejected on mathematical grounds, not ad-hoc validation logic.

## Security model

**Workload identity.** SPIFFE/SPIRE issues each workload a cryptographic identity (SVID) regardless of where it runs in the cluster.
Dapr's sidecar uses these for mTLS between all nodes.
No manual certificate management.

**Capability delegation.** Biscuit tokens carry fine-grained authorization as attenuable, offline-verifiable Datalog policies.
Any holder can produce a strictly weaker token without contacting the issuer.
The weakened token cannot be upgraded.
SPIFFE SVIDs serve as bootstrap credentials to obtain a Biscuit token from the issuing service; SPIFFE answers "who is this workload?" and Biscuit answers "what is it allowed to do?"

**External clients.** MCP clients authenticate via OAuth 2.1 Client Credentials through ContextForge.
A2A peer machines declare `MutualTlsSecurityScheme` in their AgentCard; OAuth Client Credentials serves as fallback.

**NATS.** Untrusted peers are provisioned as separate NATS accounts with subject-scoped publish permissions, not as users within the trusted account.
Account-level isolation is enforced at the NATS server before messages reach any application code.

## Distribution model

The independence relation I in M(Σ, I) is the distribution blueprint.
Commuting steps s I s' produce the same history class regardless of order and are safe to process on separate nodes without coordination.
Foata normal form tiers are the scheduling unit: steps within a tier parallelize, tiers sequence.

**Input Boundary.** Each step is published to a NATS JetStream subject keyed by thread.
Commuting steps go to independent subjects and are consumed by different Kernel actors.
Non-commuting steps are ordered by JetStream sequence number within the same subject.
Replaying a stream from sequence 0 reconstructs the full history.
NATS delivers at-least-once; step processing MUST be idempotent.
The Foata normal form of the history is the natural deduplication key.

**Normalization Kernel.** Each history t has a dedicated Dapr virtual actor.
Kernel actors are stateless between invocations — all durable state lives in rqlite; the actor is a pure compute unit.
The actor processes messages for t sequentially (one at a time); actors for independent histories run concurrently across the cluster.
Dapr's Raft-backed placement service assigns actors to nodes with no central routing process.

**State Store.** rqlite exposes distributed SQLite over Raft.
The Raft leader serializes all writes; read replicas serve reads from any worker node.
All fiber algebra tables, restriction maps, and nucleus results live here.

**Observation Layer.** Each node runs a FastMCP server.
IBM ContextForge aggregates all per-node servers using mDNS/DNS-SD discovery and Redis-backed session affinity.
External clients connect to the ContextForge gateway; it routes queries to the appropriate node.

## Content unit storage

Skills, runbooks, and other RelationalEntities are stored as typed rows in rqlite.
Each unit type has an `id` column, a `locale` column, and a `content` column (serialized body).
These are DARS's own units — not imported from any other system.

## Peer connections

Two Distributed ARS instances MAY be connected by a structure-preserving map between their fiber systems (see [relational-machine](relational-machine.md), Peer connection).
The A2A Protocol (Agent2Agent, Linux Foundation) is the candidate implementation: JSON-RPC 2.0 over HTTP with SSE streaming, no central broker required.
IBM ContextForge supports A2A alongside MCP.
The correct category of morphisms between relational machines remains an open mathematical question; A2A provides the transport once that question is resolved.

## What it is NOT

The Distributed ARS is not a runtime for the [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md).
The two are categorically different kinds of things — FARS is a System; DARS is an Automaton.
They share no content, no history, and no operational connection.

## Status

Not yet implemented.
Architecture specified in [relational-machine](relational-machine.md).
Implementation lives in `src/service/`.

## Open questions
