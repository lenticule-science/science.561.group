---
title: Project Graph Exit Steps
id: project-graph-exit-steps
role: operator
status: plan
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: step-set
  alias: exits
transformation:
- return
- exits
proof_refs:
- connection-graph
- step-set
---

# Proof
- Uses: edge relation in the connection graph to find nodes with out-degree zero.
- Shows that: exit steps can be exposed for wiring outputs/termination.
---

Extracts the sink steps (no outgoing edges) from a
[Connection Graph](./connection-graph.md).

## Proof
- Uses: the edge relation in the connection graph to find nodes with out-degree
  zero.
- Shows that: exit steps can be exposed without primitive opcodes.
