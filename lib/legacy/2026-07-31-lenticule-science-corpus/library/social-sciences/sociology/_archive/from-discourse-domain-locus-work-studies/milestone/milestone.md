---
title: "Milestone"
description: "A recognizable state of a plan — a configuration of task completions that marks meaningful progress toward the plan's goal."
date-created: 2026-04-03
instance-of: state
applies-to: plan
part-of-stage: tracking
references:
  - id: cooper1990
    type: document
    title: Stage-Gate Systems: A New Tool for Managing New Products
    author:
      - literal: Robert G. Cooper
    container-title: Business Horizons, 33(3)
    issued:
      - year: 1990
---

A milestone is a recognizable [state](../../../../philosophy/terms/state.md) of a [plan](./plan.md) — a specific configuration of task completions that marks meaningful progress toward the plan's goal. Milestones are not tasks. They are not acts. They are states — snapshots of the plan at a moment where something significant has been achieved.

A milestone serves two functions. First, it makes progress visible. A plan with 30 tasks and no milestones gives you only two data points: 0% and 100%. A plan with 5 milestones gives you 7 data points, letting you track progress continuously and detect slowdowns early.

Second, a milestone serves as a gate (Cooper 1990). At each milestone, the plan is evaluated: is it still advancing the [project](./project.md)? Should we continue, modify, or stop? The gate review is a structured decision point — not just a progress check but an authorization to continue.

A milestone is defined by conditions — which tasks must be complete, which qualities must hold. "All infrastructure tasks done" is a milestone. "First user can log in" is a milestone. "Research surveys complete" is a milestone. The conditions are verifiable — you can check whether the milestone has been reached by inspecting the current state of the plan's tasks.

Milestones compose. A project milestone ("MVP shipped") may require milestones in multiple plans. A program milestone ("Q2 objectives met") may require milestones across multiple projects. The composition follows the containment hierarchy: project contains plans, each plan has milestones, and the project milestone is defined by the conjunction of plan milestones.
