---
type: object
class: classical
status: active
depends-on:
  - memory-store.md
see-also:
  - teaching/explanations/working-memory.md
  - ../morphisms/consolidation.md
references:
  - references/atkinson-shiffrin1968.md
title: Memory buffer
description: A memory buffer is a bounded short-term store positioned between perception and long-term storage.
---

# Memory buffer

A **memory buffer** is a bounded short-term store positioned
between perception and long-term storage. It holds recent
items briefly, allowing them to be operated on, rehearsed, or
selectively transferred to durable storage.

## In cognitive psychology

The Atkinson-Shiffrin (1968) multi-store model has three
buffers:

- **Sensory register** — very brief (milliseconds), modality-
  specific, large capacity.
- **Short-term store** — seconds-to-minutes, limited capacity
  (Miller's $7 \pm 2$), the substrate of working memory.
- **Long-term store** — durable, effectively unlimited
  capacity.

Items decay or are displaced from each buffer unless they
transition to the next via attention (sensory $\to$ short-term)
or rehearsal (short-term $\to$ long-term). The buffers form
an information-filtering pipeline.

## Computational analogs

Memory buffers appear at every level of the AI stack:

- **CPU register file** — the lowest-level analog, items
  currently being computed on.
- **Replay buffer** in deep RL — recent transitions held for
  off-policy training. Items eventually overwritten by FIFO
  or importance-sampling eviction.
- **Recurrent state** of an RNN — accumulated information
  about the input sequence so far. Bounded by hidden state
  size.
- **KV-cache** of an LLM during generation — stores key-value
  vectors of recent tokens for efficient attention. Bounded
  by [context-window](context-window.md).
- **Conversation buffer** in agent frameworks — recent
  turns held for inclusion in the next prompt; older turns
  summarized or pushed to vector store.

## Design parameters

Specifying a memory buffer involves:

- **Capacity.** Bounded (number of items, total tokens).
- **Eviction.** FIFO, LRU, importance-weighted, semantic-
  similarity-pruned.
- **Manipulation.** Read-only vs read-write vs computational.
- **Persistence.** Cleared at session boundary vs surviving.

## Where the buffer matters

The buffer's *eviction policy* is often the load-bearing design
choice in agent systems:

- A FIFO conversation buffer drops old context, possibly
  losing earlier user statements.
- An LRU buffer keeps frequently-referenced items but may
  drop important singletons.
- An importance-weighted buffer requires a salience model.
- A summarization-on-eviction strategy compresses rather than
  drops, but degrades fidelity.

The choice has user-visible consequences (what does the agent
remember from earlier in the conversation?) and is the
substrate of much practical agent-engineering work.
