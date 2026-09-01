---
title: EAVT Operations Graph Architecture
description: Describes the EAVT operations graph architecture connecting six pipeline stages and outlines missing features for event-driven stage handoff and automated feedback.
date-created: 2026-04-03
type: note
name: ops-integration-context
keywords:
  - eavt-graph
  - operations-pipeline
  - stage-handoff
  - automated-feedback
  - settlement-path
specialization: analysis
serves: ops-integration
---

## Architecture (revised 2026-04-04)

The operations graph (`operations/engineering/records/operations-graph.json`) is the shared bus. All six stages read from and write to it. Events, sessions, metrics, and status changes are all EAVT entities in this graph.

### The data flow

```
                    ┌──────────────────────────────────────────┐
                    │         EAVT Operations Graph            │
                    │  (sessions, events, metrics, status)     │
                    └───┬───────┬───────┬───────┬───────┬──────┘
                        │       │       │       │       │
                   ┌────▼──┐ ┌──▼───┐ ┌─▼────┐ ┌▼─────┐ ┌▼──────┐
                   │Plan   │ │Disp  │ │Exec  │ │Track │ │Review │
                   │       │ │      │ │      │ │      │ │       │
                   │compute│ │mash-engine  │ │shell │ │query │ │/code  │
                   │-plan- │ │start │ │wrap  │ │-event│ │-review│
                   │status │ │      │ │+exit │ │.js   │ │       │
                   │.js    │ │disp- │ │code  │ │      │ │obsrvr │
                   │       │ │atch- │ │      │ │track │ │agent  │
                   │/plan  │ │work  │ │daemon│ │-stat │ │       │
                   │       │ │.js   │ │      │ │.js   │ │/learn │
                   └───────┘ └──────┘ └──────┘ └──────┘ └───────┘
                        │       │       │       │       │
                        ▼       ▼       ▼       ▼       ▼
                   ┌──────────────────────────────────────────┐
                   │              Feedback Stage               │
                   │  instinct→skill, duty updates, plan adj  │
                   └──────────────────────────────────────────┘
```

### What already works (as of 2026-04-04)

1. **Planning → Dispatch:** compute-plan-status.js identifies ready tasks. dispatch-work.js scores agent capability matches. The first officer reads this and calls `mash-engine start`.

2. **Dispatch → Execution:** `mash-engine start` spawns a shell wrapper that runs `claude -p`. The wrapper writes `.exitcode` on completion. The session is an EAVT entity in the operations graph.

3. **Execution → Tracking:** The daemon reads `.exitcode` files and updates session state (running → completed/failed). Session logs are files at `operations/engineering/records/sessions/{id}.log`.

4. **Tracking → Review:** compute-plan-status.js rolls up task/plan/project status. tracking-status.js computes health indicators. The observer agent reads observation logs and creates instincts.

### What's missing

1. **Events as EAVT entities.** Currently events go to JSONL. They should also be EAVT entities so the MCP server can query them and the daemon can watch patterns.

2. **Stage handoff via graph.** When dispatch creates a session, it should write an assignment event. When execution completes, it should write a completion event. Tracking reads these events. Currently the first officer manually connects stages.

3. **Automated feedback.** When a session fails, the system should: record the failure event, examine the log, identify what knowledge was missing, and queue a research task or duty update. This is the continuous learning pipeline.

4. **Metrics collection.** Sessions currently record 0 for all metrics. Use `claude -p --output-format json` to capture token counts, tool calls, and cost from the structured output.

### Open questions (answered)

> What is the core "work unit" record that persists through all stages?

The **task** entity. Tasks have `status`, `part-of` (plan), `work-type`, and `goal`. They're already in the knowledge graph. Assignment, execution, and completion are events referencing the task.

> Should the event system be pull-based or push-based?

Pull-based for now. The daemon polls the operations graph on its heartbeat interval. Push can come later when we need real-time (MUD, TUI updates).

> How does the settlement path apply?

The learning system IS the settlement path applied to operations. Observations (inquiry) → instincts (derivation) → skills/duties (procedure) → hooks (process). Each stage represents increasing confidence and decreasing human judgment, exactly as the settlement concept describes.
