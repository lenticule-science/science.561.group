---
title: Read Graph Ports
id: read-graph-ports
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
description: Expands a Connection Graph into its Port Set, inducing typed ports from operator signatures.
---


Expands a [Connection Graph](./connection-graph.md) into its
[Port Set](./port-set.md), inducing typed ports from operator
signatures.

## Invariants
- Reads port definitions without mutation; preserves typing from the graph.

## Earlier material

Expands a [Connection Graph](connection-graph.md) into its
[Port Set](port-set.md), inducing typed ports from operator
signatures.
