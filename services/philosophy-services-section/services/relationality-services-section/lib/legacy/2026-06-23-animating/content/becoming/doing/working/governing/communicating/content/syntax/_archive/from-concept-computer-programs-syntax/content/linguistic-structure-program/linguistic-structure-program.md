---
title: Linguistic Structure Program
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
# Linguistic Structure Program

This program models linguistic structures (phonology, morphology, syntax,
semantics) as recognitions so language analysis and generation stay grounded in
the relational calculus.

## Behaviour

- Represent linguistic units and structures (segments, morphemes, phrases,
  dependency trees, semantic roles) as recognitions with provenance.
- Link structures across levels (form↔meaning) and to domains (register, genre,
  sociolect).
- Measure structure frequency, variation, and ambiguity.

## Intended operators

- Parse and annotate text into layered linguistic structures.
- Compose/generate text from structured representations.
- Compare structures across languages, registers, or sociolects.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

