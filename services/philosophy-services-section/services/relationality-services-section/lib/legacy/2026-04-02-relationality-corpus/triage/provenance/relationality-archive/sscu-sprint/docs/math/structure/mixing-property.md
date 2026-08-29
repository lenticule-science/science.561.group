---
name: mixing-property
role: structure
derived_from:
- acts/mixing
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Structure capturing the mixing property of a flow/observation kernel: long-time
evolution makes states asymptotically independent of initial conditions.

## Definition
- Carrier: predicates on [Observation Kernel](observation-kernel.md) (and its
  iterates) stating that correlations decay to zero as time progresses.
- Data: mixing rate or bounds (when earned) and the sigma-algebra/recognition
  tower over which independence is measured.

## Invariants
- Decay: correlations of observables composed with the kernel converge to the
  product of expectations.
- Stability: preserved under iteration of the observation kernel; compatible
  with the profile tower when lifted.

## Proof
- Derived from: [Mixing](../acts/mixing.md) act, which witnesses decay of
  correlations under the kernel.
- Uses: [Observation Kernel](observation-kernel.md) as the underlying dynamic.
- Shows that: the mixing act induces a well-defined property carrier for kernels
  used by entropy and spectral fixed-point arguments.
