---
title: Introspection Structure
tags:
  - monitoring
  - introspection
  - invariants
depends_on:
  - theorem/internal/intake-stack
  - theorem/internal/measurement-stack
  - theorem/internal/scheduling-stack
  - theorem/internal/relational-network
# Introspection Structure

The intake, measurement, scheduling, and network structures induce an
introspection structure: a way to observe internal state, schedule monitoring
tasks, and feed results back into the system.

Formally, there exists a structure

```text
Introspection = (Probes, ObservationChannels, MonitorTasks)
```

such that:

1. **Probes.**
   `Probes` are measurement points attached to ports, channels, or tasks. The
   measurement stack determines which observables (progress, entropy,
   invariants) each probe can emit.

2. **Observation channels.**
   `ObservationChannels` are channels in the distribution/network structures
   dedicated to carrying probe outputs to monitoring consumers, preserving
   trace semantics and storage invariants.

3. **Monitoring tasks.**
   `MonitorTasks` are tasks in the scheduling structure that:
   - read from observation channels,
   - compute derived metrics or checks,
   - and optionally inject monitoring results back into intake for analysis or
     persistence.

The scheduling structure ensures monitoring tasks can be interleaved with
normal work without destabilising the execution order, and the intake stack
ensures monitoring inputs are treated like any other data. This introspection
structure is the mathematical foundation for operational tools (debuggers,
profilers, dashboards) built on top of the relational computer.
