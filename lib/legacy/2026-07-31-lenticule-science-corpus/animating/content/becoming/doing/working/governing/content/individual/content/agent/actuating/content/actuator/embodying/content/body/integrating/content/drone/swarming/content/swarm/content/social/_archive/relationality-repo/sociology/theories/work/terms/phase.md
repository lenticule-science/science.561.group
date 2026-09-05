---
title: "Phase"
description: "A distinct stage within a lifecycle — a bounded period during which an entity has a particular character and defined entry and exit conditions."
defines: phase
aliases: [phases]
date-created: 2026-04-04
extends: [state]
component-of: lifecycle
requires: [lifecycle, time]
produces: [transition]
instance-of: state
applies-to: [task, plan, project, endeavor, enterprise]
part-of-stage: cross-cutting
references:
  - id: harel1987
    type: document
    title: Statecharts: A Visual Formalism for Complex Systems
    author:
      - literal: David Harel
    container-title: Science of Computer Programming, 8(3)
    issued:
      - year: 1987
  - id: cooper1990
    type: document
    title: Stage-Gate Systems: A New Tool for Managing New Products
    author:
      - literal: Robert G. Cooper
    container-title: Business Horizons, 33(3)
    issued:
      - year: 1990
---

A phase is a distinct stage within a [lifecycle](./lifecycle.md) — a bounded period during which an entity has a particular character and defined entry and exit conditions.
A phase is one period in the temporal arc of an entity's existence.

A phase is a [state](../../../../philosophy/terms/state.md) understood temporally.
A state is a snapshot at a single moment — the configuration of all conditions defining a thing right now.
A phase is a state that persists over time.
The "in review" phase takes hours or days.
The "draft" phase has a different character than the "published" phase.
The phase is not just the configuration but the duration of that configuration.
Three conditions define a phase: entry conditions (what must be true to enter), the character of the phase itself (what the entity is like while in this phase), and exit conditions (what must be true to leave).

Phases compose into [lifecycles](./lifecycle.md).
A [task](./task.md) lifecycle has phases: open → active → completed (or failed).
A [plan](./plan.md) lifecycle has phases: draft → active → completed → archived.
A [project](./project.md) lifecycle has phases: initiation → planning → execution → monitoring and control → closing.
The ordering of phases may be strictly linear (waterfall: requirements → design → implementation → testing, each follows the previous without deviation) or flexible (agile: phases can overlap, loop, or branch based on conditions).
But even in flexible orderings, the phases constrain which transitions are valid.
A task cannot move backward from completed to potential without a deliberate reopening event.
A plan cannot enter the archived phase until it is completed.
These constraints encode the logical structure of what it means to be that kind of entity.

Phase transitions are [events](../../../../philosophy/terms/event.md) — discrete moments that change the entity's phase.
A task moves from "open" to "potential" when someone begins work — that transition is an event.
A plan moves from "draft" to "potential" when it is authorized — that event marks the transition.
Each event moves an entity from one phase to another.
The event is instantaneous; the phase is the interval between events.

This pattern appears across domains because any entity existing in time must pass through phases.
A plant has developmental phases: [seed dormancy](../../../../science/theories/biology/theories/botany/terms/dormancy.md) → [germination](../../../../../../science/theories/biology/theories/botany/terms/germination.md) → vegetative growth → flowering → fruiting → senescence.
A fungal mycelium has ecological phases: dispersal → colonization → growth → fruiting → decline.
A research inquiry has phases: question formation → literature review → design → data collection → analysis → reporting.
Phases are not unique to project management or work systems — they are fundamental to any ordered temporal process.

The phase concept is distinct from related ideas in the work taxonomy.
A [milestone](./milestone.md) marks the boundary between phases — it is a recognizable state achieved at the transition point.
A [process](./process.md) is work with a fully determined sequence of phases — the input determines the exact phases that will follow.
A [procedure](./procedure.md) is work with branching phases — which phase comes next depends on a decision made during execution.
An [inquiry](./inquiry.md) is work with emergent phases — the phases themselves are discovered during execution.
But all four types have phases; what differs is whether the phases are predetermined, branching, or emergent.

Phases structure how work [duration](./duration.md) is understood and allocated.
A [capacity](./capacity.md) plan must account for which phases are resource-intensive and which are lighter.
A [schedule](./schedule.md) assigns phases to calendar time.
A [workflow](./workflow.md) chains entities' phases together so that one entity's transition (a phase exit in one task) triggers another entity to enter a new phase.
The phase is the unit of time that makes all temporal coordination possible.

## See also

- [Lifecycle](./lifecycle.md) — the ordered sequence of phases
- [State](../../../../philosophy/terms/state.md) — a configuration at a moment (phase is state extended in time)
- [Event](../../../../philosophy/terms/event.md) — the transition between phases
- [Milestone](./milestone.md) — a recognizable state marking a phase boundary
- [Task](./task.md) — has a simple lifecycle with defined phases
- [Plan](./plan.md) — has a governance lifecycle with phases
- [Process](./process.md) — has a fully determined sequence of phases
- [Duration](./duration.md) — the temporal extent of a phase
