---
type: object
class: contemporary
status: active
depends-on:
  - memory-store.md
  - retrieval-key.md
see-also:
  - teaching/explanations/retrieval-augmented-generation.md
  - ../theorems/rag-grounding-bound.md
references:
  - references/lewis-rag2020.md
---

# Embedding index

An **embedding index** is a vector database supporting
*approximate-nearest-neighbor* (ANN) retrieval over learned
embeddings. It is the substrate of contemporary
[retrieval-augmented-generation](teaching/explanations/retrieval-augmented-generation.md).

## What it does

Given a corpus of items (documents, passages, conversation
turns), each is embedded into a vector $\mathbf{v}_i \in
\mathbb{R}^d$ by an embedding model. The index stores all
$\mathbf{v}_i$ in a structure (HNSW graph, IVF, FAISS-style
product quantization) that supports fast approximate
nearest-neighbor lookup: given a query embedding
$\mathbf{q}$, return the $k$ items maximizing some similarity
(typically cosine or inner product).

## Why approximate

Exact nearest-neighbor search over millions of high-
dimensional vectors is too slow for production retrieval. ANN
indexes trade *recall* (the fraction of true nearest neighbors
returned) for *speed* (queries in milliseconds rather than
seconds). Recall in the 90-99% range is typical for
production indexes.

## Scaling characteristics

- **Indexing cost.** Roughly $O(n \log n)$ for HNSW, $O(n)$
  for inverted-file indexes. Indexing scales to billions of
  items on commodity infrastructure.
- **Query cost.** $O(\log n)$ for HNSW, sublinear for IVF.
- **Memory cost.** $O(n d)$ at full precision; product
  quantization compresses by $4\times$-$32\times$ at
  modest recall cost.

## Failure modes

- **Out-of-distribution queries.** Queries semantically far
  from the index's documents return uninformative nearest
  neighbors with low confidence. The index does not
  signal "I don't have anything for this."
- **Embedding model mismatch.** If the query embedding model
  differs from the document embedding model, all retrievals
  are noise.
- **Stale embeddings.** Updating the embedding model
  invalidates all stored embeddings; reindexing is required.
- **Lexical bias.** Embedding models trained on web text
  encode lexical similarity heavily, sometimes at the
  expense of semantic similarity.

## In agent architectures

The embedding index is the *external memory* of the modern
LLM agent. It enables:

- Long-tail factual coverage beyond what the LLM memorized
  parametrically.
- Personalization (per-user document indexes).
- Cross-session memory (retrieval over past conversation
  turns).
- Domain specialization (custom indexes over technical
  documents).

The choice of embedding model, index structure, chunking
strategy, and reranking pipeline are the load-bearing design
decisions in production RAG. None of these is settled; the
field iterates rapidly.
