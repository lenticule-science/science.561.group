---
name: dispatch-add-emit-mermaid-graph
specialization: task
date-created: 2026-04-30
plan: dispatch-script-evolution
status: open
work-type: procedure
priority: 4
requires-capabilities: [code-edit, render]
requires-skills: [trace-derivation]
touches: [operations/engineering/triage/operations/engineering/services/dispatch/triage/dispatch.py]
---

Add `dispatch.py --graph` (or `--graph <plan-id>`): emit the dependency DAG and assigned-to relations as Mermaid syntax (or Graphviz).
This is technically the cartographer's job — once the cartographer agent is operational, this script can call it; in the meantime the script can emit Mermaid directly as a stopgap.

Acceptance: `dispatch.py --graph ops-dispatch-stage` outputs valid Mermaid that renders the plan's task DAG with status colors.
