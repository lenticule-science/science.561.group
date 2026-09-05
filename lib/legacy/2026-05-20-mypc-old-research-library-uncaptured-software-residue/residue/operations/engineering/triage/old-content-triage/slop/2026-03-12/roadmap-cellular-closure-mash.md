---
date: 2026-03-12
type: slop
topic: roadmap — cellular closure engine running a Multi Agent Semiotic Hub (MASH) over QCHTTopos
---

# Roadmap: Cellular Closure Engine → MASH → QCHTTopos

## Target State (stated formally)

A **Multi Agent Semiotic Hub (MASH)** is a runtime in which:
- Multiple heterogeneous personas operate concurrently on a shared typed
  directed multigraph (the semioverse)
- Each persona has a role-bounded capability set that determines which
  regions of the graph it can read/write and which closure operators it
  may apply
- The aggregate behavior of all active personas is a distributed cellular
  closure computation: concurrent applications of S_sem, S_syn, S_fus
  converging toward the least fixed point X* of the composite closure
  operator S
- The graph's type system, predicate constraints, and satisfaction relation
  are grounded in a **Quasicrystalline Hypertensor Topos (QCHTTopos)**:
  - *Topos*: the ambient logical universe — internal logic is
    intuitionistic (Heyting-valued truth), types are objects, predicates
    are morphisms, type theories are subobject classifiers
  - *Hypertensor*: predicates are not just binary relations but
    higher-rank tensors over the type lattice; a predicate p of arity n
    is a morphism p : T_1 × ... × T_n → Ω (where Ω is the truth object)
  - *Quasicrystalline*: the type lattice has long-range aperiodic order —
    not a regular grid (not a simple taxonomy) but a structure where the
    valid type neighborhoods are deterministic without being periodic.
    Types can be predicted by pattern completion but not by simple
    inheritance.

The engine computes closure. The MASH runs agents. The QCHTTopos is the
mathematical ground truth for what "correct" means.

---

## Milestone 0 — Minimal Working Foundation (DONE or nearly done)

**What exists:**
- FastMCP server with three tools: `read_object`, `write_object`,
  `list_region`
- Docker deployment, health endpoint, OpenAI-compatible `/v1/*` routes
- Single persona (Emsemiote) defined in library, loaded at startup
- MCP config in `.mcp.json`, accessible to Claude Code

**What's still broken:**
- Emsemiote's backend model (phi-4-mini NPU timeout); needs switch to
  qwen2.5-7b NPU
- No search/query tool — navigation is blind without knowing paths

**Exit criterion**: Emsemiote responds in Open-WebUI using tools to
actually read library content, not just generate from weights.

---

## Milestone 1 — Schema Layer: Kinds and SHACL

**Goal**: the library has a formal type vocabulary with computable
satisfaction criteria.

**Steps:**

1.1 Create `library/domains/general/thing.md` — base kind declaration.
    A Thing has: `description` (required), `kind`, `name`, `date-created`,
    `date-modified`, `tags[]`, `creators[]`, `version`. This is the
    universal base. Every library object is a Thing.

1.2 Create `library/standards/markdown/` — the schema registry. Each
    subdirectory corresponds to a content domain (general, math, agents,
    skills, etc.). Each subdirectory contains:
    - `{type}.md` — the kind declaration (philosophical + schema merged,
      per Tarski triplet framing: the file IS its own description)
    - `{type}.shacl.ttl` — the SHACL shapes file for this type
    - `{type}.context.jsonld` — JSON-LD context for frontmatter-to-RDF

1.3 Write `engine/methods/frontmatter_to_ttl.py` — parses a markdown
    file's frontmatter into RDF triples using the JSON-LD context for its
    kind. Output: a `.ttl` file beside the source, or an in-memory graph.

1.4 Write `engine/methods/validate_shacl.py` — given a node's TTL and
    its kind's SHACL shapes, run pyshacl and return a SHACL validation
    report. This IS the satisfaction check: v ⊨ Φ_{τ(v)}.

1.5 Expose as MCP tools:
    - `check_satisfaction(path)` → SHACL report
    - `get_gaps(path)` → list of violated shape constraints

**Exit criterion**: `check_satisfaction` on an arbitrary library file
returns a typed list of errors/warnings/satisfied, and `get_gaps`
returns the specific predicates needed to satisfy its kind's SHACL shape.

