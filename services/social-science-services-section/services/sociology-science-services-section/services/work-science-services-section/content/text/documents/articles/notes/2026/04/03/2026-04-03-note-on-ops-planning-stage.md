---
title: Planning Stage Scope and Responsibilities
description: System capability to create, schedule, and manage plans with temporal allocation, capacity awareness, dependency analysis, and multi-horizon support
date-created: 2026-04-03
type: note
name: ops-planning-stage
keywords:
  - temporal-allocation
  - capacity-modeling
  - dependency-analysis
  - plan-decomposition
  - ops-vocabulary
  - multi-horizon-coordination
date-completed: 2026-04-03
project: work-operations
specialization: plan
application: planning
architecture-note:
  - Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
  - Under architecture.md Phase 4, this stage is a respond()-composition view + formatter. Not a special-purpose tool but a batch-query over entity-fibers with presentation logic.
department: engineering
cross-cuts: [command, science]
---

## Scope

The planning stage owns:
- Plan creation and structuring (hierarchical, decomposable, temporal)
- Temporal allocation across horizons (session, weekly, quarterly, annual)
- Capacity awareness and resource constraints
- Dependency analysis (work ordering, blocking relationships)
- Multi-horizon coordination (ensuring plans nest coherently across timescales)
- Milestone and phase definitions
- Acceptance criteria and done-ness signals

## Current Infrastructure

The existing `planning-infrastructure.md` plan documents partial patterns for hierarchical plans and temporal bucketing. Once ops-vocabulary is defined, this stage should absorb and formalize those patterns.

## Open Questions

- How do temporal horizons interact with plan-vs-actual tracking?
- Should capacity be modeled per agent, per capability, or per department?
- What constitutes a "valid" decomposition (recursive structure)?
- How are cross-cutting dependencies (multi-department work) expressed?
- How do we signal that a plan is ready for dispatch?

## Blockers

Depends on ops-vocabulary to formalize:
- What is a "plan unit" (task, story, epic)?
- What data lives in the core record vs. phase/stage-specific fields?
- How do we represent "multi-horizon" — separate plans or single nested structure?
