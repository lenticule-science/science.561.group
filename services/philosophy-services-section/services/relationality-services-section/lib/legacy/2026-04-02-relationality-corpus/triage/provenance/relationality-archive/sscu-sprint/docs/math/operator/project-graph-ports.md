---
name: project-graph-ports
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---

- Uses: the port declarations embedded in the connection graph.
- Shows that: ports can be extracted as a set for typing/wiring checks without
  additional primitives.
---
# Project Graph Ports

Projects the [Port Set](../structure/port-set.md) from a
[Connection Graph](../structure/connection-graph.md).

## Proof
- Uses: the port declarations embedded in the connection graph.
- Shows that: ports can be extracted for typing/policy checks without primitive
  opcodes.
