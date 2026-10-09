---
title: "Survey: Computer System Models in the 561 Repository"
specialization: research
date-created: 2026-04-05
date-modified: 2026-04-05
part-of: survey-computer-system-models
produces-for:
  - consume-historical-decision-records
  - consume-event-stream-record-spec
  - consume-fars-substrate
  - consume-old-specification-ideas
  - consume-relational-computer-arch
  - consume-semiotic-cell-machine
  - consume-tab-architecture
description: "Landscape map of every computer system model in the repo — what each does and how it does it. Unblocks the 7 consume-X plans."
---

# Survey: Computer System Models

Each entry describes what the model DOES and HOW it does it, with enough specificity that a reader can decide whether the source is worth reading for their purpose.

## Models

### 1. TAB (Things with Attributes and Behaviors)
- **Location:** `operations/engineering/toys/tab/archive/tab/` (Fennel code) + `operations/engineering/triage/content/buckets/tech/slop/2026-03-11/tab-mud-research.md` (research survey)
- **What it does:** Runs a MUD. Players connect, look at rooms, move, interact with objects, attack mobs. The world is built from declarative model files; behavior is added by attaching behavior files.
- **How it does it:** Every object in the world is a `thing` created by `tab.make-thing`. A thing has a `name`, a `behaviors` list (names of behavior modules), an `additive-attributes` list, and a `grammar` table (pronouns, nouns, adjectives for parsing player input). At creation, `setmetatable(thing, {:__index tab.lookup-behavior-method})` wires dynamic method dispatch: calling `thing:method()` triggers `__index`, which searches `thing.behaviors` for the first behavior file that exports `method`, loads that file (Fennel `.fnl` in a `behaviors/` directory), and dispatches the call. Attributes live as data files in `attributes/`, behaviors as function files in `behaviors/`. Inheritance flows through a `base` field: `tab.collect-bases` walks the base chain, `tab.merge-models` merges them into the final thing. Fields named in `additive-attributes` accumulate down the base chain instead of being overridden.
- **Characteristic move:** The engine itself is just another `thing` (a `dimension`) whose `systems:` field lists child things (map, mudserver, timer, webserver). The engine has no privileged status — it's a thing with orchestration behaviors (`load`, `start`, `run`) over its child things.

### 2. FARS (Flatfile Agential Resource System)
- **Location:** `operations/engineering/fars/docs/terms/` (119 spec terms) — core at `flatfile-agential-resource-system.md`
- **What it does:** Turns a directory of markdown files into a queryable relational computer. Files are entities, frontmatter is typed fields, directory structure is containment, frontmatter links are typed relations. Humans read and edit the files directly; agents query/modify via skills.
- **How it does it:** Defines a site (B, J) whose medium is markdown + YAML. The mapping: file-at-path → entity identified by `id` frontmatter field. YAML keys in frontmatter become typed predicates (Fregean predicate-as-key pattern). Directory nesting produces containment edges (`part-of` relations implicit). Explicit links in frontmatter (e.g., `serves: some-goal`, `depends-on: [x, y]`) produce typed relations. Git provides byte-stable persistence. The seven closure conditions of U_G (the closure operator) define what counts as "enterprise closure" over the file set. Any file is automatically input X; the system is U_G(X) — closure under the seven conditions. FARS is substrate-independent: could run on a graph DB satisfying the same seven conditions, so the interface is the contract.
- **Characteristic move:** No file is rejected as invalid input. Validation happens through closure, not admission.

### 3. Cellular Closure Engine / CCE-CDS-RTL
- **Location:** `operations/command/personnel/emsenn/projects/emsdeavor/developing/semiotic-repository/planning/ideas/semiotic-cell-machine/` (29 files) + `operations/engineering/triage/content/buckets/tech/cellular-closure-computing/cellular-closure-engine.md` (normative spec)
- **What it does:** Computes the closure of a single cell of a GFRTU (Generative Fibered Relational Trace Universe). Given a cell's data plus a type-theoretic judgment, it checks admissibility, runs the closure construction, and returns either a refined cell or a rejection with explanation.
- **How it does it:** Exposes two pure functions: `apply(CDS_cell, RTL_judgment)` and `merge(CDS_cell, CDS_cell)`. CDS (Cellular Data Serialization) is canonical JSON with SHA-256-hex identity — every CDS_cell has a declared `site` (objects, morphisms, Heyting table), `constructors` (ordered), `fixed_layer` (presheaf sections), `laws` (invariants with repair recipes), and `canonicalization` rules. RTL (Relational Type Language) expresses typed judgments over these cells. Apply executes three phases: (1) structural validation — check CDS schema, verify hash identity, validate RTL judgment shape; (2) judgment checking — typecheck and normalize the RTL judgment; (3) closure construction — seed a breadth-first worklist from `constructors` in declared order (no host re-sorting), iterate layer-by-layer computing (x, UG(x), UG²(x), ...) where UG is the closure operator, at each layer repair the fixed layer via plus-construction sheaf gluing, then apply σ and Δ tables to every section until a fixed point or fuel exhaustion. Every repair emits a log entry `{code, before_hash, after_hash, fuel_used}` ordered by moment-of-change. Merge checks site coincidence, ensures constructor superset, intersects fixed-layer sections pointwise, unites invariants by code, re-runs phase 3. All outputs canonicalize and hash before return; id mismatch aborts.
- **Characteristic move:** Determinism by construction. Same inputs + same fuel → same output, identical repair log, hash-verifiable. No ambient state influences ordering.

