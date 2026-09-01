---
title: "AI Memory Systems: MemGPT/Letta and Mem0"
description: "Analysis of the two leading AI memory systems — Letta's OS-inspired memory hierarchy and Mem0's graph-based memory — with implications for our EAVT-backed memory system."
date-created: 2026-04-04
domain: computing
sources:
  - "https://github.com/letta-ai/letta"
  - "https://github.com/mem0ai/mem0"
  - "https://arxiv.org/abs/2310.08560"
---

The context window is finite. Everything interesting about AI memory follows from this constraint. Two systems — Letta (formerly MemGPT) and Mem0 — take fundamentally different approaches to working within it. Letta treats the context window as RAM and builds an operating system around it. Mem0 treats memories as facts and builds a knowledge graph. Both are instructive for anyone designing memory for agentic systems.

## Letta: The Operating System Metaphor

Letta's core insight is that context window management *is* memory management, and the best-understood framework for memory management is the operating system. The paper (Packer et al., 2023) made this explicit: the context window is main memory, and everything that doesn't fit gets paged to external storage.

### The Three-Tier Hierarchy

**Core memory** (always in-context). Structured as `Block` objects compiled directly into the system prompt. Two standard blocks — `persona` (who the agent is) and `human` (who the user is) — plus arbitrary additional blocks. Each block has a character limit (default 8192). The agent edits these blocks through tool calls: `core_memory_append`, `core_memory_replace`, `memory_rethink` (rewrite an entire block). Core memory is the working set — small, fast, always present.

**Recall memory** (conversation history). All messages ever exchanged, stored in a relational database. Only recent messages stay in-context. When the context overflows, a summarizer LLM compresses older messages into a summary paragraph placed at position 1 in the message list (after the system prompt, before real messages). The agent retrieves older messages on demand via `conversation_search()`, which does hybrid search — text matching plus semantic similarity, results ranked by reciprocal rank fusion (RRF).

**Archival memory** (long-term storage). Passages stored in a vector database (pgvector, Pinecone, or Turbopuffer). Each passage has text, an embedding vector, tags, and timestamps. The agent writes to archival memory with `archival_memory_insert()` and retrieves with `archival_memory_search()`, which does semantic similarity search with optional tag and date filtering. Archival memory is unlimited but requires explicit tool calls to access.

### Virtual Context Management

The paging mechanism works as follows:

1. After each LLM response, the system checks whether `total_tokens > context_window_limit`.
2. If exceeded, `summarize_messages_inplace()` fires — a separate LLM call that compresses the oldest in-context messages into a summary.
3. The summary replaces those messages. Token count drops. The system logs before/after counts.
4. A memory pressure alert fires at ~80% capacity, giving the agent a chance to proactively archive important information before forced summarization.

The system prompt includes a metadata block that tells the agent what it *can't see*: "42 previous messages in recall memory, 156 passages in archival memory, available tags: [project_x, meeting_notes, ...]". This metadata costs few tokens but lets the agent decide whether to search.

### What Makes It Work

The critical design choice is that the agent *itself* manages memory. The LLM decides what to put in core memory, what to archive, and when to search. The system provides the tools; the agent provides the judgment. This is both the strength and the weakness — it works well with capable models (GPT-4, Claude) and poorly with weaker ones, because memory management requires meta-cognitive reasoning about what's important.

The Block abstraction is elegant. By making core memory structured (labeled, size-limited, editable), Letta avoids the failure mode where the agent treats the system prompt as append-only and eventually overflows it. The `memory_rethink` function — which rewrites an entire block — is particularly important: it allows the agent to consolidate and compress, not just accumulate.

## Mem0: The Knowledge Graph Approach

Mem0 takes a different stance. Rather than managing the context window as virtual memory, Mem0 extracts discrete facts from conversations and stores them in both a vector store and a knowledge graph. Memory management is not the agent's job — it's a background process.

### Dual Storage Architecture

**Vector memory**. Facts extracted from conversations are embedded and stored in a vector database. Each memory has text, an embedding, metadata (user_id, agent_id, timestamps, hash), and a role (user or assistant). Retrieval is embedding similarity search with optional reranking.

**Graph memory**. The same conversations are also processed by an entity-relation extraction pipeline. An LLM identifies entities and their types, then identifies relationships between them. These become nodes and edges in a Neo4j graph. Nodes have embeddings, mention counts, and scoping metadata. Edges have types, validity flags, and mention counts.

Both stores are written concurrently via a thread pool. Search queries hit both and merge results.

### Memory Extraction

Mem0 uses two distinct extraction prompts:

**User memory extraction** pulls facts only from user messages — preferences, plans, professional details, health information. It explicitly penalizes including information from assistant messages.

**Agent memory extraction** (when an agent_id is present) pulls facts from assistant messages — capabilities, approach patterns, knowledge areas. This is procedural memory: what the agent has learned about how to do its job.

The extraction pipeline: parse messages → call LLM with extraction prompt → force JSON output → normalize facts. Each fact becomes a separate memory entry.

### Conflict Resolution

This is where Mem0 gets interesting. When a new fact is extracted, the system searches the vector store for the 5 most semantically similar existing memories. It then sends both old and new to an LLM with an update prompt that classifies each pair into one of four operations:

- **ADD**: genuinely new fact, no existing match.
- **UPDATE**: new fact is more recent/accurate than existing. Example: "likes cheese pizza" + "loves chicken pizza" → "loves cheese and chicken pizza".
- **DELETE**: new fact contradicts existing. Example: "loves cheese pizza" + "dislikes cheese pizza" → delete old.
- **NONE**: already captured, no change needed.

