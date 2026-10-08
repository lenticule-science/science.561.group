---
type: object
class: classical
status: active
depends-on: []
see-also:
  - memory-trace.md
  - retrieval-key.md
  - embedding-index.md
references: []
title: Memory store
description: A memory store is the data structure holding remembered content, with a defined interface for insertion (encoding), query (retrieval), and (sometimes) deletion (forgetting).
---

# Memory store

A **memory store** is the data structure holding remembered
content, with a defined interface for insertion (encoding),
query (retrieval), and (sometimes) deletion (forgetting).

## Formally

A memory store is a tuple $(M, K, \text{insert}, \text{query})$:

- $M$ — the set of stored items.
- $K$ — the set of retrieval keys.
- $\text{insert} : M \to \text{state}$ — adds an item.
- $\text{query} : K \to \mathcal{P}(M)$ — returns items
  matching a key (possibly with scores).

Optional operations: delete, update-in-place, list-all,
forget-by-decay.

## Implementations across the AI stack

- **Hash table.** Exact-match retrieval. $O(1)$ query, no
  partial match. Suitable for symbolic semantic memory.
- **Knowledge graph.** Triples retrievable by graph queries.
  Suitable for relational semantic memory.
- **Relational database.** Records retrievable by SQL.
  Suitable for episodic memory with structured fields.
- **[Embedding-index](embedding-index.md).** Embeddings
  retrievable by approximate-nearest-neighbor. Suitable for
  semantic memory over unstructured text.
- **Replay buffer.** FIFO queue of experience tuples.
  Suitable for off-policy
  [reinforcement-learning](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/reinforcement-learning/_index.md).

## Design choices

A memory store specification involves:

- **Capacity.** Bounded or unbounded.
- **Eviction policy.** What gets forgotten when capacity is
  exceeded (LRU, random, importance-weighted).
- **Indexing strategy.** What queries are efficient.
- **Update model.** Append-only vs in-place editable.
- **Consistency.** Strong (ACID) vs eventual (typical for
  vector stores).

## Where it appears

Every persistent component of an agentic system is a memory
store: the conversation history, the user-profile database,
the document index for RAG, the session-state cache, the tool-
call log. The agent's behavior is a function of which stores
exist and what their query interfaces support.
