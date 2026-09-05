---
title: Introspection Monitor Task
id: introspection-monitor-task
role: Schedule and execute monitoring tasks over introspection channels.
status: plan
inputs:
- id: introspection-probe
  name: probes
- id: introspection-channel
  name: channel
- id: task-carrier
  name: tasks
outputs:
- id: task-carrier
  name: tasks'
transformation:
- return
- value
proof_refs: []
---



Monitoring tasks scheduled alongside normal work:
- read from [Introspection Channel](../system/structure/introspection-channel.md),
- compute derived metrics or checks,
- optionally inject monitoring results back into intake and scheduling.

## Proof
- Uses: channel reads, metric computation, intake injection, and task scheduling
  to integrate monitoring into the task carrier.
- Shows that: monitoring tasks are scheduled with computed metrics while
  preserving task-carrier invariants.
