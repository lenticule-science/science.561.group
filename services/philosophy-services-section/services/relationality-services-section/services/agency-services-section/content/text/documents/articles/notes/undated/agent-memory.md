---
type: object
class: structural
status: active
depends-on:
  - teaching/explanations/persistent-state.md
  - teaching/explanations/agentic-system.md
see-also:
  - ../morphisms/memory-update.md
  - ../morphisms/state-checkpoint.md
  - ../objects/agent-session.md
  - ../theorems/memory-type-tradeoff-completeness.md
  - ../terms/agent-memory.md
references:
  - references/anthropic2024.md
  - references/bent2025.md
title: Agent memory
description: Agent memory is the typed persistence layer by which an agentic system satisfies the persistent-state condition.
---

# Agent memory

Agent memory is the typed persistence layer by which an agentic system satisfies the [persistent-state](../../../../glossary/concepts/persistent-state.md) condition.
It is a structured collection of memory stores, each with a distinct capacity, precision, latency, and durability profile.
No single store optimally satisfies all four dimensions; practical agentic systems combine multiple types.

## Memory types

**Conversation history.** The in-context sequence of messages and tool results accumulated since session start. *Capacity:* bounded by the context window. *Precision:* perfect within the window — content is verbatim. *Latency:* zero — content is immediately available to the model. *Durability:* volatile — lost when the process terminates unless explicitly persisted.

**Session checkpoints.** The agent's working state serialized to durable storage at step boundaries. *Capacity:* limited by the serialization format and storage, but effectively unbounded in practice. *Precision:* complete — whatever is in the state object is preserved. *Latency:* low for reading (one storage lookup) but requires deserialization. *Durability:* high — survives process termination; enables recovery after crash.

**Vector memory.** Past experiences and retrieved documents stored as embeddings, queried by semantic similarity. *Capacity:* scales to millions of entries. *Precision:* approximate — retrieval returns semantically similar content, not exact records; rare or precisely-phrased content may not be retrieved. *Latency:* moderate — requires an embedding query. *Durability:* high — persists indefinitely in the vector database.

**Structured knowledge.** State stored in typed databases, knowledge graphs, or schema-governed files (Markdown with frontmatter, JSON, RDF). *Capacity:* effectively unbounded. *Precision:* high — records are typed and queryable by field. *Latency:* moderate — requires explicit read operations and context loading. *Durability:* very high — version-controllable and resilient.

**File-based memory.** Plain files (Markdown notes, working documents, plans) written and read through tool calls. *Capacity:* unbounded. *Precision:* high — verbatim content, human-readable. *Latency:* moderate — requires explicit file reads that consume context budget. *Durability:* very high — survives indefinitely on durable filesystems; version-controllable with git.

## Memory management problem

Every memory type trades off across the four dimensions.
Conversation history is fast and precise but small and volatile.
Vector memory is large and durable but imprecise.
Structured knowledge is precise and durable but requires schema design.
The tradeoffs are characterized formally in [memory-type-tradeoff-completeness](memory-type-tradeoff-completeness.md).

In practice, agentic systems layer memory types: keep the current working context in conversation history, persist the plan in a file, retrieve past experiences through vector search, and look up structured facts through explicit database queries.
The orchestration framework manages these layers.

## Memory access through tool use

All non-context memory types are accessed through [tool invocation](tool-invocation.md): reading from and writing to persistent stores requires tool calls that cross the context/environment boundary.
This means memory access consumes context budget (the results of reads arrive as observations) and produces execution trace entries.
