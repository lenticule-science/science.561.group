---

name: intake-stack-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program instantiates the intake structure: a pipeline for normalising,
validating, and contextualising incoming payloads into recognised, measured
observations before they enter the relational computer.

## Behaviour

- Maintain schema registry recognitions that enumerate admissible payloads,
  bindings, and normalisation procedures.
- Record validation stages (seed, recognise, transport) as ordered recognitions
  so evaluation can replay the same sequence.
- Seed contexts via the earned context acts and record the trace; nothing is
  buffered outside the relational state.

## Intended operators

- Normalise payloads into canonical syntax; produce observation recognitions
  backed by registered schemas.
- Apply policy/discipline filters in the recorded order; reject unregistered or
  invalid data.
- Seed contexts for accepted payloads and emit observations with schema/policy
  metadata into distribution.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

