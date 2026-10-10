---
title: "Memory"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: >
  The formal study of how agents store, retrieve, and update
  information across time. The theory covers the classical
  cognitive-psychology decomposition of memory into episodic,
  semantic, procedural, and working systems (Tulving 1972,
  Atkinson-Shiffrin 1968, Baddeley-Hitch 1974); the
  computational implementations of these systems in classical
  AI (knowledge bases, case-based reasoning, memory-augmented
  neural networks); the contemporary neural account of memory
  as embedding-indexed retrieval over a vector store
  (retrieval-augmented generation, the RAG family); and the
  emerging question of whether the in-context window of an
  LLM agent constitutes a form of memory or something
  categorically different. Engages classical work
  (Tulving 1972, Atkinson-Shiffrin 1968, McClelland-McNaughton-
  O'Reilly 1995) and contemporary literature on memory-augmented
  neural networks (Weston et al. 2014, Graves et al. 2016) and
  retrieval-augmented generation (Lewis et al. 2020, Borgeaud
  et al. 2022).
position: >
  This theory is a sibling of [agents](../agents/_index.md),
  [world-modeling](../world-modeling/_index.md),
  [reinforcement-learning](../reinforcement-learning/_index.md),
  and the other AI theories. Where the world-modeling theory
  asks how an agent represents *environment dynamics*, memory
  asks how an agent represents *its own past* — observations,
  actions, intermediate computations, and learned facts. The
  two theories are dual: a perfect world model would obviate
  the need for episodic recall (the agent could reconstruct any
  past from current state and dynamics), but no real agent has
  a perfect world model, so memory carries the load. Memory
  also relates to [planning](../planning/_index.md) (which
  search expansions to remember between calls),
  [agents](../agents/_index.md) (the agent's persistent state
  is a memory), and especially to alignment, where memory of
  past principal interactions is what makes the alignment
  relationship continuous over time.
---

The memory theory gives formal structure to how agents store and
retrieve information across time. It answers four questions
precisely:

**What kinds of memory are there?** The cognitive-psychology
decomposition into episodic (specific events), semantic (general
facts), procedural (skills), and working (active manipulation)
memory has computational analogs in AI systems. Each kind has
distinct encoding, retrieval, and forgetting dynamics. See
[episodic-memory](concepts/episodic-memory.md),
[semantic-memory](concepts/semantic-memory.md),
[procedural-memory](concepts/procedural-memory.md), and
[working-memory](concepts/working-memory.md).

**How does retrieval work?** Classical AI used symbolic indexing
(hash tables, knowledge graphs); contemporary systems use
embedding-indexed vector retrieval (RAG); LLM agents combine
both with parametric knowledge stored in weights. The retrieval
mechanism determines what can be remembered and what is
silently forgotten. See [retrieval](morphisms/retrieval.md) and
[retrieval-failure-modes](theorems/retrieval-failure-modes.md).

**What are the limits?** Memory systems face fundamental
tradeoffs between capacity and retrieval accuracy, between
specific recall and generalization, and between storage cost
and query latency. The theorems
[capacity-retrieval-tradeoff](theorems/capacity-retrieval-tradeoff.md)
and [no-free-lunch-memory-systems](theorems/no-free-lunch-memory-systems.md)
characterize these limits formally.

**Is the LLM context window a memory system?** A contemporary
controversy. The context window stores tokens that can be
referenced by attention but does not persist across sessions
and does not survive context overflow. Whether this counts as
memory in any cognitively or computationally meaningful sense
is contested. See [context-as-memory](concepts/context-as-memory.md)
and [why-context-is-not-memory](narratives/why-context-is-not-memory.md).
