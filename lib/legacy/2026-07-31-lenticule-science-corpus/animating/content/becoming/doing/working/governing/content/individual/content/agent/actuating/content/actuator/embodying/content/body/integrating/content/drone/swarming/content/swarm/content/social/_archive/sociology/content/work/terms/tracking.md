---
name: "Tracking"
description: "The continuous observation of work entity states — reading the event stream, computing derived metrics, surfacing anomalies. Tracking does not act — it observes and reports. The observation layer Γ(H*) applied to work."
date-created: 2026-04-07
instance-of: [stage]
part-of-cycle: operations-loop
position-in-cycle: 4
follows: execution
precedes: review
input-from: [event, state-change, artifact]
output-to: [observation]
contrasts-with: [execution, review]
grounded-in:
  - tracking-and-measurement-survey
  - ontology-of-work-operations
traditions: [little-law, goldratt-toc, deming-spc, kanban-metrics]
settlement-role: "Tracking is the observation layer — it reads settled state (ground terms produced by execution) and computes derived quantities (metrics). It does not produce new ground terms."
---

Tracking is the stage of the [operations loop](./operations-loop-stage.md) where the system observes itself.
[Execution](./execution.md) produces [events](../../../../philosophy/terms/event.md) — timestamped records of acts.
Tracking reads those events, computes derived quantities ([metrics](./metric.md)), and surfaces anomalies.

## What tracking produces

1. **Status snapshots** — the current state of every work entity, derived from the event stream
2. **Metrics** — derived quantities like velocity, throughput, cycle time, WIP (Little, 1961)
3. **Anomalies** — deviations from expected patterns: stale tasks, blocked plans, capacity overruns, drift

## What tracking does NOT do

Tracking does not act on what it observes.
It does not reassign work, escalate blockers, or adjust plans.
Those are acts in the [dispatch](./dispatch.md), [review](./review.md), and [feedback](./feedback.md) stages.
Tracking's separation from action is structural — an observer that also modifies what it observes has a conflict of interest.

In the algebra: tracking is the global sections functor Γ(H*) — it reads the settled fiber and reports what's there.
It does not apply ⊙ or ⇒.
It reads.

## The connection to learning

Tracking feeds the continuous learning pipeline.
Observations (CL stage 1) ARE tracking events.
The event stream that tracking reads is the same stream that the learning system mines for patterns.
Tracking produces the raw material that [review](./review.md) evaluates and [feedback](./feedback.md) acts on.
