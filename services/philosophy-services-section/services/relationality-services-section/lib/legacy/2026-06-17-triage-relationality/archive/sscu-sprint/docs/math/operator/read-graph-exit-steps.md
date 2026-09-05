---
title: Read Graph Exit Steps
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Computes the list of exit steps (no outgoing edges) in a
[Connection Graph](../structure/connection-graph.md).

## Invariants
- Returns identifiers of steps with no outgoing edges; pure graph query.
