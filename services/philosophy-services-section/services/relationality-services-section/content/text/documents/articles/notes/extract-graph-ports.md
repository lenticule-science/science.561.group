---
title: Extract Graph Ports
id: extract-graph-ports
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
description: Extracts the Port Set from a Connection Graph, expanding operator signatures into typed input/output ports.
---


Extracts the [Port Set](./port-set.md) from a
[Connection Graph](./connection-graph.md), expanding operator
signatures into typed input/output ports.

## Proof
- Uses: step signatures in the graph to enumerate ports.
- Shows that: port data can be separated for independent typing/wiring checks.
