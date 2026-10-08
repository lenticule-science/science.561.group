---
name: dispatch-add-requires-skills-to-tasks
specialization: task
date-created: 2026-04-30
plan: dispatch-graph-completion
depends-on: [dispatch-replace-requires-with-capabilities]
status: open
work-type: derivation
priority: 3
requires-capabilities: [writing, taxonomy]
produces: tighter-task-dispatch-constraints
aliases:
  - Add requires-skills to tasks where a specific named skill is required
title: dispatch-add-requires-skills-to-tasks
description: Some tasks need not just a capability (writing) but a specific catalog skill (process-triage-note, validate-frontmatter).
---

Some tasks need not just a capability (writing) but a specific catalog skill (process-triage-note, validate-frontmatter).
Where the task body or title indicates a specific skill, add `requires-skills: [<skill-id>]`.

Acceptance: at least 30 tasks gain `requires-skills:` entries; the dispatch script's strict `requires-skills ⊆ agent.skills` filter narrows eligible agents meaningfully.
