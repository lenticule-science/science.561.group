---

title: "Embedding"
description: "A fixed-length vector of floating-point numbers that represents a piece of text (or image, or audio) in a continuous space where semantic similarity corresponds to geometric proximity."
domain: artificial-intelligence
produced-by: neural-network, transformer
enables: retrieval-augmented-generation, agent-memory
measures: semantic-similarity
date-created: 2026-03-29
references:
  - id: mikolov2013
    type: document
    title: Efficient Estimation of Word Representations in Vector Space
    author:
      - literal: T. Mikolov
      - literal: K. Chen
      - literal: G. Corrado
      - literal: J. Dean
    container-title: Proceedings of Workshop at ICLR 2013
    issued:
      - year: 2013
    URL: https://arxiv.org/abs/1301.3781
---

An embedding is a fixed-length vector of floating-point numbers that represents a piece of text (or image, or audio) in a continuous space where semantic similarity corresponds to geometric proximity. Two sentences about the same topic produce vectors that are close together (high cosine similarity); two sentences about unrelated topics produce vectors that are far apart.

Mikolov et al. introduced the foundational word embedding models (Word2Vec) in "Efficient Estimation of Word Representations in Vector Space" (2013), demonstrating that [neural networks](./neural-network.md) trained on word co-occurrence patterns produce vector spaces with algebraic structure — the famous example: vector("king") - vector("man") + vector("woman") ≈ vector("queen").

Modern embedding models (OpenAI `text-embedding-3`, Cohere Embed, Google Gecko, open-source models like `bge` and `e5`) produce embeddings for entire sentences or documents, not just individual words. These models are [transformers](./transformer.md) trained specifically for the embedding task — they process a text input and output a single vector (typically 768–3072 dimensions) that captures the text's semantic content.

### How embeddings work

The embedding model processes input text through its [transformer](./transformer.md) layers and produces a vector from the final layer's output — typically by averaging [token](./token.md) representations (mean pooling) or using a dedicated [CLS] token. The model is trained so that texts with similar meaning produce similar vectors: training pairs texts that are semantically related (from paraphrases, search queries and their results, or question-answer pairs) and pushes their embeddings closer together while pushing unrelated pairs apart (contrastive learning).

The resulting vector space has structure: similarity search (finding the k nearest vectors to a query vector) functions as semantic search. A query about "how to fix a broken pipe" retrieves documents about plumbing repair, even if those documents never use the exact phrase "broken pipe."

### Role in agentic systems

Embeddings are the enabling technology for [retrieval-augmented generation](./retrieval-augmented-generation.md) and vector-based [agent memory](theories/agents/terms/agent-memory.md). The standard pipeline: chunk documents into passages, embed each passage, store the vectors in a vector database, and retrieve the most relevant passages for a given query by comparing query and passage embeddings.

In [agentic systems](theories/agents/terms/agentic-system.md), embeddings provide the search layer that lets an agent find relevant information in large knowledge bases without scanning every document. The agent calls a search tool, the tool embeds the query, the vector database returns the nearest matches, and the agent reads the retrieved documents in its [context window](./context-window.md).

