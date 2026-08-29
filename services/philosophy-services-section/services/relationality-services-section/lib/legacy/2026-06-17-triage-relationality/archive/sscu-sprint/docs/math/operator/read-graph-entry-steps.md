---
title: Read Graph Entry Steps
role: operator
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: trace
  alias: entries
transformation:
- return
  - entries
proof_refs:
- connection-graph
- trace
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Computes the list of entry steps (no incoming edges) in a
[Connection Graph](../structure/connection-graph.md).

## Invariants
- Returns identifiers of steps with no incoming edges; pure graph query.
