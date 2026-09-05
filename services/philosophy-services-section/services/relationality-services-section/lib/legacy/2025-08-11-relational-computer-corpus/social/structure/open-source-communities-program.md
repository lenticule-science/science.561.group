---

name: open-source-communities-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program models open source communities and projects as recognitions so
participation and governance are traceable.

## Behaviour

- Represent projects, contributors, issues, commits, and releases as
  recognitions with provenance.
- Link governance structures, policies, and decision records to project
  artefacts.
- Measure participation, review health, and release cadence.

## Intended operators

- Track contributions and reviews with trace.
- Run governance processes (proposals, votes) for projects.
- Surface community health metrics and guide interventions.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

