---
title: "Lifecycle"
description: "The ordered sequence of phases an entity passes through from creation to completion or dissolution — the temporal shape of an entity's existence."
defines: lifecycle
aliases: [lifecycles, life-cycle, life cycle]
date-created: 2026-04-04
extends: [state, event]
enables: [task-sequencing, temporal-shape, phase-constraints]
contrasts-with: [workflow, state-machine, trajectory]
applies-to: [task, plan, norm, role, endeavor, enterprise]
references:
  - id: harel1987
    type: document
    title: "Statecharts: A Visual Formalism for Complex Systems"
    author:
      - literal: David Harel
    container-title: Science of Computer Programming
    issued:
      - year: 1987
---

A lifecycle is the ordered sequence of phases an entity passes through from creation to completion or dissolution.
It is the temporal shape of an entity's existence — the path it must follow from beginning to end.

A lifecycle names the states an entity occupies and specifies which transitions between states are valid.
A [task](./task.md) has a lifecycle: open → active → completed (or failed, or abandoned).
A [plan](./plan.md) has a lifecycle: draft → active → completed → archived.
A norm has a lifecycle: proposed → enacted → in force → amended → repealed.
A role has a lifecycle: vacant → invested → occupied → relieved → vacant.
The lifecycle of each is different, but the pattern is the same: an ordered path with valid transitions and terminal states.

Lifecycles are not [workflows](workflow.md).
A workflow is a directed graph of multiple entities (tasks, people, decisions) coordinated together — it describes how many things move in relation to each other.
A lifecycle describes how a single entity moves through its phases — it is the temporal arc of one thing.
A workflow may contain many entities, each following its own lifecycle, but the workflow is not a lifecycle.

A lifecycle is a constrained [state machine](../../../../../../humanities/theories/philosophy/terms/state-machine.md).
Not all transitions are possible.
A task cannot go backward from completed to open without a deliberate act of reopening.
A norm cannot be repealed before it is enacted.
A role cannot be relieved before it is invested.
These constraints encode the causal and logical ordering of the entity's existence.
The constraints come from the entity's nature: what it is to be a task, a plan, a norm, or a role entails a specific sequence of phases.

The phases of a lifecycle are [states](../../../../philosophy/terms/state.md).
The transitions between phases are [events](../../../../philosophy/terms/event.md).
An entity enters a state by an event, persists in that state until another event moves it, and exits when the transition is triggered.
The lifecycle is the legal set of state-to-state paths — what transitions are allowed, what states terminate the path, and whether the path is one-directional or allows reversal.

Lifecycles vary in how settled they are.
A [process](./process.md) has a fully determined lifecycle — the same input produces the same sequence of phases every time.
A [procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) has a branching lifecycle — which phase comes next depends on a decision made during execution.
An [inquiry](./inquiry.md) has an open lifecycle — the phases emerge during the work itself.
But all four types of work have lifecycles: they all have temporal shapes, paths from beginning to end, valid transitions and terminal states.

The lifecycle pattern recurs across domains because entities that exist in time must pass through phases.
This is not a property of work alone.
[Seed dormancy](../../../science/theories/biology/theories/botany/terms/dormancy.md) → [germination](../../../../../natural-science-services-section/services/biological-science-services-section/content/text/documents/articles/notes/2026/04/02/2026-04-02-germination.md) → growing → fruiting → senescing is the lifecycle of a plant.
Dispersal → colonization → growth → fruiting → decline is the lifecycle of a fungal mycelium.
These are biological lifecycles, but they follow the same pattern: a sequence of recognizable phases, each with conditions for entry and exit, constraints on what can follow, and a terminus.

