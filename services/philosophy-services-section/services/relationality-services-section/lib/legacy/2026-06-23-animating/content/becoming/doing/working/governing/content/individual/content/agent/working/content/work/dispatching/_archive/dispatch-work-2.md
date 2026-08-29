---
operation: compose-resources-into-prose
consumes: [task, office, duty]
filter: "status=open"
group-by: work-type
produces: prose-report
consumer: natural-language-parsing-model
available-to: [command, operations]
summary: "Show dispatchable work — open tasks matched against office capabilities"
usage: "mcp__mash__message entity=dispatch-work | node compose.js dispatch-work"
help-topic: [dispatch, tasks, offices, assignment, work]
see-also: [plan-status, tracking-status, briefing]
date-created: 2026-04-07
---
