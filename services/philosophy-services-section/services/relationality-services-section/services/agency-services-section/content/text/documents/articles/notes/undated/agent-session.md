---
type: object
class: structural
status: active
depends-on:
  - teaching/explanations/agentic-system.md
  - teaching/explanations/persistent-state.md
see-also:
  - ../objects/agent-memory.md
  - ../objects/execution-trace.md
  - ../morphisms/state-checkpoint.md
  - ../morphisms/context-compaction.md
  - ../terms/durable-execution.md
  - ../terms/context-compaction.md
references:
  - references/anthropic2024.md
  - references/bent2025.md
title: Agent session
description: An agent session is a bounded execution period during which an agentic system pursues a goal, producing an execution trace and maintaining associated agent memory.
derives-from: agent
---

# Agent session

An agent session is a bounded execution period during which an agentic system pursues a goal, producing an [execution trace](execution-trace.md) and maintaining associated [agent memory](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/running/content/agent-session/agent-memory.md).
Sessions have a start state, an execution history, and either a terminal state (goal achieved, failure, or explicit termination) or a suspended state (execution paused pending resumption).

## Session boundaries

A session begins when the agent receives a goal specification and allocates its initial state.
A session ends when:

- **Goal achieved:** the agent has completed the task and produces a final response.
- **Failure:** the agent encounters an unrecoverable error (tool exhaustion, maximum step count, authorization rejection).
- **Explicit termination:** the operator or user stops the session.
- **Suspension:** the agent checkpoints its state and halts execution, to be resumed later.

Suspension followed by resumption produces a session continuation.
Whether a resumed execution is considered the same session or a new one is a matter of implementation convention; what matters formally is whether the resumed execution has access to the full prior state.

## State within a session

At any point in a session, the agent's state consists of:

1. **Goal specification** — the natural-language or structured instruction defining what the agent is to accomplish.
2. **Conversation history** — the sequence of messages and tool results accumulated since session start, held in the context window.
3. **Checkpointed working state** — any planning documents, working notes, or structured state serialized to persistent storage.
4. **Memory contents** — the agent's accumulated knowledge from this and prior sessions (vector memory, structured knowledge, file-based memory).

Items 3 and 4 satisfy [persistent state](../../../../glossary/concepts/persistent-state.md); items 1 and 2 satisfy it only if they are also checkpointed, which they are not by default in most frameworks.

## Session scope and delegation

A session is the unit within which a delegation operates.
When a principal delegates a task to an agent, the delegation produces a session with a specified scope.
Sub-sessions can be nested when an orchestrator delegates to worker agents, each with their own bounded execution period.
The [delegation chain](../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/services/ludics-science-services-section/services/game-ludics-services-section/content/text/glossary/terms/delegation-chain.md) structure maps directly onto the tree of nested sessions: each delegation act produces a child session under the delegating agent's session.

## Context budget and compaction

All conversation history in a session competes for context budget.
When the history exceeds the model's context window, [context compaction](context-compaction.md) is applied: the oldest portion of the history is summarized into a compact representation that preserves information at lower fidelity.
Compaction is a lossy operation: information discarded during compaction is unrecoverable from the context.
Systems that need full history fidelity must checkpoint the full transcript before compaction.
