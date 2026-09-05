---
name: relationality-architecture-summary
date-created: 2026-04-04
description: "High-level findings for the captain: the mathematical and philosophical constraints on system design, with clear requirements for each subsystem."
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---


## The Core Finding

The system is not loosely inspired by relationality. Every component — agents, messages, ledger, MCP tools, graph structure — is a concrete manifestation of **bilattice-valued predication on fiber algebras**. The mathematical structure is tight; the only question is how deliberately we encode it.

**One principle drives everything:** Entities do not exist independently and then acquire relations. Entities *are constituted by* their relational position. This means:

- An entity has no identity apart from its fibers (predicates).
- A message is not information-passing; it is a predication assertion.
- The graph is not a thing; it is a view over fiber compositions.
- An agent does not work on entities; it works within a fiber at a specific trace.

## What Must Be True of Each Subsystem

### 1. Data Representation (EAVT / Knowledge Graph)

**Currently:** EAVT triples `[entity, attribute, value]` are stored and composed.

**Must change:** Understand and represent them as *bilattice-valued predications* in fibers.

**Concrete requirements:**
- Each attribute is a predicate defining a fiber (a space of (subject, object, value) triples).
- Values must carry bilattice information: epistemic state includes positive evidence, negative evidence, conflation flags.
- The graph is a composition of individual entity-fibers, not a primary object.
- Query results should be fiber-aware: "In the predicate P's fiber, subject S relates to object O with value V."

**Impact:** Very high — this is conceptual reframing, not code changes.

**Priority:** Phase 1 (semantics alignment). Understand and document how current EAVT already encodes this.

---

### 2. Inference and Closure (Saturation / Rules)

**Currently:** Rules are applied without distinguishing which operations they support.

**Must change:** Distinguish saturation nucleus (σ, stable equilibrium) from translation nucleus (Δ, history-invariance).

**Concrete requirements:**
- Saturation rules: modus ponens, universal instantiation, closed-world derivation. These define what holds in saturated state.
- Translation rules: state machine transitions, temporal invariants, context-preservation rules. These define what persists across trace boundaries.
- Compute and cache three layers: asserted, saturated (fixed saturation), stable (fixed saturation AND translation).
- Make the distinction visible in ledger, queries, and agent communication.

**Impact:** High. This requires restructuring how rules are stored, applied, and reported.

**Priority:** Phase 2 (ledger restructuring). Start with rule tagging and layer computation.

---

### 3. Sessions and Traces (Agent Contexts)

**Currently:** All agents operate on shared global knowledge. Sessions exist but are not tied to fiber/trace structure.

**Must change:** Each agent operates in a *trace* — a level of abstraction and refinement. Moving between traces requires reindexing.

**Concrete requirements:**
- Agents are trace-typed: planner (coarse trace), executor (fine trace), monitor (meta-trace), etc.
- Communication between agents in different traces is not copy; it is reindexing.
- Sessions, plans, and phases map to traces. Each has its own fiber algebra at its granularity.
- When agent A needs data from agent B's trace, the communication is mediated by a reindexing functor.

**Impact:** Very high. This changes how agents are dispatched and how they communicate.

**Priority:** Phase 3 (trace-aware agents). Requires design work before implementation.

---

### 4. Ledger and Event Recording

**Currently:** Events are logged as state changes. The ledger is flat and global.

**Must change:** Ledger entries are *fiber-local* relational state transitions, categorized by nucleus.

**Concrete requirements:**
- Each entry records: subject, predicate (fiber), object, old-value, new-value, trace-context, nucleus-type (saturation/translation).
- The ledger is organized by fiber, not by entity.
- Queries against the ledger are fiber-local: "What changed in the is-in-location fiber?" not "What changed about alice?"
- Examples:
  - `{ subject: "task-123", predicate: "is-ready", object: "planner", value_old: "bot", value_new: "t", trace: "session-1", nucleus: "saturation" }`
  - `{ subject: "alice", predicate: "is-assigned-to", object: "project-x", value_old: "f", value_new: "t", trace: "session-1", nucleus: "translation" }`

**Impact:** Medium-high. Ledger schema change, but backward-compatible if you preserve old entries.

**Priority:** Phase 2 (ledger restructuring). Implement alongside nucleus tagging.

---

### 5. Agent Dispatch and Orchestration

**Currently:** Agents are generic workers. Tasks are assigned to agents. No fiber or trace awareness.

**Must change:** Agents are specialized for their trace. Dispatch includes trace context. Communication is predication-based.

**Concrete requirements:**
- Dispatch message: `{ agent: "executor", trace: "execution-fine", action: { subject: "task-123", predicate: "execute", object: "step-1" }, reindex-from: "planning-coarse" }`
- Agent responds with predications in its fiber, not task status updates.
- Agents check translation-invariance before asserting facts that outlive their trace.
- Orchestration is driven by fiber coherence, not task dependencies.

**Impact:** Very high. Requires rethinking dispatch patterns and agent interfaces.

**Priority:** Phase 3 (trace-aware agents). Design first, then implement.

---

### 6. Messaging Protocol

**Currently:** Messages are task descriptions, tool outputs, status updates. No standard structure.

**Must change:** All messages are *predications* — subject-predicate-object assertions with epistemic state.

