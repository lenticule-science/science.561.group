---
title: Check Port Typing
role: operator
inputs:
- id: port-set
  alias: ports
outputs:
- id: recognition
  alias: predicate
transformation:
- call
  - port-type-check
  - ports
proof_refs:
- port-set
- recognition
- port-type-check
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Validates that each port’s carrier and direction match the inducing operator
signature in the [Port Set](../structure/port-set.md). Returns a predicate
recognition witnessing well-typedness.

## Proof
- Uses: operator signatures associated with ports to check carrier/direction
  assignments via the port type check.
- Shows that: ports are individually well-typed before edge wiring proceeds.
