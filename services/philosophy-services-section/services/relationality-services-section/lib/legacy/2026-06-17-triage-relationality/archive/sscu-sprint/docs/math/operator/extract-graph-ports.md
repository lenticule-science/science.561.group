---
title: Extract Graph Ports
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


Extracts the [Port Set](../structure/port-set.md) from a
[Connection Graph](../structure/connection-graph.md), expanding operator
signatures into typed input/output ports.

## Proof
- Uses: step signatures in the graph to enumerate ports.
- Shows that: port data can be separated for independent typing/wiring checks.
