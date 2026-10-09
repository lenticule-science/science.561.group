---

name: memory-system-design
date-created: 2026-04-03
department: engineering
part-of: generative-harness
goal: "Memory retrieval informed by fiber overlap, bilattice confidence, and the settlement path — so the system loads what's relevant, not just what's recent"
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: memory-system-design
description: Design document for improving the memory system.
---

Design document for improving the memory system. Not code yet — this captures what the system should become, grounded in research on ECC patterns, agentic memory literature, and the repo's own predication theory.

## Current state

The memory system is functional but naive:

- **Storage**: flat markdown files in `operations/engineering/records/memory/`, each with frontmatter (name, description, type)
- **Index**: `MEMORY.md` is a line-per-entry index, loaded into every session via the system prompt's auto-memory block
- **Types**: user, feedback, project, reference — good categories, no differential treatment
- **Retrieval**: entire MEMORY.md loads at session start (first 200 lines). No relevance scoring. No decay. No per-turn selection.
- **Composition**: the `compose-environment.js` hook builds per-turn context from the datastore but does NOT consult memory — memory is session-level only

### What works

- The type taxonomy (user/feedback/project/reference) is sound — it matches what needs to be remembered
- The "what NOT to save" guidelines prevent code patterns, git history, and ephemeral state from bloating memory
- The frontmatter convention (name, description, type) gives each memory a queryable identity
- The synthesize-and-update principle prevents duplication

### What doesn't work

- **No relevance filtering**: all 16 memories load every session regardless of what the agent is doing. At 16 this is fine; at 160 it won't be.
- **No decay or confidence**: a memory from 3 months ago gets the same weight as one from yesterday. No mechanism to surface memories that have been validated across sessions vs. ones that were written once and never tested.
- **No per-turn injection**: memory is session-level context, not turn-level. When the agent is working on delegation theory, the memory about hooks needing to be Node.js is noise. The compose-environment hook could inject relevant memories per-turn instead.
- **No connection to the datastore**: memories are separate from the knowledge graph. A memory about "ECC is the gold standard" could be a fact in the graph with the same predicate structure as everything else.

## Design principles

### 1. Memory is part of the knowledge graph

Memories should be entities in the datastore, queryable like any other entity. The frontmatter already provides the structure — `type: memory`, `memory-type: feedback`, etc. The graph generator already indexes them. What's missing: compose-environment should query memory entities from the graph, not load a static index.

### 2. Relevance scoring via fiber overlap

The predication theory provides the scoring mechanism. A memory is relevant to the current turn when its predicates (frontmatter keys and values) overlap with the predicates of the entities the agent is currently working on.

**Scoring function** (three components):

| Component | Mechanism | Weight |
|-----------|-----------|--------|
| Fiber overlap | Count of shared predicate keys between memory and current context entities | 0.5 |
| Recency | Exponential decay from last-validated date: $e^{-\lambda \cdot \text{days}}$, $\lambda \approx 0.01$ (half-life ~70 days) | 0.3 |
| Confidence | Bilattice-valued: confirmed ($t$=1.0), uncertain ($\top$=0.5), contradicted ($f$=0.0) | 0.2 |

A memory scores above threshold → injected into per-turn context. Below threshold → stays on disk.

### 3. Memory types have different lifecycles

| Type | Settlement direction | Lifecycle |
|------|---------------------|-----------|
| **user** | Accumulates toward a stable profile | Rarely decays; update in place |
| **feedback** | Settles into rules or skills | High initial confidence; decays if contradicted; promotes to rule when confidence is high across multiple sessions |
| **project** | Becomes stale as projects change | Fast decay; check against current project state before surfacing |
| **reference** | Static pointers | No decay; validate target exists before surfacing |

### 4. The settlement path applies to memory

Memories should settle toward more determined forms:

```
observation → instinct → memory → rule → skill → hook
```

- An **observation** is a single-session pattern noticed by the observer agent
- An **instinct** is a pattern that recurs across sessions (confidence > 0.5)
- A **memory** is an instinct that has been confirmed by the user or proven reliable
- A **rule** is a memory that should constrain every session
- A **skill** is a memory that provides a reusable procedure
- A **hook** is a skill that has been automated into code

The system already has observation → instinct (observer agent) and instinct → skill (evolve command). The missing link: instinct → memory promotion and memory → rule promotion.

### 5. Memory vs. context boundary

| Concern | Memory (cross-session) | Context (within-session) |
|---------|----------------------|------------------------|
| **Persists** | Across all sessions | Within one session only |
| **Source** | User correction, validated patterns, project state | Current task, open files, recent tool calls |
| **Loaded by** | compose-environment per-turn (proposed) | compose-environment per-turn (existing) |
| **Stored in** | memory/ files with frontmatter | session-state/ files, volatile |
| **Decays** | Yes (lifecycle-dependent) | No (dies with session) |

The key insight from Letta/MemGPT: memory should be **self-managed** — the agent decides what to promote from context to memory, not just the user. The current system only writes memory when the user says "remember this" or the auto-memory rules trigger. The system should also promote patterns that recur across sessions without explicit user instruction.

## Implementation phases

### Phase 1: Memory in the datastore (immediate)

- Ensure all memory files have correct frontmatter (they already do)
- Add `memory-type`, `last-validated`, `confidence` fields to memory frontmatter schema
- Update compose-environment to query memories from the datastore and inject top-N relevant ones per turn
- Scoring: fiber overlap only (no decay/confidence yet)

### Phase 2: Confidence and decay (near-term)

- Add `last-validated: <date>` to each memory file
- When a memory is confirmed useful in a session, update its `last-validated` date
- Apply recency decay to scoring
- Add `confidence: <0-1>` tracking — starts at 0.7, increases when validated, decreases when contradicted

### Phase 3: Settlement promotion (future)

- Build the instinct → memory promotion path
- Build the memory → rule promotion path (when confidence > 0.9 across 5+ sessions)
- Build the memory → skill promotion path (when the memory describes a reusable procedure)
- Automated pruning: memories with confidence < 0.2 and no validation in 90 days get flagged for removal

## What this does NOT cover

- **Semantic embedding**: the fiber overlap scoring is structural (shared keys), not semantic (embedding similarity). Semantic similarity would require a vector store, which adds complexity. The structural approach is good enough for the current entity count (<100 memories). Revisit if memory count exceeds ~500.
- **Multi-agent memory sharing**: how memories compose across agents in a multi-agent workflow. The current system has one memory store shared by all agents. This is fine for now.
- **Memory versioning**: tracking how a memory changed over time. Git history provides this implicitly.

## Open questions

- Should compose-environment inject memories inline (like it does with terms) or as a separate section?
- What's the right top-N for per-turn memory injection? (Probably 3-5 based on context budget)
- Should memory confidence be visible to the agent, or should it only affect scoring?
- How should contradicted memories be handled — suppressed, flagged, or deleted?
