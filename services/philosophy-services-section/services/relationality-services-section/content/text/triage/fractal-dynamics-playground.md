---
title: Fractal & Dynamical Systems Playground
layer: spec
status: someday
keywords:
  - fractal
  - dynamics
---
# Fractal & Dynamical Systems Playground

Treat iterated maps, attractors, and parameter sweeps as recognitions so you can
explore dynamical systems inside the relational computer.

## 1. Recognitions

- `SystemRecognition`
  - definition of a map or flow (e.g., logistic map, complex quadratic, Henon).
  - fields: equations, parameters, domain, initial conditions schema.
- `OrbitRecognition`
  - a particular trajectory under a system from a given seed.
- `AttractorRecognition`
  - detected attractors, basins, and invariant sets.
- `ParameterSweepRecognition`
  - sweeps over parameter ranges with links to resulting orbits/attractors.

## 2. Measurement and topology

- Measurement:
  - Lyapunov exponents, fractal dimensions, escape times,
  - statistics over orbits (distribution, periodicity).
- Topology:
  - parameter space (relations between systems and parameter choices),
  - orbit → attractor → basin relationships.

Runbooks like `iterate_system`, `detect_attractors`, `sweep_parameters` make
fractal/dynamical exploration a structured, traceable activity.