The graph has its own conflict resolution. A separate LLM prompt identifies relationships to delete, with a preservation principle: if the same relationship type could have multiple valid destinations ("alice loves pizza" and "alice loves burgers"), keep both. Deletion is soft — the `valid` flag is set to false, and an `invalidated_at` timestamp is recorded.

### Graph Search

Graph retrieval works differently from vector retrieval:

1. Extract entities from the query using an LLM.
2. Search the graph for nodes matching those entities (cosine similarity ≥ 0.7).
3. Traverse incoming and outgoing edges from matched nodes.
4. Rerank relationship triples using BM25 (TF-IDF scoring).
5. Return top-5 relationships.

This is fundamentally different from vector search: it follows *structure* rather than *similarity*. Asking "what does Alice like?" traverses Alice's outgoing edges, not the embedding space around the question.

## The Fundamental Constraint

Both systems exist because of the same problem: the context window is too small to hold everything an agent needs to know. Their solutions reveal different assumptions about what memory is for.

Letta assumes memory is *operational* — the agent needs to manage its own working state, like a programmer managing heap allocations. Memory tools are first-class capabilities. The agent's metacognitive skill at memory management directly determines system quality.

Mem0 assumes memory is *factual* — the system should extract and organize knowledge automatically, so the agent can focus on its actual task. Memory management is infrastructure, not agency.

| Dimension | Letta | Mem0 |
|-----------|-------|------|
| Metaphor | Operating system | Knowledge base |
| Who manages memory | The agent (via tools) | The system (background extraction) |
| Storage model | Blocks + messages + passages | Facts + entity-relation triples |
| Retrieval | Agent-initiated search | System-initiated injection |
| Context composition | Explicit paging and summarization | Query-time fact retrieval |
| Conflict resolution | Agent rewrites blocks | LLM classifies ADD/UPDATE/DELETE |
| Strength | Agent can reason about its own memory | No metacognitive overhead on agent |
| Weakness | Requires capable model for memory mgmt | Extraction quality depends on prompts |

## Implications for Our System

Our memory system (`operations/engineering/records/memory/`) is currently file-based: markdown files with frontmatter, indexed by `MEMORY.md`. Our EAVT datastore (`knowledge-graph.json`, 11,500+ entities, 133,000+ facts) is a knowledge graph — but it stores *library knowledge*, not *session memory*.

### What We Already Have That They Don't

**The EAVT graph is richer than Mem0's triples.** Mem0 stores entity-relation-entity triples. Our graph stores entity-attribute-value triples with temporal indexing (the T in EAVT). Every fact has a transaction timestamp. We don't need to bolt on "when was this learned?" — it's structural. Our graph also has typed attributes with a shared vocabulary across the entire library, not ad hoc relation strings extracted by an LLM.

**File-based memory is auditable.** Both Letta and Mem0 store memories in databases — vector stores, PostgreSQL, Neo4j. Our memories are markdown files in git. Every change is tracked, diffable, and reviewable. The tradeoff is retrieval speed, but at our scale (< 100 memory files) linear scan is fine.

**Hooks compose memory at turn-time.** Our hook system (`datastore.js`, `patch-graph.js`) already injects context per-turn based on what the agent is doing. This is closer to Letta's "metadata block" approach — tell the agent what's available without loading it all.

### What We Should Adopt

**From Letta: memory pressure signals.** Letta's 80% threshold alert is simple and effective. Our system should signal when context is getting full, prompting the agent to archive or summarize. We have the `context-budget` skill but don't use it automatically.

**From Letta: structured memory blocks with size limits.** Our memory files have no size governance. A memory file could grow unbounded. Adopting a block-like model — each memory type has a character budget, and the agent must consolidate rather than just append — would prevent drift.

**From Mem0: automatic conflict resolution.** Our memory system relies on the agent noticing that a memory is stale and updating it. Mem0's ADD/UPDATE/DELETE classification could run as a hook: when a new memory is written, check existing memories for semantic overlap and flag conflicts. This doesn't require a vector database — at our scale, comparing a new memory against all existing ones via an LLM call is feasible.

**From Mem0: separation of extraction and storage.** We currently extract and store in one step (the agent writes to memory). Separating these — having an observer extract candidate memories, then a validator decide whether to ADD/UPDATE/DELETE — would improve quality. We already have the `observer` agent; it could run this pipeline.

### What We Should Not Adopt

**Vector databases for memory retrieval.** At our scale, embedding search adds complexity without proportional benefit. Our memories are few enough that the MEMORY.md index plus grep is sufficient. If we grow past ~500 memories, revisit.

**Agent-managed paging (Letta's full OS model).** Our agents already work within a harness that manages context composition via hooks and skills. Adding explicit paging tools would create a second context management system competing with the first. Better to improve our existing hooks.

**Mem0's Neo4j dependency.** We have an EAVT graph that loads from JSON. Adding a graph database server for memory is overengineering. If we want graph-based memory retrieval, we can query our existing datastore.

### The Path Forward

The most valuable pattern from both systems is the *memory lifecycle*: extraction → deduplication → conflict resolution → consolidation → retrieval. Our system does extraction (agent writes memories) and retrieval (MEMORY.md index), but skips deduplication, conflict resolution, and consolidation. These middle steps are where memory quality lives.

A concrete implementation: after each session, the observer agent reads new memories, compares them against existing ones, and produces a report: "Memory X is stale (contradicted by session finding Y), Memory Z duplicates Memory W, Memory Q should be updated with new context." A human or senior agent reviews and acts. This is the settlement pattern applied to memory — exactly what our continuous learning system is designed for.

## See Also

- [Continuous Learning in Agentic Harnesses](./continuous-learning-in-agentic-harnesses.md)
- [Agentic Harness Landscape 2026](./agentic-harness-landscape-2026.md)
- [Personal AI OS Landscape 2026](./personal-ai-os-landscape-2026.md)
