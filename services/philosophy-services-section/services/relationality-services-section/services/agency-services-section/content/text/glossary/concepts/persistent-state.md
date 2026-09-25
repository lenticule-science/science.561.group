---
type: concept
class: foundational
status: active
depends-on:
  - agentic-system.md
see-also:
  - ../objects/agent-memory.md
  - ../objects/agent-session.md
  - ../objects/execution-trace.md
  - ../morphisms/state-checkpoint.md
  - ../morphisms/memory-update.md
  - ../theorems/three-condition-characterization.md
  - ../theorems/memory-type-tradeoff-completeness.md
  - ../terms/agent-memory.md
  - ../terms/durable-execution.md
references:
  - references/bent2025.md
  - references/anthropic2024.md
title: Persistent state
description: Persistent state is information maintained by an agentic system that survives interaction boundaries.
derives-from: agent
---

# Persistent state

Persistent state is information maintained by an agentic system that survives interaction boundaries.
It is the third of the three conditions constituting an [agentic system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/persisting/content/persistent-state/agentic-system.md).
A system whose state is entirely lost at process termination fails the persistent-state condition regardless of how sophisticated its in-context reasoning may be.

## The interaction boundary

An interaction boundary occurs whenever the runtime environment resets: process termination, context-window overflow with no summarization, session expiration, or hardware failure.
The question is whether the system's operational state — its knowledge of what it has done and what remains — survives the boundary.

**Conversation context alone does not satisfy persistent state.** A conversation history held entirely in the context window is lost when the process terminates.
If an agentic system holds its plan and history only in the context window, it fails the persistent-state condition: interrupting the system requires it to re-derive its plan from scratch, which violates the test.

## Forms of persistence

Four forms of persistence satisfy the condition in increasing order of durability:

**Session checkpoints.** The agent's working state serialized to a durable store at regular intervals.
Recovery after process termination is possible by replaying from the last checkpoint.
LangGraph implements this pattern: the full graph state is checkpointed after each node.

**File-based memory.** State written to files on a durable filesystem (local or network).
Claude Code's working-notes pattern, OpenHands' event-sourced state, and SOUL.md all implement this.
Files survive process termination indefinitely and are human-readable, but re-reading requires consuming context budget.

**Vector memory.** Past experiences, observations, and retrieved documents stored as embeddings in a vector database.
Durable and scalable but approximate: retrieval returns semantically similar records, not exact content.

**Structured knowledge.** State stored in typed databases, knowledge graphs, or structured files with schema.
The most durable and queryable form; requires explicit schema design.

## Minimal satisfaction

The minimum sufficient condition for persistent state is: the system can be interrupted between any two consecutive actions and resumed, recovering its progress toward the goal without re-deriving its plan.
Implementations that satisfy this minimum include any system with at least session-checkpoint persistence covering its planning state.

## Relation to durability in distributed systems

Persistent state in the agents theory maps to the D (Durability) property of ACID transactions: committed state survives system failure.
The novelty in the agentic context is that the "transaction" is a multi-step reasoning process rather than a database write, and the "committed state" is the agent's progress toward its goal rather than a data record.
