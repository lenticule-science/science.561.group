---
title: "Deadline discipline"
description: "Cells with deadline-by-ord; priority adjustment as deadline approaches; missed deadlines produce $\\top$."
kind: spec
status: normative
version: "0.2"
---


Tasks and runbook executions can have deadlines, expressed in event-ordinal time.
Deadline-anchored work is prioritized as the deadline approaches; missed deadlines produce $\top$ — surfaced as anomalies.

## Grounded in

- [`predicated-computing/theorems/monotonic-clock-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md) — deadlines (§1) are in event-ordinal, the substrate's monotonic correctness clock.
  The wall-clock-to-event-ordinal mapping (§4) is explicitly approximate because wall-clock is instrumentation; cells captured from the wall-clock map are content with bilattice values, not authoritative time.
  Per [decisions/event-ordinal-is-time.md](../../decisions/event-ordinal-is-time.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Deadline cells

```json
{"subject": "task:X", "predicate": "deadline-by-ord", "object": "<ord>", "value": "True"}
```

The substrate computes "current ord" as the latest event's ord.
The deadline is the configured ord by which the predicate's value should be a particular state.

## 2. Priority adjustment

Per [process/fairness-and-priority.md](../process/fairness-and-priority.md) §5:

- > 1000 ords away: declared priority.
- 1000-100 ords away: priority - 1.
- 100-10 ords away: priority - 2.
- < 10 ords away: priority - 3 (effectively highest).

## 3. Missed deadline

When current ord exceeds `deadline-by-ord` and the expected state hasn't reached:

```json
{"subject": "task:X", "predicate": "missed-deadline", "object": "<deadline-ord>", "value": "True"}
```

Closure rules subscribing to missed-deadline fire (escalation, notification, etc.).

## 4. Wall-clock to event-ordinal mapping

Wall-clock timestamps are instrumentation; deadlines are in event-ordinal.
To set a deadline at "5pm Friday":

- Look up the substrate's wall-clock-to-ord conversion (a periodic rule emits `(time, current-ord, <ord>, t)` for the current minute/hour).
- Choose the ord at "5pm Friday" based on past mapping.
- Set the deadline.

This is approximate; ord doesn't strictly correspond to wall-clock.
For strict wall-clock deadlines, use a periodic rule that asserts the deadline at the wall-clock moment.

## 5. Conformance

Deadlines pass:

1. Priority adjusts as deadline approaches.
2. Missed deadline produces the missed-deadline cell.
3. Subscriber rules fire.
