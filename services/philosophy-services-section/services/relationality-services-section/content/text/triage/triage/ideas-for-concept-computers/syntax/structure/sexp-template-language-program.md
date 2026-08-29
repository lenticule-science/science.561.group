---
title: S-expression Template Language Program
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
# S-expression Template Language Program

This program expresses templates in S-expression form as recognitions so code
and data generation are traceable.

## Behaviour

- Represent templates, parameters, and expansions as recognitions with
  provenance.
- Bind templates to earned operators; avoid ad-hoc generation.
- Measure reuse, expansion cost, and correctness of generated artefacts.

## Intended operators

- Define and expand templates with traceable inputs/outputs.
- Validate expansions against schemas or tests.
- Reuse templates across programs with provenance.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
