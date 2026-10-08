---
name: tick-as-iteration
description: "The discipline that the tick is simple iteration over contents: the heartbeat walks a scope's registered entities, runs one closure-rule application step at each, and records the resulting events."
type: concept
class: framing
depends-on: [tick, heartbeat, settle, four-layer-rule-architecture]
see-also: [advance-tick, heartbeat-cycle, declared-dependency-ordering, heartbeat-converges-under-strict-regime]
title: tick-as-iteration
---

# Tick as iteration

The discipline that *the tick is simple iteration over contents*: the heartbeat walks a scope's registered entities, runs one closure-rule application step at each, and records the resulting events.
There is no scheduling framework above the tick, no workflow engine, no priority queue with side-channels.
The substrate's algebra (per [`settle`](../code/transformers/settle.md), [`compose`](../morphisms/compose.md), [`restrict`](../code/transformers/restrict.md)) handles the complexity that an external workflow engine would otherwise need to encode.

The framing is the engineering content of "behavior emerges from properties, not hardcoded dispatch."
A FARS realization that wraps `advance-tick` in a state-machine, an event-bus middleware layer, or a separate scheduling daemon has lost the discipline.
The tick stays simple; richness emerges from substrate content (rule records, capability predicates, dependency declarations).

The discipline reaches FARS from convergent precedent across game engines, scheduler systems, and entity-actor frameworks:

- **Bussard.** Server update is one pass: iterate bodies, update orbits, gravity, autopilots, send positions.
  No scheduling framework.
  The simulation IS the iteration.
- **TAB.** The dimension (engine) is just another thing in the world.
  Its tick iterates its systems (child things).
  Each system processes its contents.
  The engine has no privileged status above the entities.
- **RimWorld.** Mood is computed from needs, not set directly.
  Work priorities are per-colonist per work-type.
  The system assigns best-priority colonist with the matching skill.
  Emergent behavior from simple per-entity systems interacting.
- **Guix.** Services declare what they provide and depend on.
  The system computes order from declarations.
  Declarative, not imperative.
- **Dwarf Fortress.** Properties generate behavior.
  Don't code interactions — code properties and let interactions emerge from property composition.

Each system arrived at the same answer: keep the tick a single-pass iteration; let the substrate's content (properties, predicates, rules) do the work.

## What the tick does

Per [advance-tick](../code/transformers/advance-tick.md), one tick at one entity SHALL:

1. Read the entity's [fiber](../code/structures/fiber.md) at the entity's address.
2. Match the active closure rules' premises against the fiber per [closure-rule-record](../objects/closure-rule-record.md).
3. For each matching rule, compose the rule's conclusion into the fiber via [`compose`](../morphisms/compose.md).
4. Emit one [Event](../objects/event.md) per fired rule, on the appropriate channel, with a witness.
5. If the resulting fiber is at fixed-point under the rule system, deregister the entity from the heartbeat's selection set; otherwise leave it registered for the next cycle.

The tick reads at the rule's declared match-radius (per [four-layer-rule-architecture](../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md)).
The tick's working memory is bounded by the wavefront width, not by the substrate size.
The tick does no more than this; it does no less than this.

## What the tick is not

- **Not a workflow engine.** A workflow engine has states, transitions, guards, retries, compensations.
  The tick has none of these — its semantics is "apply rules, emit events, deregister at fixpoint."
  Whatever workflow-shape behavior is needed at a particular scope SHALL be encoded in substrate content (rule records that declare the workflow's logic), not in the tick's machinery.
- **Not a job queue.** A job queue holds work to be picked up, with priorities and acknowledgments and retries.
  The tick reads from the substrate's own state; "what to do" is computed each cycle from registered entities and active rules, not from a queue's contents.
- **Not real-time.** The tick has no deadline guarantees.
  Realizations MAY tune cycle frequency; FARS does not commit to a particular frequency.
  Real-time guarantees, when needed, are the realization's responsibility (a Rust impl with bounded memory and pre-allocated structures could provide them; the spec does not).
- **Not coupled to scheduling policy.** Per [heartbeat-cycle](../code/transformers/heartbeat-cycle.md), the heartbeat's *policy* (round-robin, priority-weighted, formality-weighted, fairness-bounded) is itself substrate content carried on the [heartbeat-record](../objects/heartbeat-record.md).
  Two realizations with different policies tick the same entities differently; the substrate-level discipline is policy-agnostic.

## Position

Tick-as-iteration is the framing under which the heartbeat is small.
Without the discipline, every new piece of substrate behavior would tempt the realization to grow the heartbeat — special-casing one entity kind, adding side-channels for one rule kind, building a state-machine for one workflow.
With the discipline, the heartbeat stays the same size as the substrate grows; complexity migrates into substrate content where it is editable, queryable, and replayable.

The framing depends on [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) at one further level than [closure rules already require](../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md): the heartbeat *itself* is a substrate entity (per [heartbeat-record](../objects/heartbeat-record.md)), so even the iteration machinery is queryable and editable through the substrate's own operators.
Editing the heartbeat's policy is editing predications.
