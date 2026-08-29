---
title: Project Graph Exit Steps
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---

# Proof
- Uses: edge relation in the connection graph to find nodes with out-degree zero.
- Shows that: exit steps can be exposed for wiring outputs/termination.
---
# Project Graph Exit Steps

Extracts the sink steps (no outgoing edges) from a
[Connection Graph](../structure/connection-graph.md).

## Proof
- Uses: the edge relation in the connection graph to find nodes with out-degree
  zero.
- Shows that: exit steps can be exposed without primitive opcodes.