### 4. Event-Stream Record Spec
- **Location:** `operations/command/personnel/emsenn/projects/emsdeavor/developing/semiotic-repository/planning/ideas/event-stream-record-spec/` (6 files)
- **What it does:** Defines how to write events to a log such that the bytes are reproducible across languages, producers, and time, and any verifier can later confirm the log was not tampered with or reordered.
- **How it does it:** Each event is a JSON object with required fields: `seq` (non-negative integer, monotonic within `source_id`), `source_id` (producer identity), and a payload. Ordering is semantic — derived from `seq`, not wall-clock. Canonicalization rules (UTF-8, no whitespace variance, key ordering, number normalization) ensure identical byte representation across producers. Cryptographic integrity via SHA-256 hashes over canonicalized records; hashes can be chained so tampering with one record invalidates all downstream. A conforming verifier validates: every record canonicalizes identically on re-serialization, `seq` is monotonic within each `source_id`, hash chains are intact. Non-goals (explicitly excluded from the spec): transport, storage format beyond serialization, compression, encryption, authentication, wall-clock synchronization.
- **Characteristic move:** Narrow scope. Nothing outside canonicalization and integrity is defined, so the spec composes cleanly with any transport/storage/auth layer.

### 5. Relational Computer Architecture & Service Specs
- **Location:** `library/domains/engineering/domains/tech/domains/computing/` (architecture) + `operations/command/.../ideas/specifications/` (36+ service specs)
- **What it does:** Specifies a multi-service runtime that embodies a relational computer. Each service owns one aspect of system behavior (storage, scheduling, networking, etc.). The whole composes into an agential semioverse operating in a QCHTTopos (Quasicrystalline Hypertensor Topos).
- **How it does it:** Named services include: storage (persistence layer), scheduler (timing and dispatch), knowledge-graph (relations over entities), measurement-fabric (observable state and probes), network (inter-node communication), concurrency (parallel action safety), replication (distribution), introspection (system observes itself), audit (tamper-evident trail), policy (normative constraints), modal-logic (Heyting-valued truth evaluation), markov-dynamics (stochastic state evolution), sheaf-topos (the topos structure), heyting-algebra (the truth object Ω), directed-homotopy (paths and transitions), quasicrystalline-hypertensor (the type-lattice geometry), parametric-semantics (meaning assignment), modality-tower (modal operator stack), spectral-theorem (eigenvalue-based analysis), semiotic-activitypub (federation), information-engine (inference runtime), intake-stack (input processing), traceability-graph (causality tracking), baseline-renewal (drift correction), infinity-site (site structure beyond finite). The target computer encodes: library content as markdown+YAML, operations as skills (parametric procedures composable from tools, the sole admissible primitive), agents as profiles (role, goals, policy, skills, tools, memory), communication via MCP.
- **Characteristic move:** All operations must be mediated by skills. No direct state mutation outside skill execution. Authorization is a precondition to skill execution, never a side effect.

### 6. Emsemioverse Engine
- **Location:** `operations/command/.../ideas/emsemioverse-engine/` (Python FastAPI + MCP implementation)
- **What it does:** Loads skills declared in the library and exposes them as callable operations over both HTTP and MCP. Does not own or enforce anything itself.
- **How it does it:** FastAPI app (`api/main.py`). At startup, `api/app_state.py` reads the library's SKILL manifest and builds the skill registry. `api/skill_runner.py` executes a skill by locating its runtime entrypoint (e.g., a colocated Python script for `runtime: script` skills) and invoking it with the caller's inputs. `api/mcp_sdk_adapter.py` mirrors the HTTP skill endpoint as an MCP tool surface: each skill exposed at `POST /api/v1/skills/{skill_id}/execute` is also an MCP tool with the same input schema. Authorization, schema validation, and filesystem semantics are not engine concerns — they are skills in the library that other skills call. Environment variables configure host, port, log level. Deployment via Docker.
- **Characteristic move:** Engine is pure loader/dispatcher. Owns zero domain logic. Everything is a skill.

