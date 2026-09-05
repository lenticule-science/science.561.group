---
title: Get Graph Entry Steps
id: get-graph-entry-steps
role: operator
status: plan
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: trace
  alias: entries
transformation:
- call
  - read-graph-entry-steps
  - graph
proof_refs:
- connection-graph
- trace
- read-graph-entry-steps
---


Returns the list of entry step ids in a [Connection Graph](./connection-graph.md)
(steps with no incoming edges).

## Proof
- Uses: graph edge relation to find sources.
- Shows that: entry points are computable as a primitive query.
