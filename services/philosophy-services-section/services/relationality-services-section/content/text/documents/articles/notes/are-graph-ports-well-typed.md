---
title: Are Graph Ports Well Typed
id: are-graph-ports-well-typed
role: operator
status: plan
inputs:
- id: port-set
  alias: ports
outputs:
- id: recognition
  alias: predicate
transformation:
- call
  - check-port-typing
  - ports
proof_refs:
- port-set
- recognition
- check-port-typing
description: Predicate asserting that all ports in a Port Set are consistent with their inducing operator signatures and carrier types.
---

# Graph Ports Well Typed?

Predicate asserting that all ports in a [Port Set](./port-set.md)
are consistent with their inducing operator signatures and carrier types.

## Proof
- Uses: port declarations versus operator signatures to validate directions and
  carrier ids via `check-port-typing`.
- Shows that: port-level typing holds before wiring proceeds to edge checks.