### 7. Historical Decision Records
- **Location:** `operations/command/.../ideas/planning/decisions/` (11 ADRs)
- **What it does:** Each record captures one architectural choice, its context, the alternatives considered, and the decision rationale.
- **How it does it:** Follows ADR format. Individual decisions recorded: **0001** restructures agent instruction files into standard INBOX/IDEAS/PLANS/MEMORY/SOUL structure; **0002** specifies per-directory agent instruction files instead of global ones; **0003** makes agent instructions derive from policies and directives rather than arbitrary text; **0004** sets planning system priorities — IDEAS promote to PLANS, closed plans archive; **0005** catalogs theory directions for the semiotic endeavor; **0006** requires spec enrichment to be technical not philosophical; **0007** defines endeavor-derivation-order (charter → endeavor → goals → work); **0008** declares canonical paths ARE physical file paths (not abstract identifiers); **0009** treats directory structure as the structuration interface (the shape of the tree IS part of the semantics); **0010** defines "repository" to mean files on disk (not git history, not a remote); **0011** creates an archive subdirectory pattern for closed plans.
- **Characteristic move:** Decisions are about how to STRUCTURE planning and agent work, not about runtime architecture.

### 8. Old Specifications (Simulation Specs)
- **Location:** `operations/command/.../ideas/specifications/` (36 files)
- **What it does:** Translates mathematical theorems from the relational hyperverse corpus into runnable simulation specifications. Each spec tells an implementer: here's what to represent, how to update it, what invariants to maintain, what to output.
- **How it does it:** Each spec follows a uniform structure: state representation (what data structure encodes the object), update rules (what transitions are admissible), invariants (properties that must hold before/after updates), outputs (what the simulation produces, in what form). Real content exists for: baseline-renewal (drift correction sim), modal-logic (Heyting-valued propositional logic sim), measurement-fabric (observable-probe sim), infinity-site (directed ∞-site sim), parametric-semantics (parameterized meaning-assignment sim), modality-tower (stack of modal operators sim), spectral-theorem (eigenvalue decomposition sim). Many others exist as titles pointing at 404 stubs — structural placeholders for theorems not yet specified.
- **Characteristic move:** Each simulation sim makes one theorem executable. The simulation IS the theorem's operational witness.

### 9. MASH (Multi Agent Semiotic Hub)
- **Location:** `operations/engineering/triage/content/buckets/tech/slop/2026-03-12/roadmap-cellular-closure-mash.md` + `big-picture-technical.md`
- **What it does:** Defines a runtime where many heterogeneous agents operate concurrently on a shared typed graph, and their aggregate action is a distributed closure computation that the system converges to a mathematical fixed point.
- **How it does it:** A shared typed directed multigraph (the semioverse) holds all entities and relations. Each persona (agent) has a role-bounded capability set: which regions of the graph it can read, which it can write, which closure operators it may apply. Personas act concurrently — reads happen without locks; writes go through closure operators that detect conflict. Three closure families act on the graph: S_sem (semantic closure — ensures meaning-coherence), S_syn (syntactic closure — ensures structure-validity), S_fus (fusion closure — reconciles multi-persona updates). Their composition S = S_sem ∘ S_syn ∘ S_fus is iteratively applied; the fixed point X* where S(X*) = X* is the aggregate settled state. The graph's type system grounds in a QCHTTopos: types are topos objects, predicates p : T_1 × ... × T_n → Ω are morphisms to the truth object Ω, truth is intuitionistic Heyting-valued, the type-lattice has quasicrystalline (aperiodic but deterministic) neighborhood structure. Milestone 0 (roughly complete): MCP server with 3 tools, one persona, Docker deploy. Beyond: schema layer, SHACL shapes, multi-persona scheduling, closure-operator implementations.
- **Characteristic move:** The runtime IS the mathematics. Agent actions are closure operator applications; correctness is fixed-point convergence.

## Relationships

```
Relational Hyperverse math corpus (368 files, GFRTU definition)
              |
    ---------------------------
    |            |              |
Old Specs    CCE/CDS/RTL    Event-Stream Spec
(36 sims)  (exec closure)  (byte-stable logs)
              |
       Relational Computer Architecture
        (30+ services composed into a runtime)
              |
    ---------------------------
    |                |           |
   FARS            MASH       Emsemioverse Engine
(static files)  (running hub)   (Python loader)
    |                |
    +----------------+
              |
       Current 561 system (FARS flatfiles + mash-engine daemon + MCP)
              |
       TAB pattern (engine = dimension-with-services)
```

## What each model is FOR

| Model | Read it when you need to know... |
|---|---|
| TAB | How to structure a runtime where the engine is just another entity, and behavior is file-dispatched |
| FARS | How markdown+YAML becomes a queryable relational substrate with seven closure conditions |
| CCE/CDS/RTL | How to make a computation hash-verifiable, replayable, and fixed-point-determined |
| Event-Stream Spec | How to write logs whose bytes are reproducible and whose integrity is verifiable |
| Relational Computer Architecture | What services a complete agential-semioverse runtime needs, at spec granularity |
| Emsemioverse Engine | How a minimal skill-loader runtime is structured, concretely in Python |
| Decision Records | The structural decisions behind the current repo's directory/file organization |
| Old Specifications | How to translate a relational-hyperverse theorem into a runnable simulation |
| MASH | What the target multi-agent runtime looks like, and what "correct" means in QCHTTopos terms |

## What this survey unblocks

The 7 consume-X plans can now proceed. Each has a characterized model to consume, with enough mechanistic detail to know what to extract into operational records.
