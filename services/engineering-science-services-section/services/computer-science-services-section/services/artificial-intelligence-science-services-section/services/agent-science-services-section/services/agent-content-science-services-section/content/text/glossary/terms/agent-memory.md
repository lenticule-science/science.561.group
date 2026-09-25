---
aliases:
  - memory
  - Agent memory
description: The mechanisms by which an agentic system persists information across interactions — satisfying the persistent-state condition.
identity: agent-memory
name: agent-memory
date-created: 2026-03-29
date-modified: 2026-03-29
relations:
  satisfies: persistent-state
  types: conversation-history, session-checkpoint, vector-memory, structured-knowledge, file-based-memory
  bounded-by: context-window
  retrieval-via: embedding, retrieval-augmented-generation
  accessed-through: tool-use
satisfies: persistent-state
types: conversation-history, session-checkpoint, vector-memory, structured-knowledge, file-based-memory
bounded-by: context-window
retrieval-via: embedding, retrieval-augmented-generation
accessed-through: tool-use
---
Agent memory is the set of mechanisms by which an [agentic system](../../../../../../content/text/glossary/terms/agentic-system.md) persists information across interactions. Persistent state is one of the three conditions defining an agentic system; agent memory is how that condition is satisfied in practice.

### Memory types

**Conversation history.** The simplest form: the full sequence of messages exchanged between user and agent, maintained in the [context window](../../../../../../../../content/text/glossary/terms/context-window.md). This is immediate and high-fidelity but bounded — when the conversation exceeds the window, older messages must be dropped or summarized. Conversation history is volatile; it is lost when the process terminates unless explicitly persisted.

**Session state / checkpoints.** The agent's working state serialized to a persistent store. [LangGraph](../../../../../agent-orchestration-platform-science-services-section/content/text/glossary/terms/langgraph.md) checkpoints the full graph state at every step, enabling recovery after crashes and time-travel debugging. This is durable (survives process termination) and structured (the state object has a schema), but scoped to a single workflow execution.

**Vector memory.** Information stored as [embeddings](../../../../../../../../content/text/glossary/terms/embedding.md) in a vector database and retrieved by semantic similarity. When the agent encounters a query, it searches its vector memory for relevant past experiences, retrieved documents, or accumulated facts. This scales to large volumes and supports fuzzy matching but loses the precision and structure of the original information — retrieval returns approximate matches, not exact records.

**Structured knowledge.** Information stored in databases, knowledge graphs, or structured files (Markdown with frontmatter, JSON, RDF). The agent reads and writes structured records through [tool use](../../../../../../content/text/glossary/terms/tool-use.md) or [MCP](../../../../../model-context-protocol-science-services-section/content/text/glossary/terms/model-context-protocol.md) resources. This is the most durable and precise form of memory — records are typed, queryable, and version-controllable — but requires explicit schema design and read/write operations.

**File-based memory.** A pattern used by Claude Code, [SOUL.md](../../../../services/agent-markdown-file-science-services-section/content/text/glossary/terms/soul-md.md), and similar systems: the agent reads and writes Markdown files (MEMORY.md, working notes, plans) that persist on disk. The files are human-readable, version-controllable (via git), and survive indefinitely. The trade-off is that the agent must re-read files into the context window to access their content — file-based memory is persistent but not instantly available.

### The memory management problem

Every memory type trades off between capacity, precision, latency, and durability. Conversation history is fast and precise but small and volatile. Vector memory is large and durable but imprecise. Structured knowledge is precise and durable but requires explicit schema design.

In practice, agentic systems combine multiple memory types. A coding agent keeps the current file in its context window (conversation history), persists its plan in a Markdown file (file-based memory), stores past tool results in checkpoints (session state), and retrieves relevant documentation through search (vector memory or [RAG](../../../../../../../../content/text/glossary/terms/retrieval-augmented-generation.md)). Orchestration frameworks manage these layers; no single memory mechanism satisfies all requirements.

## Earlier material

**Session state / checkpoints.** The agent's working state serialized to a persistent store.
[LangGraph](../../../../../agent-orchestration-platform-science-services-section/content/text/glossary/terms/langgraph.md) checkpoints the full graph state at every step, enabling recovery after crashes and time-travel debugging.
This is durable (survives process termination) and structured (the state object has a schema), but scoped to a single workflow execution.

**File-based memory.** A pattern used by Claude Code, [SOUL.md](../../../../services/agent-markdown-file-science-services-section/content/text/glossary/terms/soul-md.md), and similar systems: the agent reads and writes Markdown files (MEMORY.md, working notes, plans) that persist on disk.
The files are human-readable, version-controllable (via git), and survive indefinitely.
The trade-off is that the agent must re-read files into the context window to access their content — file-based memory is persistent but not instantly available.
