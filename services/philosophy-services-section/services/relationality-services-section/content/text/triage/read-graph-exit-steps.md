---
title: Read Graph Exit Steps
id: read-graph-exit-steps
role: operator
status: plan
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: trace
  alias: exits
transformation:
- return
  - exits
proof_refs:
- connection-graph
- trace
---

# Read Graph Exit Steps

Computes the list of exit steps (no outgoing edges) in a
[Connection Graph](../structure/connection-graph.md).

## Invariants
- Returns identifiers of steps with no outgoing edges; pure graph query.
