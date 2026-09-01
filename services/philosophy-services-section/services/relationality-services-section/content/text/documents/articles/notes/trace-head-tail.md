---
title: Trace Head/Tail Operators
id: trace-head-tail
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



`head-trace`, `tail-trace`, and `bind-trace` earn projections on the trace
spine and a binding witness that reassembles the original trace up to nucleus
equivalence. These operators work over `TraceCarrier`.

## Definition
- Inputs: [Trace Carrier](./trace.md).
- Outputs: head/tail projections and a binding operation to reassemble the
  trace.
- Behaviour: compute head (first position) and tail (remainder) of a trace and
  provide a bind/concatenate that reconstructs the original trace up to earned
  equivalence.

## Invariants
- Reconstruction: bind(head, tail) equals the original trace up to nucleus
  equivalence.
- Stability: projections respect trace ordering and do not alter payload.

## Proof
- Uses: [Tail Trace](tail-trace.md), head, and bind acts to define projections
  and recomposition.
- Shows that: lifting head/tail/bind operations yields trace
  projections/compositions over the trace carrier, preserving reconstruction up
  to nucleus equivalence.
