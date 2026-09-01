---
title: "GraphRAG"
description: "A retrieval-augmented generation pattern that retrieves from a knowledge graph rather than a flat vector store — using entity relationships to answer multi-hop queries that standard RAG cannot."
defines: GraphRAG
domain: artificial-intelligence
extends: retrieval-augmented-generation
requires: embedding
optimizes: retrieval-augmented-generation
contrasts-with: retrieval-augmented-generation
date-created: 2026-03-29
date-modified: 2026-03-29
references:
  - id: edge2024
    type: document
    title: From Local to Global: A Graph RAG Approach to Query-Focused Summarization
    author:
      - literal: D. Edge
      - literal: H. Trinh
      - literal: N. Cheng
      - literal: J. Bradley
      - literal: A. Chao
      - literal: A. Mody
      - literal: S. Truitt
      - literal: J. Larson
    container-title: arXiv
    issued:
      - year: 2024
    URL: https://arxiv.org/abs/2404.16130
  - id: syseval2025
    type: document
    title: RAG vs. GraphRAG: A Systematic Evaluation
    author:
      - literal: Various
    container-title: arXiv
    issued:
      - year: 2025
    URL: https://arxiv.org/abs/2502.11371
cites:
  - edge2024
  - syseval2025
---

GraphRAG is a [retrieval-augmented generation](./retrieval-augmented-generation.md) pattern that retrieves from a knowledge graph rather than a flat vector store. Standard RAG embeds document chunks as vectors and retrieves by semantic similarity. GraphRAG extracts entities and relationships from documents, builds a graph connecting them, and traverses that graph to answer queries that require reasoning across multiple documents or multiple hops of relationship.

Microsoft Research introduced the term and architecture in "From Local to Global: A Graph RAG Approach to Query-Focused Summarization" (Edge et al., 2024). The core insight: standard RAG retrieves passages similar to the query, but many questions require synthesizing information scattered across passages that are not individually similar to the query. "What are the main themes in this dataset?" requires global understanding. "How does X relate to Y through Z?" requires following a chain of relationships. Standard RAG retrieves individual chunks; GraphRAG retrieves subgraphs.

### How it works

1. **Entity and relationship extraction.** An LLM processes source documents and extracts entities (people, concepts, organizations, terms) and relationships between them (uses, extends, contradicts, cites).
2. **Graph construction.** Extracted entities become nodes; relationships become edges. Community detection algorithms (Leiden, Louvain) identify clusters of related entities.
3. **Indexing.** Each community gets a summary. Entities and relationships get [embeddings](./embedding.md). The graph and its summaries are stored in a graph database.
4. **Retrieval.** A query is matched against entity embeddings, community summaries, or both. The system traverses the graph from matched entities to find relevant subgraphs — chains of relationships that connect query-relevant concepts.
5. **Generation.** Retrieved subgraphs and community summaries are injected into the model's [context window](./context-window.md). The model generates its response grounded in the graph structure.

### Performance characteristics

A systematic evaluation (arXiv 2502.11371, February 2025) found:

- GraphRAG delivers **1.5x better accuracy overall** and **2x better accuracy on multi-hop queries** compared to standard RAG
- For schema-heavy enterprise queries, GraphRAG outperforms vector RAG by **3.4x** (Diffbot/FalkorDB KG-LM Benchmark)
- GraphRAG achieves **90% hallucination reduction** for schema-heavy queries (FalkorDB 2025)
- GraphRAG shows **13.4% lower accuracy** on simple single-hop queries compared to standard RAG — it adds overhead without benefit when the query matches a single passage
- Vector RAG accuracy degrades to **0%** as entity count per query exceeds 5; GraphRAG sustains stable performance with 10+ entities
- GraphRAG incurs **2.4x higher latency** than standard RAG

### LightRAG

LightRAG (October 2024, peer-reviewed at EMNLP 2025 Findings) achieves comparable accuracy to GraphRAG with dramatically lower cost: **6,000x token reduction** (sub-100 tokens vs. 610,000), ~30% latency reduction, and 65-80% cost savings for high-volume processing. It uses dual-level graph retrieval — local entity-level and global community-level — without the expensive community summarization step.

### When to use GraphRAG

Use GraphRAG when queries require reasoning across relationships between 5+ entities, multi-hop traversal, or global summarization. Use standard [RAG](./retrieval-augmented-generation.md) for simple factual lookups and single-passage retrieval. Use LightRAG as a middle ground when GraphRAG's cost is prohibitive. Hybrid approaches — standard RAG for simple queries, GraphRAG for relational queries — consistently outperform either alone.

For knowledge repositories with structured metadata (semantic frontmatter with `uses`, `related`, `extends` fields), the metadata already encodes a graph. Building a graph index from existing frontmatter is cheaper than extracting entities from prose because the entities and relationships are already declared.

## Related terms

- [Retrieval-augmented generation](./retrieval-augmented-generation.md) — the pattern GraphRAG extends
- [Embedding](./embedding.md) — the representations used for entity and query matching
- [Hallucination](./hallucination.md) — the failure mode GraphRAG reduces on relational queries
- [Agent memory](../domains/agents/terms/agent-memory.md) — graph-structured memory as a persistence strategy
