---
type: concept
class: pattern
depends-on: [tick]
see-also: [dispatch, inbox]
title: Heartbeat
description: The platform's scheduler — the loop that selects unsettled entities and emits ticks at them.
---

# Heartbeat

The platform's scheduler — the loop that selects unsettled entities and emits [ticks](tick.md) at them.
The heartbeat consults a set of registered entities (those whose predication-fibers have remaining work), selects entities by a declared policy (round-robin, priority-weighted, [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md)-value-weighted, etc.), and emits one tick per selected entity per cycle.

A heartbeat is itself a [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) entity, per [self-representation](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md).
The heartbeat's policy — what selection rule it follows, what cycle rate it runs at, what scope it operates within — is recorded as predications on the heartbeat entity.
Two heartbeats running in two scopes are two distinct entities with distinct policies; they do not contend for the same registered set.

Three engineering properties:

- **Computed registration.** An entity is *automatically* on the heartbeat's selection set when its predication-fiber has any unsettled cell, and *automatically* off when every cell is at fixed-point.
  The registration is not declared by the entity itself; it is derived from the entity's fiber state by the heartbeat's policy.
  This is the engineering content of "entities that have remaining work get processing time; entities that don't, don't."
- **Policy-tunable selection.** The heartbeat's policy is replaceable: a fairness-oriented policy uses round-robin; a latency-oriented policy uses priority by message-arrival-time; a cost-oriented policy uses formality-weighted scheduling (per the kernel/micromodel/shell layered architecture in ).
  Policy changes are predication edits.
- **Witness-recorded.** Each heartbeat cycle produces a witness: which entities were selected, in what order, with what tick outcomes.
  The witness goes into the [event log](../../../objects/event-log.md).
  An auditor replaying the log reproduces the heartbeat's selection sequence; this is what makes the heartbeat *deterministic* despite operating in real time.

The heartbeat is the agential reflection of the substrate's [wavefront](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront.md).
Where the wavefront is the substrate's local-step pattern, the heartbeat is the platform's per-entity scheduler that drives the wavefront in time-bounded units.
The substrate's the closure-driven advance operator runs to quiescence in one go (modulo fuel); the heartbeat decomposes the work into per-cycle units and lets the platform interleave the work with [dispatch](dispatch.md), [skill invocation](../skill/skill-invocation/skill-invocation.md), and external interaction.
