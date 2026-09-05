---

name: measurement-fabric-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program treats the measurement fabric as recognitions that weave together
intake, observables, and downstream analysis.

## Behaviour

- Represent measurement channels, schemas, and aggregation paths as recognitions
  with provenance.
- Coordinate measurement flows across domains, ensuring units, scales, and
  normalization are explicit.
- Record renewal/baseline checks and policy on measurement usage.

## Intended operators

- Register measurement channels and schemas.
- Route observations through aggregation paths with trace.
- Audit measurement completeness and renewal obligations.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

