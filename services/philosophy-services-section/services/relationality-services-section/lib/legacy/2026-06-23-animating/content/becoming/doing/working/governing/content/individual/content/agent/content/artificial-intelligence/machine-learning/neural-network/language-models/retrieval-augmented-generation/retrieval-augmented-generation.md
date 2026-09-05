---
title: "Retrieval-Augmented Generation"
description: "The pattern of grounding a language model's generation in retrieved documents: index a corpus, retrieve relevant chunks at query time, inject them into the context window."
keywords: ["retrieval-augmented-generation", "rag", "language-models", "knowledge-retrieval"]
---


Retrieval-augmented generation (RAG) solves a fundamental problem with language models: they know what they were trained on, and nothing more. When a question requires current information, proprietary documents, or precise source grounding, a model generating from memory alone will either be wrong or fabricate. RAG fixes this by retrieving relevant documents at query time and injecting them into the context window before generation.

The standard pipeline:

1. **Indexing** — the source corpus is split into chunks, each chunk is converted to a vector embedding, and those embeddings are stored in a vector database.
2. **Retrieval** — the user's query is embedded with the same model; the database returns the k most similar chunks by cosine distance.
3. **Generation** — the retrieved chunks go into the model's context alongside the query; the model generates a response grounded in them.

RAG shifts the dominant failure mode from **fabrication** (the model invents facts from memory) to **misreading** (the model misinterprets or ignores what it retrieved). This is a meaningful improvement — misreading can be detected by inspecting the retrieved documents, while fabrication cannot.

**Graph RAG** extends standard vector retrieval with a knowledge graph over the corpus, allowing queries that require multi-hop reasoning ("find all documents related to X's work on Y") rather than just semantic similarity. See [graph-rag](archive/graph-rag.md).

RAG is the primary memory architecture for knowledge-intensive agentic systems. A library like this one — 28,000+ files — cannot fit in any model's context window. The question of how well RAG works over this corpus depends directly on how well the corpus is indexed, described, and tagged.
