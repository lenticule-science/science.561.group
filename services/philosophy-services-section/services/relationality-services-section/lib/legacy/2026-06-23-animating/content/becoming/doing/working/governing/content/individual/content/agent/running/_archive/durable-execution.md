---
id: durable-execution
description: "An execution model where workflow state is persisted at every step so that an interrupted process resumes from its last completed step rather than restarting."
defines: durable-execution
aliases: [resumable execution]
property-of: agent-orchestration
enables: human-in-the-loop, time-travel-debugging
distinction: resumable, restartable
constraint: state-serialization
origins: azure-durable-functions, aws-step-functions, temporal
date-created: 2026-03-29
date-modified: 2026-03-29
---

Durable execution is an execution model where workflow state is persisted at every step so that a process interrupted by crashes, network failures, or restarts resumes from its last completed step.
The workflow function looks like ordinary sequential code, but the runtime automatically checkpoints state after each step and replays completed steps on recovery without re-executing their side effects.

The concept originates in workflow orchestration systems: Azure Durable Functions, AWS Step Functions, and Temporal all implement durable execution for distributed systems.
In [agentic systems](./agentic-system.md), durable execution solves a specific problem: agent workflows involve expensive LLM calls and irreversible tool actions (file writes, API calls, database mutations).
Re-executing a failed workflow from the beginning wastes tokens on completed work, may produce different results (LLM output is stochastic), and may duplicate side effects.

The critical distinction is **resumable** versus **restartable**.
A restartable system re-executes the entire workflow on failure.
A resumable system picks up where it stopped.
Resumable systems preserve completed work, maintain trajectory consistency (same state continues rather than a new stochastic path), and avoid duplicating side effects.
Build resumable systems, not restartable ones.

Durable execution requires that workflow state be serializable — convertible to bytes and back without loss.
Database connections, file handles, and model instances cannot be checkpointed.
The state must be pure data: typed objects containing only the information the workflow needs to continue.
This serialization constraint shapes how agent state is designed — it must be data, not live references.

Durable execution enables two other patterns.
[Human-in-the-loop](./human-in-the-loop.md) depends on it: the agent pauses at a checkpoint, the human reviews, and the agent resumes from that exact state.
Time-travel debugging depends on it: any prior checkpoint can be restored to inspect what the agent was doing at that moment.
