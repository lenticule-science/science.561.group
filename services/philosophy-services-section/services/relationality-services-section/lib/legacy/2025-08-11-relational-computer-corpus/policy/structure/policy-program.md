---

name: policy-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program models policies as recognitions so constraints and obligations are
explicit and enforceable.

## Behaviour

- Represent policies, rules, scopes, and enforcement actions as recognitions
  with provenance.
- Link policies to domains/programs they constrain; map exemptions and appeals.
- Measure compliance, violations, and enforcement outcomes.

## Intended operators

- Declare and version policies; bind them to recognitions and runbooks.
- Enforce policies during intake, execution, and persistence with traceable
  decisions.
- Audit compliance and adjust policies based on measurements.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

