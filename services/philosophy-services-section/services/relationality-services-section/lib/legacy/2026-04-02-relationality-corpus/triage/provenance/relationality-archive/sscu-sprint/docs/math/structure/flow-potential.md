---
name: flow-potential
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Assigns an energy/potential value to recognitions based on flow resistance and
entropy production; aids scheduling and optimisation.

## Definition
- Potential: function on recognitions measuring expected entropy production or
  “effort” along flow paths.
- Inputs: flow rules and entropy functional.

## Invariants
- Monotone: higher potential indicates greater resistance/entropy production.
- Gradient-driven: flow tends toward decreasing potential when allowed.

## Proof
- Uses: flow and entropy to define potential.
- Shows that: potential can be used to guide flow decisions.
