---
title: Get Graph Exit Steps
role: operator
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: trace
  alias: exits
transformation:
- call
  - read-graph-exit-steps
  - graph
proof_refs:
- connection-graph
- read-graph-exit-steps
- trace
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Returns the list of exit step ids in a [Connection Graph](../structure/connection-graph.md)
(steps with no outgoing edges).

## Proof
- Uses: graph edge relation to find sinks.
- Shows that: exit points are computable as a primitive query.
