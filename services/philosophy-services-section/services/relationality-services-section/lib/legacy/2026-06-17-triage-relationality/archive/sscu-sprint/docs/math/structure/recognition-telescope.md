---
title: Recognition Telescope
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Sequence of recognitions linked by progressively coarse nucleus collapses.

## Definition
- Data: chain `r0 → r1 → … → rn` where each step is a nucleus collapse of the
  previous recognition, possibly across towers/scales.
- Purpose: track how recognitions simplify through successive collapses.

## Invariants
- Monotone: each step is at least as coarse as the previous.
- Termination: may stabilise at a fixed point.

## Proof
- Uses: nucleus operations on the recognition carrier.
- Shows that: collapse chains can be packaged as telescopes for analysis.
