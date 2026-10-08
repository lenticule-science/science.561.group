---
name: dispatch-add-capacity-tracking
specialization: task
date-created: 2026-04-30
plan: dispatch-script-evolution
status: open
work-type: procedure
priority: 2
requires-capabilities: [code-edit, dispatch]
touches: [operations/engineering/triage/operations/engineering/services/dispatch/triage/dispatch.py]
aliases:
  - Add capacity tracking to dispatch.py
title: dispatch-add-capacity-tracking
description: At load time, build assignedcount[agentid] from tasks where assigned-to == agentid AND status in {ready, in-progress}.
---

At load time, build `assigned_count[agent_id]` from tasks where `assigned-to == agent_id` AND `status in {ready, in-progress}`.
Expose `--capacity` to print the per-agent load table.
Sort eligible agents by ascending load (least-loaded first) when ties exist on capability match.

Acceptance: `dispatch.py --capacity` shows the load table; eligibility ordering reflects current load.
