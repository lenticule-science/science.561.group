---
title: "Heartbeat"
description: "The OS's main loop. Event-driven; tick semantics; declared-dependency-ordering of rule firings."
kind: spec
status: normative
version: "0.1"
---


The substrate's main loop.
Event-driven (sleeps when idle); ticks process pending messages, fire closure rules, append events.
Per [decisions/heartbeat-is-the-scheduler.md](../../decisions/heartbeat-is-the-scheduler.md).

This spec is a focused view; the full runtime cycle is in [kernel/runtime-cycles.md](../kernel/runtime-cycles.md) §3.

## Grounded in

- [`predicated-computing/theorems/monotonic-clock-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md) — the substrate's event ordinal is the only correctness-relevant clock; wall-clock is instrumentation.
  The tick (§1) advances substrate ordinal monotonically; the anomaly events (§4) are wall-clock instrumentation that does not change settlement outcomes.
- The four per-regime engineering envelope theorems ([strict](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/strict-regime-engineering-envelope.md), [scott-continuous](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md), [transfinite-bounded](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transfinite-bounded-regime-engineering-envelope.md), [aperiodic](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/aperiodic-regime-engineering-envelope.md)) — the per-tick fuel envelope used at step 3 (settle to fixed point) is regime-determined; v0.2's strict-regime default bounds it finitely.
  Per [decisions/regime-classification-is-load-bearing.md](../../decisions/regime-classification-is-load-bearing.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Tick structure

Each heartbeat tick:

1. **Read pending messages** from inbox queue (MCP, HTTP, federation peers, scheduled wakeups).
2. **Process each message**: run respond.
  Closure rules fire in declared-dependency-order.
3. **Settle**: closure rules iterate to fixed point per the bilattice's bounded-settlement property.
4. **Append events** to log.
5. **Notify subscribers** (WebSocket pushes, MCP subscribers, federation push targets).
6. **Update metrics**.
7. **Sleep** until next signal (new event, peer message, scheduled wakeup).

## 2. Tick deterministic ordering

Within a tick:

- Messages processed in arrival order at the inbox.
- For each message's respond: closure rules fire in priority-order; ties by lexicographic rule-id.
- Per-rule, bind-variable assignments ordered lexicographically.

Same starting state + same incoming messages → same firing order → same fiber state.

## 3. Concurrency

The heartbeat may parallelize:

- Concurrent respond invocations against disjoint targets.
- Concurrent storage reads.
- Storage writes serialize on event-log append lock.

## 4. Anomaly detection

If a tick takes longer than configured budget, the runtime emits `(heartbeat, anomaly:slow-tick, "<duration>", t)`.
Closure rules can subscribe and act.

If the inbox queue grows beyond configured depth, the runtime emits `(heartbeat, anomaly:inbox-overflow, "<depth>", t)`.
Same.

## 5. Conformance

Heartbeat passes:

1. Same starting state + same incoming events → same final fiber state.
2. Anomaly events emit when conditions met.
3. Cross-implementation: Python and Rust produce identical tick traces.

## 6. Plan 9 / Unix analogue

| Unix | Heartbeat |
|---|---|
| Process scheduler quantum | One tick |
| Run queue | Inbox queue |
| sleep until signal | sleep until next message |
| Idle process | Idle heartbeat (event-driven, near-zero CPU) |