The lifecycle is distinct from the [endeavor's](endeavor.md) temporal structure.
An endeavor has an aim that may be aim-terminated, indefinite, or aim-open; this describes how the endeavor relates to its purpose.
A lifecycle describes the phases the endeavor passes through as it pursues that aim.
An aim-terminated endeavor has a linear lifecycle: pursuit → achievement (or failure, or abandonment).
An indefinite endeavor has a cyclic or semi-infinite lifecycle — it may complete sub-cycles but the overall endeavor persists.
An aim-open endeavor has a lifecycle whose phases transform as the aim clarifies.

An [enterprise's](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/enterprise.md) degeneration — the moment when it ceases to generate new aims — is a lifecycle event.
The enterprise enters the "degenerating" phase when Γ(A_t) = ∅, when the generative mechanism produces no new aims.
This is a transition point in the enterprise's lifecycle, not a condition of the enterprise itself.
The enterprise's lifecycle may be indefinite if it continues to generate aims, or it may terminate when degeneration completes and the hard core dissolves.

The lifecycle pattern is foundational to the work taxonomy.
Every entity in the system — task, plan, norm, role, endeavor, enterprise — follows a lifecycle.
What differs is the length of the lifecycle (task: minutes to years; enterprise: years to generations), the number of phases (simple process: 2-3 phases; complex inquiry: unknown number of phases), and whether the phases are predetermined or emerge during execution.
But all follow the pattern: creation → phases → terminus.

## See also

- [State](../../../../philosophy/terms/state.md) — a phase within a lifecycle
- [Event](../../../../philosophy/terms/event.md) — a transition between phases
- [Task](./task.md) — work with a specific lifecycle (open → active → completed)
- [Plan](./plan.md) — governance with a specific lifecycle (draft → active → completed)
- [Endeavor](endeavor.md) — temporal structure relating lifecycles to purposes
- [Enterprise](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/enterprise.md) — indefinite-duration lifecycle with aim-generation
- [Process](./process.md) — fully determined lifecycle with no branches
- [Procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) — branching lifecycle with conditional transitions
- [Inquiry](./inquiry.md) — open lifecycle emerging during execution
- [Statecharts](../../../../../../humanities/theories/philosophy/terms/state-machine.md) — formal model of hierarchical state lifecycles

---

## Supplementary formulation

```yaml
---
title: "Lifecycle"
description: "The ordered sequence of phases an entity passes through from creation to completion or dissolution — the temporal shape of an entity's existence."
defines: lifecycle
aliases: [lifecycles, life-cycle, life cycle]
date-created: 2026-04-04
extends: [state, event]
enables: [task-sequencing, temporal-shape, phase-constraints]
contrasts-with: [workflow, state-machine, trajectory]
applies-to: [task, plan, norm, role, endeavor, enterprise]
references:
  - id: harel1987
    type: document
    title: Statecharts: A Visual Formalism for Complex Systems
    author:
      - literal: David Harel
    container-title: Science of Computer Programming
    issued:
      - year: 1987
---
```

A lifecycle is the ordered sequence of phases an entity passes through from creation to completion or dissolution.
It is the temporal shape of an entity's existence — the path it must follow from beginning to end.

A lifecycle names the states an entity occupies and specifies which transitions between states are valid.
A [task](task.md) has a lifecycle: open → active → completed (or failed, or abandoned).
A [plan](plan.md) has a lifecycle: draft → active → completed → archived.
A norm has a lifecycle: proposed → enacted → in force → amended → repealed.
A role has a lifecycle: vacant → invested → occupied → relieved → vacant.
The lifecycle of each is different, but the pattern is the same: an ordered path with valid transitions and terminal states.

Lifecycles are not [workflows](workflow.md).
A workflow is a directed graph of multiple entities (tasks, people, decisions) coordinated together — it describes how many things move in relation to each other.
A lifecycle describes how a single entity moves through its phases — it is the temporal arc of one thing.
A workflow may contain many entities, each following its own lifecycle, but the workflow is not a lifecycle.

A lifecycle is a constrained [state machine](../../../../../humanities/theories/philosophy/terms/state-machine.md).
Not all transitions are possible.
A task cannot go backward from completed to open without a deliberate act of reopening.
A norm cannot be repealed before it is enacted.
A role cannot be relieved before it is invested.
These constraints encode the causal and logical ordering of the entity's existence.
The constraints come from the entity's nature: what it is to be a task, a plan, a norm, or a role entails a specific sequence of phases.

The phases of a lifecycle are [states](../../../../philosophy/terms/state.md).
The transitions between phases are [events](../../../../philosophy/terms/event.md).
An entity enters a state by an event, persists in that state until another event moves it, and exits when the transition is triggered.
The lifecycle is the legal set of state-to-state paths — what transitions are allowed, what states terminate the path, and whether the path is one-directional or allows reversal.

Lifecycles vary in how settled they are.
A [process](process.md) has a fully determined lifecycle — the same input produces the same sequence of phases every time.
A [procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) has a branching lifecycle — which phase comes next depends on a decision made during execution.
An [inquiry](inquiry.md) has an open lifecycle — the phases emerge during the work itself.
But all four types of work have lifecycles: they all have temporal shapes, paths from beginning to end, valid transitions and terminal states.

The lifecycle pattern recurs across domains because entities that exist in time must pass through phases.
This is not a property of work alone.
[Seed dormancy](../../science/theories/biology/theories/botany/terms/dormancy.md) → [germination](../../../../../natural-science-services-section/services/biological-science-services-section/content/text/documents/articles/notes/2026/04/02/2026-04-02-germination.md) → growing → fruiting → senescing is the lifecycle of a plant.
Dispersal → colonization → growth → fruiting → decline is the lifecycle of a fungal mycelium.
These are biological lifecycles, but they follow the same pattern: a sequence of recognizable phases, each with conditions for entry and exit, constraints on what can follow, and a terminus.

The lifecycle is distinct from the [endeavor's](endeavor.md) temporal structure.
An endeavor has an aim that may be aim-terminated, indefinite, or aim-open; this describes how the endeavor relates to its purpose.
A lifecycle describes the phases the endeavor passes through as it pursues that aim.
An aim-terminated endeavor has a linear lifecycle: pursuit → achievement (or failure, or abandonment).
An indefinite endeavor has a cyclic or semi-infinite lifecycle — it may complete sub-cycles but the overall endeavor persists.
An aim-open endeavor has a lifecycle whose phases transform as the aim clarifies.

An [enterprise's](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/enterprise.md) degeneration — the moment when it ceases to generate new aims — is a lifecycle event.
The enterprise enters the "degenerating" phase when Γ(A_t) = ∅, when the generative mechanism produces no new aims.
This is a transition point in the enterprise's lifecycle, not a condition of the enterprise itself.
The enterprise's lifecycle may be indefinite if it continues to generate aims, or it may terminate when degeneration completes and the hard core dissolves.

The lifecycle pattern is foundational to the work taxonomy.
Every entity in the system — task, plan, norm, role, endeavor, enterprise — follows a lifecycle.
What differs is the length of the lifecycle (task: minutes to years; enterprise: years to generations), the number of phases (simple process: 2-3 phases; complex inquiry: unknown number of phases), and whether the phases are predetermined or emerge during execution.
But all follow the pattern: creation → phases → terminus.