---

## Milestone 2 — Predicate Graph: Extraction and Query

**Goal**: the full predicate graph is queryable in structured form.

**Steps:**

2.1 Write `engine/methods/build_graph.py` — walks the entire library,
    extracts all frontmatter into RDF triples using per-kind JSON-LD
    contexts, assembles an in-memory rdflib ConjunctiveGraph. One named
    graph per source file (provenance preserved). Cache invalidation:
    file mtime tracking.

2.2 Expose graph query tools:
    - `query_graph(sparql)` → rows — direct SPARQL over the full graph
    - `get_interaction_surface(path)` → [(predicate, object, target_path?)]
      — all outgoing edges from a node, with link resolution
    - `find_by_kind(kind)` → [path] — all nodes of a given type
    - `find_missing_edges(predicate)` → [(subject, object)] — declared
      reciprocal edges that aren't reciprocated

2.3 Write `engine/methods/distance_metric.py` — computes
    d(G, X*) = count of nodes where check_satisfaction returns any errors.
    Exposes as `get_distance()` — the global convergence counter.

**Exit criterion**: Emsemiote can answer "what does the library say about
X" by issuing a SPARQL query or `find_by_kind`, reading the results, and
synthesizing. No grep. Structured traversal only.

---

## Milestone 3 — Closure Operators

**Goal**: the engine can compute and apply closure, not just validate.

**Steps:**

3.1 Implement S_sem as a tool:
    `apply_semantic_closure(path)` — reads a node's satisfaction report,
    computes Gap(v) (required predicates not present), and for each gap
    either: (a) fills it from available graph data if the value is
    computable (e.g. a `name` derivable from the filename convention), or
    (b) returns it as a task for an agent to resolve.

3.2 Implement S_syn as a method:
    `detect_syntactic_gaps()` — surveys the type lattice for definable
    but undefined types. If math/algebra and math/topology exist but
    math/analysis does not, and the pattern predicts it, flag it.
    Returns: [(kind, evidence_pattern, confidence)].

3.3 Implement S_fus as a method:
    `detect_redundancy()` — finds nodes that are structurally isomorphic
    (same kind, same predicate values up to renaming). Returns merge
    candidates.

3.4 Effect reports become formal: every write operation returns an
    `effect_report` containing:
    - nodes_modified: [path]
    - satisfaction_delta: old_errors - new_errors (should be ≥ 0)
    - distance_delta: old_d - new_d
    A write that increases distance (introduces errors) is flagged.

**Exit criterion**: `apply_semantic_closure` on a node with known gaps
produces a correct write that decreases d by at least 1 and returns a
well-formed effect report.

---

## Milestone 4 — Multi-Agent Hub: Roles and Capability Filtering

**Goal**: multiple personas can operate concurrently with non-overlapping
authorized regions, and `tools/list` is filtered per persona.

**Steps:**

