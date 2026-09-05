---
name: holonomy-operator
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



Recognises the phase accumulated by transporting a section along a closed
shuffle-equivalence loop (relational geometric phase).

## Definition
- Inputs: a closed [Trace Shuffle Class](../structure/trace-shuffle-class.md)
  loop and a [Hypertensor Section](../structure/hypertensor-section.md).
- Output: recognition representing the accumulated phase/holonomy.
- Behaviour: transport the section along the loop via restrictions/gluings and
  compare to the original; record the deviation as a recognition.

## Invariants
- Loop invariance: trivial holonomy on contractible loops; nontrivial otherwise.
- Sheaf compatibility: uses earned sheaf transports; respects gluing/locality.

## Proof
- Uses: shuffle classes and hypertensor sections to define transport; compares
  start/end to extract phase as a recognition.
- Shows that: path dependence is measurable as holonomy in the relational
  setting.
