---
title: System Weather & Internal Mood
keywords:
  - idea
  - system-weather
part-of: relational-computer
description: "Treats the relational computer's internal state as recognitions to provide sense of system mood over time."
---
# Idea: System “Weather” & Internal Mood

Treat the relational computer’s own internal state as recognitions, giving you a
sense of its “weather” over time.

## 1. Recognitions

- `SystemStateRecognition`
  - snapshots of load, error rates, latencies, queue depths.
- `AnomalyRecognition`
  - bursts of errors, performance regressions, weird metric combinations.
- `PatternRecognition`
  - recurring “weather” patterns (calm, stormy, busy, idle).

## 2. Measurement and topology

- Measurement:
  - CPU/memory/IO; higher-level “mood” scores derived from patterns.
- Topology:
  - links between system states and your activity (runbooks, recognitions
    touched).

You can then notice when the system feels “fried” or “calm” and relate that to
your own usage patterns.

