---
type: morphism
class: state-operation
status: active
depends-on:
  - teaching/explanations/persistent-state.md
  - ../objects/agent-memory.md
see-also:
  - ../morphisms/state-checkpoint.md
  - ../morphisms/tool-invocation.md
  - ../objects/agent-session.md
  - ../objects/execution-trace.md
  - ../theorems/memory-type-tradeoff-completeness.md
  - ../terms/agent-memory.md
references:
  - references/anthropic2024.md
---

# Memory update

Memory update is the write operation that extends an agent's [persistent
state](teaching/explanations/persistent-state.md) with new information. It is a morphism
from the current [agent memory](../objects/agent-memory.md) state to an updated
state that includes the new information. Memory updates are executed through
[tool invocations](tool-invocation.md): writing to external memory stores
requires crossing the context/environment boundary.

## Update types by memory store

**Conversation history update** — implicit, no tool call required. The model's
output and the tool result are automatically appended to the conversation context
by the hosting runtime. Not durable by default.

**Checkpoint write** — explicit serialization of current working state to a
durable store (database, file, key-value store). Triggered by the framework at
step boundaries (LangGraph) or by the agent itself via a write tool call.

**Vector embedding write** — converting a document or experience into an
embedding vector and storing it in a vector database. Requires a call to an
embedding model followed by a write to the vector store. The stored content is
then retrievable by semantic similarity.

**File write** — writing information to a durable file (Markdown notes, JSON
state, structured records). The most transparent form: content is human-readable
and human-editable. Used by Claude Code (working notes), OpenHands (event log),
and most file-system-capable agents.

**Structured record write** — creating or updating a record in a typed database
or knowledge base. Requires a schema and explicit field values.

## Properties

**Monotonicity.** Memory update is generally monotone: adding information to
memory does not remove prior information (unless the update explicitly deletes a
record). Information accumulates across a session and, if checkpointed, across
sessions.

**Non-atomicity risk.** A memory update that involves multiple writes (e.g.,
updating a record and adding an embedding) is not atomic. If the agent crashes
between the two writes, the memory is in a partially updated state. Durable
execution frameworks handle this with transaction-scoped checkpointing.

**Context-memory gap.** Information that exists in memory but has not been read
into the context window is invisible to the model. A memory update writes
information out; to use it later, a [memory read](../morphisms/tool-invocation.md)
(read tool call) must bring it back in. Memory is not instantly available — it
must be explicitly retrieved.

## Relation to the persistent-state condition

Memory update is the operation that makes persistent state grow. An agent that
only reads from memory but never writes to it does not satisfy the persistent-
state condition in any meaningful sense — it has no evolving state tied to its
current goals. A satisfying implementation of persistent state requires that the
agent writes progress records, plan updates, and critical observations to a
durable store as it works, not merely reads from a pre-populated knowledge base.
