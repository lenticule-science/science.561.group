---
type: concept
class: contemporary
status: active
depends-on:
  - semantic-memory.md
see-also:
  - ../objects/embedding-index.md
  - ../objects/memory-store.md
  - ../morphisms/retrieval.md
  - ../theorems/rag-grounding-bound.md
  - teaching/explanations/the-rag-revolution.md
references:
  - references/lewis-rag2020.md
  - references/borgeaud-retro2022.md
title: Retrieval-augmented generation
description: Retrieval-augmented generation (RAG) is the architectural pattern of pairing a generator (typically an LLM) with an external memory store (typically an embedding-indexed vector database).
---

# Retrieval-augmented generation

**Retrieval-augmented generation** (RAG) is the architectural
pattern of pairing a generator (typically an LLM) with an
external memory store (typically an embedding-indexed vector
database). At inference, a query embedding retrieves the
most similar documents from the store; the generator
conditions on the retrieved documents to produce its output.

## The pattern

```
query --> embed --> retrieve top-k docs --> [docs ; query] --> generator --> output
```

Three modular pieces:

1. **Embedding model** — maps query and documents to a shared
   vector space.
2. **Vector index** — supports approximate-nearest-neighbor
   retrieval over millions or billions of embedded documents.
   See [embedding-index](../../documents/articles/notes/undated/embedding-index.md).
3. **Generator** — LLM that conditions on retrieved documents
   in its context.

The pattern was popularized by Lewis et al. (2020); precursors
include Weston et al.'s memory networks (2014) and the FAISS
vector indexing infrastructure.

## Why it works

RAG separates *parametric knowledge* (in the generator's
weights) from *retrieval-based knowledge* (in the external
store). This gives:

- **Updatability.** New facts go into the store, not into a
  retrained model.
- **Provenance.** The generator can cite which documents it
  retrieved, supporting verification.
- **Long-tail coverage.** The store can hold facts too rare
  to learn parametrically.
- **Smaller models.** A generator that retrieves can be
  smaller than one that must memorize.

## Where it breaks

- **Retrieval failures propagate.** If the retriever misses
  the relevant document, the generator either confabulates
  or admits ignorance. RAG groundedness is bounded by
  retrieval recall. See
  [rag-grounding-bound](../../documents/articles/notes/undated/rag-grounding-bound.md).
- **Context-window pressure.** Retrieved documents consume
  context budget that could otherwise be reasoning space.
- **Embedding mismatch.** The query embedding must match the
  document embedding for retrieval to work. Lexically
  divergent queries fail even when semantically aligned
  documents exist.
- **Stale embeddings.** When the embedding model is
  updated, all stored embeddings are invalidated.

## Variants

- **Vanilla RAG**: single retrieve-then-generate pass.
- **Multi-hop RAG**: iterative retrieve-generate-retrieve
  loops for compositional questions.
- **Adaptive RAG**: retrieve only when needed, by a learned
  retrieve-or-not classifier.
- **RETRO** (Borgeaud 2022): integrate retrieval at every
  layer of the generator rather than just at input.
- **Tool-call RAG**: the generator chooses what to retrieve
  via tool calls, blurring RAG into [tool-use](../../documents/articles/notes/undated/tool-call.md).

## In agentic systems

RAG is the dominant memory architecture for production LLM
agents. Most "agent memory" is implemented as a vector store
of past conversation turns or domain documents, retrieved by
embedding similarity to the current query. The pattern is
robust enough to underpin search, customer-support, and
research-assistant deployments.
