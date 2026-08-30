---
title: Ops Dispatch Stage
description: System capability to assign work to agents by capability and work type, with authority bounds, capacity checking, and audit trails
date-created: 2026-04-03
type: note
name: ops-dispatch-stage
keywords:
  - work-dispatch
  - capability-matching
  - authority-scope
  - wip-limits
  - handoff-schema
serves-system: cross-cutting
project: work-operations
specialization: plan
application: planning
architecture-note:
  - Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
  - Under architecture.md Phase 4, this stage is a respond()-composition view + formatter. Not a special-purpose tool but a batch-query over entity-fibers with presentation logic.
department: engineering
cross-cuts: [command, science]
depends-on:
  - predication-as-computation
  - ops-dispatch-stage-context
  - agent-session-interfacer
  - messaging-channel-infrastructure
  - session-lifecycle-infrastructure
enabled-by:
  - agent-session-interfacer
  - lens-entity-system
  - messaging-channel-infrastructure
  - session-lifecycle-infrastructure
  - system-infrastructure
---

The dispatch stage of the operations loop owns matching work to agents — by capability, authority, and capacity — and records every assignment. Foundation is built (dispatch-work.js, record-event.js, query-events.js with Gerkey-Matarić matching, Goldratt WIP limits, Anderson pull ordering) but capabilities are currently keyword-extracted from descriptions. The plan moves through three phases: Phase 1 replaces keyword extraction with declared `capabilities:` frontmatter and defines a session-typed handoff schema; Phase 2 adds authority-scope checks and push/pull selection (procedure/process pushed, derivation/inquiry pulled); Phase 3 adds a saga for failure-reassignment-with-context. `agent-capability-frontmatter` is subsumed by office-vocabulary-overhaul Step 1 (per 2026-04-04 coherence audit) — this plan defers to ovo for that task and retains handoff, authority, push/pull, and saga work. Full scope, infrastructure inventory, task rationale, grounding table, cross-plan dependencies, and mutation log live in `analyses/ops-dispatch-stage-context.md`.

Open: how to represent authority scope (path-based vs. department-based vs. graph-domain); how stateless agents "pull" work (briefing as manual pattern); whether compose-environment should inject assignments into agent session start; capacity model granularity (global WIP vs. per-agent/department/work-type per Goldratt's constraint).
