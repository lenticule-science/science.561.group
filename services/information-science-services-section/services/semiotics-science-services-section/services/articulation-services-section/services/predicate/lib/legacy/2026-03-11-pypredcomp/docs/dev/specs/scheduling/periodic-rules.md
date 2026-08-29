---
title: "Periodic rules"
description: "Closure rules with firing-cadence. Cron-equivalent."
kind: spec
status: normative
version: "0.2"
---

# Periodic rules

Closure rules with `firing-cadence` predicate fire at intervals.
Used for scheduled work: ledger period close, instinct decay, federation sync triggers, periodic reports.

## Grounded in

- [`predicated-computing/theorems/monotonic-clock-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md) — the `every-N-ords` cadence (§1) fires on the substrate's monotonic event ordinal; the `wall-clock-cron-expression` cadence (§2) is explicitly approximate because wall-clock is instrumentation.
  The drift-handling discipline (§3) is the standard treatment for monotone-clock-driven settlement when wall-clock-driven inputs lag.
  Per [decisions/event-ordinal-is-time.md](../../decisions/event-ordinal-is-time.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Cadence

```json
{"subject": "rule:<id>", "predicate": "firing-cadence", "object": "<cadence-spec>", "value": "True"}
```

Cadence specs:

- `every-N-ords` — fire every N event-ordinals.
- `wall-clock-cron-expression` — fire on wall-clock cron pattern (e.g., `0 9 * * *` for 9am daily).
- `on-state-change` — fire when a specific cell changes value.

## 2. Wall-clock cron

For wall-clock-based scheduling, the substrate evaluates cron expressions against the host wall-clock at heartbeat tick time.
When the expression matches, the rule's premise is asserted; the rule fires.

This is approximate; the actual fire time is the next tick after the wall-clock match.
For strict timing, use event-ordinal cadence.

## 3. Drift handling

If the heartbeat is slow or the substrate is in degraded state, periodic rules may miss fire windows.
The substrate detects: if N consecutive expected fires haven't fired, an `anomaly:periodic-rule-stalled` cell is asserted; the captain is notified.

## 4. Examples

### Daily ledger sync

```json
{
  "kind": "rule",
  "name": "daily-ledger-sync",
  "firing-cadence": "0 6 * * *",
  "premise": [...],
  "conclusion": [
    {"s": "runbook:ledger-sync", "p": "execute", "o": "now", "v": "True"}
  ]
}
```

### Instinct decay

```json
{
  "kind": "rule",
  "name": "instinct-confidence-decay",
  "firing-cadence": "every-100-ords",
  "premise": [
    {"s": "$instinct", "p": "kind", "o": "instinct", "v": "True"},
    {"s": "$instinct", "p": "confidence", "o": "$conf", "v": "True"}
  ],
  "conclusion": [
    {"s": "$instinct", "p": "confidence", "o": "$conf - 0.01", "v": "True"}
  ]
}
```

## 5. Conformance

Periodic rules pass:

1. Rule fires at configured cadence.
2. Drift detection works under simulated heartbeat slowdown.
3. Cron expressions match wall-clock per RFC-style cron.
