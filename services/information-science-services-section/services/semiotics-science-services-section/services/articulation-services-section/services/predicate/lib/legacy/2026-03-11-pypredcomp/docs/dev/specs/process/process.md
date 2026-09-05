---
title: "Process"
description: "The OS's process model: sessions, dispatch, runbooks, lifecycle, fairness."
kind: index
---


Sessions are the OS's processes.
Each session is a substrate-resident execution context with capability fiber, memory tiers, lifecycle, and attribution.
Dispatch is the scheduler.
Runbooks are programs.

## Specs (to be written at v0.2)

- `session-as-process.md` — sessions as OS-level processes; capability fiber inheritance from parent or owning personnel; memory tiers (volatile/implicit/consolidatable); restart-on-failure.
- `dispatch-as-scheduler.md` — message routing to sessions via closure-rule patterns; office × task fiber composition; fairness and priority.
- `runbook-as-program.md` — runbooks are ordered skill sequences; runbook execution in a session with witnessed steps.
- `computation-tiers.md` — three-tier execution model (algebraic substrate / statistical model / language-model inference); composition with the formality layer; cheapest-sufficient principle.
- `lifecycle.md` — session states (opening, open, draining, closed, archived); transitions; attribution.
- `fairness-and-priority.md` — heartbeat-tick fairness; per-session priority; deadline discipline; anti-starvation.
- `inter-session-messaging.md` — typed messages between sessions (task-handoff/query/response/completed/conflict) as substrate cells; heartbeat-driven unread surfacing via `(*, has-unread-message, *)` projection.
  Per [decisions/inter-session-messaging-is-substrate-cells.md](../../decisions/inter-session-messaging-is-substrate-cells.md).
- `session-output-streaming.md` — per-session stdout/stderr capture as `stream-chunk` cells; WebSocket bridge to TUI/web GUI shells and federation peers.
  Per [decisions/session-output-streams-over-websocket.md](../../decisions/session-output-streams-over-websocket.md).

## Theory grounding

The process model implements:

- `agential-orchestration-platform/concepts/dispatch` — work-unit routing.
- `agential-orchestration-platform/objects/dispatch-table` — routing table as substrate entity.
- `agential-orchestration-platform/objects/agent-record`, `skill-record`, `runbook-record` — first-class executables.
- `agential-orchestration-platform/objects/session-record` — process-equivalent.
- `agential-orchestration-platform/morphisms/dispatch-matching` — query → handler matching.
- `agential-orchestration-platform/morphisms/skill-invocation` — execution with scope, fuel, witness.
- `agential-orchestration-platform/theorems/dispatch-as-closure-rule-system` — dispatch emerges from closure rules.
- `flatfile-agentic-resource-system/objects/session-record` — concretization at flatfile substrate.
- `flatfile-agentic-resource-system/concepts/three-tier-memory` — volatile/implicit/consolidatable memory.

## Conformance

The process model passes:

1. Two sessions run concurrently against disjoint targets; their respond invocations don't interfere.
2. A session's capability fiber is inherited correctly on `fork`.
3. Session lifecycle transitions are auditable via the event log.
4. Dispatch-matching is deterministic: same task + same fiber state → same session selected.

## Plan 9 / Unix analogue

| Unix concept | Process analogue |
|---|---|
| Process | Session |
| PID | Session-id (substrate slug) |
| `fork()` | `fork` stdlib verb |
| `exec()` | `invoke-skill` / `execute-runbook` |
| `wait()` | `await` stdlib verb |
| Process scheduling | Heartbeat + closure-rule firing |
| Daemon | Long-lived session marked `kind = daemon` |
| init (PID 1) | The boot session running boot-sequence |