**Concrete requirements:**
- Message format: `{ subject: X, predicate: P, object: Y, value: { confidence: t|f|bot|top, contradiction: t|f|bot|top, evidence: [reason1, reason2, ...] }, trace: T, nucleus: N }`
- Tools emit predications, not task status.
- Agents route messages to the appropriate fiber.
- Messages carry bilattice epistemic state, not boolean true/false.

**Impact:** High. Changes every tool output and agent communication interface.

**Priority:** Phase 2 (after ledger, before full trace-awareness). Standardize predication-based messaging.

---

### 7. MCP Tool Interface

**Currently:** Tools take entity IDs, return properties. No fiber awareness.

**Must change:** Tools expose *fiber operations* and *reindexing*.

**Concrete requirements:**
- Tool naming by predicate, not entity: `query-has-name-fiber`, `resolve-subject-in-role`, not `get-person-attributes`.
- Tool input: subject-predicate-object skeleton with wildcards: `{ subject: ?, predicate: has-name, object: ? }` → return all matching triples.
- Tool output: fiber-local results with epistemic state and context.
- Tools can reindex facts between traces if given both source and target traces.

**Impact:** High. Requires redesigning tool interface and registration.

**Priority:** Phase 5 (lower priority, but foundational). MCP is the external face of the system.

---

### 8. Graph Generation and Composition

**Currently:** One global graph file is generated from all markdown. Graph is the source of truth.

**Must change:** Each file/entity has its own fiber (local graph). The big graph is a cache (composition of fibers).

**Concrete requirements:**
- Graph generator can run on a single file and produce that entity's fiber.
- Big graph is compose(fiber(entity_1), fiber(entity_2), ...).
- Operations graph (sessions, events) has cold storage too (markdown files in operations/).
- Tools can fall back to reading files directly if graph is stale.

**Impact:** Medium. Architectural change, high impact on workflow.

**Priority:** Phase 4 (lower priority, future). Requires infrastructure work but unblocks long-term scalability.

---

## What Changed in the Mathematical Understanding

### 1. Fibers Are Primary

The predication paper proves that every predicate $p$ defines a fiber — the collection of all (subject, object) pairs using $p$. The fiber is itself a bilattice algebra (the pointwise product of the four-valued logic). This means:

- Fibers are not virtual; they are concrete algebraic objects.
- Organizing the system by fiber (predicate) is organizing by the actual mathematical structure.
- Current EAVT organization (flat triples) already encodes fibers but doesn't make them explicit.

### 2. Dual Nuclei Are Orthogonal

Saturation nucleus (σ) and translation nucleus (Δ) are two independent closure operators that happen to commute. This means:

- They are not variants of the same operation.
- Both must be computed. Saturation without translation (or vice versa) loses information.
- The intersection (fixed fiber $H_t^*$) is the truly stable layer.

### 3. Predication Is Irreducibly Triadic

Subject-predicate-object structure is not a convenience. Peirce proved triadic relations cannot be decomposed into dyadic pairs without loss. Nāgārjuna proved subject and object arise together through dependent origination. The predicate is the *mediating term* that interprets the object *for* the subject.

This means:
- SPO triples are the mathematical primitive.
- You cannot flatten to (subject, object) or (subject, value). The predicate is essential.

### 4. Traces Are Relative Contexts, Not Temporal Points

A trace is a canonical sequence of relational steps describing how a proposition was constructed. Propositions are *trace-relative* — the same content means different things at different traces. Reindexing (moving between traces) is not a copy operation; it is a functor map that respects propositional structure.

This means:
- Sessions/plans/agents are not just "happening in time." They are happening *at different traces* (levels of abstraction).
- Communication between different traces must be explicit reindexing, not data sharing.

## What This Means for the Captain's Vision

The three systems (agentic, semiotic, ledger/messaging) are not separate. They are three views of the same thing: **bilattice-valued predication in fiber algebras over traces**.

- **Agentic:** Agents are operators that work within fibers at specific traces.
- **Semiotic:** Signs (messages) encode predications. Interpretation is reindexing between fibers.
- **Ledger:** The ledger records relational state transitions in fibers, categorized by nucleus.
- **MCP:** Tools expose fiber operations and reindexing as primitives.

The system is coherent if and only if all components respect this structure. Partial coherence (some parts respecting it, others not) creates friction and information loss.

## Concrete Next Steps

1. **Semantics Documentation (1–2 days):** Document how EAVT already encodes bilattice-valued predication. Create guides for reframing attributes as predicates, queries as fiber operations.

2. **Rule Tagging (3–5 days):** Tag all inference rules in the system as saturation or translation. Compute three-layer ledger (asserted, saturated, stable). Make this visible in queries.

3. **Trace Design (5–10 days):** Design trace hierarchy (planning → execution → monitoring) and reindexing maps between them. Prototype trace-aware agent dispatch.

4. **Messaging Standardization (5–10 days):** Standardize all inter-component communication on predication format with epistemic state. Update all tools to emit predications.

5. **Ledger Restructuring (ongoing):** Implement fiber-local ledger organization. Update event schema to include trace and nucleus context.

These are not separate projects. They are progressive clarifications of what the system already is.

---

**Research completed:** 2026-04-04  
**Grounding sources:** Predication paper, GSU specification, philosophical survey, captain's ideas  
**Next phase:** Present findings to captain; confirm interpretation; prioritize implementation phases
