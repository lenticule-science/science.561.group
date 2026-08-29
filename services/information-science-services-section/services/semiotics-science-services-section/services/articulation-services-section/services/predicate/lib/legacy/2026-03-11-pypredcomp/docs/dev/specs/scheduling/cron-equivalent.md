---
title: "Cron-equivalent"
description: "Common cron-like patterns expressed as periodic rules. Daily, hourly, weekly schedules; one-shot jobs."
kind: spec
status: normative
version: "0.2"
---

# Cron-equivalent

Common cron use cases mapped to periodic-rule patterns.

## 1. Daily at 9am

```json
{"firing-cadence": "0 9 * * *", "conclusion": [...]}
```

## 2. Every hour

```json
{"firing-cadence": "0 * * * *", "conclusion": [...]}
```

## 3. Every 15 minutes

```json
{"firing-cadence": "*/15 * * * *", "conclusion": [...]}
```

## 4. Weekday business hours

```json
{"firing-cadence": "0 9-17 * * 1-5", "conclusion": [...]}
```

## 5. One-shot

```json
{"firing-cadence": "once-at-ord", "fires-at-ord": "<ord>", "fires-once": "True", "conclusion": [...]}
```

After firing, the rule retires itself automatically.

## 6. Conformance

Cron-equivalent passes:

1. Each pattern fires at the expected cadence.
2. One-shot rule retires after firing.
3. Wall-clock-based rules match cron expressions correctly.
