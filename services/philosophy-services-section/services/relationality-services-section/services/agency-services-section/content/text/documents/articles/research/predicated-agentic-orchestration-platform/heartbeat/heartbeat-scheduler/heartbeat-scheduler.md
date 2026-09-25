---
type: definition
class: structure
realizes: [heartbeat]
depends-on: [heartbeat, tick]
see-also: [agential-orchestration-platform]
title: Heartbeat scheduler
description: The engineering structure that realizes the heartbeat.
---

# Heartbeat scheduler

The engineering structure that realizes the [heartbeat](teaching/explanations/heartbeat.md).
Formally, a heartbeat scheduler is the entity bearing predications that declare:

- **Cycle rate.** Ticks per cycle, cycles per second.
  The platform's overall throughput is bounded by these.
- **Selection policy.** The closure rule (or family of rules) that computes, on each cycle, which entities to tick.
  Examples: round-robin among unsettled entities, priority-by-message-arrival-time, formality-layer-weighted selection (per [formality-layer](../../scope/formality-layer/formality-layer.md)).
- **Registration view.** The derived view that returns the currently-unsettled entities — those whose predication-fibers have remaining work.
  Registration is *computed*, not declared: an entity is on the view iff its fiber satisfies any closure-rule premise that has not been ticked.
- **Witness format.** The canonical witness for one cycle's tick-emission: the cycle index, the selected entities in order, the tick witnesses each entity emitted, the resulting predication-graph hash.

Two engineering benefits:

- **Determinism of orchestration.** A heartbeat scheduler whose selection policy is deterministic given the registration view — and the registration view is determined by the predication-graph state — produces deterministic orchestration.
  An auditor replaying the [event log](../../../objects/event-log.md) reproduces the heartbeat's selection sequence; the orchestration is byte-identically replayable.
- **Self-tunable throughput.** Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the scheduler's policy and cycle rate are predications.
  A skill that observes the platform's throughput and adjusts the cycle rate is a skill operating on the scheduler entity.
  The platform can tune itself without external intervention.

A heartbeat scheduler is *one* heartbeat.
A platform may host multiple heartbeats — one per [scope](../../scope/scope.md), or one per formality layer (kernel, micromodel, shell-light, shell-heavy run their own schedulers with different cycle rates).
Each scheduler is its own entity; the entities do not contend for the same registered set unless they declare overlapping scope predications.

identified the heartbeat as a per-entity scheduler driven by the entity's own remaining-work state — a Bussard-style "tick is simple iteration" or LPMud-style `set_heart_beat()` registration.
The modern formulation lifts the scheduler into a first-class entity: the scheduler is a predication-graph entity; the registration view is a derived view; the selection policy is a closure rule.
All three are admissible engineering targets — replaceable, auditable, and self-representable like any other element of the platform.