4.1 Role definitions in `library/agents/roles/` each specify:
    - `region.reads`: glob patterns for readable paths
    - `region.writes`: glob patterns for writable paths
    - `skills`: list of skill IDs this role grants
    (The tool list a persona sees = only tools whose region constraints
    are satisfied by that persona's roles.)

4.2 Middleware layer in the MCP server: inspect incoming tool call's
    persona header (or session token), resolve their roles, check whether
    the tool+path combination is authorized. Return capability error if
    not. This is the TAB `system-relationships` check reimplemented as
    MCP middleware.

4.3 Persona session state: a persona's current location (path handle)
    persists across tool calls within a session. Tool calls with relative
    paths resolve against current location. `navigate(path)` updates
    current location.

4.4 Second persona operational: "Cartographer" role — read-only access
    to entire library, authorized to run S_syn and S_fus, emit gap
    reports but not write. Emsemiote does S_sem (writes). Cartographer
    surveys. Different closure operators, different regions, concurrent.

**Exit criterion**: two personas connected simultaneously, each receiving
a different filtered tool list, each making writes in non-overlapping
authorized regions without collision.

---

## Milestone 5 — Cellular Closure Engine

**Goal**: the engine can run an autonomous closure iteration to
convergence without requiring per-step agent direction.

**Steps:**

5.1 Closure scheduler: a background process that maintains a work queue
    of (node, operator) pairs. When a node is written, its neighbors
    (via edge traversal) are enqueued for re-validation.

5.2 Convergence detection: d(G, X*) is computed after each write batch.
    If d is stable for N consecutive batches, declare local convergence
    for that region. Global convergence = d = 0.

5.3 Cellular structure: the graph is partitioned into cells (library
    regions corresponding to role boundaries). Closure is applied
    cell-by-cell. A cell is "active" if it contains unsatisfied nodes.
    Active cells are assigned to available personas. When a cell reaches
    local convergence, it is deactivated.

5.4 Provenance chain: every write is stamped with:
    - persona_id: who wrote it
    - operator: which closure operator was applied
    - predecessor_state_hash: content hash before write
    - effect_report: satisfaction delta, distance delta
    This is the blockchain-style provenance chain from the architectural
    influences doc. Not for consensus — for audit.

5.5 Handoff protocol: when Emsemiote finishes a cell and activates a
    neighboring cell that requires a different role, it emits a handoff
    request (ActivityPub-style activity). The appropriate persona picks
    up the work queue.

**Exit criterion**: run `close_region("library/domains/general/")` and
observe d decrease monotonically to 0 in that region with full provenance
trail and handoffs logged.

---

## Milestone 6 — QCHTTopos Grounding

**Goal**: the type system, satisfaction relation, and closure operators
are grounded in the full QCHTTopos structure, not the approximation.

**Steps:**

6.1 Replace the 3-chain truth values (error/warning/satisfied) with
    full Heyting-algebra-valued satisfaction. Each shape constraint
    produces a truth value h ∈ H. Conjunction is meet in H. Implication
    is exponential object. The satisfaction relation v ⊨ Φ_T is now
    H-valued, not Boolean.

6.2 Hypertensor predicates: extend the predicate vocabulary to include
    n-ary relations (not just binary). Frontmatter fields that take
    multiple typed values (e.g. `creators: [(person, role)]`) are arity-2
    predicates over the type lattice. SHACL shapes for these use
    sh:SPARQLConstraint over the n-ary graph.

6.3 Quasicrystalline type lattice: formalize the type neighborhood
    structure. Each type T has a local neighborhood N(T) — the set of
    types that can appear in its predicate range. The quasicrystalline
    condition: N(T) is not determined by a simple inheritance rule but
    by a local matching rule (analogous to Penrose tiling's vertex
    matching rules). S_syn is exactly the algorithm for completing missing
    tiles given their local neighborhood constraints.

6.4 Topos internalization: the engine's logic is rewritten so that all
    truth-value computations happen in the internal logic of the topos.
    This means: quantifiers range over the type objects, implications
    are morphisms, and the SHACL validation report IS the subobject
    classifier map Ω applied to the node.

6.5 QCHTTopos spec: write a formal specification document in
    `library/standards/formal/qcht-topos.md` that defines the topos,
    the hypertensor predicate structure, and the quasicrystalline type
    lattice precisely enough that another agent can implement a
    conformant engine from the spec alone.

**Exit criterion**: the formal spec exists, the engine implements
Heyting-valued satisfaction, and the type lattice includes at least
three examples of quasicrystalline type completion (S_syn filling
tiles predicted by matching rules, not inheritance).

---

## Summary Table

| Milestone | Name | Unlocks |
|-----------|------|---------|
| M0 | Minimal Foundation | Single agent navigating library |
| M1 | Schema Layer | Formal types, computable satisfaction |
| M2 | Predicate Graph | Structured query, distance metric |
| M3 | Closure Operators | Autonomous gap-filling, effect reports |
| M4 | Multi-Agent Hub | Concurrent personas, capability filtering |
| M5 | Cellular Closure Engine | Convergent autonomous closure at scale |
| M6 | QCHTTopos Grounding | Full mathematical formalization |

M0→M1→M2→M3 is sequential (each depends on the previous).
M4 can begin in parallel with M3 (role system doesn't require closure).
M5 requires M3 and M4.
M6 is a formalization layer that can be drafted alongside M3-M5 and
backported; it does not block implementation.

The system is usable at M2. It is correct at M3. It is multi-agent at M4.
It is autonomous at M5. It is formally grounded at M6.
