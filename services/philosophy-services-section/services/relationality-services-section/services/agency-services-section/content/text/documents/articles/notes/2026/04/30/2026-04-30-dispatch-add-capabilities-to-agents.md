---
name: dispatch-add-capabilities-to-agents
specialization: task
date-created: 2026-04-30
plan: dispatch-graph-completion
status: open
work-type: procedure
priority: 1
requires-capabilities: [writing, taxonomy]
produces: agent-capability-map
aliases:
  - Add provides-capabilities to every agent
title: dispatch-add-capabilities-to-agents
description: "For each agent in command/agents/triage/, engineering/agents/triage/, science/agents/triage/, derive a provides-capabilities: [...] list."
---

For each agent in `command/agents/triage/`, `engineering/agents/triage/`, `science/agents/triage/`, derive a `provides-capabilities: [...]
` list.
Capabilities are the categorical signature distinct from work-types: writing, review, code-review, security-audit, accounting, search, render, dispatch, build-fix, audit, plan-decomposition, etc.

Cluster the existing 49 catalog skills into ~10 capabilities first; agents inherit capabilities from their declared `skills:` list plus their `role:`.

Acceptance: every agent file has `provides-capabilities:` with at least one entry; the union of all capabilities forms a small dictionary.
