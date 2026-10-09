---
name: work-management-parity-plan
specialization: plan
application: planning
architecture-note: "Application sublocale, not OS infrastructure — see applications-as-sublocales analysis"
serves-system: foah
date-created: 2026-04-05
project: work-operations
owner: operations-officer
priority: 2
department: command
serves: [work-management-parity, operations-loop]
implements: "architecture.md Phase 4 — views compose from queries"
depends-on: [predication-as-computation, fars-architecture-coherence]
enabled-by: create-as-message
aliases:
  - Work Management Parity — Asana/Todoist/Linear features via respond() compositions
title: work-management-parity-plan
description: "Each task is a view or feature built as: batch-respond(entities, query-message) → format(responses)."
---

Each task is a view or feature built as: batch-respond(entities, query-message) → format(responses).
No task requires a custom script over 30 lines.
The respond() primitive (architecture.md) handles the query; the formatter handles presentation.
Depends on architecture.md Phase 1-2 completing first (algebra on real data + queries replacing scripts).

## World-sim math enrichment (from predication-world-sim + old-draft mining, 2026-04-06)

Every Asana/Todoist/Linear feature is a shadow-class query over the quasicrystal.
This isn't metaphor — it's what batch-respond actually computes.

### Kanban columns ARE shadow classes

| Kanban column | Shadow class | What it means algebraically |
|---------------|-------------|---------------------------|
| Backlog | FreeShadow | Neither history nor destiny constrains these tasks. Pure potential. |
| Ready | TrShadow | Fated — dependencies met, destiny clear, but no history of execution yet. |
| In Progress | SatShadow | History accumulating (someone is working on it) but outcome not yet settled. |
| Done | H*_t | Fully settled. Both history and future agree: this task resolved. |
| Blocked | ⊤ on dependency predicate | Contradiction — the task's forward-settle depends on another task's settlement, which hasn't happened. ⊤ is informative: it says WHERE the blockage is. |

The kanban board IS respond(tasks, {channel: shadow-class}) formatted as columns.
No custom kanban code — the shadow class IS the column assignment.

### Gantt timelines ARE the depth filtration

A Gantt chart shows tasks on a time axis with dependencies.
In the algebra: the depth filtration R₀ ↪ R₁ ↪ R₂ ↪ ...
IS the Gantt timeline.
Each depth level is a time stratum.
Dependencies ARE the prefix ordering of T — task A depends on task B iff B is a prefix of A in the history category.
The Gantt chart IS the depth tower rendered horizontally.

Critical path = the LONGEST chain of prefix dependencies from ε to the goal.
Float = how many positions a task can shift within its depth level without affecting the prefix chain.
These are computed by respond(plan, {channel: depth-filtration}).

### Sprint velocity IS the Padovan staircase

Sprint velocity (tasks completed per sprint) follows the Padovan growth rate ρ ≈ 1.325 in a healthy organization.
Each sprint's completable work depends not just on the last sprint (Fibonacci) but on the TWO AND THREE sprints back (Padovan — because F5.3 settlement requires three-level witness).
Early sprints are slow (1, 1, 1, 2, 2, 3...).
Velocity accelerates as the three-level compound kicks in.
If velocity is growing FASTER than Padovan, something is wrong (probably counting non-F5.3 completions).
If SLOWER, enrichment is needed.

### Workload balancing IS Umwelt-matching

Workload balancing means: each office perceives tasks through its duty fiber. respond(office, task-pool) produces the office's Umwelt of available work.
A balanced workload means each office's Umwelt is in the ZPD — mixed bilattice values, not all-t (too easy) or all-⊥ (nothing connects).
Overload = ilinx (too many non-⊥ compositions per tick).
Underload = boredom (all ⊥).
The workload balancer IS the flow-temperature regulator applied to offices.

### Priority IS spectral mass

Task priority isn't a 1-5 integer — it's the spectral mass at the task's depth in the tower.
Deep tasks (high tower level, many entangled pairs, high ent) have MORE spectral mass — they affect more of the quasicrystal when they settle.
Shallow tasks have less mass.
Priority IS how much the task's settlement affects the organization's quasicrystalline structure.
The task-priority-matrix task should compute priority from spectral mass, not from a designer's rubric.

### Notifications ARE composition-gap firings

When a new event creates a bypass boundary with an existing entity (I.
6 — the composition gap), new reachable states appear that neither the event nor the entity contained alone.
That's a notification: "something you care about just composed with something new, and the composition reaches states you haven't seen." respond(officer, new-event) producing non-⊥ IS the notification.
No notification system needed — the algebra IS the notification system.
Events that produce ⊥ when composed with an officer's fiber are simply invisible to that officer (Umwelt filtering).
