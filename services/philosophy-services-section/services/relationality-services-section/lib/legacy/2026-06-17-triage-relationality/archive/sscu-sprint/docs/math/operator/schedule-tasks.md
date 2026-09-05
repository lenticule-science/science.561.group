---
title: Schedule Tasks
role: Derive an execution order from a wiring/connection graph and task carrier.
inputs:
- id: task-carrier
  name: tasks
- id: connection-graph
  name: graph
outputs:
- id: task-carrier
  name: scheduled
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



System-level operator that extracts tasks from a runbook/wiring plan and
produces an execution order respecting dependencies.

## Behaviour
- Extract tasks: map each step in a connection graph to a `Task` with metadata
  (priority, cost).
- Build task graph: derive edges from wiring constraints and trace semantics.
- Produce schedule: linearise tasks respecting dependency order and trace spine
  coherence.

## Invariants
- Execution order respects dependency graph and kernel invariants.
- Scheduler does not introduce cycles.

## Proof
- Uses: [Task Carrier](../structure/task-carrier.md) and
  [Connection Graph](../structure/connection-graph.md) to derive a precedence
  relation from wiring and trace constraints, then linearises it.
- Shows that: scheduling derived from the graph preserves dependency invariants.
