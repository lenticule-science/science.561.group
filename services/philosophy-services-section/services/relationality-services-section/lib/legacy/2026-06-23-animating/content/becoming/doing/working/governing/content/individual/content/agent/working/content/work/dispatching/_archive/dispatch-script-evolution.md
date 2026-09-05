---
title: "Dispatch script evolution — jurisdiction, capacity, charter checks, plan ordering"
specialization: plan
date-created: 2026-04-30
horizon: week
work-type: procedure
serves: [operations-loop, dispatch, generative-harness]
depends-on: [operational-records-as-dag]
contributes-to: [agentic-orchestration]
produces: production-grade-dispatch-script
status: draft
---

The first-pass `dispatch.py` answers "who could do this task" by work-type filter + fuzzy capability match.
It doesn't answer the full "who should do it and when" question because four constraints aren't enforced yet:

1. **Jurisdiction** — agents declare `jurisdiction.{read,write}: [paths]` but the script doesn't filter eligible agents by whether the task's target paths fall in the agent's write jurisdiction.
  A task that touches `library/` shouldn't dispatch to an agent whose write jurisdiction is `.claude/`.
2. **Capacity** — capacity must be computed at query-time as `count(tasks where assigned-to == agent AND status in {ready, in-progress})`.
  The script currently has no notion of agent load.
3. **Charter check** — agents declare `charter-bindings.{rules, guidelines}`.
  A task should be checked against these — does the dispatch violate any rule the agent is bound by?
4. **Plan ordering** — given a plan (a container of tasks with `depends-on` edges), the script should produce a topological ordering: which tasks can dispatch now, which must wait, which path is the critical path.

## Tasks

- `dispatch-add-jurisdiction-filter` — add a function `task_in_jurisdiction(task, agent)` that compares `task.touches` (or, if absent, `task.produces` path) against `agent.jurisdiction.write`; reject mismatches
- `dispatch-add-capacity-tracking` — at load time, build `assigned_count[agent_id]` from tasks with `assigned-to == agent_id` and `status in {ready, in-progress}`; expose `--capacity` to show the table; sort eligible agents by ascending capacity
- `dispatch-add-charter-binding-check` — load charter rules + guidelines; for each eligible agent, check whether any binding rule's `forbids:` matches the task; reject violations with reason
- `dispatch-add-plan-topological-sort` — `dispatch.py --plan <plan-id>` walks all tasks with `plan: <plan-id>`, builds the depends-on DAG, returns the topological order with current-status annotation
- `dispatch-add-touches-field-to-tasks` — sweep tasks; for each, infer the path(s) the task touches (from `produces:`, body content, or explicit `touches:`); add `touches: [paths]` for jurisdiction matching
- `dispatch-add-emit-mermaid-graph` — `dispatch.py --graph` outputs the dependency DAG and assigned-to relations as Mermaid (delegating to the cartographer's job description)

## Acceptance

- A task that writes to `library/` is rejected when matched against an agent whose write jurisdiction is `.claude/` only — and surfaces this as the rejection reason
- `dispatch.py --capacity` shows current load per agent
- `dispatch.py --plan ops-dispatch-stage` produces a valid topological order over the plan's tasks
- A task that violates a charter rule the agent is bound to is rejected with the rule cited
