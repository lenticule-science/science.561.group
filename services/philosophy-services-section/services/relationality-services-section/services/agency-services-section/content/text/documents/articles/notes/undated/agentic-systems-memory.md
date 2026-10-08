---
title: "Memory in AI Systems"
description: "How AI systems and agents store, retrieve, and update information across time — from in-context memory to external stores to learned weights."
keywords: ["memory", "agent-memory", "retrieval-augmented-generation", "artificial-intelligence"]
---


A language model's generation is entirely determined by what is in its context window at the moment of generation. Everything outside that window is inaccessible unless explicitly retrieved. This makes memory a design problem rather than an intrinsic property — the system must be designed to put the right information in the right place at the right time.

Four kinds of memory appear in the literature and in practice:

**In-context memory** is the simplest: include information in the prompt. It's immediate and precise but bounded by the context window and costs tokens on every request.

**External memory** (retrieval) uses a database outside the model — a vector store, a graph database, a structured file — and retrieves relevant content at query time. This is the RAG pattern. See [retrieval-augmented-generation](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/retrieval-augmented-generation).

**Episodic memory** is a record of past interactions: what the agent did, what it observed, what it concluded. Session logs, working notes, and journal entries are episodic memory. They require both storage and a retrieval strategy to be useful.

**Parametric memory** is what the model learned during training — encoded in its weights, not accessible as discrete retrievable facts, and not updatable without retraining or fine-tuning. It is the most persistent but the least precise form of memory.

Agentic systems combine these. A typical architecture: parametric memory for general world knowledge and skills, external memory for the corpus the agent specializes in, episodic memory for session state and prior decisions, in-context memory for the immediate task.

The failure mode at every level is the same: the right information is not in the right place when the model needs it. Good memory architecture is fundamentally about information routing.
