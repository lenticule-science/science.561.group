---
name: session-2026-04-07-cleanup-priorities
date-created: 2026-04-07
serves: [system-architecture-refactor, endeavor-resource-planning]
captain-corrections:
  - "Nuclear quartet exists to describe a specific phenomenon in a specific mathematical program that is not actually ANYWHERE in predication bilattices. It's just a buzzword here."
  - "The sigma/delta and H* stuff — you latch onto that because it sounds formal, but it's never ACTUALLY what we are implementing, it's just how it kinda looks from one math perspective."
  - "My big concern is disentangling the artificial mathiness from our plans/projects, because it really gets in the way of the REAL math we need."
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## The real implementation vocabulary

The system's computational model is:

- **Four values**: ⊥ (no info), t (true), f (false), ⊤ (both) — implemented in predication.js
- **Two operations**: extend (⊙), restrict (⇒) — implemented in predication.js
- **One adjunction**: a ⊙ p ≤_t q iff p ≤_t (a ⇒ q) — verified on all 64 triples
- **respond()**: build entity fiber from graph, compose with message via ⊙, restrict via ⇒, return result — implemented in respond.js
- **settle()**: respond() transitively through relation edges until nothing changes — implemented in settle.js
- **message()**: the public API that calls settle() — implemented in message.js

That's it. 1,693 lines of JavaScript. Everything the system does is a composition of these pieces.

The triage math (nuclei, quartets, tower levels, sheaf conditions, settling triads, Padovan recurrences, Heyting algebras, locales, sublocales, covering topologies) is RESEARCH about the mathematical properties of this system. It belongs in the library and in analyses. It does NOT belong in implementation plans. Plans should describe what functions to write, what files to create, and what tests to run — in the vocabulary of the implementation, not the vocabulary of the research.

## What's blocking the next session

1. **No indexed store.** Every call to respond() or settle() loads a 46 MB JSON file (1.3 seconds, 306 MB RAM). The fix is two JSON files (entity-index.json, value-index.json) and two new functions (loadFiber, loadNeighbors). This is the #1 implementation priority.

2. **message() can't create entities.** When an entity doesn't exist, message.js returns an error. It should create the entity instead — write a markdown file with the message's predicates as frontmatter. The markdown apply() function already works (interfacer Phase 1 complete).

3. **settings.json is empty.** No hooks run. No session-start. No constraints. No cost tracking. A minimal config with 3 hooks would restore basic session infrastructure.

4. **30 files uncommitted from this session.** Need to be committed.

## What the next session should build (in order)

### 1. Entity index (compile-cache output)

**File:** `entity-index.json` at repo root (alongside knowledge-graph.json)
**Produced by:** generate.js (add output alongside existing knowledge-graph.json generation)
**Format:** `{ "entity-id": "path/to/file.md", ... }` — 48K entries, ~4 MB
**Purpose:** loadFiber(id) reads this to find the file, then parses that one file

### 2. Value index (compile-cache output)

**File:** `value-index.json` at repo root
**Produced by:** generate.js
**Format:** `{ "referenced-value": ["entity-id-1", "entity-id-2", ...], ... }` — inverted index
**Purpose:** loadNeighbors(id) reads this to find which entities reference a given entity

### 3. loadFiber() and loadNeighbors() in graph.js

**loadFiber(id):** Read entity-index.json for file path → parse that one markdown file → return fiber (Map of predicate:value → bilattice value). Should be <10ms, <1 MB.

**loadNeighbors(id):** Read value-index.json for the entity id → return list of entity ids that reference it. O(1) lookup.

**Keep loadGraph()** for backward compatibility — commands that need the full graph (reports, burndown) can still use it. But respond() and settle() should use loadFiber/loadNeighbors.

### 4. Entity creation in message.js

When `getEntityFiber(id)` returns null and the message has a non-empty payload:
- Derive file path from the entity's type predicate (type: plan → operations/command/endeavor/records/plans/)
- Call markdown apply() to create the file with the payload as frontmatter
- Patch entity-index.json and value-index.json
- Log the creation event
- Continue with normal respond/settle

### 5. Minimal settings.json

Three hooks:
- **session-start:** Load the first-officer office definition + run /bridge
- **check-constraints:** Thin adapter reading precompiled constraint cache (already exists at systems/foah/check-constraints.js)
- **cost-tracking:** Record token usage per API call

## Plans that need math jargon stripped

These plans have high concentrations of research vocabulary (nuclear quartet, σ/Δ, H*_t, settling triad, sublocale, Heyting algebra, etc.) where they should have implementation vocabulary. The jargon makes them look precise but they're actually vague — "implement σ ∘ Δ" doesn't tell you what function to write.

**High priority (critical path plans):**
- agentic-to-fars-refactor.md (9 instances) — should say "make hooks call message() instead of doing ad-hoc JS"
- convergent-enrichment-plan.md (9 instances) — should say "add predicates to entity frontmatter until respond() returns useful results"
- lens-entity-system.md (10 instances) — should say "define view entities that filter which predicates respond() returns"

**Medium priority (active plans):**
- sunday-funday-sprint.md (10 instances) — gamification plan drowning in research notation
- progressive-automation-plan.md (6 instances) — should say "replace LLM calls with scripts when the work is deterministic"
- transactional-record-infrastructure.md (5 instances) — should say "every state change is a debit/credit pair recorded in the event log"
- work-management-parity-plan.md (5 instances) — should say "plans and tasks should be queryable by respond()"

**Low priority (world-sim/research plans — math IS the content):**
- pws-* plans (11-16 instances each) — these are research plans, math notation is appropriate
- fiber-projection.md (11 instances) — this discovered the barcode concept, notation is warranted
- entity-actor-model.md (11 instances) — this is research connecting CHL to FARS

## Research vocabulary that's being used as implementation vocabulary

| Research term | What it actually means in implementation |
|---|---|
| "nuclear quartet" | Not implemented. Not part of predication.js. A concept from triage math about what happens with two commuting closure operators on a Heyting algebra. |
| "σ (saturation nucleus)" | Not implemented. In context means: "restricting a fiber by accumulated history" — but respond() already does this. |
| "Δ (transfer nucleus)" | Not implemented. In context means: "extending a fiber to future contexts" — but respond() already does this too. |
| "H*_t (fixed fiber)" | Not implemented. In context means: "the predicates that don't change when you settle" — i.e., the result of settle() |
| "settling triad" | Not implemented. In context means: "raw input → processed → stable" — i.e., what respond() does |
| "sublocale" | Not implemented. In context means: "a filtered view of the graph" — i.e., what a lens entity does |
| "covering topology" | Not implemented. In context means: "which entities are neighbors" — i.e., what the value-index tells you |
| "fiber algebra" | Partly implemented. In context means: "the bilattice operations on predicate values" — i.e., predication.js |

The right column is what plans should say. The left column belongs in library/research documents.

## What to remember

The real math that IS implemented and that plans CAN reference:
- The bilattice: four values, two orderings (truth and knowledge), two operations (extend, restrict)
- The adjunction: verified computationally, the foundation of respond()
- respond(): compose two fibers, return both perspectives
- settle(): respond() transitively until fixpoint
- message(): the one public primitive

The research math that IS NOT implemented and that plans should NOT reference as if it were:
- Everything in the triage math directory (from-gsu-ccs-20260313/math/)
- The nuclear quartet, the settling triad, the tower, the hyperverse
- σ, Δ, H*_t, covering topologies, Padovan recurrences, sheaf conditions

These are valuable research. They may lead to papers. They inform architectural understanding. But they are not specs. Plans that reference them as specs produce work that implements notation rather than functionality.
