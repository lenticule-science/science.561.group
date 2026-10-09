---
type: morphism
class: durability-operation
status: active
depends-on:
  - teaching/explanations/persistent-state.md
  - ../objects/agent-session.md
  - ../objects/agent-memory.md
see-also:
  - ../morphisms/memory-update.md
  - ../objects/execution-trace.md
  - ../theorems/memory-type-tradeoff-completeness.md
  - ../terms/durable-execution.md
  - ../terms/langgraph.md
references:
  - references/anthropic2024.md
  - references/bent2025.md
title: State checkpoint
description: A state checkpoint is the operation of serializing the current agent session state to a durable external store, producing a recoverable snapshot.
---

# State checkpoint

A state checkpoint is the operation of serializing the current agent session state to a durable external store, producing a recoverable snapshot.
It is the primary mechanism for satisfying the [persistent-state](../../../../glossary/concepts/persistent-state.md) condition: a session that is checkpointed can be interrupted and resumed from the checkpoint without re-deriving its plan.

## Operational structure

A state checkpoint captures:

1. **Planning state** — the current goal specification, the decomposed plan, and which subtasks have been completed.
2. **Conversation history** — the sequence of messages and tool results accumulated since session start (or since the last full checkpoint).
3. **Working variables** — any intermediate values, counters, or flags the agent maintains.
4. **Memory references** — pointers to external memory stores (vector databases, structured records) that are part of the agent's current operational context.

A complete checkpoint is sufficient to resume the session: given the checkpoint, a new agent instance can pick up where the previous one stopped.

## Checkpoint granularity

**Per-step checkpointing** — checkpoint after every tool invocation.
Maximum recovery fidelity: failure at any point loses at most one step.
Maximum storage overhead: the number of checkpoints equals the number of steps.

**Milestone checkpointing** — checkpoint at designated milestones (after completing a subtask, before a destructive write).
Recovery may require replaying steps since the last milestone.
Lower overhead; suitable when per-step cost is high.

**Manual checkpointing** — the agent explicitly writes a checkpoint via a tool call when it reaches a significant intermediate state.
Most flexible; requires the agent to reason about when checkpoints are valuable.

## LangGraph as a reference implementation

LangGraph implements per-step checkpointing by default: after each graph node executes, the full graph state is serialized to a configurable checkpoint store (SQLite, Postgres, or custom).
Recovery is replay from the last checkpoint.
LangGraph also exposes "time travel": an operator can roll back to any prior checkpoint and re-execute from that point.
This is the most complete public implementation of state checkpoint semantics as of early 2026.

## Relation to execution trace

A state checkpoint and an [execution trace](execution-trace.md) are complementary artifacts.
The execution trace is an append-only log of what happened; the checkpoint is a snapshot of current state.
For recovery, the checkpoint is primary: it restores operational state without replaying history.
For accountability, the trace is primary: it shows exactly what happened at each step.
A system with both checkpoint and trace provides both recovery and full auditability.

## Checkpoint as accountability artifact

The timing and completeness of checkpoints affect accountability assessment.
A system that checkpoints after irreversible writes (file deletes, API POSTs) enables recovery from failures in subsequent steps.
A system that does not checkpoint before irreversible writes cannot recover if a post-write step fails — the write is committed but subsequent steps are incomplete.
The choice of checkpoint granularity and placement is a design decision that affects the principal's accountability exposure.
