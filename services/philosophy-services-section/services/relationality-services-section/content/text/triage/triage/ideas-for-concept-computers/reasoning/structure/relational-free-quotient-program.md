---
title: Relational Free Quotient Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---
# Relational Free Quotient Program

This program explores free quotients in the relational setting as recognitions,
for reasoning about equivalence under constraints.

## Behaviour

- Represent generators, relations, and quotient constructions as recognitions
  with provenance.
- Link to structures/operators that witness the quotient in the earned math.
- Measure properties of quotients (normal forms, identifications) in use.

## Intended operators

- Construct quotient recognitions from generators/relations.
- Normalise elements and check equivalences under the quotient.
- Export quotient structure for other reasoning programs.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
