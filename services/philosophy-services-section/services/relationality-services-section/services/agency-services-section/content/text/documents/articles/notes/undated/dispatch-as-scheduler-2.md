---
title: "Dispatch as scheduler"
description: "Dispatch is the OS scheduler. Closure-rule firings route messages to sessions via fiber composition; office × task matching produces the dispatch table."
kind: spec
status: normative
version: "0.2"
---


In the OS, dispatch IS the scheduler.
The closure-rule engine fires rules that route messages to sessions; office × task fiber composition produces the runtime dispatch decisions; declared-dependency-ordering provides deterministic firing order.

This spec implements `agential-orchestration-platform`'s dispatch concept as an OS-level scheduler.
Per [decisions/heartbeat-is-the-scheduler.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/decisions/heartbeat-is-the-scheduler.md).

## Grounded in

- The four per-regime engineering envelope theorems ([strict](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/strict-regime-engineering-envelope.md), [scott-continuous](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md), [transfinite-bounded](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transfinite-bounded-regime-engineering-envelope.md), [aperiodic](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/aperiodic-regime-engineering-envelope.md)) — dispatch's per-tick fuel envelope (§6) is regime-determined; the strict-regime default bounds dispatch-rule firing finitely.
  Per [decisions/regime-classification-is-load-bearing.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/decisions/regime-classification-is-load-bearing.md).
- [`predicated-computing/theorems/cost-discipline-reads-free`](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline-reads-free.md) — the dispatch-table reads (§1, §7 — auto-dispatch daemon scanning `(*, dispatch-to, *, "True")`) contribute the cost quantale's unit; only the actual session-open and respond firings consume settlement fuel.
- See [_patterns/predicated-computing-grounding.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Dispatch table

Per `agential-orchestration-platform/objects/dispatch-table`, the dispatch table is a substrate fiber:

```json
{"subject": "task:<id>", "predicate": "dispatch-to", "object": "office:<slug>", "value": "True"}
```

The dispatch-to predicate is set by closure rules matching tasks to offices based on:

- Task properties: kind, priority, deadline, requested-skills.
- Office properties: incumbents, formality-layer, available capacity.
- Constraints: capability-discipline (the office must have authority), budget (within session budget).

## 2. Dispatch as closure-rule firing

A dispatch rule:

```json
{
  "kind": "rule",
  "name": "dispatch-engineering-tasks-to-engineering-office",
  "premise": [
    {"s": "$task", "p": "is-a", "o": "engineering-task", "v": "True"},
    {"s": "$task", "p": "status", "o": "open", "v": "True"},
    {"s": "$task", "p": "dispatch-to", "o": "*", "v": "None"}
  ],
  "conclusion": [
    {"s": "$task", "p": "dispatch-to", "o": "office:engineering", "v": "True"}
  ]
}
```

When this rule's premise matches (an open engineering task without a dispatch), it fires, asserting the dispatch-to cell.
The substrate's heartbeat picks up; the dispatched session is opened.

## 3. Dispatch composition

Per `agential-orchestration-platform/concepts/dispatch`, dispatch is fiber composition:

```
dispatch-fiber = office-fiber ⊙ task-fiber
```

The composition's bilattice value at predicate `dispatch-to`:

- $t$ when both office and task agree the dispatch is appropriate.
- $f$ when one denies (e.g., capability denied).
- $\top$ when they disagree (escalation to captain).
- $\bot$ when neither has spoken.

This is the substrate's algebra producing scheduling decisions.
No separate scheduler.

## 4. Multi-office dispatch

When multiple offices match a task, the substrate produces composed cells:

```json
{"s": "task:X", "p": "dispatch-candidate", "o": "office:engineering", "v": "True"}
{"s": "task:X", "p": "dispatch-candidate", "o": "office:operations", "v": "True"}
```

A second-tier closure rule selects:

```json
{
  "name": "select-dispatch-by-priority",
  "premise": [
    {"s": "$task", "p": "dispatch-candidate", "o": "$office", "v": "True"},
    {"s": "$office", "p": "priority", "o": "$priority", "v": "True"}
  ],
  "conclusion": [
    {"s": "$task", "p": "dispatch-rank", "o": "$priority + (cell:<id> count)", "v": "True"}
  ]
}
```

Selection ties broken by lexicographic office-slug (deterministic).

## 5. Fairness

Per [scheduling/fairness-and-priority.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/scheduling) (TBD), the dispatch scheduler ensures:

- **No starvation.** A task with `dispatch-to` set but no dispatched session within N ticks raises `dispatch-stalled` and escalates.
- **Round-robin between offices.** When multiple tasks dispatch to the same office, they round-robin (subject to priority overrides).
- **Priority-respecting.** Higher-priority tasks dispatched first within a tick.

## 6. Per-tick dispatch

Each heartbeat tick:

1. Closure rules fire including dispatch rules.
2. New `dispatch-to` cells are produced.
3. The supervisor opens sessions for dispatched tasks (subject to office capacity, capability check).
4. Sessions begin operating; their respond invocations are attributed.

## 7. Auto-dispatch daemon

A long-lived session at session:auto-dispatch:

- Subscribes to `(*, dispatch-to, *, "True")` cells.
- For each new dispatch, opens a session for the office's incumbent.
- Tracks office capacity to avoid over-subscription.

This is the auto-dispatch-daemon from the captain's ideas-trove.
It's a substrate-resident session (visible in `ps`-equivalent) running as a daemon.

## 8. Manual dispatch

Personnel can manually dispatch a task by asserting:

```
respond(task:X, {"dispatch-to": "office:Y"}, sender=personnel:emsenn)
```

The substrate enforces: personnel must have authority to dispatch to that office.

## 9. Dispatch escalation

When dispatch fails (no office matches, all candidate offices reject, or `dispatch-stalled`):

- A `dispatch-escalation` cell asserts.
- The captain's notification subscription fires.
- Manual intervention required.

## 10. Errors

| Code | Meaning |
|---|---|
| `PCS_DISPATCH_NO_MATCH` | No office matched the task; manual escalation. |
| `PCS_DISPATCH_OFFICE_DECLINED` | Office's capability fiber denies the task. |
| `PCS_DISPATCH_OFFICE_AT_CAPACITY` | Office is at capacity; queueing or escalation per policy. |
| `PCS_DISPATCH_STALLED` | Dispatched task hasn't progressed within configured ticks. |

## 11. Implementation

### Python (v0.2+)

- Dispatch rules are LangGraph StateGraph edges; firing is graph traversal.
- Dispatch composition uses substrate's algebra primitives.
- Auto-dispatch daemon as an asyncio task.

### Rust (v0.2+)

- Same logic via mash-engine's algebra.

## 12. Conformance

Dispatch scheduler passes:

1. **Deterministic.** Same task + same office state → same dispatch outcome.
2. **Capability respect.** Dispatch rejected when office's capability denies.
3. **Fairness.** Multiple tasks dispatching to same office round-robin or priority-respect.
4. **Escalation.** No-match dispatch escalates to captain.
5. **Cross-language equivalence.** Python and Rust produce same dispatch state for same inputs.

## 13. Plan 9 / Unix analogue

| Unix concept | Dispatch analogue |
|---|---|
| Scheduler | Dispatch closure rules |
| Run queue | Tasks with `dispatch-to` set |
| Process priority | Task priority predicate |
| Fairness | Round-robin within office capacity |
| `nice` | Adjust task priority |
| Real-time scheduling | Deadline-anchored dispatch (`firing-cadence`) |
