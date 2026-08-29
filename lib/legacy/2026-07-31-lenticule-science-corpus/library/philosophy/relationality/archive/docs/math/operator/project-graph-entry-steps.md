---
title: Project Graph Entry Steps
id: project-graph-entry-steps
role: operator
status: plan
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: step-set
  alias: entries
transformation:
- return
- entries
proof_refs:
- connection-graph
- step-set
---

# Proof
- Uses: edge relation in the connection graph to find nodes with in-degree zero.
- Shows that: entry steps can be exposed for scheduling/topology.
---
# Project Graph Entry Steps

Extracts the source steps (no incoming edges) from a
[Connection Graph](../structure/connection-graph.md).

## Proof
- Uses: the edge relation in the connection graph to find nodes with in-degree
  zero.
- Shows that: entry steps can be exposed without primitive opcodes.
