---

name: information-engine-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program realises the relational computer as an “information engine”: intake
payloads become recognitions, measurements become towers, and finite sections of
the hypertensor sheaf become the working state. No additional notion of
persistent state is introduced beyond the global sheaf section described by the
[Relational Machine Kernel](../../../machine/structure/kernel.md).

## Behaviour

- Provide a canonical pipeline:
  1) intake/coding from external payloads into recognition carriers with trace,
  2) measurement/normalisation to observables and profiles,
  3) tower construction (profile towers over fibres),
  4) sheaf/hypertensor sections `(window, towers)`,
  5) domain views as constrained projections of those sections.
- Maintain stable carriers: recognition carriers, profile towers, lattice
  windows/sites, sheaf sections, and domain-specific carriers where needed.
- Enforce invariants: schema validity and policy at intake; tower consistency;
  sheaf-section integrity; row-stochastic Markov kernels and fixed-chain
  consistency; flow–nucleus commutation where applicable.

## Intended operators

- Intake and validation runbooks for observations with traceability.
- Measurement/tower runbooks to build and evolve towers.
- Sheaf-section runbooks to build, persist, and step `(window, towers)` under
  dynamics.
- Flow/nucleus runbooks to witness the earned commutation properties.
- Domain view runbooks that read/write sections under additional domain
  constraints without altering the underlying relational behaviour.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

