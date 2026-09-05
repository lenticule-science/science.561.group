---
title: Operations Tracking Stage
description: System capability to know the current state of all work at every level, with history, metrics, and health indicators
date-created: 2026-04-03
type: note
name: ops-tracking-stage
keywords:
  - status-tracking
  - metrics-collection
  - health-scoring
  - dependency-propagation
  - anomaly-detection
serves-system: cross-cutting
project: work-operations
specialization: plan
application: planning
architecture-note:
  - Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
  - Under architecture.md Phase 4, this stage is a respond()-composition view + formatter. Not a special-purpose tool but a batch-query over entity-fibers with presentation logic.
department: engineering
cross-cuts: [command, science]
enabled-by:
  - messaging-channel-infrastructure
  - session-lifecycle-infrastructure
  - system-infrastructure
  - transactional-record-infrastructure
---

## Scope

The tracking stage owns:
- Multi-level rollup (work unit → plan → department → org)
- Current status at every level (what's happening now?)
- Status history (how did we get here?)
- Metrics collection (velocity, cycle time, throughput, quality)
- Health indicators (on-track, at-risk, blocked, complete)
- Real-time dashboards and views
- Audit trail of all status changes
- Dependency state propagation (if X is blocked, what depends on X?)

## Current Infrastructure

### Built (2026-04-03)

- **tracking-status.js** — unified hierarchical status: goal → project → plan → tasks. Computes health indicators (on-track/at-risk/behind/blocked), detects anomalies (empty plans, stale tasks, WIP violations, fully-blocked projects), propagates dependency state. Modes: `--health`, `--blocked`, `--anomalies`, `--project X`, `--plan X`.
- **query-events.js** — flow metrics from event log: cycle time, lead time, throughput by day, current WIP. Filters by subject, action, actor, date range.
- **record-event.js** — append-only JSONL event creation for all 6 stages. 18 valid action types.
- **dispatch-work.js** — shows dispatchable work with agent capability matching (feeds tracking).

### Health model

Plans are scored by: progress ratio, blocked task count, deferred task count, event staleness (>7 days without activity). Score maps to status: ≥70 on-track, ≥40 at-risk, <40 behind. Blocked plans override to blocked status.

### Anomaly types

- `empty-plan` — plan exists but has no tasks
- `stale-task` — task open >7 days with no events
- `project-all-blocked` — all plans in a project are blocked
- `wip-violation` — system WIP exceeds 15

## Remaining Work

- Real-time dependency propagation (if X blocks Y and X fails, auto-flag Y)
- Scheduled tracking reports (daily/weekly cadence via cron)
- EVM integration (planned value vs. earned value vs. actual cost)
- Cumulative flow diagrams (text-based from event log)
- Integration with compose-environment to show health in agent context

### World Tick Expansion (from ideas/daemon-world-tick.md)

The daemon heartbeat should become a world tick that notices things beyond sessions:
- Check for unreviewed failure reports (`.failure` files older than 1 hour)
- Check for stale tasks (open tasks with no events in 7+ days)
- Emit ambient events to the bridge channel when anomalies are detected
- Run the balance check periodically and flag imbalances (see plaintext-accounting-operations)

The bridge channel then shows not just session completions but "5 tasks haven't been touched in a week" and "the token budget is 80% spent." Each observation is itself a transaction.

### Channels as Event Stream Views (from ideas/mud-chat-as-messaging.md)

Don't build an internal messaging system. A "channel" is a query over the operations graph: "show me all events where subject matches this pattern." Inter-agent communication, status updates, alerts, and human notifications are all the same thing: entities in the graph with an audience attribute.

This means tracking can surface health information to different audiences through channel queries:
- Bridge channel: operational events the first officer needs
- Engineering channel: infrastructure changes, build status
- Fleet channel: session lifecycle, dispatch status
- Attention queue: failures needing human review
