---
type: concept
class: pattern
depends-on: [agent]
see-also: [heartbeat, dispatch]
title: Tick
description: "The smallest unit of platform-level temporal advance: one application of the substrate's closure machinery to one unsettled entity, scheduled by the platform's heartbeat rather than by a globally-coordinated step."
---

# Tick

The smallest unit of platform-level temporal advance: one application of the substrate's closure machinery to one unsettled entity, scheduled by the platform's [heartbeat](heartbeat.md) rather than by a globally-coordinated step.
A tick advances one entity by one closure step; a sequence of ticks across the platform's entities is what the platform's settlement-driven advance is operationally.

Three properties:

- **Per-entity.** Each tick is associated with one entity.
  The platform does not advance entities globally in lockstep; each entity ticks when the heartbeat selects it, and entities at fixed-point are dropped from the heartbeat's selection set automatically.
  An entity whose predications already satisfy all applicable closure rules contributes nothing further and need not be ticked.
  This is the engineering content of *only-unsettled-entities-need-processing*.
- **Bounded work.** A single tick is one closure-rule application — bounded by the rule's match-radius and a finite number of substrate insertions.
  The platform's effective tick rate is bounded by per-entity predication count and per-rule match cost, not by the global graph size.
- **Witness-recorded.** Each tick produces a [witness](../../teaching/explanations/witness.md) — the entity ticked, the rule applied, the resulting predications, the canonical hashes before and after.
  The witness is appended to the [event log](../../../objects/event-log.md); the cumulative witness chain across all ticks is the platform's history.

A useful comparison is the heartbeat-driven entity loop in long-running multi-user systems where each entity registers itself for the next heartbeat tick when it has remaining work and unregisters automatically at fixed-point: the platform's heartbeat consults only the registered set, not the full entity population.
The tick is the smallest scheduling unit; the heartbeat is the scheduler that sequences ticks across registered entities.

## What the tick is, structurally

Three structural commitments characterize the platform's tick:

- **Simple iteration over contents.** The tick walks a scope's contents (entities, work items, registered subscribers) and processes each.
  There is no separate workflow engine or scheduling framework above the tick — the tick *is* the iteration.
  The substrate's algebra handles the complexity that an external workflow engine would otherwise need to encode.
- **Behavior emerges from predications, not hardcoded dispatch.** What an entity does on its tick is determined by which closure rules apply at its current predications.
  There is no declared workflow that says "if entity is in state X, run procedure Y" — the rules are predications, the entity's state is predications, and the rule that fires is whichever predication-pattern matches.
  Adding a new behavior is adding a new closure rule (a predication), not editing the tick's body.
- **Synchronous cascade within a tick.** When a tick at one entity creates predications that match closure rules at neighbors, those neighbors' rules fire within the same tick cycle, propagating the wavefront synchronously until quiescence (or fuel exhaustion) within the cycle.
  Cross-cycle propagation is a platform choice; within-cycle is structural.

## Proactive monitoring as part of the tick

Beyond processing assigned work, the tick can also *detect anomalies*: stale tasks, failed sessions, overdue items, capacity overruns, integrity-check violations.
Anomaly detection is not a separate monitoring layer; it is closure rules applied as part of the tick.
A stale-task rule fires when a work-item entity's age exceeds a declared threshold; a failed-session rule fires when a session has no recent activity; a capacity rule fires when an office's assigned-work count exceeds a declared limit.

Because anomaly-detection closure rules are themselves substrate entities, the platform's monitoring discipline is editable through the same operators as the platform's content.
Adding a new anomaly check is inserting a closure rule; tuning a threshold is editing a predication on the rule's specification; removing a check is retracting the rule's predications.
The platform's self-observation is on the same footing as its self-action.

## Declarative dependency ordering

When ticks across multiple entities have causal dependencies — entity $a$'s tick produces predications that entity $b$'s tick reads — the substrate computes the tick order from the entities' declared *reads-and-writes* predications, not from a hardcoded schedule.
An entity that declares `reads: status` and `writes: event` ticks after any entity that writes `status`.
The order is computed each cycle; entities whose declared dependencies change between cycles are reordered automatically.

The pattern lets the platform avoid an out-of-band scheduler.
Tick order is part of the substrate, derived from the substrate's own predications, recalculated at substrate edit time.
Adding a new entity with a new dependency pattern reorders the tick automatically.
