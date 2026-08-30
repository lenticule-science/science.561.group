---
defines: record
description: "A committed artifact of organizational activity — a decision made, a plan adopted, a task assigned, an analysis produced. Records persist. They carry provenance (who, when, why) and connect to the work they serve."
extends: [work-item]
date-created: 2026-04-07
has: [id, type, status, date-created]
display:
  headline: title
  body: description
  metadata: [id, type, status, date-created, part-of, serves, depends-on]
help-predicates: [id, type, summary, description, status, part-of]
---

A **record** is a committed artifact of organizational activity. Plans, tasks, decisions, analyses, ideas, projects, goals, objectives, milestones, reviews — all are records. What makes something a record: it was committed (someone created it deliberately), it persists (it's a file, not a conversation), and it carries provenance (who created it, when, serving what purpose).

Records form the operational memory of the organization. A decision record captures a choice with its context and rationale. A plan record captures an approach with its tasks and dependencies. A task record captures a unit of work with its goal and completion criteria. Each specialization adds predicates specific to its kind of work, but all share the base record predicates: id, type, status, date-created.

The `display` predicates on this term define default rendering for all records: title as headline, description as body, key metadata as labeled fields. Specific record types (plan, task, etc.) can override with their own display predicates.
