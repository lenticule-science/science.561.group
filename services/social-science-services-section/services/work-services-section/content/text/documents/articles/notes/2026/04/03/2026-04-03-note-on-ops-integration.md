---
title: Operations-Loop Six-Stage Integration
description: The six stages share a data model and event system — work flows through the loop without manual re-entry at each stage
date-created: 2026-04-03
type: note
name: ops-integration
keywords:
  - operations-loop
  - eavt
  - operations-graph
  - stage-handoff
  - unified-record
date-completed: 2026-04-04
project: work-operations
specialization: plan
application: planning
architecture-note:
  - Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
  - Under architecture.md Phase 4, this stage is a respond()-composition view + formatter. Not a special-purpose tool but a batch-query over entity-fibers with presentation logic.
department: engineering
cross-cuts: [command, science]
depends-on: [ops-integration-context]
---

The six operations-loop stages (plan / dispatch / execute / track / review / feed-back) share one bus: the operations graph at `operations/engineering/records/operations-graph.json`, where events, sessions, metrics, and status-changes are all EAVT entities. The task entity is the work-unit that persists across stages; assignment, execution, and completion are events referencing it. As of 2026-04-04 planning→dispatch, dispatch→execution, execution→tracking, and tracking→review all work; what remains is lifting events from JSONL into EAVT for MCP-query, writing stage-handoff events (so the first officer doesn't connect stages manually), automating failure-feedback into research/duty updates, and capturing real metrics via `claude -p --output-format json`. The integration is pull-based (daemon polls heartbeat). Full architecture diagram, stage-by-stage infrastructure inventory, what's-missing list, and resolved open questions (work-unit = task entity; settlement path = the learning system) live in `analyses/ops-integration-context.md`.

Open: none — this plan is closed; remaining work is the unified-record tasks under other plans.
