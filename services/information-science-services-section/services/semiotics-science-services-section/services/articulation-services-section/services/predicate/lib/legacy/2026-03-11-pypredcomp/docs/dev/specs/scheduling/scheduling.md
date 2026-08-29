---
title: "Scheduling"
description: "Heartbeat, deadlines, periodic rules, cron-equivalent. When things run."
kind: index
---

# Scheduling

The substrate is event-ordinal; wall-clock is instrumentation.
Scheduling is **declared-dependency-ordering** of closure-rule firings during the heartbeat tick.
Periodic rules are first-class.
Distributed coordination (leader election, locks) is used only when CRDT discipline isn't sufficient.

## Specs (to be written at v0.1 partial; v0.2 full)

- `heartbeat.md` — the substrate's main loop; tick semantics; event-driven, not wall-clock-driven.
- `deadline.md` — cells with `deadline-by-ord` predicates; anomaly detection on missed deadlines.
- `periodic-rules.md` — closure rules with `firing-cadence` predicate; cron-equivalent.
- `cron-equivalent.md` — periodic-rule patterns matching common cron use cases.
- `tier-routing.md` — dispatch picks the cheapest sufficient computation tier per respond; composes with `process/computation-tiers.md` and the office × task dispatch table.

## Theory grounding

Scheduling implements:

- `predicated-computing/concepts/deadline-discipline` — deadline-anchored work.
- `predicated-computing/concepts/clock`, `latency-budget`, `fuel-bound`, `cost-discipline` — resource discipline.
- `agential-orchestration-platform/concepts/heartbeat`, `tick` — periodic rhythm.
- `agential-orchestration-platform/objects/heartbeat-scheduler` — scheduler entity.
- `agential-orchestration-platform/concepts/settlement-path` — work trajectory under cost.
- `agential-orchestration-platform/morphisms/tick-advance`, `heartbeat-cycle` — scheduler operations.
- `agential-orchestration-platform/concepts/declared-dependency-ordering` — explicit DAG of rule firings.
- `agential-orchestration-platform/concepts/anomaly-as-contradiction` — missed deadlines surface as $\top$.
- `flatfile-agentic-resource-system/concepts/tick-as-iteration` — tick = file walk + rule cascade.
- `flatfile-agentic-resource-system/objects/heartbeat-record` — entity with tick schedule.
- `distributed-coordination-platform/concepts/leader-election`, `distributed-lock`, `failure-detection` — used only when CRDT isn't enough.

## Conformance

Scheduling passes:

1. Heartbeat tick semantics are deterministic: same starting state + same incoming events → same firing order.
2. Periodic rules fire at configured cadence; missed firings surface as anomalies.
3. Deadline misses produce $\top$-cells visibly.
4. Distributed-lock acquisition serializes correctly across simulated peer failures.

## Plan 9 / Unix analogue

| Unix concept | Scheduling analogue |
|---|---|
| Cron / `crontab` | Periodic closure rules |
| `at` | One-shot scheduled rule |
| Process priority | Closure-rule priority + session priority |
| Quantum / time slice | Heartbeat tick |
| Real-time scheduling | Deadline discipline + priority |
| `nice` / `renice` | `set-priority` on session entity |
| `sleep` | `await` on a deadline cell |
