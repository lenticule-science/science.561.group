---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/persistent-state.md
  - ../objects/agent-memory.md
see-also:
  - ../morphisms/memory-update.md
  - ../morphisms/state-checkpoint.md
  - questions/agentness-spectrum-metric.md
  - ../terms/agent-memory.md
references:
  - references/anthropic2024.md
  - references/bent2025.md
title: Memory type tradeoff completeness
description: Claim.
---

# Memory type tradeoff completeness

**Claim.** No single memory type for agentic systems can simultaneously maximize all four dimensions of memory quality: capacity, precision, latency, and durability.
Every memory type achieves high performance on at most three of the four dimensions, incurring a tradeoff on the fourth.
Optimal memory design requires combining multiple types.

## The four dimensions

**Capacity** — how much information the store can hold.
Bounded by the context window for in-context storage; effectively unbounded for external stores (file systems, databases, vector databases).

**Precision** — how accurately information is retrieved relative to what was stored.
Verbatim text retrieval has perfect precision; embedding-based semantic retrieval has imperfect precision (approximate matches, near-miss failures).

**Latency** — how quickly information is available to the model.
In-context information is instantly available (zero additional latency); external storage requires a tool call (read invocation + result delivery) adding one model-turn latency.

**Durability** — how reliably information survives failures.
In-context storage is volatile: process termination destroys it.
Durable storage (files, databases, vector databases) survives process termination.

## Tradeoff table

| Memory type | Capacity | Precision | Latency | Durability |
|---|---|---|---|---|
| Conversation history | Low (context-bounded) | High (verbatim) | Low (instant) | Low (volatile) |
| Session checkpoints | High | High | Moderate (tool call) | High |
| Vector memory | High | Low (approximate) | Moderate | High |
| Structured knowledge | High | High | Moderate | High |
| File-based memory | High | High | Moderate | High |

**Conversation history fails capacity and durability.** It holds only what fits in the context window (low capacity) and is lost at process termination (low durability).
It succeeds on precision (verbatim content) and latency (instant access).

**Vector memory fails precision.** Semantic similarity retrieval returns approximate matches; rare or precisely-worded content may not be retrieved at all.
It succeeds on capacity, latency (comparable to other external stores), and durability.

**All external stores share a latency penalty.** Any memory not in the context window requires a tool call to read, adding at least one model-turn of latency.
This is an irreducible cost of the context/environment boundary: the model can only access information that enters its context window.

## Why no single type can maximize all four

**Capacity and latency are in structural tension.** High capacity requires external storage (because the context window is small).
External storage incurs latency (because reading it requires tool calls).
Therefore, maximum capacity implies non-minimum latency.

**Precision and scalability are in structural tension.** Verbatim retrieval (maximum precision) requires exact-match lookup, which does not scale to the kind of semantic queries agents use ("what did I learn about X?").
Semantic retrieval (which scales) uses approximate matching, reducing precision.

**Durability and latency are in structural tension.** The only zero-latency store is the context window, which is volatile.
Durable stores require external persistence, which requires tool calls, which adds latency.

These tensions are not contingent limitations of current implementations — they follow from the architecture: a bounded context window, a context/environment boundary traversable only by tool calls, and the imprecision of approximate retrieval.

## Engineering consequences

**Layer memory types.** No single type is optimal; use conversation history for current working context (low latency, high precision), checkpoints for recovery (high durability, high precision), vector memory for past-experience retrieval (high capacity), and structured knowledge for queryable facts (high precision, high capacity).

**Match memory type to access pattern.** If the agent needs instant access to a value, it must be in-context.
If it needs durable storage with exact retrieval, use a structured knowledge store.
If it needs approximate recall of past experiences, use vector memory.

**Anticipate context budget for memory reads.** Every external memory read consumes context budget (the result enters the context window).
In a long session with many memory reads, the budget may fill with read results rather than working content.
Plan memory access patterns to keep the working context manageable.
