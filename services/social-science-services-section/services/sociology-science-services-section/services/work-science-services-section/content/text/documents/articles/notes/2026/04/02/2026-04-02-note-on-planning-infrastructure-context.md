---
title: Task Scheduling and Review Infrastructure Plan
description: Research-grounded roadmap for adding temporal fields, scheduling, milestones, and review cycles to a task-planning system with dependency tracking.
date-created: 2026-04-02
type: note
name: planning-infrastructure-context
keywords:
  - temporal-tracking
  - scheduling-infrastructure
  - milestone-planning
  - review-cycles
  - weekly-planning
specialization: analysis
serves: planning-infrastructure
---

## The problem

System tracks what depends on what and which tasks are ready. It cannot help plan a week, estimate completion, review what happened, or think in timeframes. No task uses dates; no milestones exist; there is no "what should I work on today?"

## What exists now

Works: compute-plan-status.js (dependency graphs), `depends-on`, `work-type`, `goal`, `status`, `part-of` on tasks; `tasks`, `ordering`, `goal` on plans; well-grounded library terms (task, plan, workflow, objective, project).

Missing: temporal fields, milestones, session planning, weekly/daily cycles, effort estimation, recurring tasks, calendar views, urgency/importance, retrospective infrastructure.

Missing library terms: schedule, milestone, deadline, review, cadence, capacity.

## Research sources (Steps 1-3)

### Scheduling theory
- CPM — Kelly & Walker (1959)
- PERT — Malcolm et al. (1959)
- Gantt (1910s)
- Goldratt — *The Goal* (1984), *Critical Chain* (1997)
- Cohn — *Agile Estimating and Planning* (2005)
- PMBOK scheduling (PMI 7th ed.)
- Produces: `work/texts/scheduling-theory-survey.md`

### Personal productivity
- GTD — Allen (2001/2015)
- Newport — *Deep Work* (2016), *A World Without Email* (2021)
- Eisenhower matrix
- Forster — Autofocus / Final Version
- Carroll — *Bullet Journal* (2018)
- Claessens et al. (2007); Macan (1994)
- Produces: `work/texts/personal-task-management-survey.md`

### Review cycles
- AAR — US Army TC 25-20 (1993)
- Derby & Larsen — *Agile Retrospectives* (2006)
- Deming — *Out of the Crisis* (1986), PDCA
- Allen's weekly review; Newport's weekly planning
- Schön — *The Reflective Practitioner* (1983)
- Haudenosaunee Gayanashagowa — seven generations
- Produces: `work/texts/review-cycles-survey.md`

## Steps

1-3. Research tracks (parallel, inquiry work-type)
4. **Define schedule terms** — schedule, milestone, deadline, review, cadence, capacity, estimate. Grounded in research. Derivation.
5. **Temporal frontmatter schema** — start-date, due-date, estimated-effort, actual-effort, cadence, milestone, priority, planned-session, completed-date. Procedure.
6. **Extend compute-plan-status** — approaching due dates, CPM critical path (earliest/latest start, float), estimated vs. actual, milestone status, float-zero flagging. Procedure.
7. **Weekly planning command** `/week-plan` — what's due, what's ready, what happened, allocate to days/sessions, produce week-plan file. Procedure.
8. **Daily standup command** `/standup` — planned today, blocked, overdue, changed since last session. Shorter than /briefing. Process.
9. **Review cycle infrastructure** — weekly/monthly/quarterly records in AAR format (what planned / what happened / why gap / what change); review commands; recurring task support. Derivation.
10. **Milestone support** — first-class milestones: named checkpoint, date, criteria, shown in status/planning/reviews. Procedure.

## Parallel groups

- 1, 2, 3 parallel (research)
- 4 after all research
- 5 after 4
- 6, 9, 10 after 5 (parallel)
- 7, 8 after 6

## What this produces

Monday-morning command shows: planned this week, what's due, what's ready, what happened, milestone status. Weekly plan + review + adjust. Grounded in CPM, PERT, GTD, AAR, Bratman — not ad-hoc date fields.

## What this does NOT produce

Multi-user coordination (needs networked layer), automated scheduling, long-horizon seven-generations thinking (future plan), external calendar integration.
