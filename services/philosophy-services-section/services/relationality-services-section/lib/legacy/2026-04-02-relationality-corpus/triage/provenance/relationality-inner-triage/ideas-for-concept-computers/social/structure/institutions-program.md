---

name: institutions-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program represents institutional structures (schools, orgs, labs) as
recognitions so they can be reasoned about like any other system.

## Behaviour

- Model institutions, roles, programs/courses, policies, and governance
  decisions as recognitions with provenance.
- Map topology: org charts, program structures, committees, membership.
- Measure participation, outcomes, resource allocation, churn.

## Intended operators

- Create programs, assign roles, and run reviews using auditable runbooks.
- Attach policies and decisions to the domains they affect.
- Surface institutional health via the recorded measurements.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

