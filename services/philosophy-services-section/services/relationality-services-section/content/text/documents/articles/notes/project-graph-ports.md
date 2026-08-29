---
title: Project Graph Ports
id: project-graph-ports
role: operator
status: plan
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: port-set
  alias: ports
transformation:
- return
- ports
proof_refs:
- connection-graph
- port-set
---

# Proof
- Uses: the port declarations embedded in the connection graph.
- Shows that: ports can be extracted as a set for typing/wiring checks without
  additional primitives.
---
# Project Graph Ports

Projects the [Port Set](./port-set.md) from a
[Connection Graph](./connection-graph.md).

## Proof
- Uses: the port declarations embedded in the connection graph.
- Shows that: ports can be extracted for typing/policy checks without primitive
  opcodes.
