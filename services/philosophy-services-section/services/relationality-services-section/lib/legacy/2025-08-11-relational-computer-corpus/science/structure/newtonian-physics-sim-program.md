---

name: newtonian-physics-sim-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program simulates Newtonian physics as recognitions so state and dynamics
are traceable.

## Behaviour

- Represent bodies, forces, and states as recognitions with provenance.
- Apply earned dynamics operators to evolve states; record traces and
  measurements.
- Link simulations to measurement channels for validation.

## Intended operators

- Set up initial conditions; step simulations under Newtonian dynamics.
- Compare simulations with observations; adjust parameters with trace.
- Export simulation slices for other programs (visualization, education).

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

