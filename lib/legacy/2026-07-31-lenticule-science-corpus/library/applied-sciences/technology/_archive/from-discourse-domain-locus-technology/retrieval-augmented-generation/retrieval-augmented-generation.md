---

title: "Retrieval-Augmented Generation"
description: "A pattern where a language model's generation is grounded by retrieving relevant documents from an external knowledge base and injecting them into the context window before generating a response."
domain: artificial-intelligence
requires: embedding, context-window
extends: large-language-model
optimizes: agent-memory
contrasts-with: fine-tuning
date-created: 2026-03-29
references:
  - id: lewis2020
    type: document
    title: Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks
    author:
      - literal: P. Lewis
      - literal: E. Perez
      - literal: A. Piktus
      - literal: F. Petroni
      - literal: V. Karpukhin
      - literal: N. Goyal
      - literal: H. Küttler
      - literal: M. Lewis
      - literal: W. Yih
      - literal: T. Rocktäschel
      - literal: S. Riedel
      - literal: D. Kiela
    container-title: Advances in Neural Information Processing Systems 33 (NeurIPS 2020)
    issued:
      - year: 2020
    URL: https://arxiv.org/abs/2005.11401
---

Retrieval-augmented generation (RAG) is a pattern where a [large language model](../../on-device-inference/terms/large-language-model.md) retrieves relevant documents from an external knowledge base before generating a response. The retrieved documents are injected into the [context window](./context-window.md) alongside the user's query, grounding the model's generation in specific source material. Lewis et al. introduced the term and architecture in "Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks" (NeurIPS 2020).

The standard RAG pipeline has three stages:

1. **Indexing.** Documents are split into chunks, each chunk is converted into a vector [embedding](./embedding.md), and the embeddings are stored in a vector database (Pinecone, Weaviate, Chroma, pgvector, or similar).

2. **Retrieval.** When the user submits a query, the query is embedded using the same embedding model. The vector database returns the k most similar document chunks by cosine similarity (or another distance metric).

3. **Generation.** The retrieved chunks are inserted into the model's prompt — typically between the [system prompt](./system-prompt.md) and the user's message. The model generates its response with access to this retrieved context.

RAG addresses a specific limitation of language models: their knowledge is frozen at training time. A model trained through January 2025 knows nothing about events after January 2025. RAG provides access to current information, proprietary data, and domain-specific documents that the model was never trained on — without retraining or [fine-tuning](./fine-tuning.md).

RAG also reduces [hallucination](./hallucination.md). A model generating from memory may produce plausible but false statements. A model generating with relevant source documents in its context window is more likely to reproduce information from those documents accurately. RAG does not eliminate hallucination — the model can still ignore or misinterpret the retrieved context — but it shifts the failure mode from fabrication to misreading.

### RAG and agentic systems

In [agentic systems](../domains/agents/terms/agentic-system.md), RAG is one strategy for managing the [context window](./context-window.md) constraint. An agent that accumulates tool results and reasoning traces over many steps eventually exceeds the window. RAG allows the agent to store intermediate results in a knowledge base and retrieve them when needed, trading window space for retrieval latency.

RAG can also be implemented as a [tool](../domains/agents/terms/tool-use.md): the agent calls a "search" tool that queries a vector database and returns relevant chunks. This is functionally equivalent to RAG but gives the model control over when and what to retrieve, making retrieval a decision the agent makes rather than a fixed pipeline step.

