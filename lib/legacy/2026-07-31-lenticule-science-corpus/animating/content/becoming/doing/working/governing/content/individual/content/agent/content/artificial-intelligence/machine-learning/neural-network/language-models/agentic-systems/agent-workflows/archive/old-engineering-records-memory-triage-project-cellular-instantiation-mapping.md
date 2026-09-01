---
name: project_cellular-instantiation-mapping
description: Explicit mapping from Cellular Closure Engine (CCE) mathematical specification to mash-engine implementation, showing how the 2026-03 cell-machine design is realized in the current system.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## Cellular System → mash-engine Implementation

The cellular system specs (CCE.md, CDS.md, RTL.md, Node-Cycle.md) from March 2026 describe a mathematical machine. The mash-engine daemon and EAVT graph store instantiate this machine at the system level.

### CDS (Canonical Data Serialization) → EAVT

**Spec:** CDS defines cells as canonical JSON with `id` matching SHA-256 hash of canonical bytes.

**Implementation:**
- `eavt.rs` Graph struct uses FNV-1a hashing for entity IDs
- Every entity insertion computes hash of canonical JSON (`canonical_json()`)
- Entity IDs are determined by hash, not arbitrarily assigned
- The EAVT `{attrs, eavt}` format is the canonical serialization

**Code:** `src/eavt.rs` — `fn insert_entity(seed: &str, attrs: HashMap<String, String>)`

### RTL (Relational Type Language) → Session Events

**Spec:** RTL defines judgments — what is valid, proved, and certified.

**Implementation:**
- Session entities record state (pending/running/completed/failed)
- Events in the operations graph carry judgments: "session is running", "task completed", "plan ready for review"
- Each event is a judgment: a claim about what is true in the system

**Code:** `src/session/store.rs` — `enum SessionState`, `struct Session`

### CCE Apply/Merge → Daemon World Tick

**Spec:** CCE's `apply(CDS, RTL) → (refined_CDS, repair_log)` constructs closure deterministically.

**Implementation:**
- World tick ingests JSONL events into the graph (apply judgment to current state)
- Repair log equivalent: world tick produces events recording anomalies
- Merge equivalent: `Graph::compose()` combines knowledge graph and operations graph
- The daemon applies closure in three phases (like CCE):
  1. Ingest events (add new data)
  2. Check invariants (stale tasks, failures, stale sessions, incomplete plans)
  3. Emit events (propagate results)

**Code:** `src/session/daemon.rs` — `fn world_tick()` at line 196

### Fuel/Depth Bounds → World Tick Interval

**Spec:** CCE uses fuel to bound closure construction depth — prevents infinite expansion.

**Implementation:**
- World tick runs every 30 heartbeats (~5 minutes) — this is the fuel bound
- Each tick is one iteration of closure over current state
- Fuel exhaustion equivalent: world tick timeout (would abort if processing took too long)

**Code:** `src/session/daemon.rs` line 26 — `let world_tick_interval: u64 = 30;`

### Repair Log → Failure Reports + Events

**Spec:** CCE produces `repair_log: [{code, before_hash, after_hash, fuel_used}]` for every repair.

**Implementation:**
- Session completions write metrics and transaction records
- Failures write `.failure` files (the repair log)
- Each event in operations graph carries before/after state implicitly
- Missing: explicit hash recording of repairs (would be CEcR in CCE terms)

**Code:** `src/session/daemon.rs` — `fn write_failure_report()`, `fn record_session_transaction()`

### Evidence Vector → Session Transcripts

**Spec:** CCE produces evidence: `[input_hash, input_rtl_hash, repair_hashes..., output_hash, output_judgment_hash]` for verification.

**Implementation:**
- Session logs at `operations/engineering/records/sessions/{id}.log` are the transcript
- Metrics files at `{id}.metrics` carry token counts, cost, tool calls
- Missing: explicit cryptographic evidence vector (would enable independent audit)

**Code:** `src/session/daemon.rs` — extracts metrics, stores in graph

### Cell Merging → Graph Composition

**Spec:** CCE's `merge(c1, c2) → c_merged` combines cells while checking invariants.

**Implementation:**
- `Graph::compose()` merges knowledge graph and operations graph
- Invariants checked: no conflicting attributes, types consistent
- Result: unified graph that queries can work over

**Code:** `src/eavt.rs` — `fn compose()` method

## What's Missing From Spec But Needed

1. **Explicit hash recording** — every repair should record before/after hashes for auditability
2. **Canonical JSON hashes as keys** — currently using FNV-1a; should be SHA-256 of canonical bytes (would enable external verification)
3. **Evidence vectors** — sessions should produce verifiable transcripts for independent audit
4. **Repair recipe codification** — currently world_tick detects anomalies but doesn't record repair rules systematically
5. **Deterministic replay** — should be able to replay a session's closure from events + repair log

## What's Ahead

The next phase is making the cellular machine fully explicit in the operations loop:

1. **Rule codification** — σ_t and Δ_t rules encoded as queryable definitions
2. **Repair recipe automation** — when an anomaly is detected, system applies the CCE repair recipe automatically
3. **Evidence preservation** — every settlement produces CEcR (Closure Event Record) entry
4. **Multi-level closure** — stack multiple worlds (FARS, MASH, operations loop) and run settlement on each
5. **Constraint verification** — before allowing state transitions, verify they don't violate nucleus laws

These are not new architecture — they're instantiating what the cellular machine specification already defines.
