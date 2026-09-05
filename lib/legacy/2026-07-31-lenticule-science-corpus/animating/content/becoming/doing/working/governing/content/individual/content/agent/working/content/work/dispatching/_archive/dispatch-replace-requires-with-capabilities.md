---
name: dispatch-replace-requires-with-capabilities
specialization: task
date-created: 2026-04-30
plan: dispatch-graph-completion
depends-on: [dispatch-add-capabilities-to-agents]
status: open
work-type: process
priority: 2
requires-capabilities: [writing]
produces: schema-aligned-task-frontmatter
---

Sweep `texts/tasks/*.md`.
For each task with a `requires:` field, rename to `requires-capabilities:` and validate values against the capability dictionary established in the prior task.
Where a value doesn't match the dictionary, flag for manual review.

Acceptance: zero tasks remain with `requires:` (only `requires-capabilities:`); all values are in the dictionary.
