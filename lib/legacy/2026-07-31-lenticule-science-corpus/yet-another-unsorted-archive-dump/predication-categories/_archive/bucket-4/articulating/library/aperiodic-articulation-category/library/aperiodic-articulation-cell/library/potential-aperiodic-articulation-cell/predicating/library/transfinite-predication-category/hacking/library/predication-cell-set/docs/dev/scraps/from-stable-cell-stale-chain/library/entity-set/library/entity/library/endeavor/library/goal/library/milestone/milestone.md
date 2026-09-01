---
name: milestone
description: A recognizable state of a plan — a configuration of task settlements marking meaningful progress and serving as a gate for continuation review. An entity-form whose characteristic predication-shape names a state, conditions, and a parent plan.
---

## Pure form

A milestone is a *state*, not a task. The defining predication: `(milestone, recognizes-state-of, plan)` together with the conditions `(milestone, requires-condition, condition)` whose joint settlement constitutes the state. Inspecting the milestone reduces to inspecting whether its required conditions are settled on the plan.

A milestone serves two functions. First, it makes progress visible: a plan with 30 tasks and no milestones gives two data points; a plan with five milestones gives seven. Second, a milestone is a *gate*: at each milestone, the plan is evaluated — continue, modify, or stop. The gate review is a formal decision point, not just a progress check.

## Characteristic predication-shape

- `recognizes-state-of(milestone, plan)` — the plan whose state this milestone names; the individuating predication.
- `requires-condition(milestone, condition)` — a verifiable condition (typically a task settlement, an objective achievement, or a quality assertion) whose conjunction defines the state.
- `has-status(milestone, {pending | reached | bypassed})` — current lifecycle state of the milestone itself.
- `gates(milestone, decision-event)` — the formal review the milestone triggers when reached.
- `composes-into(milestone, milestone)` — milestone composition: a higher-level milestone reached when its constituent milestones are reached.

## State, not act

A milestone is a snapshot of the plan at a moment where something significant has been achieved. It is not an act, not a task, not work to be assigned. Three distinct kinds of cell are involved:

- *Reaching* a milestone — derived by inspecting whether conditions are settled.
- *Recording* that a milestone has been reached — a witness predication.
- *The gate decision* the milestone triggers — a separate decision record.

## Composition

Milestones compose along the work hierarchy. A project milestone may require milestones in multiple plans; a campaign milestone may require milestones across multiple projects. Composition follows the containment hierarchy and is computed bottom-up from leaf task settlements.
