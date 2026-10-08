---
title: "Dispatch"
description: "The stage of the operations loop where work meets worker — matching tasks to agents by capability, authority, and capacity, then creating the assignment that transfers bounded execution authority."
date-created: 2026-04-07
instance-of: [stage, act]
part-of-cycle: operations-loop
position-in-cycle: 2
follows: planning
precedes: execution
input-from: [plan, task, queue, office]
output-to: [assignment, event]
contrasts-with: [planning, execution]
grounded-in:
  - dispatch-and-delegation-survey
  - ontology-of-work-operations
traditions: [mintzberg-coordination, kanban-pull, gerkey-mataric-allocation, hohfeld-authority]
---

Dispatch is the stage of the [operations loop](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/operations-loop-stage.md) where work meets worker.
A [task](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/task.md) exists in a [plan](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/plan.md).
An [office](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/office.md) exists with capabilities and authority.
Dispatch creates the [assignment](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/assignment.md) that connects them.

## The three checks

Every dispatch act checks three conditions before creating an assignment (Gerkey and Matarić, 2004):

1. **Capability** — the agent CAN do this type of work.
  The [role](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/governance/terms/role.md)'s capability signature matches the task's requirements.
  In fiber terms: `respond(office, task)` produces t on the capability predicates.

2. **Authority** — the agent is PERMITTED to do this work.
  The dispatcher has the [power](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/theories/governance/terms/authority.md) to assign, and the work falls within the office's [action domain](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/office.md).
  In Hohfeldian terms: the dispatcher exercises a power, creating a liability (duty of execution) in the assignee.

3. **Capacity** — the agent has BANDWIDTH.
  Little's Law (1961): more work in progress means longer cycle time per task.
  Dispatch must check current load before adding more.
  An overloaded office produces worse results on everything, not just the new task.

## Push vs. pull

Mintzberg (1979) identifies five coordination mechanisms.
Two apply directly to dispatch:

- **Direct supervision** (push): a coordinator assigns work to agents.
  The [first officer](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/office.md) dispatches tasks to offices.
  This is the default when agents cannot self-select — when the overview of all work and all capacity exists only at the coordination level.

- **Mutual adjustment** (pull): agents select work from a shared [queue](../../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/queue.md).
  Kanban (Anderson, 2010) formalizes this: work items enter a backlog, agents pull items matching their capabilities when they have capacity.
  This is the default when agents can self-assess capability and capacity.

The system needs both.
Push for work requiring specific expertise or cross-cutting coordination.
Pull for routine work where agents know what they can do.

## Dispatch and delegation

Every assignment involves [delegation](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/delegation.md).
The dispatcher transfers bounded execution authority to the assignee.
The four invariants of delegation apply:

- **Derivativity** — cannot assign authority the dispatcher doesn't hold
- **Accountability non-transfer** — the dispatcher remains accountable for the assignment's outcome
- **Boundedness** — the assignment specifies what, within what limits, for how long
- **Revocability** — the dispatcher can reassign

## The algebraic reading

In the [algebraic structure of work](../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/algebraic-structure-of-work.md), dispatch is variable binding.
An unassigned task is an open term with the agent variable free: `operate(?, input, ?)
`.
Dispatch binds the agent variable: `operate(planner, input, ?)
`.
The remaining free variables (the specific execution path, the specific output) are bound during [execution](../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/execution.md).

In fiber terms: `respond(office, task)` via ⊙ (composition) produces the overlap between what the office can do and what the task needs.
The t-valued predicates in the result are the capabilities that match.
The ⊥-valued predicates are where the office has no opinion (might or might not handle it).
The f-valued predicates are capabilities the office explicitly lacks.
Dispatch selects the office whose composition produces the most t and the least f.

## See also

- [Assignment](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/assignment.md) — the act dispatch produces
- [Delegation](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/_archive/delegation.md) — the authority transfer underlying every assignment
- [Execution](../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/execution.md) — the stage that follows dispatch
- [Priority](../../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/priority.md) — what determines which task gets dispatched first
- [Queue](../../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/queue.md) — where tasks wait for dispatch
- [Dispatch and Delegation Survey](../03/2026-04-03-dispatch-and-delegation-survey.md) — the full disciplinary grounding
