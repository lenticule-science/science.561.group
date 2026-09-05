---
title: Compressibility Recognition
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Recognises whether a trace can be simplified under shuffle/nucleus without loss.

## Definition
- Inputs: a [Trace Shuffle Class](../structure/trace-shuffle-class.md).
- Output: recognition indicating compressibility/incompressibility.
- Behaviour: attempt to reduce the trace via shuffle equivalences and nucleus;
  if equivalent shorter trace exists, mark as compressible.

## Invariants
- Soundness: only truly reducible traces are marked compressible.
- Monotonicity: adding more steps cannot make an incompressible trace
  compressible without additional equivalences.

## Proof
- Uses: [Trace Shuffle Class](../structure/trace-shuffle-class.md) to explore
  equivalences.
- Produces: [Recognition Carrier](../structure/recognition.md) marker.
- Shows that: compressibility is recognisable within the earned trace/shuffle
  structure.
