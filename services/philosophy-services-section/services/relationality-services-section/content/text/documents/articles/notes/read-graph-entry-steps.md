---
title: Read Graph Entry Steps
id: read-graph-entry-steps
role: operator
status: plan
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
description: Computes the list of entry steps (no incoming edges) in a Connection Graph.
---


Computes the list of entry steps (no incoming edges) in a
[Connection Graph](./connection-graph.md).

## Invariants
- Returns identifiers of steps with no incoming edges; pure graph query.

## Earlier material

Computes the list of entry steps (no incoming edges) in a
[Connection Graph](connection-graph.md).
