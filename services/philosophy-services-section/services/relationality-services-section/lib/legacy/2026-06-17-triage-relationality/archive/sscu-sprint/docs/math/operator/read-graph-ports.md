---
title: Read Graph Ports
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


Expands a [Connection Graph](../structure/connection-graph.md) into its
[Port Set](../structure/port-set.md), inducing typed ports from operator
signatures.

## Invariants
- Reads port definitions without mutation; preserves typing from the graph.
