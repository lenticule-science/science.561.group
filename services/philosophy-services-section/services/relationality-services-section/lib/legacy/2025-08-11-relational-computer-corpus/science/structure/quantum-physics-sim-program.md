---

name: quantum-physics-sim-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program simulates quantum systems as recognitions so states and dynamics
are traceable and consistent with earned structures.

## Behaviour

- Represent quantum states, operators, Hamiltonians, and measurements as
  recognitions with provenance.
- Evolve states under earned dynamics; record measurements and collapse events
  with trace.
- Link simulations to validation data where available.

## Intended operators

- Set up and evolve quantum systems; sample measurements.
- Compare simulations to observations; adjust parameters with trace.
- Export slices for analysis or visualization programs.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

