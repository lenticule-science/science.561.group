---

name: learning-curriculum-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program defines curricula as recognitions so courses, modules, and
dependencies are explicit and auditable.

## Behaviour

- Represent curricula, courses, modules, prerequisites, and outcomes as
  recognitions with provenance.
- Map dependency graphs between modules and link to assessments and runbooks.
- Measure coverage, mastery, and progression rates.

## Intended operators

- Design curricula and adjust based on learner progress.
- Validate prerequisites before advancing learners.
- Export curriculum slices for different audiences or domains.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

