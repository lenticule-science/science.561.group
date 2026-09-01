---
title: Fractal and Dynamical Systems Playground Program
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

This program explores iterated maps, attractors, and parameter sweeps as
recognitions so dynamical systems can be traced and compared inside the
relational computer.

## Behaviour

- Define systems (maps/flows with equations, parameters, domains, initial
  conditions), orbits, attractors, and parameter sweeps as recognitions with
  provenance.
- Capture measurements such as Lyapunov exponents, fractal dimensions, escape
  times, and orbit statistics; attach them to orbits/attractors.
- Map topology: parameter spaces, orbit→attractor→basin relationships.

## Intended operators

- Iterate systems from seeds and record orbits with measurements.
- Detect attractors and basins; relate them across parameter sweeps.
- Run sweeps over parameter ranges, keeping results traceable and comparable.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
