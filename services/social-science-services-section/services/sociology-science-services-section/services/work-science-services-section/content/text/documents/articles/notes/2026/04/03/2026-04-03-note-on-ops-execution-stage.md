---
title: Ops Execution Stage
description: System capability to track execution state of work units, monitor progress, enforce WIP limits, handle failures, and record artifacts
date-created: 2026-04-03
type: note
name: ops-execution-stage
keywords:
  - work-unit
  - state-machine
  - artifact-capture
  - failure-handling
  - wip-limits
  - blocking-relationships
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

The execution stage owns:
- State machine for work units (not-started, in-progress, blocked, completed, failed)
- Progress tracking and handoff points
- Work-in-progress (WIP) limit enforcement
- Artifact capture and storage (output, decisions, evidence)
- Failure handling (retry, escalation, rollback)
- Blocking relationship handling (what unblocks a blocked work unit?)
- Status signaling back to tracking stage
- Intermediate commits and checkpoints

## Current Infrastructure

Partial patterns exist in loop-operator and autonomous-loops agents, but no unified execution record schema.

## Open Questions

- What constitutes a valid state transition?
- How granular are WIP limits (agent level, team level, global)?
- What triggers escalation vs. retry vs. rollback?
- How do we capture "evidence" of work (commits, transcripts, artifacts)?
- Should execution be synchronous (blocking) or async?
- What is the recovery protocol for a failed work unit?

## Blockers

Depends on ops-vocabulary to formalize:
- Work unit execution record (state, progress %, blockers, artifacts)
- State machine definition and valid transitions
- Artifact schema (what we capture and how)
- Blocking/unblocking semantics
